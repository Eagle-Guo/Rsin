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
        $( "#businessEvent" ).autocomplete({
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
        });;
    });  

    
    $(function() {
        $( "#registerDate" ).datepicker();
        $( "#planAuditDate" ).datepicker();
        $( "#actualAuditDate" ).datepicker();
        $( "#financetDate" ).datepicker();
        $( "#gstTaxDate" ).datepicker();
        $( "#formClaimDate" ).datepicker();
        $( "#formTaxDate" ).datepicker();
        $( "#eciClaimDate" ).datepicker();
        $( "#ecitaxDate" ).datepicker();
        $( "#xbrlClaimDate" ).datepicker();
        $( "#openAccountDate" ).datepicker();
        $( "#OpenAccountCompleteDate" ).datepicker();
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
        $('#email').keyup(function(){
            if($(this).val().length !=0)
                $('#step2next').attr('disabled', false);            
            else
                $('#step2next').attr('disabled',true);
        })
        
        $("#send_email").click(function(event){
        	   alert("submit and confirm");
        	   console.log(JSON.stringify(services));
        	   console.log(JSON.stringify(companyInfos));
        	   console.log(JSON.stringify(shareholderInfos));
            $.post(
               "/api/sendemail",
               { "services" : JSON.stringify(services),
                 "companyInfos": JSON.stringify(companyInfos),
                 "shareholderInfos" : JSON.stringify(shareholderInfos)},
               function(data, status) {
            	   alert("Data: " + data + "\nStatus: " + status);
             	<!--     $('#stage').html(data); -->
               }
            );
					
         });
      });

    function saveToBackend() {
    	alert("save To Backend");
    	$.post(
                "/api/newCompany",
                { "services" : JSON.stringify(services),
                  "companyInfos": JSON.stringify(companyInfos),
                  "shareholderInfos" : JSON.stringify(shareholderInfos)},
                function(data, status) {
             	   alert("Data: " + data + "\nStatus: " + status);
              	<!--     $('#stage').html(data); -->
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
        if (document.getElementById("businessEvent").value!="") {
            companyInfos.push({name:"公司商业活动",description:document.getElementById("businessEvent").value});
        }
        if (document.getElementById("conpanyAddressAndPostalCode").value!="") {
            companyInfos.push({name:"公司地址及邮编",description:document.getElementById("conpanyAddressAndPostalCode").value});
        }

        var position = "";
        if (document.getElementById("checkb_dongshi1").checked) {
        	position = position + "董事, " ;
        }
        if (document.getElementById("checkb_gudong1").checked) {
        	position = position + "股东, ";
        }
        if (document.getElementById("checkb_contactpeople1").checked) {
        	position = position + "联系人, ";
        }
        if (position != "") {
            var pos = position.substring(0, position.length-2);
        	shareholderInfos.push({name:"职位填报类型", description:pos});
        }
        
        if (document.getElementById("fullName").value!="") {
            shareholderInfos.push({name:"全名",description:document.getElementById("fullName").value});
        }
        if (document.getElementById("country").value!="") {
            shareholderInfos.push({name:"国籍",description:document.getElementById("country").value});
        }
        if (document.getElementById("gender").value!="") {
            shareholderInfos.push({name:"性别",description:document.getElementById("gender").value});
        }
        if (document.getElementById("ICType").value!="") {
            shareholderInfos.push({name:"身份证类型",description:document.getElementById("ICType").value});
        }
        if (document.getElementById("ICNumber").value!="") {
            shareholderInfos.push({name:"证件号码",description:document.getElementById("ICNumber").value});
        }
        if (document.getElementById("email").value!="") {
            shareholderInfos.push({name:"电子邮箱",description:document.getElementById("email").value});
        }
        if (document.getElementById("phone").value!="") {
            shareholderInfos.push({name:"联系电话",description:document.getElementById("phone").value});
        }
        if (document.getElementById("personalAddressAndPostalCode").value!="") {
            shareholderInfos.push({name:"个人地址及邮编",description:document.getElementById("personalAddressAndPostalCode").value});
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
        //document.getElementsByClassName("choosedsvr")[x].style.backgroundColor= '#f8fafb';     
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
            	z.push(document.getElementById("inputGroupSelect04").value);
                z.push(document.getElementById("countYear").value);
                if (services.some(el => el.name === "挂名董事")){
                    services = services.filter(item => item.name !== "挂名董事")
                    //services = services.filter(item => item.name !== "押金")
                }
                services.push({name:"挂名董事",price:z[0]*z[1]*1800+1500});
                //services.push({name:"押金",price:1500});
                refreshRightSummary();
                z=[];
                break;
            case 2:
                  z.push(document.getElementById("countGuDong").value);
                  z.push(document.getElementById("countYearGuDong").value);
                  if (services.some(el => el.name === "挂名股东")){
                      services = services.filter(item => item.name !== "挂名股东")
                  }
                  services.push({name:"挂名股东",price:z[0]*z[1]*1000});
                  refreshRightSummary();
                  z=[];
                  break;
            case 3:
                  z.push(document.getElementById("countoffice").value);
                  z.push(document.getElementById("countMoffice").value);
                  if (services.some(el => el.name === "共享办公室")){
                      services = services.filter(item => item.name !== "共享办公室")
                  }
                  services.push({name:"共享办公室",price:z[0]*z[1]*800});
                  refreshRightSummary();
                  z=[];
                  break;
            case 4:
            	  if (services.some(el => el.name === "商标注册")){
                    services = services.filter(item => item.name !== "商标注册")
                  }
                  var bigClass = document.getElementsByClassName("choosedsvr")[x+1];
                  if (!bigClass.classList.contains('choosesv')) {
                	  services.push({name:"商标注册",price:1200});
                  } else {
                      services.push({name:"商标注册",price:2100});
                  }
                  refreshRightSummary();
                  break;
            case 5:
                  if (services.some(el => el.name === "商标注册")){
                      services = services.filter(item => item.name !== "商标注册")
                  }
                  var bigClass = document.getElementsByClassName("choosedsvr")[x-1];
              	  if (!bigClass.classList.contains('choosesv')) {
              		services.push({name:"商标注册",price:900});
              	  } else {
              		services.push({name:"商标注册",price:2100});
                  }
                  refreshRightSummary();
                  break;
            case 6:
            	z.push(document.getElementById("countapgst").value);
                  if (services.some(el => el.name === "GST消费税注册")){
                      services = services.filter(item => item.name !== "GST消费税注册")
                  }
                  var gstClaim = document.getElementsByClassName("choosedsvr")[x+1];
                  var requestClaim = document.getElementsByClassName("choosedsvr")[x+2];
              	  if (!gstClaim.classList.contains('choosesv')) {
                  	  if (!requestClaim.classList.contains('choosesv')){
                  		services.push({name:"GST消费税注册",price:400});
                      } else {
                    	  services.push({name:"GST消费税注册",price:400+1400});
                      }
              	  } else {
              		if (!requestClaim.classList.contains('choosesv')){
                  		services.push({name:"GST消费税注册",price:400+300*z[0]});
                      } else {
                    	  services.push({name:"GST消费税注册",price:400+300*z[0]+1400});
                      }
                  }
                  refreshRightSummary();
                  break;
            case 7:
                z.push(document.getElementById("countapgst").value);
                if (services.some(el => el.name === "GST消费税注册")){
                    services = services.filter(item => item.name !== "GST消费税注册")
                }
                var oneTimeReg = document.getElementsByClassName("choosedsvr")[x-1];
                var requestClaim = document.getElementsByClassName("choosedsvr")[x+1];
            	  if (!oneTimeReg.classList.contains('choosesv')) {
                	  if (!requestClaim.classList.contains('choosesv')){
                		services.push({name:"GST消费税注册",price:300*z[0]});
                      } else {
                  	    services.push({name:"GST消费税注册",price:300*z[0]+1400});
                      }
            	  } else {
            		if (!requestClaim.classList.contains('choosesv')){
                		services.push({name:"GST消费税注册",price:400+300*z[0]});
                    } else {
                  	  services.push({name:"GST消费税注册",price:400+300*z[0]+1400});
                    }
                }
                refreshRightSummary();
                z=[];
                break;
            case 8:
            	z.push(document.getElementById("countapgst").value);
            	if (services.some(el => el.name === "GST消费税注册")){
                    services = services.filter(item => item.name !== "GST消费税注册")
                }
                var gstClaim = document.getElementsByClassName("choosedsvr")[x-1];
                var oneTimeReg = document.getElementsByClassName("choosedsvr")[x-2];
            	  if (!gstClaim.classList.contains('choosesv')) {
                	if (!oneTimeReg.classList.contains('choosesv')){
                		services.push({name:"GST消费税注册",price:1400});
                    } else {
                  	  services.push({name:"GST消费税注册",price:400+1400});
                    }
            	  } else {
            		if (!oneTimeReg.classList.contains('choosesv')){
                		services.push({name:"GST消费税注册",price:1400+300*z[0]});
                    } else {
                  	  services.push({name:"GST消费税注册",price:400+300*z[0]+1400});
                    }
                }
                refreshRightSummary();
                break;

            case 9:
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
            case 10:
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
            case 11:
                  z.push(document.getElementById("countmail").value);
                  if (services.some(el => el.name === "收信转寄服务")){
                      services = services.filter(item => item.name !== "收信转寄服务")
                  }
                  services.push({name:"收信转寄服务",price:z[0]*600});
                  refreshRightSummary();
                  z=[];
                  break; 
            case 12:
                  z.push(document.getElementById("countaccounting").value);
                  if (services.some(el => el.name === "会计记账")){
                      services = services.filter(item => item.name !== "会计记账")
                  }
                  services.push({name:"会计记账",price:z[0]});
                  refreshRightSummary();
                  z=[];
                  break;   
            case 13:
                  if (services.some(el => el.name === "注册时间")){
                      services = services.filter(item => item.name !== "注册时间")
                  }
                  var urgent = document.getElementsByClassName("choosedsvr")[x+1];
                  if (!urgent.classList.contains('choosesv')) {
                	  services.push({name:"注册时间",price:0});
                  } else {
                      services.push({name:"注册时间",price:300});
                  }
                  refreshRightSummary();
                  z=[];
                  break; 
            case 14:
                if (services.some(el => el.name === "注册时间")){
                    services = services.filter(item => item.name !== "注册时间")
                }
                services.push({name:"注册时间",price:300});
                var normal = document.getElementsByClassName("choosedsvr")[x-1];
                if (!normal.classList.contains('choosesv')) {
              	  services.push({name:"注册时间",price:300});
                } else {
                    services.push({name:"注册时间",price:0});
                }
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
                if (services.some(el => el.name === "挂名股东")){
                    services = services.filter(item => item.name !== "挂名股东")
                }
                refreshRightSummary();
                break;
            case 3:
                if (services.some(el => el.name === "共享办公室")){
                    services = services.filter(item => item.name !== "共享办公室")
                }
                refreshRightSummary();
                break;
            case 4:
            	if (services.some(el => el.name === "商标注册")){
                    services = services.filter(item => item.name !== "商标注册")
                }
            	var nextClass = document.getElementsByClassName("choosedsvr")[x+1];
                if (nextClass.classList.contains('choosesv')) {
              	  services.push({name:"商标注册",price:900});
                }
                refreshRightSummary();
                break;
            case 5:
                if (services.some(el => el.name === "商标注册")){
                    services = services.filter(item => item.name !== "商标注册")
                }
                var previousClass = document.getElementsByClassName("choosedsvr")[x-1];
                if (previousClass.classList.contains('choosesv')) {
              	  services.push({name:"商标注册",price:1200});
                }
                refreshRightSummary();
                break;
            case 6:
            	z.push(document.getElementById("countapgst").value);
                if (services.some(el => el.name === "GST消费税注册")){
                    services = services.filter(item => item.name !== "GST消费税注册")
                }
                
                var gstClaim = document.getElementsByClassName("choosedsvr")[x+1];
                var requestClaim = document.getElementsByClassName("choosedsvr")[x+2];
            	if (gstClaim.classList.contains('choosesv')) {
                    if (requestClaim.classList.contains('choosesv')){
                		services.push({name:"GST消费税注册",price:300*z[0]+1400});
                    } else {
                  	    services.push({name:"GST消费税注册",price:300*z[0]});
                    }
            	} else {
            		if (requestClaim.classList.contains('choosesv')){
                		services.push({name:"GST消费税注册",price:1400});
                    }
                }
            	z=[];
                refreshRightSummary();
                break;
            case 7:
            	if (services.some(el => el.name === "GST消费税注册")){
                    services = services.filter(item => item.name !== "GST消费税注册")
                }
                var oneTimeReg = document.getElementsByClassName("choosedsvr")[x-1];
                var requestClaim = document.getElementsByClassName("choosedsvr")[x+1];
                if (oneTimeReg.classList.contains('choosesv')) {
                    if (requestClaim.classList.contains('choosesv')) {
              	        services.push({name:"GST消费税注册",price:400+1400});
                    } else {
                	    services.push({name:"GST消费税注册",price:400});
                    }
          	    } else {
          		    if (requestClaim.classList.contains('choosesv')) {
                	  services.push({name:"GST消费税注册",price:1400});
                    }
                }
                refreshRightSummary();
                break;
            case 8:
            	z.push(document.getElementById("countapgst").value);
                if (services.some(el => el.name === "GST消费税注册")){
                    services = services.filter(item => item.name !== "GST消费税注册")
                }
                var gstClaim = document.getElementsByClassName("choosedsvr")[x-1];
                var oneTimeReg = document.getElementsByClassName("choosedsvr")[x-2];
            	if (gstClaim.classList.contains('choosesv')) {
                    if (oneTimeReg.classList.contains('choosesv')){
                       services.push({name:"GST消费税注册",price:400+300*z[0]});
                    } else {
                  	    services.push({name:"GST消费税注册",price:300*z[0]});
                    }
                } else {
            		if (oneTimeReg.classList.contains('choosesv')){
                		services.push({name:"GST消费税注册",price:400});
                    }
                }
            	z=[];
                refreshRightSummary();
                break;
            case 9:
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
            case 10:
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
            case 11:
                if (services.some(el => el.name === "收信转寄服务")){
                    services = services.filter(item => item.name !== "收信转寄服务")
                }
                refreshRightSummary();
                break; 
            case 12:
                if (services.some(el => el.name === "会计记账")){
                    services = services.filter(item => item.name !== "会计记账")
                }
                refreshRightSummary();
                break;   
            case 13:
                if (services.some(el => el.name === "注册时间")){
                    services = services.filter(item => item.name !== "注册时间")
                }
                var nextClass = document.getElementsByClassName("choosedsvr")[x+1];
                if (nextClass.classList.contains('choosesv')) {
              	  services.push({name:"注册时间",price:300});
                }
                refreshRightSummary();
                break;  
            case 14:
                if (services.some(el => el.name === "注册时间")){
                    services = services.filter(item => item.name !== "注册时间")
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
            z.push(document.getElementById("inputGroupSelect04").value);
            z.push(document.getElementById("countYear").value);
            if (z.length == 2){
                document.getElementById("priceDongshi").innerHTML = "S$"+(z[0]*z[1]*1800+1500)+"（含押金S$1500）";
                if (services.some(el => el.name === "挂名董事")){
                    services = services.filter(item => item.name !== "挂名董事")
                }
            services.push({name:"挂名董事",price:z[0]*z[1]*1800+1500});
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
                  if (services.some(el => el.name === "寄信服务")){
                    services = services.filter(item => item.name !== "寄信服务")
                }
                services.push({name:"寄信服务",price:z[0]*500});
                refreshRightSummary();
                  z= [];    
             }    
      }  

      function runaccounting(x) {
          z.push(document.getElementById("countaccounting").value);
          if (z.length ==1){
              document.getElementById("priceaccounting").innerHTML = "S$"+z[0];
              if (services.some(el => el.name === "会计记账")){
                services = services.filter(item => item.name !== "会计记账")
            }
            services.push({name:"会计记账",price:z[0]});
            refreshRightSummary();
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
      function removeFileadd (input) {
          input.parentNode.parentNode.remove()
      }

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
      function removeFilepimg (input) {
          input.parentNode.parentNode.remove()
      }


      function addMoreQ(x) {
    	  var checkBox = document.getElementById("checkb_gudong"+x);
    	  var text = document.getElementById("addmoreqtext"+x);
    	  if (checkBox.checked == true){
    	    text.style.display = "block";
    	  } else {
    	     text.style.display = "none";
    	  }
    	}

      function addContactP (x) {
          //var x=a+1;
          document.querySelector('#addContactPDiv'+x).insertAdjacentHTML('afterend',
          ` <br/><br/><div class="section-title">董事、股东、联系人资料</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">职位填报类型</label>
				<div class="col-sm-9">																											
					 <div class="form-group">
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="checkb_dongshi"+x value="dongshi">
                        <label style="height:auto;" class="form-check-label" for="inlineCheckbox1">董事</label>
                      </div>
                      <div class="form-check form-check-inline">`
                      + "<input class='form-check-input' type='checkbox' id='checkb_gudong'+x value='gudong' onclick='addMoreQ("+x+")'>"+
                        `<label style="height:auto;"  class="form-check-label" for="inlineCheckbox2">股东</label>
                      </div>                     
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="checkb_contactpeopple"+x value="contactpeople">
                        <label style="height:auto;"  class="form-check-label" for="inlineCheckbox3">联系人</label>
                      </div>
                    </div>																															
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">全名(护照姓名)*</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="fullName"
						placeholder="全名(护照姓名)">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">国籍*</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="nationality"
						placeholder="国籍">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">性别</label>
				<div class="col-sm-9">
					<select class="custom-select c-select-info" id="gender">
						<option selected>男</option>
						<option value="1">女</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">身份证类型</label>
				<div class="col-sm-9">
					<select class="custom-select c-select-info" id="ICType">
						<option value="公民" selected>NRIC（公民）</option>
						<option value="永久居民">NRIC（永久居民）</option>
						<option value="FIN">FIN</option>
						<option value="护照/其他">护照/其他</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">证件号码*</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="ICNumber"
						placeholder="证件号码">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">出生国家*</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="birthCountry"
						placeholder="出生国家">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">出生日期*</label>
				<div class="col-sm-9">
					<input type="date" class="form-control" id="dateOfBirth"
						placeholder="出生日期">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">电子邮箱*</label>
				<div class="col-sm-9">
					<input type="email" class="form-control" id="email"
						placeholder="电子邮箱">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">联系电话*</label>
				<div class="col-sm-9">
					<input type="tel" class="form-control"
						id="contractNumber" placeholder="联系电话">
				</div>
			</div>`+
			"<div style='display:none;' id='addmoreqtext"+x+"'> " +
			`<div class="form-group row">
				<label class="col-sm-3 col-form-label">发行股份数量*</label>
				<div class="col-sm-9">
					<input type="tel" class="form-control"
						id="numberofSharesIssued"+x placeholder="发行股份数量">
				</div>
			</div>													
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">实缴股份数量*</label>
				<div class="col-sm-9">
					<input type="tel" class="form-control"
						id="numberofPaid-inShares"+x placeholder="实缴股份数量">
				</div>
			</div>													
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">每股价值*</label>
				<div class="col-sm-9">
					<input type="tel" class="form-control"
						id="aluePerShare"+x placeholder="每股价值">
				</div>
			</div>	
			</div>											
			<div class="form-group row">
				<label class="col-sm-3 col-form-label">个人地址及邮编</label>
				<div class="col-sm-9">
					<textarea class="form-control"
						id="personalAddressAndPostalCode" placeholder="个人地址及邮编"></textarea>
				</div>
			</div>
			<div class="form-group row" style="margin-top: 1rem;">
				<label class="col-sm-3 col-form-label">NRIC / ID / FIN /护照/其他</label>
				<div class="col-sm-8">
					<input type="file" class="form-control" id="uploadIC"+x placeholder="资料上传">
				</div>
				<div class="col-sm-1"
					style="margin-top: .5rem; padding-left: 0;">`
					+"<input type='button' value='+' onclick='addFile("+(x+1)+")'>"+
				`</div>
			</div>`+
			"<div class='form-group row' id='addfilediv"+x+"'></div>" +
			`<div class="form-group row">
				<label class="col-sm-3 col-form-label">住所证明（海外,3个月内）</label>
				<div class="col-sm-8">
					<input type="file" class="form-control"
						id="uploadAddress"+x placeholder="资料上传">
				</div>
				<div class="col-sm-1"
					style="margin-top: .5rem; padding-left: 0;">`
					+"<input type='button' value='+' onclick='addFileadd("+(x+1)+")'>"+
				`</div>
			</div>`+
			"<div class='form-group row' id='addfiledivadd"+(x+1)+"'></div>"+
			`<div class="form-group row">
				<label class="col-sm-3 col-form-label">持护照(有照片页)正面头部照</label>
				<div class="col-sm-8">
					<input type="file" class="form-control"
						id="uploadpassport"+x placeholder="资料上传">
				</div>
				<div class="col-sm-1"
					style="margin-top: .5rem; padding-left: 0;">`
					+"<input type='button' value='+' onclick='addFilepimg("+(x+1)+")'>"+
				`</div>
			</div>
			<input type="button" value="-" onclick="removeFileadd(this)">`
          )
      } 
