$(document).ready(function() {
	//$("#startDate").attr("value", new Date(new Date().setFullYear(new Date().getFullYear() + 1)).toISOString().slice(0, 10));
	$("#annual_audit_start_date").attr("min", new Date().toISOString().slice(0, 10));
	var allA = document.getElementsByTagName("a");
    for (var i = 0; i < allA.length; i++) {
        allA[i].onclick = deleteList;
    }
});

function generateRecord(type){
    var registerDate = document.getElementById(type + "_registerDate").value;            	
    var serviceCycle = document.getElementById(type + "_service_cycle").value;
    var serviceTimes = document.getElementById(type + "_service_times").value;
    var startDate = new Date(document.getElementById(type + "_start_date").value);
 
    for (var i = 0; i < serviceTimes; i++) {
    	var tr = document.createElement("tr");
        tr.innerHTML="" +
        		"<td colspan='2' scope='col'>"+startDate.toLocaleDateString('en-GB')+
        			"<input type='hidden' name='annual_audit_plan_date_gen_" + i + "' value='" + startDate.toLocaleDateString('en-GB') + "'/></td>"+
		        "<td><div class='form-group'><input type='date' class='form-control' name='annual_audit_actual_date_gen_"+ i +"'></div></td>" +
				"<td><div class='form-check'><input class='form-check-input' type='checkbox' name='annual_audit_status_gen_" + i + "'> " +
					"<label class='form-check-label' for='annual_audit_status_gen_"+ i +"'>已完成</label>" +
					"</div></td>" +
				"<td><div class='form-group'><input type='text' class='form-control' name='annual_audit_comment_gen_"+ i + "'></div></td>" +
                "<td><a href='javascript:;'>删除此记录</a></td>" ;
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

function confirmInfo(x) {
		var checkBox = document.getElementById("infoCheckbox"+x);
		var text0 = document.getElementById("textInput00"+x);	
		var text1 = document.getElementById("textInput01"+x);
		var text2 = document.getElementById("textInput02"+x);
		var text3 = document.getElementById("textInput03"+x);
		var text4 = document.getElementById("textInput04"+x);
		var text5 = document.getElementById("textInput05"+x);	
		var text6 = document.getElementById("textInput06"+x);
		var text7 = document.getElementById("textInput07"+x);
		var text8 = document.getElementById("textInput08"+x);
		var text9 = document.getElementById("textInput09"+x);
		var text10 = document.getElementById("textInput10"+x);		
		var text11 = document.getElementById("textInput11"+x);
		var text12 = document.getElementById("textInput12"+x);	
		var text13 = document.getElementById("textInput13"+x);	
		var text14 = document.getElementById("textInput14"+x);
		var text15 = document.getElementById("textInput15"+x);
		var text16 = document.getElementById("textInput16"+x);
		var text17 = document.getElementById("textInput17"+x);
		var text18 = document.getElementById("textInput18"+x);	
		var text19 = document.getElementById("textInput19"+x);
		var text20 = document.getElementById("textInput20"+x);
		var text21 = document.getElementById("textInput21"+x);
		var text22 = document.getElementById("textInput22"+x);
		var text23 = document.getElementById("textInput23"+x);		
		var text24 = document.getElementById("textInput24"+x);
		var text25 = document.getElementById("textInput25"+x);	
		var text26 = document.getElementById("textInput26"+x);
		var text27 = document.getElementById("textInput27"+x);
		var text28 = document.getElementById("textInput28"+x);		
		var text29 = document.getElementById("textInput29"+x);
		var text30 = document.getElementById("textInput30"+x);						
		if (checkBox.checked == true){
			text0.style.pointerEvents="none";	
			text0.style.color = "gray"; 
			text1.style.pointerEvents="none";
			text1.style.borderColor="white";		
			text2.style.pointerEvents="none";
			text2.style.borderColor="white";				
			text3.style.pointerEvents="none";
			text3.style.borderColor="white";			
			text4.style.pointerEvents="none";
			text4.style.borderColor="white";				
			text5.style.pointerEvents="none";
			text5.style.borderColor="white";			
			text6.style.pointerEvents="none";	
			text6.style.borderColor="white";			
			text7.style.pointerEvents="none";	
			text7.style.borderColor="white";			
			text8.style.pointerEvents="none";	
			text8.style.borderColor="white";			
			text9.style.pointerEvents="none";
			text9.style.borderColor="white";			
			text10.style.pointerEvents="none";	
			text10.style.borderColor="white";			
			text11.style.pointerEvents="none";
			text11.style.borderColor="white";			
			text12.style.pointerEvents="none";	
			text12.style.borderColor="white";		
			text13.style.pointerEvents="none";	
			text13.style.borderColor="white";
			text14.style.pointerEvents="none";	
			text14.style.borderColor="white";
			text15.style.pointerEvents="none";	
			text15.style.borderColor="white";
			text16.style.pointerEvents="none";	
			text16.style.borderColor="white";
			text17.style.pointerEvents="none";	
			text17.style.borderColor="white";
			text18.style.pointerEvents="none";	
			text18.style.borderColor="white";
			text19.style.pointerEvents="none";	
			text19.style.borderColor="white";
			text20.style.pointerEvents="none";	
			text20.style.borderColor="white";
			text21.style.pointerEvents="none";	
			text21.style.borderColor="white";
			text22.style.pointerEvents="none";	
			text22.style.borderColor="white";
			text23.style.pointerEvents="none";	
			text23.style.borderColor="white";
			text24.style.pointerEvents="none";	
			text24.style.borderColor="white";
			text25.style.pointerEvents="none";	
			text25.style.borderColor="white";
			text26.style.pointerEvents="none";	
			text26.style.borderColor="white";
			text27.style.pointerEvents="none";	
			text27.style.borderColor="white";
			text28.style.pointerEvents="none";	
			text28.style.borderColor="white";
			text29.style.pointerEvents="none";	
			text29.style.borderColor="white";
			text30.style.pointerEvents="none";	
			text30.style.borderColor="white";								
		} else {
			text0.style.pointerEvents="unset";	
			text0.style.color = "#6777ef"; 
			text1.style.pointerEvents="unset";
			text1.style.borderColor="#e4e6fc";		
			text2.style.pointerEvents="unset";	
			text2.style.borderColor="#e4e6fc";			
			text3.style.pointerEvents="unset";	
			text3.style.borderColor="#e4e6fc";			
			text4.style.pointerEvents="unset";	
			text4.style.borderColor="#e4e6fc";			
			text5.style.pointerEvents="unset";	
			text5.style.borderColor="#e4e6fc";			
			text6.style.pointerEvents="unset";	
			text6.style.borderColor="#e4e6fc";			
			text7.style.pointerEvents="unset";	
			text7.style.borderColor="#e4e6fc";			
			text8.style.pointerEvents="unset";	
			text8.style.borderColor="#e4e6fc";			
			text9.style.pointerEvents="unset";	
			text9.style.borderColor="#e4e6fc";			
			text10.style.pointerEvents="unset";	
			text10.style.borderColor="#e4e6fc";			
			text11.style.pointerEvents="unset";	
			text11.style.borderColor="#e4e6fc";			
			text12.style.pointerEvents="unset";	 	
			text12.style.borderColor="#e4e6fc";	
			text13.style.pointerEvents="unset";	
			text13.style.borderColor="#e4e6fc";			
			text14.style.pointerEvents="unset";	 	
			text14.style.borderColor="#e4e6fc";	
			text15.style.pointerEvents="unset";	
			text15.style.borderColor="#e4e6fc";			
			text16.style.pointerEvents="unset";	 	
			text16.style.borderColor="#e4e6fc";	
			text17.style.pointerEvents="unset";	
			text17.style.borderColor="#e4e6fc";			
			text18.style.pointerEvents="unset";	 	
			text18.style.borderColor="#e4e6fc";	
			text19.style.pointerEvents="unset";	
			text19.style.borderColor="#e4e6fc";			
			text20.style.pointerEvents="unset";	 	
			text20.style.borderColor="#e4e6fc";		
			text21.style.pointerEvents="unset";	 	
			text21.style.borderColor="#e4e6fc";	
			text22.style.pointerEvents="unset";	 	
			text22.style.borderColor="#e4e6fc";	
			text23.style.pointerEvents="unset";	 	
			text23.style.borderColor="#e4e6fc";	
			text24.style.pointerEvents="unset";	 	
			text24.style.borderColor="#e4e6fc";	
			text25.style.pointerEvents="unset";	 	
			text25.style.borderColor="#e4e6fc";	
			text26.style.pointerEvents="unset";	 	
			text26.style.borderColor="#e4e6fc";	
			text27.style.pointerEvents="unset";	 	
			text27.style.borderColor="#e4e6fc";	
			text28.style.pointerEvents="unset";	 	
			text28.style.borderColor="#e4e6fc";	
			text29.style.pointerEvents="unset";	 	
			text29.style.borderColor="#e4e6fc";	
			text30.style.pointerEvents="unset";	 	
			text30.style.borderColor="#e4e6fc";							
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

	/*if (checkBox.checked == true) {
		$("#lock_record").val("yes");
		$("#companyDetailForm input").prop("disabled", true);
		$("#hide_id").prop('disabled', false);
		$("#txt_director").attr("disabled","disabled");
		$("#txt_shareholder").attr("disabled","disabled");		
	} else {
		$("#lock_record").val("no");
		$("#companyDetailForm input").prop('disabled', false);
		$("#txt_director").attr("disabled","disabled");
		$("#txt_shareholder").attr("disabled","disabled");	
	}*/

	if (checkBox.checked == true) {
		//$(".badge").val("yes");
		$("#lock_record").val("yes");

		$(".lineRecordArea input").prop("disabled", true);
		$(".lineRecordArea select").prop("disabled", true);
		$(".lineRecordArea button").prop("disabled", true);
		$(".lineRecordArea .badge").addClass("disabled");		
		$(".lineRecordArea a").addClass("disabled");
		$(".confirmArea #addNewService_timeLineRecord").addClass("disabled gray");		
		$(".confirmArea #addNewService_timeLineRecord").removeClass("view");		
		//$(".badge").attr("disabled","disabled");			
	} else {
		//$("#lock_record").val("no");
		$("#lock_record").val("no");

		$(".lineRecordArea input").prop('disabled', false);
		$(".lineRecordArea select").prop("disabled", false);
		$(".lineRecordArea button").prop("disabled", false);
		$(".lineRecordArea a").prop("disabled", false);	
		$(".lineRecordArea .badge").removeClass("disabled");
		$(".lineRecordArea a").removeClass("disabled");		
		$(".confirmArea #addNewService_timeLineRecord").removeClass("disabled gray");	
		$(".confirmArea #addNewService_timeLineRecord").addClass("view");		
		//$(".badge").attr("disabled","disabled");
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
