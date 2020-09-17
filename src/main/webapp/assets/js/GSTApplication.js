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
	function reCalcgst(x) {
		var z = [];
        z.push(document.getElementById("countapgst").value);
        if (z.length ==1){
            document.getElementById("priceapgst").innerHTML = "S$"+z[0]*300;
            if (services.some(el => el.name === "GST申报")){
                services = services.filter(item => item.name !== "GST申报")
            }
            services.push({name:"GST申报",price:z[0]*300});
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
                  if (services.some(el => el.name === "一次性注册")){
                      services = services.filter(item => item.name !== "一次性注册")
                  }
                  services.push({name:"一次性注册",price:400});
                  refreshRightSummary();
                  break;
            case 1:
                if (services.some(el => el.name === "GST申报")){
                    services = services.filter(item => item.name !== "GST申报")
                }
                var countapgst = document.getElementById("countapgst").value;
                services.push({name:"GST消费税注册",price:countapgst * 300});
                refreshRightSummary();
                break;
            case 2:
                if (services.some(el => el.name === "申请加4次申报配套")){
                    services = services.filter(item => item.name !== "申请加4次申报配套")
                }
                services.push({name:"申请加4次申报配套",price:1400});
                refreshRightSummary();
                break;
            }
        } else {
        	switch (x) {
            case 0:
            	if (services.some(el => el.name === "一次性注册")){
                    services = services.filter(item => item.name !== "一次性注册")
                }
                refreshRightSummary();
                break;
            case 1:
            case 0:
            	if (services.some(el => el.name === "GST消费税注册")){
                    services = services.filter(item => item.name !== "GST消费税注册")
                }
                refreshRightSummary();
                break;
            case 2:
            case 0:
            	if (services.some(el => el.name === "申请加4次申报配套")){
                    services = services.filter(item => item.name !== "申请加4次申报配套")
                }
                refreshRightSummary();
                break;
            } 
        }
        element.classList.toggle("choosesv");    
        btn.classList.toggle("choosedsvbtn");
    }
    
    



