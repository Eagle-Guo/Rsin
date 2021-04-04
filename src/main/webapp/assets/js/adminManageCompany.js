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
        	$("#showReport"+person_id).append(`<div id='AttachedReport${obj.referenceNo}'>						
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

function lock(x) {
	var checkBox = document.getElementById("companyfilelock"+x);
	var text1 = document.getElementById("file_com_upload"+x);
	var text2 = document.getElementById("showReport"+x).querySelectorAll(".delete_company_file");
	var text3 = document.getElementById("upload_company_file"+x);
	/*var text2 = document.getElementById("preview_company_file"+x);
	var text3 = document.getElementById("upload_company_file"+x);
	var text4 = document.getElementById("delete_company_file"+x);
	var text5 = document.getElementById("sign_company_file"+x);	*/
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

function confirmShareholderInfo(shareholderId) {
	var checkBox = document.getElementById("shareholder_info_" + shareholderId);
	console.log($('#shareholderDetailForm_' + shareholderId).serialize());
	$.ajax({
        url: '/api/shareholder/manage/update/' + shareholderId,
        type : "POST",
        data: $('#shareholderDetailForm_' + shareholderId).serialize(),
        timeout: 600000,
        success: function(response){
        	console.log("Update Successful", response);
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
	if (checkBox.checked == true){
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
}	

function companyshowfilediag_new (doc_id){
	$('#file_com_upload'+doc_id).trigger('click');	
}

function addNewUploadFile_company(companyId){
	var id = new Date().getTime();
	$("#newUploadFileArea_company").append(`
		<div id="newArea_company">
			<div class="row" style="padding-top:1%;">
			
	            <div class="col-12 col-md-8 col-lg-8 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport_new" style="cursor: pointer;padding-right: 8%;display: inherit;padding-bottom: 1%;">
	           	   <input type="text" class="form-control">		                  
				</div>
	            <div class="col-12 col-md-4 col-lg-4">	
					<div class="form-check">
                        <input class="form-check-input" type="checkbox"  id="companyfilelock$_new"  onclick="lock(new)">
                        <label class="form-check-label" for="gridCheck">确认锁定 </label>
                    </div>	
                    <div class="inline">
		            	<span> | </span><input type="file" id="file_com_upload_new`+ id +`" style="display:none" onchange="companyuploadfile(`+ companyId + ", " + id +`)"/>
		            			<a id="upload_company_file_new" class="btnMenu view"  onclick="companyshowfilediag_new(` + id + `)">上传</a>	
		            	<span> | </span><input type="file" id="file_com_del_new" style="display:none" onchange=""/>
		            			<a id="" class="btnMenu view"  onclick="del_newAdd_company()">删除</a>					
					</div>
				</div>
			</div>

			<div id="showReport_new" class="collapse in">
				
					<div id="AttachedReport_new">							
						<div class="row">
								<div class="col-12 col-md-1 col-lg-1"></div>		
					            <div class="col-12 col-md-7 col-lg-7">	
					           	 	<span>修改记录：</span> 		                  
								</div>
				            <div class="col-12 col-md-4 col-lg-4">														            	
				            	<div class="inline">														            	
					            	<a id="download_company_file_new" class="btnMenu view"  onclick="companydownloadfile('new')" >下载</a>	
					            	<span> | </span><a id="preview_company_file_new" class="btnMenu view" onclick="companypreviewfile('new')">浏览</a>			
					            	<span> | </span><a id="delete_company_file$_new" class="btnMenu view delete_company_file" onclick="companydeletefile('new')">删除</a>						                  
								</div>							                  
							</div>		
							<div class="col-12 col-md-1 col-lg-1"></div>					
						</div>
					</div>

			</div>														
		</div>
	`);
	}


function del_newAdd_company() {
	var parent=document.getElementById("newUploadFileArea_company");
	var child=document.getElementById("newArea_company");
	alert("确定要删除此条记录吗？");
	parent.removeChild(child);
};





function addNewUploadFile_personal(){
	$("#newUploadFileArea_personal").append(`
		<div id="newArea_personal">
			<div class="row" style="padding-top:1%;">
			
	            <div class="col-12 col-md-8 col-lg-8 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport_new" style="cursor: pointer;padding-right: 8%;display: inherit;padding-bottom: 1%;">
	           	   <input type="text" class="form-control">		                  
				</div>
	            <div class="col-12 col-md-4 col-lg-4">	
					<div class="form-check">
                        <input class="form-check-input" type="checkbox"  id="companyfilelock$_new"  onclick="lock(new)">
                        <label class="form-check-label" for="gridCheck">确认锁定 </label>
                    </div>	
                    <div class="inline">														            	
		            	<span> | </span><input type="file" id="file_com_upload_new" style="display:none" onchange=""/>
		            					<a id="upload_company_file_new" class="btnMenu view"  onclick="personalshowfilediag_new()">上传</a>	
		            	<span> | </span><input type="file" id="file_com_del_new" style="display:none" onchange=""/>
		            					<a id="" class="btnMenu view"  onclick="del_newAdd_personal()">删除</a>					
					</div>
				</div>
			</div>

			<div id="showReport_new" class="collapse in">
				
					<div id="AttachedReport_new">							
						<div class="row">
								<div class="col-12 col-md-1 col-lg-1"></div>		
					            <div class="col-12 col-md-7 col-lg-7">	
					           	 	<span>修改记录：</span> 		                  
								</div>
				            <div class="col-12 col-md-4 col-lg-4">														            	
				            	<div class="inline">														            	
					            	<a id="download_company_file_new" class="btnMenu view"  onclick="personaldownloadfile('new')" >下载</a>	
					            	<span> | </span><a id="preview_company_file_new" class="btnMenu view" onclick="personalpreviewfile('new')">浏览</a>			
					            	<span> | </span><a id="delete_company_file$_new" class="btnMenu view delete_company_file" onclick="personaldeletefile('new')">删除</a>						                  
								</div>							                  
							</div>		
							<div class="col-12 col-md-1 col-lg-1"></div>					
						</div>
					</div>

			</div>														
		</div>	
																
	`);
	}


function del_newAdd_personal() {
	var parent=document.getElementById("newUploadFileArea_personal");
	var child=document.getElementById("newArea_personal");
	alert("确定要删除此条记录吗？");
	parent.removeChild(child);
};





function addNewPerson_personal(){
	$("#newPersonArea_personal").append(`
		<div class="col-12 col-md-12 col-lg-12">
		    <div class="card downLoadFile">
		    	<div class="card-body" id="accordion_id">
		      		<div class="accordion">
		                <div class="accordion-header collapsible1  collapsed" role="button" data-toggle="collapse" data-target="#panel-body-new" aria-expanded="false">
		                 	<h4>董事/股东/联系人:
		                 	</h4>
		                </div>
		                <div class="accordion-body collapse" id="panel-body-new" data-parent="#accordion_id">
			                <div class="card">
			                  <div class="card-body">
			                  	<div class="row">
						            <div class="col-12 col-md-12 col-lg-12" data-toggle="collapse"  data-target="#staffDetail_id" style="cursor: pointer">	
						           	    <b>个人基本信息</b><span style="color: #6777ef;">(查看|修改)</span>                 
									</div>							
								</div>	
								<div id="staffDetail_id" class="collapse in">							
									<div class="row">
										<div class="col-12 col-md-1 col-lg-1"></div>		
							            <div class="col-12 col-md-10 col-lg-10">
							            	<form id = "shareholderDetailForm_id" name="employeeForm">
							                    <table class="table table-sm">
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
							                          <td><input type="text" class="form-control form-control-sm" id="name_id" name="name_id"  value=""></td>
							                          <th scope="row">状态</th>
							                          <td>
														<div class="form-group">
															<div class="form-check form-check-inline">
																<input type="hidden" id="shareholder_id_id }" name="shareholder_id_id" value="">
					                                			<input type="hidden" name="lock_shareholder_id" value="yes">
																<input class="form-check-input" type="radio" name="status_id" id="status_id" >
																<label style="height: auto;" class="form-check-label">有效</label>
															</div>
															<div class="form-check form-check-inline">
																<input class="form-check-input" type="radio" name="status_id" id="status_id"/>
																<label style="height: auto;" class="form-check-label">撤销</label>
															</div>
														</div>
							                          </td>										                          
							                        </tr>
							                        <tr>
							                          <th scope="row">性别</th>
							                          <td><input type="text" class="form-control form-control-sm" id="gender_id" name="gender_id"  value=""></td>														                        
							                          <th scope="row">职位</th>
							                          <td>
														<div class="form-group">
															<div class="form-check form-check-inline">
																<input class="form-check-input" type="checkbox" id="director_id"  name="director_id"  /> 
																<label style="height: auto;" class="form-check-label">董事</label>
															</div>
															<div class="form-check form-check-inline">
																<input class="form-check-input" type="checkbox" id="shareholder_id"/>
																<label style="height: auto;" class="form-check-label">股东</label>
															</div>
															<div class="form-check form-check-inline">
																<input class="form-check-input" type="checkbox" id="cotact_id"  /> 
																<label style="height: auto;" class="form-check-label">联系人</label>
															</div>
														</div>
							                          </td>															                        													                            									                          
							                        </tr>														                        
							                        <tr>
							                          <th scope="row">国籍</th>
							                          <td><input type="text" class="form-control form-control-sm" id="national_id" name="national_idd}"  value=""></td>
							                          <th scope="row">发行股份数量</th>
							                          <td><input type="text" class="form-control form-control-sm" id="issue_stock_id" name="issue_stock_id"  value=""></td>	
							                        </tr>
							                        <tr>
							                          <th scope="row">证件类型</th>
							                          <td><input type="text" class="form-control form-control-sm" id="ic_type_id" name="ic_type_id" value=""></td>		
													  <th scope="row">实缴股份数量</th>
							                          <td><input type="text" class="form-control form-control-sm" id="actual_stock_id" name="actual_stock_id"  value=""></td>		
							                        </tr>
							                        <tr>
							                          <th scope="row">证件号码</th>
							                          <td><input type="text" class="form-control form-control-sm" id="ic_number_id" name="ic_number_id"  value=""></td>	
							                          <th scope="row">每股价值S$</th>
							                          <td><input type="text" class="form-control form-control-sm" id="value_per_stock_id" name="value_per_stock_id"  value=""></td>															                          
							                        </tr>
							                        <tr>
							                          <th scope="row">联系电话</th>
							                          <td><input type="text" class="form-control form-control-sm" id="contact_number_id" name="contact_number_id"  value=""></td>
							                          <th scope="row">电子邮箱</th>
							                          <td><input type="text" class="form-control form-control-sm" id="email_id" name="email_id"  value=""></td>														                         
							                        </tr>
							                        <tr>														                         
							                          <th scope="row">个人地址及邮编</th>
							                          <td colspan="3">
							                          	<input type="text" class="form-control form-control-sm" id="address_id" 
							                          	name="address_id" value="">
							                          </td>
							                        </tr>										                        																						                        									                        
							                      </tbody>
							                    </table>
						                    </form>	
											<div class="row">
									            <div class="col-12 col-md-4 col-lg-4"></div>
									            <div class="col-12 col-md-4 col-lg-4"></div>		
									            <div class="col-12 col-md-3 col-lg-3" style="padding-left: 5%;">	
												<div class="form-check">
							                        <input class="form-check-input" type="checkbox"  id="shareholder_info_id"  onclick="confirmShareholderInfo(id)">
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
								</div>
		
								
									<div class="row">
										<div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReportid" style="cursor: pointer">
										   <b></b>			                  
										</div>
								
											
												<div class="col-12 col-md-4 col-lg-4">	
													签名人员： (已签名)
												</div>
										
										
												<div class="col-12 col-md-4 col-lg-4">	
													签名人员： (已签名)
												</div>
											
												<div class="col-12 col-md-4 col-lg-4">	
													签名人员： (已签名)
												</div>
										
												<div class="col-12 col-md-4 col-lg-4">	
													签名人员： (已签名)
												</div>
									
												<div class="col-12 col-md-4 col-lg-4">	
													签名人员： (已签名)
												</div>
											
												<div class="col-12 col-md-4 col-lg-4">	
													人员： (已上传)
												</div>
											
												<div class="col-12 col-md-4 col-lg-4">	
													人员： (已上传)
												</div>
									
												<div class="col-12 col-md-4 col-lg-4">	
													人员： (已上传)
												</div>
									
												<div class="col-12 col-md-4 col-lg-4">	
													人员： (已上传)
												</div>
											
												<div class="col-12 col-md-4 col-lg-4">	
													人员： (已上传)
												</div>
											
												<div class="col-12 col-md-4 col-lg-4">	
													人员： (已上传)
												</div>
		
										<div class="col-12 col-md-4 col-lg-4">	
											<div class="form-check">
												<input class="form-check-input" type="checkbox"  id="personalfilelockid"  onclick="personlock(id)">
												<label class="form-check-label" for="gridCheck">确认锁定 </label>
											</div>	
											<div class="inline">														            	
												<span> | </span><input type="file" id="file_per_uploadid" style="display:none" onchange="personuploadfile(id)"/>
																<a id="upload_person_fileid" class="btnMenu view"  onclick="personshowfilediag(id)">上传</a>		
											</div>
										</div>
									</div>
								
									<div id="showReportid" class="collapse in">
										
											<div id="AttachedReportid">							
												<div class="row">
														<div class="col-12 col-md-1 col-lg-1"></div>		
														<div class="col-12 col-md-7 col-lg-7">	
															<span>修改记录：</span>                 
														</div>
													<div class="col-12 col-md-4 col-lg-4">														            	
														<div class="inline">														            	
															<a id="download_company_fileid" class="btnMenu view"  onclick="companydownloadfile(id)" >下载</a>	
															<span> | </span><a id="preview_company_fileid" class="btnMenu view" onclick="companypreviewfile(id)">浏览</a>			
															<span> | </span><a id="delete_company_fileid" class="btnMenu view delete_company_file" onclick="companydeletefile(id)">删除</a>						                  
														</div>							                  
													</div>		
													<div class="col-12 col-md-1 col-lg-1"></div>					
												</div>
											</div>
									
									</div>
							
								
								<div id="newUploadFileArea_personal">																	
								</div>	
									
								<div class="inline">	
								       <div class="badge badge-danger"><span  id="addNewUploadFile_personal"  onclick="addNewUploadFile_personal()" style="cursor: pointer;">增加上传文件</span></div>												            	
								</div>																	
								
			                  </div>
			                </div>
		                </div>
		      		</div>
		     	 </div>
		    </div>
		</div>
																
	`);
	}

