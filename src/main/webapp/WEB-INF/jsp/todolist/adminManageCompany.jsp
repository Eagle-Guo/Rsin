<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>睿信集团  &mdash;  睿信集团</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
  
  <!-- Template CSS -->
  <link rel="stylesheet" href="../../../assets/css/style.css">
  <link rel="stylesheet" href="../../../assets/css/components.css">
  <link rel="stylesheet" href="../../../assets/css/multiplepage.css">
  <link rel="stylesheet" href="../../../assets/css/jquery-ui.css">

</head>

<body>
<jsp:include page="../userMenu.jsp" />
<!-- Main Content -->
      <div class="main-content" id="openaccount">
        <section class="section">
          <div class="section-header">
            <h1>公司信息</h1>
          </div>
		  <!--PEN CONTENT -->	
           <div class="row adminDownLoadFile">
              <div class="col-12">
                <div class="card ">
                  <div class="card-header">
                    <h4>${company.name}</h4>
                    <div class="card-header-form">
                      <form>
                        <div class="input-group">
                          <input type="text" class="form-control" placeholder="Search">
                          <div class="input-group-btn">
                            <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>		  
							<div class="row">
						            <div class="col-12 col-md-12 col-lg-12" id="readyContent">
						                <div class="card downLoadFile">
						                	<div class="card-body">
						                    	<div id="accordion">
						                      		<div class="accordion">
								                        <div class="accordion-header collapsible1 collapsed" role="button" data-toggle="collapse" data-target="#panel-body-1" aria-expanded="false">
								                         	<h4>公司基本信息和注册文件</h4>
								                        </div>
								                        <div class="accordion-body collapse" id="panel-body-1" data-parent="#accordion">
										                <div class="card">
											                <div class="card-body">
											                  <form id = "companyDetailForm" name="employeeForm">
											                    <table class="table table-sm">
											                      <thead>
											                        <tr>
											                          <th scope="col">项目</th>
											                          <th scope="col">内容</th>						  
											                        </tr>
											                      </thead>
											                      
											                      <tbody>
											                        <tr>
											                          <th scope="row">ID</th>
											                          <td>${company.id } 
											                          		<input type="hidden" id="hide_id" name="hide_id"  value="${company.id }">
											                                <input type="hidden" name="lock_record"  value="yes">
											                          </td>
											                        </tr>
											                        
											                        <tr>
											                          <th scope="row">UEN(注册号)</th>
											                          <td><input type="text" class="form-control form-control-sm" name="txt_uen" <c:if test="${company.lockFlag }">disabled</c:if> value="${company.uen }"></td>
											                        </tr>
											                        <tr>
											                          <th scope="row">公司名称</th>
											                          <td><input type="text" class="form-control form-control-sm" name="txt_name" <c:if test="${company.lockFlag }">disabled</c:if> value="${company.name }"></td>
											                        </tr>
											                        <tr>
											                          <th scope="row">公司类型</th>
											                          <td><input type="text" class="form-control form-control-sm" name="txt_type" <c:if test="${company.lockFlag }">disabled</c:if> value="${company.type }"></td>
											                        </tr>
											                        <tr>
											                          <th scope="row">商业 活动1</th>
											                          <td><input type="text" class="form-control form-control-sm" name="txt_activity1" <c:if test="${company.lockFlag }">disabled</c:if> value="${company.activityOne }"></td>
											                        </tr>										                        
											                        <tr>
											                          <th scope="row">商业 活动2</th>
											                          <td><input type="text" class="form-control form-control-sm" name="txt_activity2" <c:if test="${company.lockFlag }">disabled</c:if> value="${company.activityTwo }"></td>
											                        </tr>										                        
											                        <tr>
											                          <th scope="row">挂名董事</th>
											                          <td><input type="text" class="form-control form-control-sm" name="txt_nominated" <c:if test="${company.lockFlag }">disabled</c:if> value="${company.nominatedDirector }"></td>
											                        </tr>																
											                        <tr>
											                          <th scope="row">董事</th>
											                          <td><input type="text" class="form-control form-control-sm" id="txt_director" name="txt_director" value="${directorsName }" disabled></td>
											                        </tr>																	
											                        <tr>
											                          <th scope="row">股东</th>
											                          <td><input type="text" class="form-control form-control-sm" id="txt_shareholder" name="txt_shareholder" value="${shareholdersName }" disabled></td>
											                        </tr>																	
											                        <tr>
											                          <th scope="row">秘书</th>
											                          <td><input type="text" class="form-control form-control-sm" name="txt_secretary" <c:if test="${company.lockFlag }">disabled</c:if> value="${company.secretary }"></td>
											                        </tr>																
											                        <tr>
											                          <th scope="row">注册资本</th>
											                          <td><input type="text" class="form-control form-control-sm" name="txt_totalStock" <c:if test="${company.lockFlag }">disabled</c:if> value="${company.totalStockCapital }"></td>
											                        </tr>																	
											                        <tr>
											                          <th scope="row">实缴资本</th>
											                          <td><input type="text" class="form-control form-control-sm" name="txt_actualStock" <c:if test="${company.lockFlag }">disabled</c:if> value="${company.actualStockCapital }"></td>
											                        </tr>		
											                        <tr>
											                          <th scope="row">注册时间</th>
											                          <td><input type="text" class="form-control form-control-sm" name="txt_registrationDate" <c:if test="${company.lockFlag }">disabled</c:if>  value="<fmt:formatDate pattern = 'dd/MM/yyyy' value='${company.registrationDate}' />"></td>
											                        </tr>																						                        									                        
											                      </tbody>
											                     
											                    </table>
											                    </form>
																<div class="row">
															            <div class="col-12 col-md-4 col-lg-4"></div>
															            <div class="col-12 col-md-4 col-lg-4"></div>		
															            <div class="col-12 col-md-4 col-lg-4">	
																		<div class="form-check">
													                        <input class="form-check-input" type="checkbox"  id="infoCheckbox" <c:if test="${company.lockFlag }">checked</c:if> onclick="confirmCompanyInfo()">
													                        <label class="form-check-label" for="gridCheck">确认锁定</label>
													                    </div>	
													                    <div class="inline">														            	
															            	<span></span><a id="textInput000" href="#"></a>							                  
																		</div>
																		</div>																								
																</div>											                    
											                  </div>
											                
										                </div>
										                <div class="card">
										                  <div class="card-body">
															<div class="row">
													            <div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport9" style="cursor: pointer">
													           	   <b>Constitution of Company（公司章程）</b>			                  
																</div>
													            <div class="col-12 col-md-4 col-lg-4"></div>		
													            <div class="col-12 col-md-4 col-lg-4">	
																	<div class="form-check">
												                        <input class="form-check-input" type="checkbox"  id="companyfilelock9"  onclick="lock(9)">
												                        <label class="form-check-label" for="gridCheck">确认锁定 </label>
												                    </div>	
												                    <div class="inline">														            	
														            	<span> | </span><input type="file" id="file_com_upload9" style="display:none" onchange="companyuploadfile(${company.id }, 9)"/>
														            					<a id="upload_company_file9" class="btnMenu view"  onclick="companyshowfilediag(9)">上传</a>		
																	</div>
																</div>
															</div>
																<div id="showReport9" class="collapse in">
																	<c:forEach items="${documentType1}" var="doc1" varStatus="loop">
																		<div id="AttachedReport${doc1.referenceNo}">							
																			<div class="row">
																					<div class="col-12 col-md-1 col-lg-1"></div>		
																		            <div class="col-12 col-md-7 col-lg-7">	
																		           	 	<span>修改记录：</span> ${doc1.createdDate}		                  
																					</div>
																	            <div class="col-12 col-md-4 col-lg-4">														            	
																	            	<div class="inline">														            	
																		            	<a id="download_company_file${doc1.id}" class="btnMenu view"  onclick="companydownloadfile('${doc1.referenceNo}')" >下载</a>	
																		            	<span> | </span><a id="preview_company_file${doc1.id}" class="btnMenu view" onclick="companypreviewfile('${doc1.referenceNo}')">浏览</a>			
																		            	<span> | </span><a id="delete_company_file${doc1.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${doc1.referenceNo}')">删除</a>						                  
																					</div>							                  
																				</div>		
																				<div class="col-12 col-md-1 col-lg-1"></div>					
																			</div>
																		</div>
																	</c:forEach>
																</div>
															<div class="row">
													            <div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport10" style="cursor: pointer">	
													           	    <b>Attached AML/CFT Report</b>
																</div>
													            <div class="col-12 col-md-4 col-lg-4"></div>		
													            <div class="col-12 col-md-4 col-lg-4">
														            <div class="form-check">
												                        <input class="form-check-input" type="checkbox"  id="companyfilelock10"  onclick="lock(10)">
												                        <label class="form-check-label" for="gridCheck"> 确认锁定 </label>
												                    </div>															            	
												                    <div class="inline">
														            	<span> | </span><input type="file" id="file_com_upload10" style="display:none" onchange="companyuploadfile(${company.id }, 10)"/>
														            					<a id="upload_company_file10" class="btnMenu view"   onclick="companyshowfilediag(10)">上传</a>		
																	</div>
																</div>								
															</div>
															<div id="showReport10" class="collapse in">
																<c:forEach items="${documentType2}" var="doc2" varStatus="loop">
																	<div id="AttachedReport${doc2.referenceNo}">							
																		<div class="row">
																				<div class="col-12 col-md-1 col-lg-1"></div>		
																	            <div class="col-12 col-md-7 col-lg-7">	
																	           	 	<span>修改记录：</span> ${doc2.createdDate}		                  
																				</div>
																            <div class="col-12 col-md-4 col-lg-4">														            	
																            	<div class="inline">														            	
																	            	<a id="download_company_file${doc2.id}" onclick="companydownloadfile('${doc2.referenceNo}')" >下载</a>	
																	            	<span> | </span><a id="preview_company_file${doc2.id}" class="btnMenu view" onclick="companypreviewfile('${doc2.referenceNo}')">浏览</a>			
																	            	<span> | </span><a id="delete_company_file${doc2.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${doc2.referenceNo}')">删除</a>						                  
																				</div>							                  
																			</div>		
																			<div class="col-12 col-md-1 col-lg-1"></div>					
																		</div>
																	</div>
																</c:forEach>
																</div>

															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport11" style="cursor: pointer"">	
														           	   <b>Certificate of Incorporation（公司注册证书）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            				                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="companyfilelock11"  onclick="lock(11)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><input type="file" id="file_com_upload11" style="display:none" onchange="companyuploadfile(${company.id }, 11)"/>
															            					<a id="upload_company_file11" class="btnMenu view"  onclick="companyshowfilediag(11)">上传</a>
																		</div>				                  
																	</div>																									
															</div>
															<div id="showReport11" class="collapse in">
															<c:forEach items="${documentType3}" var="doc3" varStatus="loop">
																	<div id="AttachedReport${doc3.referenceNo}">							
																		<div class="row">
																				<div class="col-12 col-md-1 col-lg-1"></div>		
																	            <div class="col-12 col-md-7 col-lg-7">	
																	           	 	<span>修改记录：</span> ${doc3.createdDate}		                  
																				</div>
																            <div class="col-12 col-md-4 col-lg-4">														            	
																            	<div class="inline">														            	
																	            	<a id="download_company_file${doc3.id}" onclick="companydownloadfile('${doc3.referenceNo}')" >下载</a>	
																	            	<span> | </span><a id="preview_company_file${doc3.id}" class="btnMenu view" onclick="companypreviewfile('${doc3.referenceNo}')">浏览</a>			
																	            	<span> | </span><a id="delete_company_file${doc3.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${doc3.referenceNo}')">删除</a>						                  
																				</div>							                  
																			</div>		
																			<div class="col-12 col-md-1 col-lg-1"></div>					
																		</div>
																	</div>
																</c:forEach>
																</div>
															<div class="row">
													            <div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport1" style="cursor: pointer"">	
													           	   <b>First Director Meeting Resolution</b>			                  
																</div>
													            <div class="col-12 col-md-4 col-lg-4">	
													            		签名人员：${nameInFirstDirectorMeetingResolution }
																</div>		
													            <div class="col-12 col-md-4 col-lg-4">	
														            <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="companyfilelock1"  onclick="lock(1)">
												                        <label class="form-check-label" for="gridCheck">
												                       		 确认锁定
												                        </label>
												                    </div>															            	
												                    <div class="inline">														            	
														            	<span> | </span><input type="file" id="file_com_upload1" style="display:none" onchange="companyuploadfile(${company.id }, 1)"/>
														            					<a id="upload_company_file1" class="btnMenu view"   onclick="companyshowfilediag(1)">上传</a>
																	</div>
																</div>																									
															</div>	
															<div id="showReport1" class="collapse in">
															<c:forEach items="${documentType4}" var="doc4" varStatus="loop">
																	<div id="AttachedReport${doc4.referenceNo}">							
																		<div class="row">
																				<div class="col-12 col-md-1 col-lg-1"></div>		
																	            <div class="col-12 col-md-7 col-lg-7">	
																	           	 	<span>修改记录：</span> ${doc4.createdDate}		                  
																				</div>
																            <div class="col-12 col-md-4 col-lg-4">														            	
																            	<div class="inline">														            	
																	            	<a id="download_company_file${doc4.id}" onclick="companydownloadfile('${doc4.referenceNo}')" >下载</a>	
																	            	<span> | </span><a id="preview_company_file${doc4.id}" class="btnMenu view" onclick="companypreviewfile('${doc4.referenceNo}')">浏览</a>			
																	            	<span> | </span><a id="delete_company_file${doc4.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${doc4.referenceNo}')">删除</a>						                  
																				</div>							                  
																			</div>		
																			<div class="col-12 col-md-1 col-lg-1"></div>					
																		</div>
																	</div>
																</c:forEach>
																</div>

															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4  collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport12" style="cursor: pointer"">	
														           	   <b>Risk Assessment（风险评估）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            		签名人员：${nameInRiskAssessment } 			                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="companyfilelock12"  onclick="lock(12)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><input type="file" id="file_com_upload12" style="display:none" onchange="companyuploadfile(${company.id }, 12)"/>
															            					<a id="upload_company_file12" class="btnMenu view"   onclick="companyshowfilediag(12)">上传</a>
																			<span> | </span><a id="sign_company_file12"  class="btnMenu view">在线签名</a>										            						                  
																		</div>
																	</div>																									
															</div>
															<div id="showReport12" class="collapse in">
																<c:forEach items="${documentType5}" var="doc5" varStatus="loop">
																	<div id="AttachedReport${doc5.referenceNo}">							
																		<div class="row">
																				<div class="col-12 col-md-1 col-lg-1"></div>		
																	            <div class="col-12 col-md-7 col-lg-7">	
																	           	 	<span>修改记录：</span> ${doc5.createdDate}		                  
																				</div>
																            <div class="col-12 col-md-4 col-lg-4">														            	
																            	<div class="inline">														            	
																	            	<a id="download_company_file${doc5.id}" onclick="companydownloadfile('${doc5.referenceNo}')" >下载</a>	
																	            	<span> | </span><a id="preview_company_file${doc5.id}" class="btnMenu view" onclick="companypreviewfile('${doc5.referenceNo}')">浏览</a>			
																	            	<span> | </span><a id="delete_company_file${doc5.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${doc5.referenceNo}')">删除</a>						                  
																				</div>							                  
																			</div>		
																			<div class="col-12 col-md-1 col-lg-1"></div>					
																		</div>
																	</div>
																</c:forEach>
																</div>
	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport13" style="cursor: pointer"">	
														           	   <b>Risk Assessment Checklist（风险评估清单）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            					                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="companyfilelock13"  onclick="lock(13)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><input type="file" id="file_com_upload13" style="display:none" onchange="companyuploadfile(${company.id }, 13)"/>
															            					<a id="upload_company_file13" class="btnMenu view"   onclick="companyshowfilediag(13)">上传</a>		
																		</div>
																	</div>																										
															</div>
															<div id="showReport13" class="collapse in">
																<c:forEach items="${documentType6}" var="doc6" varStatus="loop">
																	<div id="AttachedReport${doc6.referenceNo}">							
																		<div class="row">
																				<div class="col-12 col-md-1 col-lg-1"></div>		
																	            <div class="col-12 col-md-7 col-lg-7">	
																	           	 	<span>修改记录：</span> ${doc6.createdDate}		                  
																				</div>
																            <div class="col-12 col-md-4 col-lg-4">														            	
																            	<div class="inline">														            	
																	            	<a id="download_company_file${doc6.id}" onclick="companydownloadfile('${doc6.referenceNo}')" >下载</a>	
																	            	<span> | </span><a id="preview_company_file${doc6.id}" class="btnMenu view" onclick="companypreviewfile('${doc6.referenceNo}')">浏览</a>			
																	            	<span> | </span><a id="delete_company_file${doc6.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${doc6.referenceNo}')">删除</a>						                  
																				</div>							                  
																			</div>		
																			<div class="col-12 col-md-1 col-lg-1"></div>					
																		</div>
																	</div>
																</c:forEach>
																</div>
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport2" style="cursor: pointer"">	
														           	   <b>Secretary Agreement（秘书协议）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            		签名人员：${nameInSecretaryAgreement }		                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="companyfilelock2"  onclick="lock(2)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><input type="file" id="file_com_upload2" style="display:none" onchange="companyuploadfile(${company.id }, 2)"/>
															            					<a id="upload_company_file2" class="btnMenu view"  onclick="companyshowfilediag(2)">上传</a>
															            	<span> | </span><a id="sign_company_file2"  class="btnMenu view">在线签名</a>					                  
																		</div>
																	</div>
															</div>
															<div id="showReport2" class="collapse in">
																<c:forEach items="${documentType7}" var="doc7" varStatus="loop">
																	<div id="AttachedReport${doc7.referenceNo}">							
																		<div class="row">
																				<div class="col-12 col-md-1 col-lg-1"></div>		
																	            <div class="col-12 col-md-7 col-lg-7">	
																	           	 	<span>修改记录：</span> ${doc7.createdDate}		                  
																				</div>
																            <div class="col-12 col-md-4 col-lg-4">														            	
																            	<div class="inline">														            	
																	            	<a id="download_company_file${doc7.id}" onclick="companydownloadfile('${doc7.referenceNo}')" >下载</a>	
																	            	<span> | </span><a id="preview_company_file${doc7.id}" class="btnMenu view" onclick="companypreviewfile('${doc7.referenceNo}')">浏览</a>			
																	            	<span> | </span><a id="delete_company_file${doc7.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${doc7.referenceNo}')">删除</a>						                  
																				</div>							                  
																			</div>		
																			<div class="col-12 col-md-1 col-lg-1"></div>					
																		</div>
																	</div>
																</c:forEach>
																</div>

															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport14" style="cursor: pointer"">	
														           	   <b>Company info（公司信息）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            					                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="companyfilelock14"  onclick="lock(14)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><input type="file" id="file_com_upload14" style="display:none" onchange="companyuploadfile(${company.id }, 14)"/>
															            					<a id="upload_company_file14" class="btnMenu view"  onclick="companyshowfilediag(14)">上传</a>
																		</div>
																	</div>																										
															</div>	
															<div id="showReport14" class="collapse in">
															<c:forEach items="${documentType8}" var="doc8" varStatus="loop">
																	<div id="AttachedReport${doc8.referenceNo}">							
																		<div class="row">
																				<div class="col-12 col-md-1 col-lg-1"></div>		
																	            <div class="col-12 col-md-7 col-lg-7">	
																	           	 	<span>修改记录：</span> ${doc8.createdDate}		                  
																				</div>
																            <div class="col-12 col-md-4 col-lg-4">														            	
																            	<div class="inline">														            	
																	            	<a id="download_company_file${doc8.id}" onclick="companydownloadfile('${doc8.referenceNo}')" >下载</a>	
																	            	<span> | </span><a id="preview_company_file${doc8.id}" class="btnMenu view" onclick="companypreviewfile('${doc8.referenceNo}')">浏览</a>			
																	            	<span> | </span><a id="delete_company_file${doc8.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${doc8.referenceNo}')">删除</a>						                  
																				</div>							                  
																			</div>		
																			<div class="col-12 col-md-1 col-lg-1"></div>					
																		</div>
																	</div>
																</c:forEach>
																</div>
															
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport15" style="cursor: pointer"">	
														           	   <b>Register of Charges（收费登记册）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            					                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="companyfilelock15"  onclick="lock(15)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><input type="file" id="file_com_upload15" style="display:none" onchange="companyuploadfile(${company.id }, 15)"/>
															            					<a id="upload_company_file15" class="btnMenu view"  onclick="companyshowfilediag(15)">上传</a>
																		</div>
																	</div>																									
															</div>	
															<div id="showReport15" class="collapse in">
																<c:forEach items="${documentType9}" var="doc9" varStatus="loop">
																	<div id="AttachedReport${doc9.referenceNo}">							
																		<div class="row">
																				<div class="col-12 col-md-1 col-lg-1"></div>		
																	            <div class="col-12 col-md-7 col-lg-7">	
																	           	 	<span>修改记录：</span> ${doc9.createdDate}		                  
																				</div>
																            <div class="col-12 col-md-4 col-lg-4">														            	
																            	<div class="inline">														            	
																	            	<a id="download_company_file${doc9.id}" onclick="companydownloadfile('${doc9.referenceNo}')" >下载</a>	
																	            	<span> | </span><a id="preview_company_file${doc9.id}" class="btnMenu view" onclick="companypreviewfile('${doc9.referenceNo}')">浏览</a>			
																	            	<span> | </span><a id="delete_company_file${doc9.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${doc9.referenceNo}')">删除</a>						                  
																				</div>							                  
																			</div>		
																			<div class="col-12 col-md-1 col-lg-1"></div>					
																		</div>
																	</div>
																</c:forEach>
																</div>

															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport16" style="cursor: pointer"">	
														           	   <b>Register of Secretary（秘书名册）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            				                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="companyfilelock16"  onclick="lock(16)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><input type="file" id="file_com_upload16" style="display:none" onchange="companyuploadfile(${company.id }, 16)"/>
															            					<a id="upload_company_file16" class="btnMenu view" onclick="companyshowfilediag(16)">上传</a>
																		</div>
																	</div>																									
															</div>
															<div id="showReport16" class="collapse in">
																<c:forEach items="${documentType10}" var="doc10" varStatus="loop">
																	<div id="AttachedReport${doc10.referenceNo}">							
																		<div class="row">
																				<div class="col-12 col-md-1 col-lg-1"></div>		
																	            <div class="col-12 col-md-7 col-lg-7">	
																	           	 	<span>修改记录：</span> ${doc10.createdDate}		                  
																				</div>
																            <div class="col-12 col-md-4 col-lg-4">														            	
																            	<div class="inline">														            	
																	            	<a id="download_company_file${doc10.id}" onclick="companydownloadfile('${doc10.referenceNo}')" >下载</a>	
																	            	<span> | </span><a id="preview_company_file${doc10.id}" class="btnMenu view" onclick="companypreviewfile('${doc10.referenceNo}')">浏览</a>			
																	            	<span> | </span><a id="delete_company_file${doc10.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${doc10.referenceNo}')">删除</a>						                  
																				</div>							                  
																			</div>		
																			<div class="col-12 col-md-1 col-lg-1"></div>					
																		</div>
																	</div>
																</c:forEach>
															</div>
										                  
										                  </div>
										                </div>								                       
								                       
								                        </div>
						                      		</div>
						                    	</div>
						                 	 </div>
						                </div>
						            </div>			  		
                                </div> 
							<div class="row">
						            <div class="col-12 col-md-12 col-lg-12" id="">
						                <div class="card downLoadFile">
						                	<div class="card-body">
						                    	<div id="">
						                      		<div class="accordion">
								                        <div class="accordion-header collapsible1  collapsed" role="button" data-toggle="collapse" data-target="#panel-body-2" aria-expanded="false">
								                         	<h4>董事/股东/联系人：<span>AAA</span><span>状态（有效/撤销）</span></h4>
								                        </div>
								                        <div class="accordion-body collapse" id="panel-body-2" data-parent="#accordion">
										                <div class="card">
										                  <div class="card-body">
										                  	<div class="row">
														            <div class="col-12 col-md-12 col-lg-12" data-toggle="collapse"  data-target="#staffDetail" style="cursor: pointer">	
														           	    <b>AAA个人基本信息</b><span style="color: #6777ef;">(查看|修改)</span>                 
																	</div>							
															</div>	
															<div id="staffDetail" class="collapse in">							
																<div class="row">
																		<div class="col-12 col-md-1 col-lg-1"></div>		
															            <div class="col-12 col-md-10 col-lg-10">	
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
														                          <td><input type="text" class="form-control form-control-sm" id="textInput011"  value="AAA"></td>
														                          <th scope="row">状态</th>
														                          <td>
																					<div class="form-group">
																						<div class="form-check form-check-inline">
																							<input class="form-check-input" type="checkbox" id=""> 
																							<label style="height: auto;" class="form-check-label">有效</label>
																						</div>
																						<div class="form-check form-check-inline">
																							<input class="form-check-input" type="checkbox" id="" >
																							<label style="height: auto;" class="form-check-label">撤销</label>
																						</div>
																					</div>
														                          </td>										                          
														                        </tr>
														                        <tr>
														                          <th scope="row">性别</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput021" value="女"></td>														                        
														                          <th scope="row">职位</th>
														                          <td>
																					<div class="form-group">
																						<div class="form-check form-check-inline">
																							<input class="form-check-input" type="checkbox" id=""> 
																							<label style="height: auto;" class="form-check-label">董事</label>
																						</div>
																						<div class="form-check form-check-inline">
																							<input class="form-check-input" type="checkbox" id="" >
																							<label style="height: auto;" class="form-check-label">股东</label>
																						</div>
																						<div class="form-check form-check-inline">
																							<input class="form-check-input" type="checkbox" id=""> 
																							<label style="height: auto;" class="form-check-label">联系人</label>
																						</div>
																					</div>
														                          </td>															                        													                            									                          
														                        </tr>														                        
														                        <tr>
														                          <th scope="row">国籍</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput031" value="中国"></td>															                        
														                          <th scope="row">发行股份数量</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput081" value="5000"></td>	
														                        </tr>
														                        <tr>
														                          <th scope="row">证件类型</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput041" value="护照"></td>		
																				  <th scope="row">实缴股份数量</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput091" value="5000"></td>		
														                        </tr>
														                        <tr>
														                          <th scope="row">证件号码</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput051" value="W2222222222"></td>	
														                          <th scope="row">每股价值S$</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput101" value="1"></td>															                          
														                        </tr>
														                        <tr>
														                          <th scope="row">联系电话</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput071" value="65+83627182"></td>
														                          <th scope="row">电子邮箱</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput061" value="test@gmail.com"></td>														                         
														                        </tr>
														                        <tr>														                         
														                          <th scope="row">个人地址及邮编</th>
														                          <td colspan="3"><input type="text" class="form-control form-control-sm" id="textInput111" value="test"></td>
														                        </tr>										                        																						                        									                        
														                      </tbody>
														                    </table>	
																			<div class="row">
																		            <div class="col-12 col-md-4 col-lg-4"></div>
																		            <div class="col-12 col-md-4 col-lg-4"></div>		
																		            <div class="col-12 col-md-3 col-lg-3" style="padding-left: 5%;">	
																					<div class="form-check">
																                        <input class="form-check-input" type="checkbox"  id="infoCheckbox1"  onclick="confirmInfo(1)">
																                        <label class="form-check-label" for="gridCheck">
																                       		 确认锁定
																                        </label>
																                    </div>	
																                    <div class="inline">														            	
																		            	<span></span><a id="textInput001"  href="#" ></a>							                  
																					</div>
																					</div>																								
																			</div>															                    
														                    	<br/>      <br/>      <br/>                  
																		</div>	
																	<div class="col-12 col-md-1 col-lg-1"></div>					
																</div>
															</div>																
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>ANNEX B - Notice for Controllers</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	签名人员：AAA（已签名）	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox11"  onclick="lock(11)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn111"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn211"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Application of Shares</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	签名人员：AAA（已签名）	 	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox12"  onclick="lock(12)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn112"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn212"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																									
															</div>								
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Client Acceptance Form</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	签名人员：AAA（已签名）	 	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox13"  onclick="lock(13)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn113"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn213"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Form 45 / 201</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	签名人员：AAA（已签名）	 	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox14"  onclick="lock(14)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn114"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn214"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																									
															</div>
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Share Certificate</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	签名人员：AAA（已签名）	 	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox15"  onclick="lock(15)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn115"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn215"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																										
															</div>								
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Register of member </b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox16"  onclick="lock(16)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn116"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn216"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																										
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Register of director </b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox17"  onclick="lock(17)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn117"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn217"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																									
															</div>															
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Register of Auditor</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox18"  onclick="lock(18)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn118"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn218"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																										
															</div>								
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Register of Controllers </b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            		                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox19"  onclick="lock(19)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn119"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn219"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Register of Beneficial Owner</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox20"  onclick="lock(20)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn120"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn220"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																										
															</div>
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>IC正面</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	人员：AAA（已上传）	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox21"  onclick="lock(21)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn121"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn221"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																										
															</div>								
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>IC背面</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	人员：AAA（已上传）	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox22"  onclick="lock(22)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn122"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn222"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																								
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b> 护照（有照片页）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	人员：AAA（已上传）	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox23"  onclick="lock(23)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn123"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn223"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																										
															</div>																														
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>中国身份证</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	人员：AAA（已上传）	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox24"  onclick="lock(24)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn124"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn224"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																										
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>持护照（打开有照片页）上半身照</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	人员：AAA（已上传）	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox25"  onclick="lock(25)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn125"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn225"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																										
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>住所证明</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	人员：AAA（已上传）	                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
														            	 <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox26"  onclick="lock(26)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id=""  href="#" >下载</a>	
															            	<span> | </span><a id=""  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn126"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn226"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																									
															</div>																				                  
										                  </div>
										                </div>
								                        </div>
						                      		</div>
						                    	</div>
						                 	 </div>
						                </div>
						            </div>			  		
                                </div>                                 
       			</div>
               </div>
           </div>	        
        </section>
      </div>
      <footer class="main-footer">
        <div class="footer-left">
                      版权所有 &copy; 2020 <div class="bullet"></div> 设计是由 <a href="#">睿信集团</a>
        </div>
        <div class="footer-right">
          1.1.0
        </div>
      </footer>

  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../assets/js/stisla.js"></script>

  <!-- Template JS File -->
  <script src="../../../assets/js/scripts.js"></script>
  <script src="../../../assets/js/custom.js"></script>
  <script  src="../../../assets/js/multiplepage.js"></script>
  <!-- Page Specific JS File -->
  <script  src="../../../assets/js/adminManageCompany.js"></script>
</body>
</html>