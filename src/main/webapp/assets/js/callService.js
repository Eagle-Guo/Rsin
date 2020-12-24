    var COUNTRY_COUNT=0;
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
	function runglotel(x) {
		var z = [];
        z.push(document.getElementById("countglotel").value);
        if (z.length ==1){
            document.getElementById("priceglotel").innerHTML = "S$"+z[0] * 500;
            if (services.some(el => el.name === "新加坡固定座机无人应答")){
                services = services.filter(item => item.name !== "新加坡固定座机无人应答")
            }
            services.push({name:"新加坡固定座机无人应答",price:z[0] * 500});
            refreshRightSummary();
            z = [];
        }    
    } 
	
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
               }
            );
					
         });
      });

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

    function listSummary() {
    	companyInfos = [];
        if (document.getElementById("companyName").value!="") {
        	companyInfos.push({name:"公司名称",description:document.getElementById("companyName").value});
        }
        console.log("companyInfos" + companyInfos);
        companytext = "<ul class='list-group'>";
        for (i = 0; i < companyInfos.length; i++) {
            companytext += "<li class='list-group-item d-flex justify-content-between align-items-center'>" + companyInfos[i].name + 
                        "<span style='text-align: right;' class='badge badge-primary badge-pill'>" + companyInfos[i].description  + "</span>" +
                   "</li>";
        }
        companytext += "</ul>";
        document.getElementById("companyinfo_summary").innerHTML = companytext;
    }

    function choosedsv(x) {
        var element = document.getElementsByClassName("choosedsvr")[x];
        var btn = document.getElementsByClassName("badge-pill")[x];
        
        if (!element.classList.contains('choosesv')) {
        	switch (x) {                  
            case 0:
                if (services.some(el => el.name === "新加坡固定座机无人应答")){
                    services = services.filter(item => item.name !== "新加坡固定座机无人应答")
                }
                var countapgst = document.getElementById("countglotel").value;
                services.push({name:"新加坡固定座机无人应答",price:countapgst * 500});
                refreshRightSummary();
                break;
            }
        } else {
        	switch (x) {
            case 0:
            	if (services.some(el => el.name === "新加坡固定座机无人应答")){
                    services = services.filter(item => item.name !== "新加坡固定座机无人应答")
                }
                refreshRightSummary();
                break;
            } 
        }
        element.classList.toggle("choosesv");    
        btn.classList.toggle("choosedsvbtn");
    }
    
    



