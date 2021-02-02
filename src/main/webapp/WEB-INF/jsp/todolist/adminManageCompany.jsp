<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
														                          		<input type="hidden" id="hide_id" name="hide_id" value="${company.id }">
														                                <input type="hidden" name="lock_record" value="yes">
														                          </td>
												                       			</tr>
												                        
														                        <tr>
														                          <th scope="row">UEN(注册号)</th>
														                          <td><input type="text" class="form-control form-control-sm" name="txt_uen" <c:if test="${company.lockFlag || companay.uen != null }">disabled</c:if> value="${company.uen }"></td>
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

																<c:forEach var="docs" items="${docCompanyList}" >
																	<div class="row">
															            <div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport${docs.id}" style="cursor: pointer">
															           	   <b>${docs.documentDesc} <c:if test="${not empty docs.documentDesccn}"> (${docs.documentDesccn}) </c:if></b>			                  
																		</div>
																		<c:choose>
																			<c:when test = "${docs.documentDesc eq 'First Director Meeting Resolution'}">
																				<div class="col-12 col-md-4 col-lg-4">	
																            		签名人员：${nameInFirstDirectorMeetingResolution }
																				</div>
																			</c:when>
																			<c:when test = "${docs.documentDesc eq 'Risk Assessment'}">
																				<div class="col-12 col-md-4 col-lg-4">	
																            		签名人员：${nameInRiskAssessment }
																				</div>
																			</c:when>
																			<c:when test = "${docs.documentDesc eq 'Secretary Agreement'}">
																				<div class="col-12 col-md-4 col-lg-4">	
																            		签名人员：${nameInSecretaryAgreement }
																				</div>
																			</c:when>
																			<c:otherwise>
																				<div class="col-12 col-md-4 col-lg-4"></div>		
																			</c:otherwise>
																		</c:choose>
															            <div class="col-12 col-md-4 col-lg-4">	
																			<div class="form-check">
														                        <input class="form-check-input" type="checkbox"  id="companyfilelock${docs.id}"  onclick="lock(${docs.id})">
														                        <label class="form-check-label" for="gridCheck">确认锁定 </label>
														                    </div>	
														                    <div class="inline">														            	
																            	<span> | </span><input type="file" id="file_com_upload${docs.id}" style="display:none" onchange="companyuploadfile(${company.id }, ${docs.id})"/>
																            					<a id="upload_company_file${docs.id}" class="btnMenu view"  onclick="companyshowfilediag(${docs.id})">上传</a>		
																			</div>
																		</div>
																	</div>

																	<div id="showReport${docs.id}" class="collapse in">
																		<c:forEach items="${docCompanyMap[docs.documentType.documentTypeCode]}" var="docHistory" varStatus="loop">
																			<div id="AttachedReport${docHistory.referenceNo}">							
																				<div class="row">
																						<div class="col-12 col-md-1 col-lg-1"></div>		
																			            <div class="col-12 col-md-7 col-lg-7">	
																			           	 	<span>修改记录：</span> ${docHistory.createdDate}		                  
																						</div>
																		            <div class="col-12 col-md-4 col-lg-4">														            	
																		            	<div class="inline">														            	
																			            	<a id="download_company_file${docHistory.id}" class="btnMenu view"  onclick="companydownloadfile('${docHistory.referenceNo}')" >下载</a>	
																			            	<span> | </span><a id="preview_company_file${docHistory.id}" class="btnMenu view" onclick="companypreviewfile('${docHistory.referenceNo}')">浏览</a>			
																			            	<span> | </span><a id="delete_company_file${docHistory.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${docHistory.referenceNo}')">删除</a>						                  
																						</div>							                  
																					</div>		
																					<div class="col-12 col-md-1 col-lg-1"></div>					
																				</div>
																			</div>
																		</c:forEach>
																	</div>
																</c:forEach> 
																
															<div id="newUploadFileArea">	
																<!--<c:forEach var="docs" items="${docCompanyList}" >-->
																	<div class="row">
															            <div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport${docs.id}" style="cursor: pointer">
															           	   <input type="text" class="form-control">		                  
																		</div>
															            <div class="col-12 col-md-4 col-lg-4">	
																			<div class="form-check">
														                        <input class="form-check-input" type="checkbox"  id="companyfilelock${docs.id}"  onclick="lock(${docs.id})">
														                        <label class="form-check-label" for="gridCheck">确认锁定 </label>
														                    </div>	
														                    <div class="inline">														            	
																            	<span> | </span><input type="file" id="file_com_upload${docs.id}" style="display:none" onchange="companyuploadfile(${company.id }, ${docs.id})"/>
																            					<a id="upload_company_file${docs.id}" class="btnMenu view"  onclick="companyshowfilediag(${docs.id})">上传</a>		
																			</div>
																		</div>
																	</div>

																	<div id="showReport${docs.id}" class="collapse in">
																		
																			<div id="AttachedReport${docHistory.referenceNo}">							
																				<div class="row">
																						<div class="col-12 col-md-1 col-lg-1"></div>		
																			            <div class="col-12 col-md-7 col-lg-7">	
																			           	 	<span>修改记录：</span> ${docHistory.createdDate}		                  
																						</div>
																		            <div class="col-12 col-md-4 col-lg-4">														            	
																		            	<div class="inline">														            	
																			            	<a id="download_company_file${docHistory.id}" class="btnMenu view"  onclick="companydownloadfile('${docHistory.referenceNo}')" >下载</a>	
																			            	<span> | </span><a id="preview_company_file${docHistory.id}" class="btnMenu view" onclick="companypreviewfile('${docHistory.referenceNo}')">浏览</a>			
																			            	<span> | </span><a id="delete_company_file${docHistory.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${docHistory.referenceNo}')">删除</a>						                  
																						</div>							                  
																					</div>		
																					<div class="col-12 col-md-1 col-lg-1"></div>					
																				</div>
																			</div>
						
																	</div>
																<!--</c:forEach>-->																
																
																
															</div>	
																
																<div class="inline">	
															          <div class="badge badge-danger"><span  id="addNewUploadFile"  onclick="addNewUploadFile()">增加上传文件</span></div>												            	
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
                                <c:forEach items="${infos}" var="shareholderInfo" varStatus="loop">
									<div class="row">
							            <div class="col-12 col-md-12 col-lg-12">
							                <div class="card downLoadFile">
							                	<div class="card-body" id="accordion_${shareholderInfo.id}">
						                      		<div class="accordion">
								                        <div class="accordion-header collapsible1  collapsed" role="button" data-toggle="collapse" data-target="#panel-body-2" aria-expanded="false">
								                         	<h4>董事/股东/联系人: <span>${shareholderInfo.name }</span>
								                         	     <c:choose>
								                         	     	<c:when test="${shareholderInfo.status}"><span>状态 (有效)</span></c:when>
								                         	     	<c:otherwise><span>状态 (撤销)</span></c:otherwise>
								                         	     </c:choose>
								                         	</h4>
								                        </div>
								                        <div class="accordion-body collapse" id="panel-body-2" data-parent="#accordion_${shareholderInfo.id}">
											                <div class="card">
											                  <div class="card-body">
											                  	<div class="row">
														            <div class="col-12 col-md-12 col-lg-12" data-toggle="collapse"  data-target="#staffDetail_${shareholderInfo.id}" style="cursor: pointer">	
														           	    <b>${shareholderInfo.name }个人基本信息</b><span style="color: #6777ef;">(查看|修改)</span>                 
																	</div>							
																</div>	
																<div id="staffDetail_${shareholderInfo.id}" class="collapse in">							
																	<div class="row">
																		<div class="col-12 col-md-1 col-lg-1"></div>		
															            <div class="col-12 col-md-10 col-lg-10">
															            	<form id = "shareholderDetailForm_${shareholderInfo.id }" name="employeeForm">
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
															                          <td><input type="text" class="form-control form-control-sm" id="name_${shareholderInfo.id }" name="name_${shareholderInfo.id }" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> value="${shareholderInfo.name }"></td>
															                          <th scope="row">状态</th>
															                          <td>
																						<div class="form-group">
																							<div class="form-check form-check-inline">
																								<input type="hidden" id="shareholder_id_${shareholderInfo.id }" name="shareholder_id_${shareholderInfo.id }" value="${shareholderInfo.id }">
													                                			<input type="hidden" name="lock_shareholder_${shareholderInfo.id }" value="yes">
																								<input class="form-check-input" type="radio" name="status_${shareholderInfo.id }" id="status_${shareholderInfo.id }" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> <c:if test="${shareholderInfo.status}">checked</c:if>/> 
																								<label style="height: auto;" class="form-check-label">有效</label>
																							</div>
																							<div class="form-check form-check-inline">
																								<input class="form-check-input" type="radio" name="status_${shareholderInfo.id }" id="status_${shareholderInfo.id }" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> <c:if test="${not shareholderInfo.status}">checked </c:if> />
																								<label style="height: auto;" class="form-check-label">撤销</label>
																							</div>
																						</div>
															                          </td>										                          
															                        </tr>
															                        <tr>
															                          <th scope="row">性别</th>
															                          <td><input type="text" class="form-control form-control-sm" id="gender_${shareholderInfo.id}" name="gender_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> value="${shareholderInfo.gender }"></td>														                        
															                          <th scope="row">职位</th>
															                          <td>
																						<div class="form-group">
																							<div class="form-check form-check-inline">
																								<input class="form-check-input" type="checkbox" id="director_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> name="director_${shareholderInfo.id}" <c:if test="${fn:contains(shareholderInfo.positionType, '董事')}">checked</c:if> /> 
																								<label style="height: auto;" class="form-check-label">董事</label>
																							</div>
																							<div class="form-check form-check-inline">
																								<input class="form-check-input" type="checkbox" id="shareholder_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> name="shareholder_${shareholderInfo.id}" <c:if test="${fn:contains(shareholderInfo.positionType, '股东')}">checked</c:if> />
																								<label style="height: auto;" class="form-check-label">股东</label>
																							</div>
																							<div class="form-check form-check-inline">
																								<input class="form-check-input" type="checkbox" id="cotact_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> name="cotact_${shareholderInfo.id}" <c:if test="${fn:contains(shareholderInfo.positionType, '联系人')}">checked</c:if> /> 
																								<label style="height: auto;" class="form-check-label">联系人</label>
																							</div>
																						</div>
															                          </td>															                        													                            									                          
															                        </tr>														                        
															                        <tr>
															                          <th scope="row">国籍</th>
															                          <td><input type="text" class="form-control form-control-sm" id="national_${shareholderInfo.id}" name="national_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> value="${shareholderInfo.nationality}"></td>
															                          <th scope="row">发行股份数量</th>
															                          <td><input type="text" class="form-control form-control-sm" id="issue_stock_${shareholderInfo.id}" name="issue_stock_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> value="${shareholderInfo.issueStockAmount}"></td>	
															                        </tr>
															                        <tr>
															                          <th scope="row">证件类型</th>
															                          <td><input type="text" class="form-control form-control-sm" id="ic_type_${shareholderInfo.id}" name="ic_type_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> value="${shareholderInfo.icType}"></td>		
																					  <th scope="row">实缴股份数量</th>
															                          <td><input type="text" class="form-control form-control-sm" id="actual_stock_${shareholderInfo.id}" name="actual_stock_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> value="${shareholderInfo.actualStockAmount}"></td>		
															                        </tr>
															                        <tr>
															                          <th scope="row">证件号码</th>
															                          <td><input type="text" class="form-control form-control-sm" id="ic_number_${shareholderInfo.id}" name="ic_number_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> value="${shareholderInfo.icNumber}"></td>	
															                          <th scope="row">每股价值S$</th>
															                          <td><input type="text" class="form-control form-control-sm" id="value_per_stock_${shareholderInfo.id}" name="value_per_stock_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> value="${shareholderInfo.valuePerStock}"></td>															                          
															                        </tr>
															                        <tr>
															                          <th scope="row">联系电话</th>
															                          <td><input type="text" class="form-control form-control-sm" id="contact_number_${shareholderInfo.id}" name="contact_number_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> value="${shareholderInfo.contactNumber}"></td>
															                          <th scope="row">电子邮箱</th>
															                          <td><input type="text" class="form-control form-control-sm" id="email_${shareholderInfo.id}" name="email_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> value="${shareholderInfo.email}"></td>														                         
															                        </tr>
															                        <tr>														                         
															                          <th scope="row">个人地址及邮编</th>
															                          <td colspan="3">
															                          	<input type="text" class="form-control form-control-sm" id="address_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">disabled</c:if> 
															                          	name="address_${shareholderInfo.id}" value="${shareholderInfo.address}">
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
															                        <input class="form-check-input" type="checkbox"  id="shareholder_info_${shareholderInfo.id}" <c:if test="${shareholderInfo.lockFlag }">checked</c:if> onclick="confirmShareholderInfo(${shareholderInfo.id})">
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

																<c:forEach var="docpers" items="${docPersonalList}" >
																	<div class="row">
																		<div class="col-12 col-md-4 col-lg-4 collapsible_record collapsed" data-toggle="collapse"  data-target="#showReport${docpers.id}" style="cursor: pointer">
																		   <b>${docpers.documentDesc}</b>			                  
																		</div>
																		<c:choose>
																			<c:when test = "${docpers.documentDesc eq 'ANNEX B - Notice for Controllers'}">
																				<div class="col-12 col-md-4 col-lg-4">	
																					签名人员：${shareholderInfo.name } (已签名)
																				</div>
																			</c:when>
																			<c:when test = "${docpers.documentDesc eq 'Application of Shares'}">
																				<div class="col-12 col-md-4 col-lg-4">	
																					签名人员：${shareholderInfo.name } (已签名)
																				</div>
																			</c:when>
																			<c:when test = "${docpers.documentDesc eq 'Client Acceptance Form'}">
																				<div class="col-12 col-md-4 col-lg-4">	
																					签名人员：${shareholderInfo.name } (已签名)
																				</div>
																			</c:when>
																			<c:when test = "${docpers.documentDesc eq 'Form 45 / 201'}">
																				<div class="col-12 col-md-4 col-lg-4">	
																					签名人员：${shareholderInfo.name } (已签名)
																				</div>
																			</c:when>
																			<c:when test = "${docpers.documentDesc eq 'Share Certificate'}">
																				<div class="col-12 col-md-4 col-lg-4">	
																					签名人员：${shareholderInfo.name } (已签名)
																				</div>
																			</c:when>
																			<c:when test = "${docpers.documentDesc eq 'IC正面'  && not empty docPersonalMap[docpers.documentType.documentTypeCode]}">
																				<div class="col-12 col-md-4 col-lg-4">	
																					人员：${shareholderInfo.name} (已上传)
																				</div>
																			</c:when>
																			<c:when test = "${docpers.documentDesc eq 'IC背面' && not empty docPersonalMap[docpers.documentType.documentTypeCode]}">
																				<div class="col-12 col-md-4 col-lg-4">	
																					人员：${shareholderInfo.name} (已上传)
																				</div>
																			</c:when>
																			<c:when test = "${docpers.documentDesc eq '护照（有照片页）' && not empty docPersonalMap[docpers.documentType.documentTypeCode]}">
																				<div class="col-12 col-md-4 col-lg-4">	
																					人员：${shareholderInfo.name} (已上传)
																				</div>
																			</c:when>
																			<c:when test = "${docpers.documentDesc eq '中国身份证' && not empty docPersonalMap[docpers.documentType.documentTypeCode]}">
																				<div class="col-12 col-md-4 col-lg-4">	
																					人员：${shareholderInfo.name} (已上传)
																				</div>
																			</c:when>
																			<c:when test = "${docpers.documentDesc eq '持护照（打开有照片页）上半身照' && not empty docPersonalMap[docpers.documentType.documentTypeCode]}">
																				<div class="col-12 col-md-4 col-lg-4">	
																					人员：${shareholderInfo.name} (已上传)
																				</div>
																			</c:when>
																			<c:when test = "${docpers.documentDesc eq '住所证明' && not empty docPersonalMap[docpers.documentType.documentTypeCode]}">
																				<div class="col-12 col-md-4 col-lg-4">	
																					人员：${shareholderInfo.name} (已上传)
																				</div>
																			</c:when>
																			<c:otherwise>
																				<div class="col-12 col-md-4 col-lg-4"></div>		
																			</c:otherwise>
																		</c:choose>
																		<div class="col-12 col-md-4 col-lg-4">	
																			<div class="form-check">
																				<input class="form-check-input" type="checkbox"  id="personalfilelock${docpers.id}"  onclick="personlock(${docpers.id})">
																				<label class="form-check-label" for="gridCheck">确认锁定 </label>
																			</div>	
																			<div class="inline">														            	
																				<span> | </span><input type="file" id="file_per_upload${docpers.id}" style="display:none" onchange="personuploadfile(${company.id }, ${docpers.id})"/>
																								<a id="upload_person_file${docpers.id}" class="btnMenu view"  onclick="personshowfilediag(${docpers.id})">上传</a>		
																			</div>
																		</div>
																	</div>
																
																	<div id="showReport${docpers.id}" class="collapse in">
																		<c:forEach items="${docPersonalMap[docpers.documentType.documentTypeCode]}" var="docPerHistory" varStatus="loop">
																			<div id="AttachedReport${docPerHistory.referenceNo}">							
																				<div class="row">
																						<div class="col-12 col-md-1 col-lg-1"></div>		
																						<div class="col-12 col-md-7 col-lg-7">	
																							<span>修改记录：</span> ${docPerHistory.createdDate}		                  
																						</div>
																					<div class="col-12 col-md-4 col-lg-4">														            	
																						<div class="inline">														            	
																							<a id="download_company_file${docPerHistory.id}" class="btnMenu view"  onclick="companydownloadfile('${docPerHistory.referenceNo}')" >下载</a>	
																							<span> | </span><a id="preview_company_file${docPerHistory.id}" class="btnMenu view" onclick="companypreviewfile('${docPerHistory.referenceNo}')">浏览</a>			
																							<span> | </span><a id="delete_company_file${docPerHistory.id}" class="btnMenu view delete_company_file" onclick="companydeletefile('${docPerHistory.referenceNo}')">删除</a>						                  
																						</div>							                  
																					</div>		
																					<div class="col-12 col-md-1 col-lg-1"></div>					
																				</div>
																			</div>
																		</c:forEach>
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
							</c:forEach> 
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