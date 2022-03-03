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
  <title>睿信集团  &mdash;  时间表</title>

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
            	<h1>时间表</h1>
          	</div>
		  	<!--PEN CONTENT -->	
          	<div class="row">
          		<div class="col-12">
                	<div class="card ">
	                  	<div class="card-header">
	                    	<h4>公司 ${company.name}</h4>
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
						                        <div class="accordion-header" role="button" data-toggle="collapse" data-target="" aria-expanded="true">
						                         	<h4>各项业务时间表记录</h4>
						                        </div>

						                        <div class="accordion-body collapse show">
								                	<div class="card">
								                  		<div class="card-body">
						                        			<div id="lineRecordArea" class="lineRecordArea">
							                        			<form id = "timeLineForm">
							                        				<input type="hidden" id="initiate_lock" value="${company.timelineLockFlag}" />
	
											                  		<div id="div_annual_audit" class="unfoldBorder">
																		<table id="recordTable" class="table table-sm">
																      		<tr>
																				<th scope="col">服务项目</th>
																				<th scope="col">注册时间</th>
																				<th scope="col">服务周期</th>
																				<th scope="col">服务次数</th>	
																				<th scope="col">开始时间</th>   
																				<th scope="col">生成记录</th> 	
																      		</tr>
																      		<tr>
																			<th scope="row" id="annual_audit_service" >年审</th>
																			<th scope="row"  id="annual_audit_registerDate">
																				<fmt:formatDate pattern = 'dd/MM/yyyy' value='${annualaudittimeline.registrationDate}' />
																				<input type="hidden" id="hide_company_id" name="hide_company_id" value="${company.id }">
																				<input type="hidden" name="lock_record" value="${!company.timelineLockFlag}">
																			</th>
																				<td>
																					<div class="form-group">
																						<select class="form-control" id="annual_audit_service_cycle" name="annual_audit_service_cycle">
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
																						<select class="form-control" id="annual_audit_service_times" name="annual_audit_service_times">
																							<option>选择服务次数</option>
																							<option value="1">1</option>
																							<option selected="selected">2</option>
																							<option>3</option>
																							<option>4</option>												                        
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
																						<input type="date" id="annual_audit_start_date" name="annual_audit_start_date" value="<fmt:formatDate pattern = 'yyyy-MM-dd' value='${annualaudittimeline.startDate}' />" class="form-control">
																					</div>
																				 </td>
																			 	<td>
																			 		<div class="badge badge-danger"><div style="cursor:pointer" onclick="generateRecord('annual_audit')">生成记录</div></div>
																			 		<div class="badge badge-info"><div class="" id="viewRecord_annual_audit" style="cursor:pointer" onclick="showAndHideRecord('annual_audit')">收起记录</div></div>
																			 	</td>
																			</tr>	
																		</table>
																		<table class="table table-sm" id="recordTable_annual_audit"  >																		 																			 																			 																		
																	        <tr>
																	             <td colspan="6" align="center" class="addBottom_adminTimeLine"><b>记录列表</b></td>
																	        </tr>		
																			<tr>
																				<th colspan="2" scope="col">预计年审时间</th>	
																				<th scope="col">实际年审时间</th>  
																				<th scope="col">项目办理结果</th>    
																				<th scope="col">其它内容备注</th>   
																				<th scope="col">是否删除记录</th>                    				  
																			</tr>
																			<c:forEach items="${auditTimelineDetail}" var="audit" varStatus="loop">
																				<tr>
																					<td colspan="2" >
																						<fmt:formatDate value="${audit.estimateDate}" pattern="dd/MM/yyyy"/>
																						<input type="hidden" name="annual_audit_plan_date_exist_${audit.id}" value="${audit.estimateDate}"/>
																					</td>
																					<td><div class="form-group"><input type="date" class="form-control" name="annual_audit_actual_date_exist_${audit.id}" id="actual_date_${audit.id}" value="<fmt:formatDate pattern ='yyyy-MM-dd' value='${audit.actualDate}' />"></div></td>
																					<td>										                          
																						<div class="form-check">
																							<input class="form-check-input" type="checkbox" id="defaultCheck${audit.id}" name="annual_audit_status_exist_${audit.id}" <c:if test="${audit.result}">checked</c:if>>	
																							<label class="form-check-label" for="defaultCheck${audit.id}"> 已完成</label>
																						</div>
																					</td>
																					<td>
																						<div class="form-group"><input type="text" class="form-control" name="annual_audit_comment_exist_${audit.id}" value="${audit.comment}"></div>
																					</td>													                      
																		 			<td><a href="javascript:;">删除此记录</a></td>
																				</tr>
																			</c:forEach>
																			
																    	</table>															    
																	</div>
	
											                  		<div id="div_ECI" class="unfoldBorder">
																		<table  class="table table-sm">
																      		<tr>
																				<th scope="col">服务项目</th>
																				<th scope="col">注册时间</th>
																				<th scope="col">服务周期</th>
																				<th scope="col">服务次数</th>	
																				<th scope="col">开始时间</th>   
																				<th scope="col">生成记录</th> 	
																      		</tr>
																      		<tr>        
																			<th scope="row" id="ECI_service">ECI申报</th>
																			<th scope="row"  id="ECI_registerDate"><fmt:formatDate pattern = 'dd/MM/yyyy' value='${ecitimeline.registrationDate}' /></th>
																				<td>
																					<div class="form-group">
																						<select class="form-control" id="ECI_service_cycle" name="ECI_service_cycle">
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
																						<select class="form-control" id="ECI_service_times" name="ECI_service_times">
																							<option>选择服务次数</option>
																							<option value="1">1</option>
																							<option selected="selected">2</option>
																							<option>3</option>
																							<option>4</option>												                        
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
																						<input type="date" id="ECI_start_date" value="<fmt:formatDate pattern = 'yyyy-MM-dd' value='${ecitimeline.startDate}' />" class="form-control" name="ECI_start_date">
																					</div>
																				 </td>
																			 	<td>
																				 	<div class="badge badge-danger"><div style="cursor:pointer" onclick="generateRecord('ECI')" >生成记录</div></div>
																				 	<div class="badge badge-info"><div class="" id="viewRecord_ECI" style="cursor:pointer" onclick="showAndHideRecord('ECI')">收起记录</div></div>
																			 	</td>
																			</tr>	
																			</table>
																		<table class="table table-sm" id="recordTable_ECI"  >
																	        <tr><td colspan="6" align="center" class="addBottom_adminTimeLine"><b>记录列表</b></td></tr>		
																			<tr>
																				<th colspan="2" scope="col">预计ECI申报时间</th>	
																				<th scope="col">实际ECI申报时间</th>  
																				<th scope="col">服务办理结果</th>
																				<th scope="col">其它内容备注</th>
																				<th scope="col">是否删除记录</th>
																			</tr>
																			<c:forEach items="${ECIClaimTimelineDetail}" var="eci" varStatus="loop">
																				<tr>
																					<td colspan="2" >
																						<fmt:formatDate value="${eci.estimateDate}" pattern="dd/MM/yyyy"/>
																						<input type="hidden" name="ECI_plan_date_exist_${eci.id}" value="${eci.estimateDate}">
																					</td>
																					<td><div class="form-group"><input type="date" class="form-control" name="ECI_actual_date_exist_${eci.id}" value="<fmt:formatDate pattern ='yyyy-MM-dd' value='${eci.actualDate}' />"></div></td>
																					<td>										                          
																						<div class="form-check">
																							<input class="form-check-input" type="checkbox" id="defaultCheck${eci.id}" name="ECI_status_exist_${eci.id}" <c:if test="${eci.result}">checked</c:if>>	
																							<label class="form-check-label" for="defaultCheck${eci.id}"> 已完成</label>
																						</div>
																					</td>
																					<td>
																						<div class="form-group"><input type="text" class="form-control" name="ECI_comment_exist_${eci.id}" value="${eci.comment}"></div>
																					</td>
																					
																		 			<td><a href="javascript:;">删除此记录</a></td>
																				</tr>
																			</c:forEach>
																			
																    	</table>															    
																	</div>
	
											                  		<div id="div_GST" class="unfoldBorder">
																		<table  class="table table-sm">
																      		<tr>
																				<th scope="col">服务项目</th>
																				<th scope="col">注册时间</th>
																				<th scope="col">服务周期</th>
																				<th scope="col">服务次数</th>	
																				<th scope="col">开始时间</th>   
																				<th scope="col">生成记录</th> 	
																      		</tr>
																      		<tr>        
																			<th scope="row" id="GST_service">消费税申报</th>
																			<th scope="row" id="GST_registerDate"><fmt:formatDate pattern = 'dd/MM/yyyy' value='${gsttimeline.registrationDate}' /></th>
																				<td>
																					<div class="form-group">
																						<select class="form-control" id="GST_service_cycle" name="GST_service_cycle">
																							<option>选择服务周期</option>
																							<option>1个月</option>
																							<option>2个月</option>
																							<option selected="selected">3个月</option>
																							<option>4个月</option>												                        
																							<option>5个月</option>
																							<option>6个月</option>												                        
																							<option>7个月</option>
																							<option>8个月</option>
																							<option>9个月</option>
																							<option>10个月</option>												                        
																							<option>11个月</option>
																							<option>12个月</option>												                        
																						</select>
																					 </div>
																	            </td>
																				<td>
																					 <div class="form-group">
																						<select class="form-control" id="GST_service_times" name="GST_service_times">
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
																						<input type="date" id="GST_start_date" value="<fmt:formatDate pattern = 'yyyy-MM-dd' value='${gsttimeline.startDate}' />" class="form-control" name="GST_start_date">
																					</div>
																				 </td>
																			 	<td>
																				 	<div class="badge badge-danger"><div style="cursor:pointer" onclick="generateRecord('GST')">生成记录</div></div>
																				 	<div class="badge badge-info"><div class="" id="viewRecord_GST" style="cursor:pointer" onclick="showAndHideRecord('GST')">收起记录</div></div>
																			 	</td>
																			</tr>	
																			</table>
																		<table class="table table-sm" id="recordTable_GST"  >
																	        <tr>
																	             <td colspan="6" align="center" class="addBottom_adminTimeLine"><b>记录列表</b></td>
																	        </tr>		
																			<tr>
																				<th colspan="2" scope="col">预计消费税申报时间</th>	
																				<th scope="col">实际消费税申报时间</th>  
																				<th scope="col">服务办理结果</th>    
																				<th scope="col">其它内容备注</th>   
																				<th scope="col">是否删除记录</th>                    				  
																			</tr>
																			<c:forEach items="${GSTTimelineDetail}" var="gst" varStatus="loop">
																				<tr>
																					<td colspan="2" >
																						<fmt:formatDate value="${gst.estimateDate}" pattern="dd/MM/yyyy"/>
																						<input type="hidden" name="GST_plan_date_exist_${gst.id}" value="${gst.estimateDate}">
																					</td>
																					<td><div class="form-group"><input type="date" class="form-control" name="GST_actual_date_exist_${gst.id}" value="<fmt:formatDate pattern ='yyyy-MM-dd' value='${gst.actualDate}' />"></div></td>
																					<td>										                          
																						<div class="form-check">
																							<input class="form-check-input" type="checkbox" id="defaultCheck${gst.id}" name="GST_status_exist_${gst.id}" <c:if test="${gst.result}">checked</c:if> >	
																							<label class="form-check-label" for="defaultCheck${gst.id}"> 已完成</label>
																						</div>
																					</td>
																					<td>
																						<div class="form-group"><input type="text" class="form-control" name="GST_comment_exist_${gst.id}" value="${gst.comment}" ></div>
																					</td>													                      
																		 			<td><a href="javascript:;">删除此记录</a></td>
																				</tr>
																			</c:forEach>
																			
																    	</table>															    
																	</div>
	
											                  		<div id="div_CIT" class="unfoldBorder">
																		<table  class="table table-sm">
																      		<tr>
																				<th scope="col">服务项目</th>
																				<th scope="col">注册时间</th>
																				<th scope="col">服务周期</th>
																				<th scope="col">服务次数</th>	
																				<th scope="col">开始时间</th>   
																				<th scope="col">生成记录</th> 	
																      		</tr>
																      		<tr>        
																			<th scope="row" id="CIT_service">所得税报税</th>
																			<th scope="row"  id="CIT_registerDate"><fmt:formatDate pattern = 'dd/MM/yyyy' value='${incometaxclaimtimeline.registrationDate}' /></th>
																				<td>
																					<div class="form-group">
																						<select class="form-control" id="CIT_service_cycle" name="CIT_service_cycle">
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
																						<select class="form-control" id="CIT_service_times" name="CIT_service_times">
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
																						<input type="date" id="CIT_start_date" value="<fmt:formatDate pattern = 'yyyy-MM-dd' value='${incometaxclaimtimeline.startDate}' />" class="form-control" name="CIT_start_date">
																					</div>
																				 </td>
																			 	<td>
																				 	<div class="badge badge-danger"><div style="cursor:pointer" onclick="generateRecord('CIT')" >生成记录</div></div>
																				 	<div class="badge badge-info"><div class="" id="viewRecord_CIT" style="cursor:pointer" onclick="showAndHideRecord('CIT')" >收起记录</div></div>
																			 	</td>
																			</tr>	
																			</table>
																		<table class="table table-sm" id="recordTable_CIT"  >
																	        <tr>
																	             <td colspan="6" align="center" class="addBottom_adminTimeLine"><b>记录列表</b></td>
																	        </tr>		
																			<tr>
																				<th colspan="2" scope="col">预计所得税报税时间</th>	
																				<th scope="col">实际所得税报税时间</th>  
																				<th scope="col">服务办理结果</th>    
																				<th scope="col">其它内容备注</th>   
																				<th scope="col">是否删除记录</th>                    				  
																			</tr>
																			<c:forEach items="${incomeTaxClaimTimelineDetail}" var="incomeTax" varStatus="loop">
																				<tr>
																					<td colspan="2" >
																						<fmt:formatDate value="${incomeTax.estimateDate}" pattern="dd/MM/yyyy"/>
																						<input type="hidden" name="CIT_plan_date_exist_${incomeTax.id}" value="${incomeTax.estimateDate}">
																					</td>
																					<td><div class="form-group"><input type="date" class="form-control" name="CIT_actual_date_exist_${incomeTax.id}" value="<fmt:formatDate pattern ='yyyy-MM-dd' value='${incomeTax.actualDate}' />"></div></td>
																					<td>										                          
																						<div class="form-check">
																							<input class="form-check-input" type="checkbox" id="defaultCheck${incomeTax.id}" name="CIT_status_exist_${incomeTax.id}" <c:if test="${incomeTax.result}">checked</c:if>>	
																							<label class="form-check-label" for="annual_audit_check_${incomeTax.id}"> 已完成</label>
																						</div>
																					</td>
																					<td>
																						<div class="form-group"><input type="text" class="form-control" name="CIT_comment_exist_${incomeTaxci.id}" value="${incomeTax.comment}" ></div>
																					</td>													                      
																		 			<td><a href="javascript:;">删除此记录</a></td>
																				</tr>
																			</c:forEach>
																			
																    	</table>															    
																	</div>
	
											                  		<div id="div_CIT_payment" class="unfoldBorder">
																		<table  class="table table-sm">
																      		<tr>
																				<th scope="col">服务项目</th>
																				<th scope="col">注册时间</th>
																				<th scope="col">服务周期</th>
																				<th scope="col">服务次数</th>	
																				<th scope="col">开始时间</th>   
																				<th scope="col">生成记录</th> 	
																      		</tr>
																      		<tr>        
																			<th scope="row" id="CIT_payment_service">所得税缴税</th>
																			<th scope="row"  id="CIT_payment_registerDate"><fmt:formatDate pattern = 'dd/MM/yyyy' value='${incometaxpayabletimeline.registrationDate}' /></th>
																				<td>
																					<div class="form-group">
																						<select class="form-control" id="CIT_payment_service_cycle" name="CIT_payment_service_cycle">
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
																						<select class="form-control" id="CIT_payment_service_times" name="CIT_payment_service_times">
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
																						<input type="date" id="CIT_payment_start_date" value="<fmt:formatDate pattern = 'yyyy-MM-dd' value='${incometaxpayabletimeline.startDate}' />" class="form-control" name="CIT_payment_start_date">
																					</div>
																				 </td>
																			 	<td>
																				 	<div class="badge badge-danger"><div style="cursor:pointer" onclick="generateRecord('CIT_payment')" >生成记录</div></div>
																				 	<div class="badge badge-info"><div class="" id="viewRecord_CIT_payment" style="cursor:pointer" onclick="showAndHideRecord('CIT_payment')">收起记录</div></div>
																			 	</td>
																			</tr>	
																			</table>
																		<table class="table table-sm" id="recordTable_CIT_payment"  >
																	        <tr>
																	             <td colspan="6" align="center" class="addBottom_adminTimeLine"><b>记录列表</b></td>
																	        </tr>		
																			<tr>
																				<th colspan="2" scope="col">预计所得税缴税时间</th>	
																				<th scope="col">实际所得税缴税时间</th>  
																				<th scope="col">服务办理结果</th>    
																				<th scope="col">其它内容备注</th>   
																				<th scope="col">是否删除记录</th>                    				  
																			</tr>
																			<c:forEach items="${incomeTaxPayableTimelineDetail}" var="payable" varStatus="loop">
																				<tr>
																					<td colspan="2" >
																						<fmt:formatDate value="${payable.estimateDate}" pattern="dd/MM/yyyy"/>
																						<input type="hidden" name="CIT_payment_plan_date_exist_${payable.id}" value="${payable.estimateDate}">
																					</td>
																					<td><div class="form-group"><input type="date" class="form-control" name="CIT_payment_actual_date_exist_${payable.id}" value="<fmt:formatDate pattern ='yyyy-MM-dd' value='${payable.actualDate}' />"></div></td>
																					<td>										                          
																						<div class="form-check">
																							<input class="form-check-input" type="checkbox" id="defaultCheck${payable.id}" name="CIT_payment_status_exist_${payable.id}" <c:if test="${payable.result}">checked</c:if> >	
																							<label class="form-check-label" for="defaultCheck${payable.id}"> 已完成</label>
																						</div>
																					</td>
																					<td>
																						<div class="form-group"><input type="text" class="form-control" name="CIT_payment_comment_exist_${payable.id}" value="${payable.comment}"></div>
																					</td>													                      
																		 			<td><a href="javascript:;">删除此记录</a></td>
																				</tr>
																			</c:forEach>
																			
																    	</table>															    
																	</div>

																	<!-- New service -->
																	<c:forEach items="${otherServiceTimelines}" var="othersService" varStatus="loop">
																		<div id="div_${othersService.service}" class="unfoldBorder">
																			<table class="table table-sm">
																	      		<tr>
																					<th scope="col">服务项目</th>
																					<th scope="col">备注说明</th>
																					<th scope="col">服务周期</th>
																					<th scope="col">服务次数</th>	
																					<th scope="col">开始时间</th>   
																					<th scope="col">生成记录</th> 	
																	      		</tr>
																	      		<tr>
																					<th scope="row"><div class="form-group"><input type="text" class="form-control" name="${othersService.service}_service" value="${othersService.service}"></div></th>
																					<th scope="row"><div class="form-group"><input type="text" class="form-control" name="${othersService.service}_comment" value="${othersService.comment}"></div></th>
																					<td>
																						<div class="form-group">
																							<select class="form-control" id="${othersService.service}_service_cycle" name="${othersService.service}_service_cycle">
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
																							<select class="form-control" id="${othersService.service}_service_times" name="${othersService.service}_service_times">
																								<option>选择服务次数</option>
																								<option value="1">1</option>
																								<option selected="selected">2</option>
																								<option>3</option>
																								<option>4</option>												                        
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
																							<input type="date" id="${othersService.service}_start_date" name="${othersService.service}_start_date" value="<fmt:formatDate pattern = 'yyyy-MM-dd' value='${othersService.startDate}' />" class="form-control">
																						</div>
																					 </td>
																				 	<td>
																				 		<div class="badge badge-danger"><div style="cursor:pointer" onclick="generateRecord('${othersService.service}')">生成记录</div></div>
																				 		<div class="badge badge-info"><div class="" id="viewRecord_${othersService.service}" style="cursor:pointer" onclick="showAndHideRecord('${othersService.service}')">收起记录</div></div>
																				 	</td>
																				</tr>	
																			</table>

																			<table class="table table-sm" id="recordTable_${othersService.service}"  >																		 																			 																			 																		
																		        <tr>
																		             <td colspan="6" align="center" class="addBottom_adminTimeLine"><b>记录列表</b></td>
																		        </tr>		
																				<tr>
																					<th colspan="2" scope="col">预计年审时间</th>	
																					<th scope="col">实际年审时间</th>  
																					<th scope="col">项目办理结果</th>    
																					<th scope="col">其它内容备注</th>   
																					<th scope="col">是否删除记录</th>                    				  
																				</tr>
																				<c:forEach items="${otherServiceTimelineDetails}" var="detail" varStatus="loop">
																					<c:if test="${detail.timeline.id eq othersService.id}">
																						<tr>
																							<td colspan="2" >
																								<fmt:formatDate value="${detail.estimateDate}" pattern="dd/MM/yyyy"/>
																								<input type="hidden" name="${othersService.service}_plan_date_exist_${detail.id}" value="${detail.estimateDate}"/>
																							</td>
																							<td><div class="form-group"><input type="date" class="form-control" name="${othersService.service}_actual_date_exist_${detail.id}" id="actual_date_${detail.id}" value="<fmt:formatDate pattern ='yyyy-MM-dd' value='${detail.actualDate}' />"></div></td>
																							<td>										                          
																								<div class="form-check">
																									<input class="form-check-input" type="checkbox" id="defaultCheck${detail.id}" name="${othersService.service}_status_exist_${detail.id}" <c:if test="${detail.result}">checked</c:if>>	
																									<label class="form-check-label" for="defaultCheck${detail.id}"> 已完成</label>
																								</div>
																							</td>
																							<td>
																								<div class="form-group"><input type="text" class="form-control" name="${othersService.service}_comment_exist_${detail.id}" value="${detail.comment}"></div>
																							</td>													                      
																				 			<td><a href="javascript:;">删除此记录</a></td>
																						</tr>
																					</c:if>
																				</c:forEach>
																				
																	    	</table>
																		</div>
																		
																	</c:forEach>
																	
																</form>
						                        				<form id = "timeLineNewserviceForm"></form>
						                        			</div>																		
															 <div class="row adminTimeLine confirmArea">
													            <div class="col-12 col-md-12 col-lg-12 divCss">	
														            <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="infoCheckbox_timeLineRecord" <c:if test="${company.timelineLockFlag}">checked</c:if> onclick="confirmTimelineInfo()">
												                        <label class="form-check-label" for="gridCheck"> 确认锁定  </label>
												                    </div>															            	
												                    <div class="inline">
														            	<span> | </span><span id="addNewService_timeLineRecord"  class="btnMenu view"  onclick="addNewServiceArea()" >增加服务项</span>		
																	</div>
																</div>
															</div>
														</div>

								                	</div>
						                        </div>
					                      		</div>

						                      	<div class="accordion">
							                        <div class="accordion-body collapse show" id="panel-body-5" data-parent="#accordion">
														<div class="card" >
									                  		<div class="card-body">					                
																<div class="row">	
																	<div class="col-12 col-md-12 col-lg-12">
													                    <div class="form-group">
													                      <label>服务进展</label>
													                      <textarea class="form-control" id="textarea1" name="textarea1" <c:if test="${timelineAddition.serviceFlag}">disabled</c:if> >${timelineAddition.serviceProgress}</textarea>
													                    </div>
																		<div class="row adminTimeLine">
																            <div class="col-12 col-md-12 col-lg-12 divCss">	
																	            <div class="form-check">
															                        <input class="form-check-input" type="checkbox" id="infoCheckbox1" <c:if test="${timelineAddition.serviceFlag}">checked</c:if> onclick="confirmInfo(${company.id },1)">
															                        <label class="form-check-label" for="gridCheck">
															                       		 确认锁定
															                        </label>
															                    </div>	
															                    <div class="inline">														            	
																	            	<span></span><a id="textInput001"  class="btnMenu view" href="#" ></a>		
																				</div>																                    														            	
																			</div>																									
																		</div>														                    												                    
												                    </div>
																 </div>											                
								                        	</div>
						                      			</div>	

														<div class="card">
										                  <div class="card-body">					                
																<div class="row">	
																	<div class="col-12 col-md-12 col-lg-12">
													                    <div class="form-group">
													                      <label>渠道方</label>
													                      <textarea class="form-control"  id="textarea2" name="textarea2" <c:if test="${timelineAddition.channelFlag}">disabled</c:if>>${timelineAddition.channel} </textarea>
													                    </div>
																		<div class="row  adminTimeLine">
																	            <div class="col-12 col-md-12 col-lg-12 divCss">	
																		            <div class="form-check">
																                        <input class="form-check-input" type="checkbox" id="infoCheckbox2" <c:if test="${timelineAddition.channelFlag}">checked</c:if>  onclick="confirmInfo(${company.id },2)">
																                        <label class="form-check-label" for="gridCheck">
																                       		 确认锁定
																                        </label>
																                    </div>
																                    <div class="inline">														            	
																		            	<span></span><a id="textInput002"  class="btnMenu view" href="#" ></a>		
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
               </div>
           </div>	        
        </section>
      </div>
      <jsp:include page="../footer.jsp" />  

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
   <script  src="../../../assets/js/adminTimeLine.js"></script> 

</body>
</html>