var addContactNo = 0;
function openAccountFunction(x,y) {
      // Get the checkbox
      var checkBox = document.getElementById(x);
      // Get the output text
      var text = document.getElementById(y);
      // If the checkbox is checked, display the output text
      
      if (checkBox.checked == true){
        text.style.display = "block";
      } else {
        text.style.display = "none";
     }
}

$(function() {
    $("#businessEvent1,#businessEvent2").autocomplete({
    	minLength: 0,
        max: 10,
        width: 150,
        //autoFill: true,
        mustMatch: true,
        matchContains: true,
        scrollHeight: 220,
        autoFocus: true,
        delay: 100,
        classes: {"ui-autocomplete": "highlight"},
        source: function(request, response) {
            $.ajax({
                url: "/api/category",
                dataType: "json",
                data: {term: request.term},
                success: function(data) {
                	console.log(data);
                	response($.map(data, function (item) {
                        return {
                            label: (item.nameEN + ": " + item.nameCN),
                            value: (item.nameEN + ": " + item.nameCN)
                        };
                    }));
                },
                error: function(jqXHR, textStatus, errorThrown){
                     console.log( textStatus);
                }
            });
        },
    }).focus(function() {
        $(this).autocomplete('search', $(this).val())
    });
});  


$(function() {
    $('#company_type input[type=radio]').change(function(){
        if ($(this).val() == "private") {
        	if (services.some(el => el.name === "公众有限责任公司")){
                services = services.filter(item => item.name !== "公众有限责任公司")
            }
            services.push({name:"私人豁免有限公司",price:850});
        } else {
        	if (services.some(el => el.name === "私人豁免有限公司")){
        		services = services.filter(item => item.name !== "私人豁免有限公司")
            }
            services.push({name:"公众有限责任公司",price:1200});
        }
        refreshRightSummary();
        })
  });

var services = [];
var companyInfos = [];
var shareholderInfos = [];
$(document).ready(function(){
	$('#step2next').attr('disabled',true);
    $('#email0').keyup(function(){
        if($(this).val().length !=0)
            $('#step2next').attr('disabled', false);            
        else
            $('#step2next').attr('disabled',true);
    })
    
    $("#send_email").click(function(event){
    	alert("submit and confirm");
        $.post("/api/sendemail",
           { "services" : JSON.stringify(services),
             "companyInfos": JSON.stringify(companyInfos),
             "shareholderInfos" : JSON.stringify(shareholderInfos)},
           function(data, status) {
        	   alert("Data: " + data + "\nStatus: " + status);
           }
        );
				
     });
  });

function saveToBackend() {
	alert("save To Backend");
	$.post(
            "/api/newCompany",
            { 	"services" : JSON.stringify(services),
            	"companyInfos": JSON.stringify(companyInfos),
            	"shareholderInfos" : JSON.stringify(shareholderInfos)},
            function(data, status) {
         	   alert("Data: " + data + "\nStatus: " + status);
            }
         );
}

function refreshRightSummary() {
    var number = services.length;
    var selectedsummaryhtml = "<h6 class='mt-3'>服务类型详细清单</h6><ul class='list-unstyled list-unstyled-border'>";
    var totalamount = 0;
    
    for (let i=0; i<services.length; i+=1) {
        totalamount = totalamount + services[i].price;
        selectedsummaryhtml += 
             `<li class="media"><a href="#"><img alt="image" class="mr-3 rounded" width="40" src="../assets/img/products/product-2-50.png"></a>
                  <div class="media-body"><div class="media-right"><span class="text-muted" id="price">`;
        selectedsummaryhtml += services[i].price;
        selectedsummaryhtml += `</span></div><div class="media-title"><a href="#">`;
        selectedsummaryhtml += `<span class="text-muted" id="company_name">`;
        selectedsummaryhtml += services[i].name; 
        selectedsummaryhtml += "</span></a></div></div></li>";
    }                  
    selectedsummaryhtml += "</ul>";

    selectedsummaryhtml += `<h6 class="mt-3">总计服务<span class="text-muted media-left">(`;
    selectedsummaryhtml += services.length
    selectedsummaryhtml += ") </span>  总计金额（S$）  (<span class='text-muted media-right'>" + totalamount + "</span>)</h6>";
    document.getElementById("selected_summary").innerHTML = selectedsummaryhtml;
}

function addGudong () {
  document.querySelector('#gudongdiv').insertAdjacentHTML('afterend',
    `<li class="list-group-item">
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">股东</label>
            <div class="col-sm-9"><input type="text" class="form-control" id="gudong2" placeholder="股东">
                <input type="button" value="-" onclick="removeGuDong(this)">
            </div>
            
        </div>
    </li>`      
  )
}
function addDongshi () {
  document.querySelector('#dongshidiv').insertAdjacentHTML('afterend',
    `<li class="list-group-item">
        <div class="form-group row">
            <label class="col-sm-3 col-form-label">董事</label>
            <div class="col-sm-9"><input type="text" class="form-control" id="dongshi2" placeholder="董事">
                <input type="button" value="-" onclick="removeDongShi(this)">
            </div>
            
        </div>
    </li>`      
  )
}
function removeGuDong (input) {
  input.parentNode.parentNode.parentNode.remove();
}
function removeDongShi (input) {
  input.parentNode.parentNode.parentNode.remove();
}

function listSummary() {
	companyInfos = [];
	shareholderInfos = [];
    if (document.getElementById("companyName").value!="") {
        companyInfos.push({name:"公司名称",description:document.getElementById("companyName").value});
    }
    if (document.getElementById("companyBackupName").value!="") {
        companyInfos.push({name:"公司备用名称",description:document.getElementById("companyBackupName").value});
    }
    if (document.getElementById("companyType").value!="") {
        companyInfos.push({name:"公司类型",description:document.getElementById("companyType").value});
    }
    if (document.getElementById("registeredCapital1").value!="") {
        companyInfos.push({name:"发行股份资本",description:document.getElementById("registeredCapital1").value});
    }
    if (document.getElementById("registeredCapital2").value!="") {
        companyInfos.push({name:"实缴股份资本",description:document.getElementById("registeredCapital2").value});
    }
    if (document.getElementById("businessEvent1").value!="") {
        companyInfos.push({name:"公司商业活动1",description:document.getElementById("businessEvent1").value});
    }
    if (document.getElementById("businessEvent2").value!="") {
        companyInfos.push({name:"公司商业活动2",description:document.getElementById("businessEvent2").value});
    }
    if (document.getElementById("conpanyAddressAndPostalCode").value!="") {
        companyInfos.push({name:"公司地址及邮编",description:document.getElementById("conpanyAddressAndPostalCode").value});
    }

    shareholderInfos.push({name:"CONTACTCOUNT", description:(parseInt(addContactNo)+1)});
    for (i=0; i<=addContactNo; i++) {
    	var position = "";
        if (document.getElementById("checkb_dongshi"+i).checked) {
        	position = position + "董事, " ;
        }
        if (document.getElementById("checkb_gudong"+i).checked) {
        	position = position + "股东, ";
        }
        if (document.getElementById("checkb_contactpeople"+i).checked) {
        	position = position + "联系人, ";
        }
        if (position != "") {
            var pos = position.substring(0, position.length-2);
        	shareholderInfos.push({name:"职位填报类型"+(i+1), description:pos});
        }
        if (document.getElementById("fullName"+i).value!="") {
            shareholderInfos.push({name:"全名"+(i+1),description:document.getElementById("fullName"+i).value});
        }
        if (document.getElementById("gender"+i).value!="") {
            shareholderInfos.push({name:"性别"+(i+1),description:document.getElementById("gender"+i).value});
        }
        if (document.getElementById("country"+i).value!="") {
            shareholderInfos.push({name:"国籍"+(i+1),description:document.getElementById("country"+i).value});
        }
        if (document.getElementById("ICType"+i).value!="") {
            shareholderInfos.push({name:"证件类型"+(i+1),description:document.getElementById("ICType"+i).value});
        }
        if (document.getElementById("ICNumber"+i).value!="") {
            shareholderInfos.push({name:"证件号码"+(i+1),description:document.getElementById("ICNumber"+i).value});
        }
        if (document.getElementById("email"+i).value!="") {
            shareholderInfos.push({name:"电子邮箱"+(i+1),description:document.getElementById("email"+i).value});
        }
        if (document.getElementById("phone"+i).value!="") {
            shareholderInfos.push({name:"联系电话"+(i+1),description:document.getElementById("phone"+i).value});
        }
        if (document.getElementById("personalAddressAndPostalCode"+i).value!="") {
            shareholderInfos.push({name:"个人地址及邮编"+(i+1),description:document.getElementById("personalAddressAndPostalCode"+i).value});
        }
        if (document.getElementById("calcPerShare"+i).value!="") {
            shareholderInfos.push({name:"每股价值"+(i+1),description:document.getElementById("calcPerShare"+i).value});
        }
        if (document.getElementById("calcNumberofSharesIssued"+i).value!="") {
            shareholderInfos.push({name:"发行股份数量"+(i+1),description:document.getElementById("calcNumberofSharesIssued"+i).value});
        }
        if (document.getElementById("calcNumberofPaid-inShares"+i).value!="") {
            shareholderInfos.push({name:"实缴股份数量"+(i+1),description:document.getElementById("calcNumberofPaid-inShares"+i).value});
        }
    }
    
    console.log("companyInfos" + companyInfos);
    console.log("shareholderInfos" + shareholderInfos);
    companytext = "<ul class='list-group'>";
    for (i = 0; i < companyInfos.length; i++) {
        companytext += "<li class='list-group-item d-flex justify-content-between align-items-center'>" + companyInfos[i].name + 
                    "<span style='text-align: right;' class='badge badge-primary badge-pill'>" + companyInfos[i].description  + "</span>" +
               "</li>";
    }
    companytext += "</ul>";
    document.getElementById("companyinfo_summary").innerHTML = companytext;
    
    shareholdertext = "<ul class='list-group'>";
    for (i = 0; i < shareholderInfos.length; i++) {
        shareholdertext += "<li class='list-group-item d-flex justify-content-between align-items-center'>" + shareholderInfos[i].name + 
                    "<span style='text-align: right;' class='badge badge-primary badge-pill'>" + shareholderInfos[i].description  + "</span>" +
               "</li>";
    }
    shareholdertext += "</ul>";
    document.getElementById("shareholder_summary").innerHTML = shareholdertext;
}

function choosedsv(x) {
    // document.getElementsByClassName("choosedsvr")[x].style.backgroundColor='#f8fafb';
    var element = document.getElementsByClassName("choosedsvr")[x];
    var btn = document.getElementsByClassName("badge-pill")[x];
    
    if (!element.classList.contains('choosesv')) {
    	switch (x) {
        case 0:
            if (services.some(el => el.name === "新注册新加坡公司开户")){
                services = services.filter(item => item.name !== "新注册新加坡公司开户")
            }
            services.push({name:"新注册新加坡公司开户",price:300});
            refreshRightSummary();
            break;
        case 1:
            if (services.some(el => el.name === "挂名董事")){
                services = services.filter(item => item.name !== "挂名董事")
                // services = services.filter(item => item.name !== "押金")
            }
            services.push({name:"挂名董事",price:1800+1500});
            // services.push({name:"押金",price:1500});
            refreshRightSummary();
            z=[];
            break;
        case 2:
              if (services.some(el => el.name === "GST消费税注册")){
                  services = services.filter(item => item.name !== "GST消费税注册")
              }
              var requestClaim = document.getElementsByClassName("choosedsvr")[x+1];
          	  if (!requestClaim.classList.contains('choosesv')){
          		services.push({name:"GST消费税注册",price:400});
              } else {
            	  services.push({name:"GST消费税注册",price:400+1200});
              }
              refreshRightSummary();
              break;
        case 3:           	
        	if (services.some(el => el.name === "GST消费税注册")){
                services = services.filter(item => item.name !== "GST消费税注册")
            }
            var gstClaim = document.getElementsByClassName("choosedsvr")[x-1];
    	    if (!gstClaim.classList.contains('choosesv')) {
        		services.push({name:"GST消费税注册",price:1200});
            } else {
          	  services.push({name:"GST消费税注册",price:400+1200});
            }
            refreshRightSummary();
            break;
        case 4:
        	z.push(document.getElementById("countsgtel").value);
            z.push(document.getElementById("countglotel").value);
            if (services.some(el => el.name === "虚拟电话")){
                services = services.filter(item => item.name !== "虚拟电话")
            }
            
            var nextClass = document.getElementsByClassName("choosedsvr")[x+1];
            if (!nextClass.classList.contains('choosesv')) {
          	  services.push({name:"虚拟电话",price:z[0]*200});
            } else {
                services.push({name:"虚拟电话",price:z[0]*200+z[1]*500});
            }
            refreshRightSummary();
            z=[];
            break;
        case 5:
            z.push(document.getElementById("countsgtel").value);
            z.push(document.getElementById("countglotel").value);
            if (services.some(el => el.name === "虚拟电话")){
                services = services.filter(item => item.name !== "虚拟电话")
            }
            
            var previousClass = document.getElementsByClassName("choosedsvr")[x-1];
            if (!previousClass.classList.contains('choosesv')) {
          	  services.push({name:"虚拟电话",price:z[1]*500});
            } else {
                services.push({name:"虚拟电话",price:z[0]*200+z[1]*500});
            }
            refreshRightSummary();
            z=[];
            break;
        case 6:
              z.push(document.getElementById("countmail").value);
              if (services.some(el => el.name === "收信转寄服务")){
                  services = services.filter(item => item.name !== "收信转寄服务")
              }
              services.push({name:"收信转寄服务",price:z[0]*600});
              refreshRightSummary();
              z=[];
              break; 
        case 7:
              z.push(document.getElementById("countaccounting").value);
              if (services.some(el => el.name === "会计记账")){
                  services = services.filter(item => item.name !== "会计记账")
              }
              services.push({name:"会计记账",price:parseInt(z[0])});
              refreshRightSummary();
              z=[];
              break;   
        case 8:
              if (services.some(el => el.name === "注册加急")){
                  services = services.filter(item => item.name !== "注册加急")
              }
              var urgent = document.getElementsByClassName("choosedsvr")[x+1];
              if (!urgent.classList.contains('choosesv')) {
            	  services.push({name:"注册加急",price:0});
              } else {
                  services.push({name:"注册加急",price:300+0});
              }
              refreshRightSummary();
              z=[];
              break; 
        case 9:
            if (services.some(el => el.name === "注册加急")){
                services = services.filter(item => item.name !== "注册加急")
            }
      	  services.push({name:"注册加急",price:300});
            refreshRightSummary();
            z=[];
            break; 
        }
    } else {
    	switch (x) {
        case 0:
        	if (services.some(el => el.name === "新注册新加坡公司开户")){
                services = services.filter(item => item.name !== "新注册新加坡公司开户")
            }
            refreshRightSummary();
            break;
        case 1:
        	if (services.some(el => el.name === "挂名董事")){
                services = services.filter(item => item.name !== "挂名董事")
            }
            refreshRightSummary();
            break;
        case 2:
            if (services.some(el => el.name === "GST消费税注册")){
                services = services.filter(item => item.name !== "GST消费税注册")
            }
            var gstClaim = document.getElementsByClassName("choosedsvr")[x+1];
        	if (gstClaim.classList.contains('choosesv')) {
        		services.push({name:"GST消费税注册",price:1200});
            }
        	z=[];
            refreshRightSummary();
            break;
        case 3:
        	if (services.some(el => el.name === "GST消费税注册")){
                services = services.filter(item => item.name !== "GST消费税注册")
            }
            var oneTimeReg = document.getElementsByClassName("choosedsvr")[x-1];
            if (oneTimeReg.classList.contains('choosesv')) {
        	    services.push({name:"GST消费税注册",price:400});
            }
            refreshRightSummary();
            break;
        case 4:
            z.push(document.getElementById("countglotel").value);
            if (services.some(el => el.name === "虚拟电话")){
                services = services.filter(item => item.name !== "虚拟电话")
            }
            var nextClass = document.getElementsByClassName("choosedsvr")[x+1];
            if (nextClass.classList.contains('choosesv')) {
          	  services.push({name:"虚拟电话",price:z[0]*500});
            }
            z=[];
            refreshRightSummary();
            break;
        case 5:
        	z.push(document.getElementById("countsgtel").value);
            if (services.some(el => el.name === "虚拟电话")){
                services = services.filter(item => item.name !== "虚拟电话")
            }
            var previousClass = document.getElementsByClassName("choosedsvr")[x-1];
            if (previousClass.classList.contains('choosesv')) {
          	  services.push({name:"虚拟电话",price:z[0]*200});
            }
            z=[];
            refreshRightSummary();
            break;
        case 6:
            if (services.some(el => el.name === "收信转寄服务")){
                services = services.filter(item => item.name !== "收信转寄服务")
            }
            refreshRightSummary();
            break; 
        case 7:
            if (services.some(el => el.name === "会计记账")){
                services = services.filter(item => item.name !== "会计记账")
            }
            refreshRightSummary();
            break;   
        case 8:
        	if (services.some(el => el.name === "注册加急")){
                services = services.filter(item => item.name !== "注册加急")
            }
        	var urgent = document.getElementsByClassName("choosedsvr")[x+1];
        	if (urgent.classList.contains('choosesv')) {
        		services.push({name:"注册加急",price:300});
            }
            refreshRightSummary();
            break;  
        case 9:
            if (services.some(el => el.name === "注册加急")){
                services = services.filter(item => item.name !== "注册加急")
            }
            refreshRightSummary();
            break;    
        } 
    }
    element.classList.toggle("choosesv");    
    btn.classList.toggle("choosedsvbtn");
}

var z= [];
function run(x) {
        if (z.length == 2){
            document.getElementById("priceDongshi").innerHTML = "S$"+(1800+1500)+"（含押金S$1500）";
            if (services.some(el => el.name === "挂名董事")){
                services = services.filter(item => item.name !== "挂名董事")
            }
        services.push({name:"挂名董事",price:1800+1500});
        refreshRightSummary();
        z= [];
    }    
}       

function runGuDong(x) {
    z.push(document.getElementById("countGuDong").value);
    z.push(document.getElementById("countYearGuDong").value);
    if (z.length ==2){
        document.getElementById("priceGuDong").innerHTML = "S$"+z[0]*z[1]*1000;
        if (services.some(el => el.name === "挂名股东")){
            services = services.filter(item => item.name !== "挂名股东")
        }
        services.push({name:"挂名股东",price:z[0]*z[1]*1000});
        refreshRightSummary();
        z= [];
    }
}

function runoffice(x) {
    z.push(document.getElementById("countoffice").value);
    z.push(document.getElementById("countMoffice").value);
    if (z.length ==2){
        document.getElementById("priceoffice").innerHTML = "S$"+z[0]*z[1]*800;
        if (services.some(el => el.name === "共享办公室")){
            services = services.filter(item => item.name !== "共享办公室")
        }
        services.push({name:"共享办公室",price:z[0]*z[1]*800});
        refreshRightSummary();
        z= [];
    }    
}       

function rungst(x) {
    z.push(document.getElementById("countapgst").value);
    //z.push(document.getElementById("countMoffice").value);
    if (z.length ==1){
        document.getElementById("priceapgst").innerHTML = "S$"+z[0]*300;
        if (services.some(el => el.name === "GST申报")){
            services = services.filter(item => item.name !== "GST申报")
        }
        services.push({name:"GST申报",price:z[0]*300});
        refreshRightSummary();
        z= [];
    }    
} 

function runsgtel(x) {
    z.push(document.getElementById("countsgtel").value);
    if (z.length ==1){
        document.getElementById("pricesgtel").innerHTML = "S$"+z[0]*200;
        if (services.some(el => el.name === "新加坡固定座机无人应答")){
            services = services.filter(item => item.name !== "新加坡固定座机无人应答")
        }
        services.push({name:"新加坡固定座机无人应答",price:z[0]*200});
        refreshRightSummary();
        z= [];
    }    
} 

  function runglotel(x) {
      z.push(document.getElementById("countglotel").value);
      if (z.length ==1){
          document.getElementById("priceglotel").innerHTML = "S$"+z[0]*500;
          if (services.some(el => el.name === "新加坡固定座机全球呼叫转移")){
            services = services.filter(item => item.name !== "新加坡固定座机全球呼叫转移")
        }
        services.push({name:"新加坡固定座机全球呼叫转移",price:z[0]*500});
        refreshRightSummary();
          z= [];
    }    
}

function runmail(x) {
	z.push(document.getElementById("countmail").value);
    if (z.length ==1){
         document.getElementById("pricemail").innerHTML = "S$"+z[0]*600;
         z= [];    
    }  
  }  

function runaccounting(x) {
    z.push(document.getElementById("countaccounting").value);
    if (z.length ==1){
        document.getElementById("priceaccounting").innerHTML = "S$"+z[0];
        z= [];        
   }    
}  

function addFile (x) {
    document.querySelector('#addfilediv'+x).insertAdjacentHTML('afterend',
        ` <div class="form-group row"  style="padding-left:15px;">
          <label class="col-sm-3 col-form-label">NRIC / ID / FIN /护照/其他</label>
          <div class="col-sm-8"><input type="file" class="form-control"  placeholder="联系电话"></div>
          <div class="col-sm-1" style="margin-top:.5rem;padding-left:0;"><input type="button" value="-" onclick="removeFile(this)"></div>                  
             </div>         
        </li>`      
    )
}         
function removeFile (input) {
    input.parentNode.parentNode.remove()
}

function addFileadd (x) {
      document.querySelector('#addfiledivadd'+x).insertAdjacentHTML('afterend',
    ` <div class="form-group row"  style="padding-left:15px;">
      <label class="col-sm-3 col-form-label">住所证明（海外,3个月内）</label>
      <div class="col-sm-8"><input type="file" class="form-control"  placeholder="联系电话"></div>
      <div class="col-sm-1" style="margin-top:.5rem;padding-left:0;"><input type="button" value="-" onclick="removeFileadd(this)"></div>                  
         </div>         
    </li>`      
      )
}

function removeFileadd (input) { input.parentNode.parentNode.remove() }

function addFilepimg (x) {
      document.querySelector('#addfiledivpimg'+x).insertAdjacentHTML('afterend',
        ` <div class="form-group row"  style="padding-left:15px;">
          <label class="col-sm-3 col-form-label">持护照(有照片页)正面头部照</label>
          <div class="col-sm-8"><input type="file" class="form-control"  placeholder="联系电话"></div>
          <div class="col-sm-1" style="margin-top:.5rem;padding-left:0;"><input type="button" value="-" onclick="removeFilepimg(this)"></div>                  
             </div>         
        </li>`      
      )
}

function removeFilepimg (input) { input.parentNode.parentNode.remove() }


function addMoreQ(x) {
	var checkBox = document.getElementById("checkb_gudong"+x);
	var text = document.getElementById("addmoreqtext"+x);
	if (checkBox.checked == true){
		text.style.display = "block";
	} else {
		text.style.display = "none";
	}
}

function addContactP() {
	addContactNo = document.getElementById("addContactNo").value;
	console.log ("addContactP: " + addContactNo);
	var contact = "";
	for (i = 1; i <= addContactNo; i++) {
		contact = contact + `<div class="contactClone">
			<div class="section-title">董事、股东、联系人资料 `+ i + `<div style="text-align: right;" class="removeNode">删除 [X]</div></div>
			<div class="form-group row">
			<label class="col-sm-3 col-form-label">职位类型（可多选）</label>
			<div class="col-sm-9">
				<div class="form-group">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="checkb_dongshi`+ i +`"> 
						<label style="height: auto;" class="form-check-label">董事</label>
					</div>
					<div class="form-check form-check-inline">`
						+ "<input class='form-check-input' type='checkbox' id='checkb_gudong"+ i + "' value='gudong' onclick='addMoreQ(" + i + ")'>"+
							`<label style="height:auto;"  class="form-check-label">股东</label>
					</div>   
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="checkb_contactpeople`+ i +`"> 
						<label style="height: auto;" class="form-check-label">联系人</label>
					</div>
				</div>

				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">全名(护照姓名)</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="fullName`+ i +`" placeholder="限英文"  onkeyup="value=value.replace(/[^\\\w\\\.\\\s\\\#\\\,\\\-\\\'\\\\\\\&\\\*\\\·\\\/]/ig,'')">
				</div>
			</div>	
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">性别</label>
				<div class="col-sm-9">
					<select class="custom-select c-select-info  appinfo" id="gender`+ i +`">
						<option value="男" selected>男</option>
						<option value="女">女</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
	        <label class="col-sm-3 col-form-label">国籍</label>
				<div class="form-item  col-sm-9">` + 
				"<input id='country" + i + "' class='form-control' type='text'>" + 
				"	<label for='country"+ i + "' style='display:none;'>Select a country here...</label> </div>  </div>" +
			`<div class="form-group row">
				<label class="col-sm-3 col-form-label">证件类型</label>
				<div class="col-sm-9">
					<select class="custom-select c-select-info  appinfo" id="ICType`+ i +`">
						<option value="公民" selected>新加坡公民(NRIC)</option>
						<option value="永久居民">新加坡PR(NRIC)</option>
						<option value="其他">国际护照</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">证件号码</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="ICNumber`+ i +`" placeholder="证件号码">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">电子邮箱</label>
				<div class="col-sm-9">
					<input type="email" class="form-control" id="email`+ i +`" placeholder="电子邮箱"  onkeyup="value=value.replace(/[^\\\w\\\.\\\s\\\#\\\,\\\-\\\'\\\\\\\&\*\\\·\\\@\\\/]/ig,'')">
				</div>
			</div>
			
			<div class="form-group row">
	         	 <label for="phone` + i + `" class="col-sm-3 col-form-label">联系电话</label><br/>
	         	 <div class="col-sm-9">
	         	    <input style="padding-left:3rem;" id="phone` + i + `" type="text" class="form-control telinput" placeholder="联系电话"/>
	         	 </div>
	      </div>											                    										                                  
			`+
			"<div style='display:none;' id='addmoreqtext"+ i +"'> " +
			`<div class="form-group row">
				<label class="col-sm-3 col-form-label">发行股份数量</label>
				<div class="col-sm-9">
					<input type="tel" class="form-control"
						id="calcNumberofSharesIssued` + i + `" placeholder="建议10000-50000股"   onkeyup="this.value=this.value.replace(/\\\D/g,'')" onafterpaste="this.value=this.value.replace(/\\\D/g,'')">
				</div>
			</div>													
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">实缴股份数量</label>
				<div class="col-sm-9">
					<input type="tel" class="form-control"
						id="calcNumberofPaid-inShares` + i + `" placeholder="建议与发行股份一致"   onkeyup="this.value=this.value.replace(/\\\D/g,'')" onafterpaste="this.value=this.value.replace(/\\\D/g,'')">
				</div>
			</div>													
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">每股价值</label>
				<div class="col-sm-9">
					<input type="tel" class="form-control"
						id="calcPerShare`+ i + `" placeholder="每股价值" value="1"   onkeyup="this.value=this.value.replace(/\\\D/g,'')" onafterpaste="this.value=this.value.replace(/\\\D/g,'')">
				</div>
			</div>	
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">个人地址及邮编</label>
				<div class="col-sm-9">
					<textarea class="form-control textareaheight"
						id="personalAddressAndPostalCode`+ i +`" placeholder="限英文，填写示范：111 North Bridge Rd, Peninsula Plaza #29-06A, Singapore 179098"  onkeyup="value=value.replace(/[^\\\w\\\.\\\s\\\#\\\,\\\-\\\'\\\\\\\&\\\*\\\·\\\/]/ig,'')"></textarea>
				</div>
		    </div>	
        </div>`;
	}
	$('.contactClone').remove();
	document.querySelector('#addContactPDiv0').insertAdjacentHTML('afterend',contact);
  	
	for (i = 1; i <= addContactNo; i++) {
		$("#country" + i ).countrySelect({
	    	preferredCountries: ['sg', 'cn', 'my']
	    });
	    var input = document.querySelector("#phone" + i );
	  	window.intlTelInput(input, {
	  	    // any initialisation options go here
	  	});
	}
  	
	$("input[id^='calc']").change(function () {
		var totalIssue = 0;
		var totalpay = 0;
		$("input[id^='calcPerShare']").each(function(i) {
  			var issueNo = $("#calcNumberofSharesIssued"+i).val();
	    	var payNo = $("#calcNumberofPaid-inShares"+i).val();
	    	var pershare = $("#calcPerShare"+i).val();
	    	totalIssue = totalIssue + issueNo * pershare;
	    	totalpay = totalpay + payNo * pershare;
		});
    	
		$("#registeredCapital1").val(totalIssue);
		$("#registeredCapital2").val(totalpay);
	}).change();
}

$("input[id^='calc']").change(function () {
	var issueNo = $("#calcNumberofSharesIssued0").val();
	var payNo = $("#calcNumberofPaid-inShares0").val();
	var pershare = $("#calcPerShare0").val();
	$("#registeredCapital1").val(issueNo * pershare);
	$("#registeredCapital2").val(payNo * pershare);
 }).change();

$('body').on('click','.removeNode', function() {
    $(this).closest('.contactClone').remove();
});
