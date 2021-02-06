$(document).ready(function() {
	//$("#startDate").attr("value", new Date(new Date().setFullYear(new Date().getFullYear() + 1)).toISOString().slice(0, 10));
	// $("#annual_audit_start_date").attr("min", new Date().toISOString().slice(0, 10));
	var allA = document.getElementsByTagName("a");
    for (var i = 0; i < allA.length; i++) {
        allA[i].onclick = deleteList;
    }
    
    var initiateLock = $( "#initiate_lock" ).val();
    //if default is lock then need to lock all the input and link
    if (initiateLock == 'true') {
    	$("#timeLineForm :input").prop("disabled", true);
		$("#hide_company_id").prop("disabled", false);
		$('#timeLineForm div').css({"pointer-events":"none"});
    }

});

function generateRecord(type){
    var registerDate = document.getElementById(type + "_registerDate").value;            	
    var serviceCycle = document.getElementById(type + "_service_cycle").value;
    var serviceTimes = document.getElementById(type + "_service_times").value;
    var startDate = new Date(document.getElementById(type + "_start_date").value);
 
    for (var i = 0; i < serviceTimes; i++) {
    	var tr = document.createElement("tr");
    	if (type == "annual_audit") {
    		tr.innerHTML="" +
    		"<td colspan='2' scope='col'>"+startDate.toLocaleDateString('en-GB')+
    			"<input type='hidden' name='annual_audit_plan_date_gen_" + i + "' value='" + startDate.toLocaleDateString('en-GB') + "'/></td>"+
	        "<td><div class='form-group'><input type='date' class='form-control' name='annual_audit_actual_date_gen_"+ i +"'></div></td>" +
			"<td><div class='form-check'><input class='form-check-input' type='checkbox' name='annual_audit_status_gen_" + i + "'> " +
				"<label class='form-check-label' for='annual_audit_status_gen_"+ i +"'>已完成</label>" +
				"</div></td>" +
			"<td><div class='form-group'><input type='text' class='form-control' name='annual_audit_comment_gen_"+ i + "'></div></td>" +
            "<td><a href='javascript:;'>删除此记录</a></td>" ;
    	} else if (type == "ECI") {
    		tr.innerHTML="" +
    		"<td colspan='2' scope='col'>"+startDate.toLocaleDateString('en-GB')+
    			"<input type='hidden' name='ECI_plan_date_gen_" + i + "' value='" + startDate.toLocaleDateString('en-GB') + "'/></td>"+
	        "<td><div class='form-group'><input type='date' class='form-control' name='ECI_actual_date_gen_"+ i +"'></div></td>" +
			"<td><div class='form-check'><input class='form-check-input' type='checkbox' name='ECI_status_gen_" + i + "'> " +
				"<label class='form-check-label' for='ECI_status_gen_"+ i +"'>已完成</label>" +
				"</div></td>" +
			"<td><div class='form-group'><input type='text' class='form-control' name='ECI_comment_gen_"+ i + "'></div></td>" +
            "<td><a href='javascript:;'>删除此记录</a></td>" ;
    	} else if (type == "GST") {
    		tr.innerHTML="" +
    		"<td colspan='2' scope='col'>"+startDate.toLocaleDateString('en-GB')+
    			"<input type='hidden' name='GST_plan_date_gen_" + i + "' value='" + startDate.toLocaleDateString('en-GB') + "'/></td>"+
	        "<td><div class='form-group'><input type='date' class='form-control' name='GST_actual_date_gen_"+ i +"'></div></td>" +
			"<td><div class='form-check'><input class='form-check-input' type='checkbox' name='GST_status_gen_" + i + "'> " +
				"<label class='form-check-label' for='GST_status_gen_"+ i +"'>已完成</label>" +
				"</div></td>" +
			"<td><div class='form-group'><input type='text' class='form-control' name='GST_comment_gen_"+ i + "'></div></td>" +
            "<td><a href='javascript:;'>删除此记录</a></td>" ;
    	} else if (type == "CIT") {
    		tr.innerHTML="" +
    		"<td colspan='2' scope='col'>"+startDate.toLocaleDateString('en-GB')+
    			"<input type='hidden' name='CIT_plan_date_gen_" + i + "' value='" + startDate.toLocaleDateString('en-GB') + "'/></td>"+
	        "<td><div class='form-group'><input type='date' class='form-control' name='CIT_actual_date_gen_"+ i +"'></div></td>" +
			"<td><div class='form-check'><input class='form-check-input' type='checkbox' name='CIT_status_gen_" + i + "'> " +
				"<label class='form-check-label' for='CIT_status_gen_"+ i +"'>已完成</label>" +
				"</div></td>" +
			"<td><div class='form-group'><input type='text' class='form-control' name='CIT_comment_gen_"+ i + "'></div></td>" +
            "<td><a href='javascript:;'>删除此记录</a></td>" ;
    	} else if (type == "CIT_payment") {
    		tr.innerHTML="" +
    		"<td colspan='2' scope='col'>"+startDate.toLocaleDateString('en-GB')+
    			"<input type='hidden' name='CIT_payment_plan_date_gen_" + i + "' value='" + startDate.toLocaleDateString('en-GB') + "'/></td>"+
	        "<td><div class='form-group'><input type='date' class='form-control' name='CIT_payment_actual_date_gen_"+ i +"'></div></td>" +
			"<td><div class='form-check'><input class='form-check-input' type='checkbox' name='CIT_payment_status_gen_" + i + "'> " +
				"<label class='form-check-label' for='CIT_payment_status_gen_"+ i +"'>已完成</label>" +
				"</div></td>" +
			"<td><div class='form-group'><input type='text' class='form-control' name='CIT_payment_comment_gen_"+ i + "'></div></td>" +
            "<td><a href='javascript:;'>删除此记录</a></td>" ;
    	}
        
        var a = tr.getElementsByTagName("a")[0];
        a.onclick=deleteList;
        var recordTable = document.getElementById("recordTable_"+ type);
        var tbody = recordTable.getElementsByTagName("tbody")[0];
        tbody.appendChild(tr);
        startDate.setFullYear(startDate.getFullYear() + 1);

    }
    alert("已生成记录，请在记录列表进行查看。");
}
//TEST

function deleteList() {
    var tr = this.parentNode.parentNode;
    var name = tr.children[0].innerHTML;
    var flag = confirm("确定" + name + "删除吗？");
    if (flag) {
        tr.parentNode.removeChild(tr);
    }
    return false;
};

//remove record
function removeTimeLineRecord() {
	var parent=document.getElementById("defaultparent");
	var child=document.getElementById("defaultchild");
	parent.removeChild(child);
}

//
function timeLineRecord(x) {
	  var text = document.getElementById("timeLineRecord"+x);	  
	  if (text.style.display === "none") {
		  text.style.display = "block";
	  } else {
		  text.style.display = "none";
	  }
	}

function confirmInfo(companyId, i) {
	var checkBox = document.getElementById("infoCheckbox"+i);
	var text = document.getElementById("textarea"+i);
	var lockflag = false;

	if (checkBox.checked == true){
		lockflag = true;
	} else {
		$("#textarea"+i).prop("disabled", false);
		lockflag = false;
	}

	console.log($('#textarea' + i).serialize());
	$.ajax({
        url: '/api/timeline/addition/update/'+companyId,
        type : "POST",
        data: $('#textarea' + i).serialize() + "&lockflag=" + lockflag,
        timeout: 600000,
        success: function(response){
        	console.log("Update Successful", response);
        },
        error: function(e) {
        	console.error("ERROR : ", e);
        }
    });
	
	if (checkBox.checked == true){
		$("#textarea"+i).prop("disabled", true);
	} else {
		
	}
}		

function showAndHideRecord(type) {
	  var x = document.getElementById("recordTable_"+type);
	  //var a = document.getElementById("changeFaIcon");	
	  var text = document.getElementById("viewRecord_"+type);	
	  var addBorder = document.getElementById("div_"+type);		  
	  if (x.style.display === "none") {
		x.style.display = "table";	
		//a.classList.replace("fa-plus-circle","fa-minus-circle");  
		text.innerHTML="收起记录";
		addBorder.style.border = "2px solid #3abaf4;";	
	  } else {
	    x.style.display = "none";
		//a.classList.replace("fa-minus-circle","fa-plus-circle");  
		text.innerHTML="展开记录";
		addBorder.style.border = "0px solid #3abaf4;";
		addBorder.replace("unfoldBorder","removeBorder");  
	  }
	}

function confirmTimelineInfo() {
	console.log($('#timeLineForm').serialize());
	var checkBox = document.getElementById("infoCheckbox_timeLineRecord");
	var locked = false;
	if (checkBox.checked == true) {
		locked = true;
	} else {
		locked = false;
	}	
	
	$.ajax({
        url: '/api/timeline/manage/update',
        type : "POST",
        data: $('#timeLineForm').serialize(),
        timeout: 600000,
        success: function(response){
        	console.log("Update Successful", response);
        },
        error: function(e) {
        	console.error("ERROR : ", e);
        }
    });

	if (locked) {
		$(".lineRecordArea input").prop("disabled", true);
		$(".lineRecordArea select").prop("disabled", true);
		$(".lineRecordArea button").prop("disabled", true);
		$(".lineRecordArea .badge").addClass("disabled");		
		$(".lineRecordArea a").addClass("disabled");
		$(".confirmArea #addNewService_timeLineRecord").addClass("disabled gray");		
		$(".confirmArea #addNewService_timeLineRecord").removeClass("view");
		// $(".lineRecordArea input[type=hidden]").prop("disabled", false);
		$(".lineRecordArea a").attr('class', 'disabled');
		$("#hide_company_id").prop("disabled", false);
		$('#timeLineForm div').css({"pointer-events":"none"});
	} else {
		$(".lineRecordArea input").prop('disabled', false);
		$(".lineRecordArea select").prop("disabled", false);
		$(".lineRecordArea button").prop("disabled", false);
		$(".lineRecordArea a").prop("disabled", false);	
		$(".lineRecordArea .badge").removeClass("disabled");
		$(".lineRecordArea a").removeClass("disabled");	
		$(".lineRecordArea a").attr('class', 'enabled');
		$(".confirmArea #addNewService_timeLineRecord").removeClass("disabled gray");	
		$(".confirmArea #addNewService_timeLineRecord").addClass("view");	
		$('#timeLineForm div').css({"pointer-events":""});
	}	
}



function addNewServiceArea(){
$("#lineRecordArea").append(`<div id="div_new" class="unfoldBorder">
								<table  class="table table-sm">
						      		<tr>
										<th scope="col">服务项目</th>
										<th scope="col">备注说明</th>
										<th scope="col">服务周期</th>
										<th scope="col">服务次数</th>	
										<th scope="col">开始时间</th>   
										<th scope="col">生成记录</th> 	
						      		</tr>
						      		<tr>        
									<th scope="row" id="new_service"><div class="form-group"><input type="text" class="form-control"></div></th>
									<th scope="row"  id="new_registerDate"><div class="form-group"><input type="text" class="form-control"></div></th>
										<td>
											<div class="form-group">
												<select class="form-control" id="new_service_cycle" >
													<option>选择服务周期</option>
													<option>1个月</option>
													<option>2个月</option>
													<option>3个月</option>
													<option>4个月</option>												                        
													<option>5个月</option>
													<option>6个月</option>												                        
													<option>7个月</option>
													<option>8个月</option>
													<option>9个月</option>
													<option>10个月</option>												                        
													<option>11个月</option>
													<option selected="selected">12个月</option>												                        
												</select>
											 </div>
							            </td>
										<td>
											 <div class="form-group">
												<select class="form-control" id="new_service_times">
													<option>选择服务次数</option>
													<option value="1">1</option>
													<option>2</option>
													<option>3</option>
													<option selected="selected">4</option>												                        
													<option>5</option>
													<option>6</option>												                        
													<option>7</option>
													<option>8</option>												                        
													<option>9</option>
													<option>10</option>		
													<option>11</option>
													<option>12</option>													                        											                        
												</select>
											</div>
							             </td>                   												  
										 <td>                    
											<div class="form-group">
												<input type="date" id="new_start_date"  class="form-control" name="meeting-time">
											</div>
										 </td>
									 	<td>
										 	<div class="badge badge-danger"><div style="cursor:pointer" onclick="generateRecord('new')">生成记录</div></div>
										 	<div class="badge badge-info"><div class="" id="viewRecord_new" style="cursor:pointer" onclick="showAndHideRecord('new')">收起记录</div></div>
									 	</td>
									</tr>	
									</table>
								<table class="table table-sm" id="recordTable_new"  >
							        <tr>
							             <td colspan="6" align="center" class="addBottom_adminTimeLine"><b>记录列表</b></td>
							        </tr>		
									<tr>
										<th colspan="2" scope="col">预计服务时间</th>	
										<th scope="col">实际服务时间</th>  
										<th scope="col">服务办理结果</th>    
										<th scope="col">其它内容备注</th>   
										<th scope="col">是否删除记录</th>                    				  
									</tr>
			
									
						    	</table>															    
							</div>`);
}
