function confirmCompanyInfo() {
	var checkBox = document.getElementById("infoCheckbox");
	$.ajax({
        url: '/api/company/manage/update',
        type : "POST",
        data: $('#companyDetailForm').serialize(),
        timeout: 600000,
        success: function(response){
        	console.log("Update Successful", response);
        },
        error: function(e) {
        console.error("ERROR : ", e);
    }
    });

	if (checkBox.checked == true) {
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
	}	
}
$('#a_com_upload').click(function(){ $('#imgupload').trigger('click'); });


function companyshowfilediag(doc_id) {
	$('#file_com_upload'+doc_id).trigger('click');		
}

function personshowfilediag(doc_id) {
	$('#file_per_upload'+doc_id).trigger('click');		
}

function companydownloadfile(uuid) {
	var req = new XMLHttpRequest();
    req.open("GET", "/api/company/download/file?uuid=" + uuid, true);
    req.responseType = "blob";
    req.onload = function (event) {
        var blob = req.response;
        var fileName = req.getResponseHeader("fileName") //if you have the fileName header available
        var link=document.createElement('a');
        link.href=window.URL.createObjectURL(blob);
        link.download=fileName;
        link.click();
    };
    req.send();
}
function companypreviewfile(uuid) {
	var req = new XMLHttpRequest();
    req.open("GET", "/api/company/download/file?uuid=" + uuid, true);
    req.responseType = "blob";
    req.onload = function (event) {
        var blob = req.response;
        var blobURL = URL.createObjectURL(blob);
        window.open(blobURL);
    };
    req.send();
}

function companyuploadfile(company_id, id) {
	var formData = new FormData();
    formData.append("file",$("#file_com_upload" + id)[0].files[0]);
    formData.append("company_id", company_id);
    formData.append("id", id);
    $.ajax({
        url:'/api/company/company/document/upload/'+company_id,
        type:'post',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response){
        	console.log("Upload Successful", response);
        	var obj = JSON.parse(response);
        	$("#showReport"+id).append(`<div id='AttachedReport${obj.referenceNo}'>						
											<div class="row">
												<div class="col-12 col-md-1 col-lg-1"></div>		
									            <div class="col-12 col-md-7 col-lg-7"><span>修改记录：</span> ${obj.createdDate}</div>
									            <div class="col-12 col-md-4 col-lg-4">														            	
									            	<div class="inline">														            	
										            	<a id="download_company_file${obj.id}" class="btnMenu view" onclick="companydownloadfile('${obj.referenceNo}')" >下载</a>	
										            	<span> | </span><a id="preview_company_file${obj.id}" class="btnMenu view" onclick="companypreviewfile('${obj.referenceNo}')">浏览</a>			
										            	<span> | </span><a id="delete_company_file${obj.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${obj.referenceNo}')">删除</a>						                  
													</div>							                  
												</div>		
												<div class="col-12 col-md-1 col-lg-1"></div>					
											</div>
										</div>`);
        	alert('上传文件成功');
        },
        error: function(e) {
        	console.error("ERROR : ", e)
        	alert('上传文件失败');
        }
    });
}

function companyuploadothertypefile (company_id, id) {
	var formData = new FormData();
	var name = $("#description_" + id).val();
	if (name === undefined || name == null || name.length <= 0) {
		alert('请先输入文档类型！');
		return false;
	}
    formData.append("file",$("#file_com_upload" + id)[0].files[0]);
    formData.append("company_id", company_id);
    formData.append("id", id);
    // formData.append("desc", $("#description_" + id));
    formData.append("desc", name);
    $.ajax({
        url:'/api/company/other/document/upload/'+company_id,
        type:'post',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response){
        	console.log("Upload Successful", response);
        	var obj = JSON.parse(response);
        	console.log("ReferenceNo: ", obj.referenceNo);
        	$("#showReport"+id).append(`<div id='AttachedReport` + obj.referenceNo + `'>						
											<div class="row">
												<div class="col-12 col-md-1 col-lg-1"></div>		
									            <div class="col-12 col-md-7 col-lg-7"><span>修改记录：</span> ` + obj.createdDate + `</div>
									            <div class="col-12 col-md-4 col-lg-4">														            	
									            	<div class="inline">														            	
										            	<a id="download_company_file`+ obj.id +`" class="btnMenu view" onclick="companydownloadfile('`+ obj.referenceNo+ `')" >下载</a>	
										            	<span> | </span><a id="preview_company_file`+obj.id+`" class="btnMenu view" onclick="companypreviewfile('`+obj.referenceNo+`')">浏览</a>			
										            	<span> | </span><a id="delete_company_file`+ obj.id+`" class="btnMenu view delete_company_file" onclick="companydeletefile('`+obj.referenceNo+`')">删除</a>						                  
													</div>							                  
												</div>		
												<div class="col-12 col-md-1 col-lg-1"></div>					
											</div>
										</div>`);
        	alert('上传文件成功');
        	// TODO need to update the list and replace the document history id from random to response one.
        	console.log(obj);
        	//$("#AttachedReport_"+id ).val(obj.referenceNo);
        	
        	
        },
        error: function(e) {
        	console.error("ERROR : ", e)
        	alert('上传文件失败');
        }
    });
}

function personuploadfile(company_id, person_id) {
	var formData = new FormData();
    formData.append("file",$("#file_per_upload" + person_id)[0].files[0]);
    formData.append("company_id", company_id);
    formData.append("person_id", person_id);
    $.ajax({
        url:'/api/company/person/document/upload/'+company_id,
        type:'post',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response){
        	console.log("Upload Successful", response);
        	var obj = JSON.parse(response);
        	$("#showReport"+person_id).append(`<div id='AttachedReport`+obj.referenceNo+`'>						
											<div class="row">
												<div class="col-12 col-md-1 col-lg-1"></div>		
									            <div class="col-12 col-md-7 col-lg-7"><span>修改记录：</span> `+obj.createdDate+`</div>
									            <div class="col-12 col-md-4 col-lg-4">														            	
									            	<div class="inline">														            	
										            	<a id="download_company_file`+obj.id+`" class="btnMenu view" onclick="companydownloadfile('`+obj.referenceNo+`')" >下载</a>	
										            	<span> | </span><a id="preview_company_file`+ obj.id + `" class="btnMenu view" onclick="companypreviewfile('`+obj.referenceNo+`')">浏览</a>			
										            	<span> | </span><a id="delete_company_file` + obj.id + `" class="btnMenu view delete_company_file" onclick="companydeletefile('`+obj.referenceNo+`')">删除</a>						                  
													</div>
												</div>
												<div class="col-12 col-md-1 col-lg-1"></div>
											</div>
										</div>`);
        	alert('上传文件成功');
        },
        error: function(e) {
        	console.error("ERROR : ", e)
        	alert('上传文件失败');
        }
    });
}

function companydeletefile(uuid) {
	var flag = confirm("提示: 确认删除此条记录吗? ");
	if(flag) {
		$.ajax({url: "/api/company/delete/file?uuid=" + uuid, 
			  success: function(result){
				  $('#AttachedReport'+uuid).remove();	
		}});
		
	}	
	
} 

//Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

function onloadlock (x) {
	var checkBox = document.getElementById("companyfilelock"+x);
	var text1 = document.getElementById("file_com_upload"+x);
	var text2 = document.getElementById("showReport"+x).querySelectorAll(".delete_company_file");
	var text3 = document.getElementById("upload_company_file"+x);
	if (checkBox.checked == true){
		for (var i = 0; i < text2.length; i++) {
			text2[i].style.cssText = "pointer-events: none; cursor: not-allowed;color:gray !important;";
		}
		text1.style.color = "gray";
		text1.style.pointerEvents="none";
		text1.style.textDecoration = "none";
		text3.style.cssText = "color:gray !important;";
		text3.style.pointerEvents="none";
		text3.style.textDecoration = "none";
	} else {
		for (var i = 0; i < text2.length; i++) {
			text2[i].style.removeProperty("pointer-events");
			text2[i].style.removeProperty("cursor");
			text2[i].style.removeProperty("color");
		}
		text1.style.color = "#6777ef";
		text1.style.pointerEvents="unset";
		text3.style.cssText = "color:#6777ef !important;";
		text3.style.pointerEvents="unset";
	}
}
function lock(x) {
	var checkBox = document.getElementById("companyfilelock"+x);
	var text1 = document.getElementById("file_com_upload"+x);
	var text2 = document.getElementById("showReport"+x).querySelectorAll(".delete_company_file");
	var text3 = document.getElementById("upload_company_file"+x);
	var flag = "false";
	if (checkBox.checked == true){
		flag = "true";
		for (var i = 0; i < text2.length; i++) {
			text2[i].style.cssText = "pointer-events: none; cursor: not-allowed;color:gray !important;";
		}
		text1.style.color = "gray";
		text1.style.pointerEvents="none";
		text1.style.textDecoration = "none";
		text3.style.cssText = "color:gray !important;";
		text3.style.pointerEvents="none";
		text3.style.textDecoration = "none";
	} else {
		flag = "false";
		for (var i = 0; i < text2.length; i++) {
			text2[i].style.removeProperty("pointer-events");
			text2[i].style.removeProperty("cursor");
			text2[i].style.removeProperty("color");
		}
		text1.style.color = "#6777ef";
		text1.style.pointerEvents="unset";
		text3.style.cssText = "color:#6777ef !important;";
		text3.style.pointerEvents="unset";
	}
	// call the API to update the flag
	var formData = new FormData();
    formData.append("id", x);
    console.log(formData);
	$.ajax({
        url: '/api/update/document/flag/' + flag,
        type:'post',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response){
        	console.log("Update Successful", response);
        },
        error: function(e) {
        	console.error("ERROR : ", e);
        }
    });
}	

function status_check(status, info_id, info_name) {
	document.getElementById("title_"+ info_id).innerHTML=(status=='on') ? 
			"董事/股东/联系人: <span>"+info_name+" 状态 (有效)</span>" : 
			"董事/股东/联系人: <span>"+info_name+" 状态 (撤销)</span>";
	
}

function confirmShareholderInfo(shareholderId) {
	var checkBox = document.getElementById("shareholder_info_" + shareholderId);
	var formData = $('#shareholderDetailForm_' + shareholderId).serialize();
	console.log(formData);
	/*var n = formData.indexOf("status_valid_"+shareholderId+"=on");
	if (n == -1) {
		document.getElementById("demo").innerHTML = n;
	}*/
	$.ajax({
        url: '/api/shareholder/manage/update/' + shareholderId,
        type : "POST",
        data: formData,
        timeout: 600000,
        success: function(response){
        	console.log("Update Successful", response);
        	// TODO need to add the file upload part
        	
        },
        error: function(e) {
        	console.error("ERROR : ", e);
        }
    });

	if (checkBox.checked == true) {
		$("#lock_shareholder_" + shareholderId).val("yes");
		$("#shareholderDetailForm_" + shareholderId + " input").prop("disabled", true);
		$("#shareholder_id_" + shareholderId).prop('disabled', false);
		
	} else {
		$("#lock_shareholder_" + shareholderId).val("no");
		$("#shareholderDetailForm_" + shareholderId + " input").prop('disabled', false);
	}	
}

function personlock(x) {
	var checkBox = document.getElementById("personalfilelock"+x);
	var text1 = document.getElementById("upload_person_file"+x);
	var text2 = document.getElementById("showReport"+x).querySelectorAll(".delete_company_file");
	var text3 = document.getElementById("upload_person_file"+x);
	var flag = "false";
	if (checkBox.checked == true){
		flag = "true";
		for (var i = 0; i < text2.length; i++) {
			text2[i].style.cssText = "pointer-events: none; cursor: not-allowed;color:gray !important;";
		}
		text1.style.color = "gray";
		text1.style.pointerEvents="none";
		text1.style.textDecoration = "none";
		text3.style.cssText = "color:gray !important;";
		text3.classList.remove("view");
		text3.style.pointerEvents="none";
		text3.style.textDecoration = "none";
	} else {
		flag = "false";
		for (var i = 0; i < text2.length; i++) {
			text2[i].style.removeProperty("pointer-events");
			text2[i].style.removeProperty("cursor");
			text2[i].style.removeProperty("color");
		}
		text1.style.color = "#6777ef";
		text1.style.pointerEvents="unset";
		text3.style.cssText = "color:#6777ef !important;";
		text3.classList.add("view");
		text3.style.pointerEvents="unset";
	}
	// call the API to update the flag
	var formData = new FormData();
    formData.append("id", x);
    console.log(formData);
	$.ajax({
        url: '/api/update/document/flag/' + flag,
        type:'post',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response){
        	console.log("Update Successful", response);
        },
        error: function(e) {
        	console.error("ERROR : ", e);
        }
    });
}	

function addNewUploadFile_company(companyId){
	var dateString = new Date().getTime().toString();
	var id = dateString.slice(dateString.length - 9).replace(/^0+/, ''); // need to remove 0
	$("#newUploadFileArea_company").append(`
		<div id="company_newfile_`+ id +`">
			<div class="row" style="padding-top:1%;">
			
	            <div class="col-12 col-md-8 col-lg-8 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport` + id + `" style="cursor: pointer;padding-right: 8%;display: inherit;padding-bottom: 1%;">
	           	   <input type="text" class="form-control" id = "description_` + id + `">		                  
				</div>
	            <div class="col-12 col-md-4 col-lg-4">	
					<div class="form-check">
                        <input class="form-check-input" type="checkbox"  id="companyfilelock`+ id +`"  onclick="lock(` + id + `)">
                        <label class="form-check-label" for="gridCheck">确认锁定 </label>
                    </div>	
                    <div class="inline">
		            	<span> | </span><input type="file" id="file_com_upload`+ id +`" style="display:none" onchange="companyuploadothertypefile(`+ companyId + ", " + id +`)"/>
		            			<a id="upload_company_file` + id + `" class="btnMenu view"  onclick="companyshowfilediag(` + id + `)">上传</a>	
		            	<span> | </span><input type="file" id="file_com_del_new" style="display:none" onchange=""/>
		            			<a id="" class="btnMenu view"  onclick="del_newAdd_company('company_newfile_`+ id + `')">删除</a>					
					</div>
				</div>
			</div>

			<div id="showReport` + id + `" class="collapse in">
			</div>														
		</div>
	`);
	}




function del_newAdd_company(childId) {
	var parent=document.getElementById("newUploadFileArea_company");
	var child=document.getElementById(childId);
	alert("确定要删除此条记录吗？");
	parent.removeChild(child);
};

function del_newAdd_personal() {
	var parent=document.getElementById("newUploadFileArea_personal");
	var child=document.getElementById("newArea_personal");
	alert("确定要删除此条记录吗？");
	parent.removeChild(child);
};

function addNewPerson_personal(companyId){
	var dateString = new Date().getTime().toString();
	var id = dateString.slice(dateString.length - 9).replace(/^0+/, ''); // need to remove 0
	var doclist = ["ANNEX B - Notice for Controllers", "Application of Shares", "Client Acceptance Form", "Form 45 & 201", "Share Certificate",
		        "Register of member", "Register of director", "Register of Auditor", "Register of Controllers ", "Register of Beneficial Owner",
		        "IC正面", "IC背面", "护照（有照片页）", "中国身份证 ", "持护照（打开有照片页）上半身照","住所证明"];
	
	var documentlist = "";
	for (i = 0; i < doclist.length; i++) {
		var text;
		switch (doclist[i]) {
		  case "ANNEX B - Notice for Controllers":
		  case "Application of Shares":
		  case "Client Acceptance Form":
		  case "Share Certificate":
			   text = "签名人员：Rsin (待签名)";
		       break;
		  default:
		    text = "";
		    break;
		}
		//TODO need to change the id to random otherwise duplicate with first shareholder id
		documentlist += `<div class="row">
				<div class="col-12 col-md-4 col-lg-4 collapsible_record" data-toggle="collapse" data-target="#showReport`+id+"_"+i+`" style="cursor: pointer" aria-expanded="true">
				   <b>`+doclist[i]+`</b>			                  
				</div>
				<div class="col-12 col-md-4 col-lg-4">` + text + `</div>
				<div class="col-12 col-md-4 col-lg-4">	
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="personalfilelock`+id+"_"+i+`" onclick="personlock('`+id+"_"+i+`')">
						<label class="form-check-label" for="gridCheck">确认锁定 </label>
					</div>	
					<div class="inline">														            	
						<span> | </span><input type="file" id="file_per_upload`+id+"_"+i+`" style="display:none" onchange="personuploadfile('`+companyId+ ", "+id+"_"+ i +`')">
										<a id="upload_person_file`+id+"_"+i+`" class="btnMenu view" onclick="personshowfilediag('`+id+"_"+i+`')">上传</a>		
					</div>
				</div>
			</div>`;
	}
		
	$("#newPersonArea_personal").append(`
		<div class="col-12 col-md-12 col-lg-12">
		    <div class="card downLoadFile">
		    	<div class="card-body" id="accordion_`+ id +`">
		      		<div class="accordion">
		                <div class="accordion-header collapsible1  collapsed" role="button" data-toggle="collapse" data-target="#panel-body-`+id+`" aria-expanded="false">
		                 	<h4>董事/股东/联系人:
		                 	</h4>
		                </div>
		                <div class="accordion-body collapse" id="panel-body-`+id+`" data-parent="#accordion_`+id+`">
			                <div class="card">
			                  <div class="card-body">
			                  	<div class="row">
						            <div class="col-12 col-md-12 col-lg-12" data-toggle="collapse"  data-target="#staffDetail_`+id+`" style="cursor: pointer">	
						           	    <b>个人基本信息</b><span style="color: #6777ef;">(查看|修改)</span>                 
									</div>							
								</div>	
								<div id="staffDetail_`+id+`" class="collapse in">							
									<div class="row">
										<div class="col-12 col-md-1 col-lg-1"></div>		
							            <div class="col-12 col-md-10 col-lg-10">
							            	<form id = "shareholderDetailForm_`+id+`" name="employeeForm">`
							            	//need to add the company id then can pass to backend
							            	+ "<input type='hidden' id='company_id' name='company_id' value='" +companyId+ "'>" +
							                    `<table class="table table-sm">
							                      <thead>
							                        <tr>
							                          <th scope="col">项目</th>
							                          <th scope="col">内容</th>
							                          <th scope="col">项目</th>
							                          <th scope="col">内容</th>											                          						  
							                        </tr>
							                      </thead>
							                      <tbody>
							                        <tr>
							                          <th scope="row">全名(护照姓名)</th>
							                          <td><input type="text" class="form-control form-control-sm" id="name_`+id+`" name="name_`+id+`"  value=""></td>
							                          <th scope="row">状态</th>
							                          <td>
														<div class="form-group">
															<div class="form-check form-check-inline">
																<input class="form-check-input" type="radio" name="status_valid_`+id+`" id="status_valid_`+id+`" >
																<label style="height: auto;" class="form-check-label">有效</label>
															</div>
															<div class="form-check form-check-inline">
																<input class="form-check-input" type="radio" name="status_valid_`+id+`" id="status_valid_`+id+`"/>
																<label style="height: auto;" class="form-check-label">撤销</label>
															</div>
														</div>
							                          </td>										                          
							                        </tr>
							                        <tr>
							                          <th scope="row">性别</th>
							                          <td><input type="text" class="form-control form-control-sm" id="gender_`+id+`" name="gender_`+id+`"  value=""></td>														                        
							                          <th scope="row">职位</th>
							                          <td>
														<div class="form-group">
															<div class="form-check form-check-inline">
																<input class="form-check-input" type="checkbox" id="director_`+id+`"  name="director_`+id+`"  /> 
																<label style="height: auto;" class="form-check-label">董事</label>
															</div>
															<div class="form-check form-check-inline">
																<input class="form-check-input" type="checkbox" id="shareholder_`+id+`" name="shareholder_`+id+`"/>
																<label style="height: auto;" class="form-check-label">股东</label>
															</div>
															<div class="form-check form-check-inline">
																<input class="form-check-input" type="checkbox" id="cotact_`+id+`" name="cotact_`+id+`" /> 
																<label style="height: auto;" class="form-check-label">联系人</label>
															</div>
														</div>
							                          </td>															                        													                            									                          
							                        </tr>														                        
							                        <tr>
							                          <th scope="row">国籍</th>
							                          <td><input type="text" class="form-control form-control-sm" id="national_`+id+`" name="national_`+id+`}"></td>
							                          <th scope="row">发行股份数量</th>
							                          <td><input type="text" class="form-control form-control-sm" id="issue_stock_`+id+`" name="issue_stock_`+id+`"></td>	
							                        </tr>
							                        <tr>
							                          <th scope="row">证件类型</th>
							                          <td><input type="text" class="form-control form-control-sm" id="ic_type_`+id+`" name="ic_type_`+id+`"></td>		
													  <th scope="row">实缴股份数量</th>
							                          <td><input type="text" class="form-control form-control-sm" id="actual_stock_`+id+`" name="actual_stock_`+id+`"></td>		
							                        </tr>
							                        <tr>
							                          <th scope="row">证件号码</th>
							                          <td><input type="text" class="form-control form-control-sm" id="ic_number_`+id+`" name="ic_number_`+id+`"></td>	
							                          <th scope="row">每股价值S$</th>
							                          <td><input type="text" class="form-control form-control-sm" id="value_per_stock_`+id+`" name="value_per_stock_`+id+`"></td>															                          
							                        </tr>
							                        <tr>
							                          <th scope="row">联系电话</th>
							                          <td><input type="text" class="form-control form-control-sm" id="contact_number_`+id+`" name="contact_number_`+id+`"></td>
							                          <th scope="row">电子邮箱</th>
							                          <td><input type="text" class="form-control form-control-sm" id="email_`+id+`" name="email_`+id+`"></td>														                         
							                        </tr>
							                        <tr>														                         
							                          <th scope="row">个人地址及邮编</th>
							                          <td colspan="3"><input type="text" class="form-control form-control-sm" id="address_`+id+`" name="address_`+id+`"></td>
							                        </tr>										                        																						                        									                        
							                      </tbody>
							                    </table>
						                    </form>	
											<div class="row">
									            <div class="col-12 col-md-4 col-lg-4"></div>
									            <div class="col-12 col-md-4 col-lg-4"></div>		
									            <div class="col-12 col-md-3 col-lg-3" style="padding-left: 5%;">	
												<div class="form-check">
							                        <input class="form-check-input" type="checkbox"  id="shareholder_info_`+id+`"  onclick="confirmShareholderInfo(`+id+`)">
							                        <label class="form-check-label" for="gridCheck">
							                       		 确认锁定
							                        </label>
							                    </div>	
							                    <div class="inline">														            	
									            	<span></span><a id="textInput001"  href="#" ></a>							                  
												</div>
												</div>																								
											</div>															                    
						                    <br/><br/>
										</div>	
										<div class="col-12 col-md-1 col-lg-1"></div>					
									</div>
								</div>` + 
								documentlist +
			                  `<div id="showReportid" class="collapse in"></div>
			                  </div>
			                </div>
		                </div>
		      		</div>
		     	 </div>
		    </div>
		</div>
																
	`);
	}

