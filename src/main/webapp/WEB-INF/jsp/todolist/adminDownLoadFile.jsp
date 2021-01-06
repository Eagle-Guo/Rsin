<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
                    <h4>公司AAA</h4>
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
								                        <div class="accordion-header collapsible1" role="button" data-toggle="collapse" data-target="#panel-body-1" aria-expanded="false">
								                         	<h4>公司基本信息和注册文件</h4>
								                        </div>
								                        <div class="accordion-body collapse" id="panel-body-1" data-parent="#accordion">
										                <div class="card">
										                  <div class="card-body">
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
										                          <td>0000000001</td>
										                        </tr>
										                        <tr>
										                          <th scope="row">UEN(注册号)</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput010"  value="201500518N"></td>
										                        </tr>
										                        <tr>
										                          <th scope="row">公司名称</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput020" value="KNOCKNOCK TECHNOLOGIES ASIA PTE. LTD"></td>
										                        </tr>
										                        <tr>
										                          <th scope="row">公司类型</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput030" value="私人有限公司 (PTE. LTD.)"></td>
										                        </tr>
										                        <tr>
										                          <th scope="row">商业 活动1</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput040" value="AGRICULTURE AND RELATED SERVICE ACTIVITIES: 农业及相关服务"></td>
										                        </tr>										                        
										                        <tr>
										                          <th scope="row">商业 活动2</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput050" value="AGRICULTURE AND RELATED SERVICE ACTIVITIES: 农业及相关服务"></td>
										                        </tr>										                        
										                        <tr>
										                          <th scope="row">挂名董事</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput060" value="挂名董事1,挂名董事2"></td>
										                        </tr>																
										                        <tr>
										                          <th scope="row">董事</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput070" value="董事1,董事2"></td>
										                        </tr>																	
										                        <tr>
										                          <th scope="row">股东</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput080" value="股东1,股东2"></td>
										                        </tr>																	
										                        <tr>
										                          <th scope="row">秘书</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput090" value="秘书1"></td>
										                        </tr>																
										                        <tr>
										                          <th scope="row">注册资本</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput100" value="743968"></td>
										                        </tr>																	
										                        <tr>
										                          <th scope="row">实缴资本</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput110" value="743968"></td>
										                        </tr>		
										                        <tr>
										                          <th scope="row">注册时间</th>
										                          <td><input type="text" class="form-control form-control-sm" id="textInput120" value="12/12/2020"></td>
										                        </tr>																						                        									                        
										                      </tbody>
										                    </table>
											                <!--<div class="buttons">
										                      <a href="#" class="btn btn-icon icon-left btn-success"><i class="fas fa-check"></i>确认</a>                      
															  <a href="#" class="btn btn-icon icon-left btn-primary"><i class="far fa-edit"></i>修改</a>
										                    </div>-->
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4"></div>
														            <div class="col-12 col-md-4 col-lg-4"></div>		
														            <div class="col-12 col-md-4 col-lg-4">	
																	<div class="form-check">
												                        <input class="form-check-input" type="checkbox"  id="infoCheckbox0"  onclick="confirmInfo(0)">
												                        <label class="form-check-label" for="gridCheck">
												                       		 确认锁定
												                        </label>
												                    </div>	
												                    <div class="inline">														            	
														            	<span></span><a id="textInput000"  href="#" ></a>							                  
																	</div>
																	</div>																								
															</div>											                    
										                  </div>
										                </div>
										                <div class="card">
										                  <div class="card-body">
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Constitution of Company（公司章程）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">			            					                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
																	<div class="form-check">
												                        <input class="form-check-input" type="checkbox"  id="checkbox1"  onclick="confirm(1)">
												                        <label class="form-check-label" for="gridCheck">
												                       		 确认锁定
												                        </label>
												                    </div>	
												                    <div class="inline">														            	
														            	<span> | </span><a id="menuBtn11"  href="#" >下载</a>	
														            	<span> | </span><a id="menuBtn21"  class="btnMenu view" href="#" >浏览</a>		
														            	<span> | </span><a id="menuBtn31"  class="btnMenu view" href="#" >上传</a>		
														            	<span> | </span><a id="menuBtn41"  class="btnMenu view" href="#" >删除</a>						                  
																	</div>
																	</div>																								
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4" data-toggle="collapse"  data-target="#AttachedReport" style="cursor: pointer">	
														           	    <b>Attached AML/CFT Report</b><span style="color: #6777ef;">(最新版)</span>                 
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">				                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox"  id="checkbox2"  onclick="confirm(2)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn12"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn22"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn32"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn42"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>								
															</div>								
															<div id="AttachedReport" class="collapse in">							
																<div class="row">
																		<div class="col-12 col-md-1 col-lg-1"></div>		
															            <div class="col-12 col-md-7 col-lg-7">	
															           	 <span>修改记录：</span> 28.02.2019 07:44:11		                  
																		</div>
														            <div class="col-12 col-md-4 col-lg-4">														            	
														            	<div class="inline">														            	
															            	<a   href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn22001"  class="btnMenu view" href="#" >浏览</a>			
															            	<span> | </span><a id="menuBtn42001"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>							                  
																	</div>		
																	<div class="col-12 col-md-1 col-lg-1"></div>					
																</div>
															</div>		
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Certificate of Incorporation（公司注册证书）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            				                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox3"  onclick="confirm(3)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
														            	<div class="inline">														            	
															            	<span> | </span><a id="menuBtn13"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn23"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn33"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn43"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>					                  
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>First Director Meeting Resolution</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            		签名人员：签名人1(待签名)、签名人2(已签名)、签名人3(待签名)			                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox4"  onclick="confirm(4)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn14"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn24"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn34"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn44"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																									
															</div>		
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Risk Assessment（风险评估）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            		签名人员：签名人1(待签名)、签名人2(已签名)、签名人3(待签名)				                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox5"  onclick="confirm(5)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn15"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn25"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn35"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn45"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Risk Assessment Checklist（风险评估清单）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            					                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox6"  onclick="confirm(6)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn16"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn26"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn36"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn46"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																										
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Secretary Agreement（秘书协议）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            		签名人员：签名人1(待签名)、签名人2(已签名)、签名人3(待签名)				                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox7"  onclick="confirm(7)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn17"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn27"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn37"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn47"  class="btnMenu view" href="#" >删除</a>		
															            	<span> | </span><a id="menuBtn57"  class="btnMenu view" href="#" >在线签名</a>					                  
																		</div>
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Company info（公司信息）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            					                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox8"  onclick="confirm(8)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn18"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn28"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn38"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn48"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																										
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Register of Charges（收费登记册）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            					                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox9"  onclick="confirm(9)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn19"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn29"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn39"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn49"  class="btnMenu view" href="#" >删除</a>						                  
																		</div>
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-4 col-lg-4">	
														           	   <b>Register of Secretary（秘书名册）</b>			                  
																	</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            				                  
																	</div>		
														            <div class="col-12 col-md-4 col-lg-4">	
															            <div class="form-check">
													                        <input class="form-check-input" type="checkbox" id="checkbox10"  onclick="confirm(10)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn110"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn210"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn310"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn410"  class="btnMenu view" href="#" >删除</a>						                  
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
							<div class="row">
						            <div class="col-12 col-md-12 col-lg-12" id="">
						                <div class="card downLoadFile">
						                	<div class="card-body">
						                    	<div id="">
						                      		<div class="accordion">
								                        <div class="accordion-header collapsible1" role="button" data-toggle="collapse" data-target="#panel-body-2" aria-expanded="false">
								                         	<h4>董事/股东：<span>AAA</span></h4>
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
														                          <th scope="row">性别</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput021" value="女"></td>										                          
														                        </tr>
														                        <tr>
														                          <th scope="row">国籍</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput031" value="中国"></td>
														                          <th scope="row">证件类型</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput041" value="护照"></td>										                          
														                        </tr>
														                        <tr>
														                          <th scope="row">证件号码</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput051" value="W2222222222"></td>
														                          <th scope="row">电子邮箱</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput061" value="test@gmail.com"></td>										                          
														                        </tr>
														                        <tr>
														                          <th scope="row">联系电话</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput071" value="65+83627182"></td>
														                          <th scope="row">发行股份数量</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput081" value="5000"></td>										                          
														                        </tr>
														                        <tr>
														                          <th scope="row">实缴股份数量</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput091" value="5000"></td>
														                          <th scope="row">每股价值S$</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput101" value="1"></td>										                          
														                        </tr>										                        
														                        <tr>
														                          <th scope="row">个人地址及邮编</th>
														                          <td><input type="text" class="form-control form-control-sm" id="textInput111" value="test"></td>
														                        </tr>										                        																						                        									                        
														                      </tbody>
														                    </table>	
															                <!-- <div class="buttons">
														                      <a href="#" class="btn btn-icon icon-left btn-success"><i class="fas fa-check"></i>确认</a>                      
																			  <a href="#" class="btn btn-icon icon-left btn-primary"><i class="far fa-edit"></i>修改</a>
														                    </div>	-->
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
													                        <input class="form-check-input" type="checkbox" id="checkbox11"  onclick="confirm(11)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn111"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn211"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn311"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn411"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox12"  onclick="confirm(12)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn112"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn212"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn312"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn412"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox13"  onclick="confirm(13)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn113"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn213"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn313"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn413"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox14"  onclick="confirm(14)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn114"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn214"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn314"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn414"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox15"  onclick="confirm(15)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn115"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn215"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn315"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn415"  class="btnMenu view" href="#" >删除</a>	
															            	<span> | </span><a id="menuBtn515"  class="btnMenu view" href="#" >在线签名</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox16"  onclick="confirm(16)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn116"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn216"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn316"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn416"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox17"  onclick="confirm(17)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn117"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn217"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn317"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn417"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox18"  onclick="confirm(18)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn118"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn218"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn318"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn418"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox19"  onclick="confirm(19)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn119"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn219"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn319"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn419"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox20"  onclick="confirm(20)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn120"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn220"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn320"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn420"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox21"  onclick="confirm(21)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn121"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn221"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn321"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn421"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox22"  onclick="confirm(22)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn122"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn222"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn322"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn422"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox23"  onclick="confirm(23)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn123"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn223"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn323"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn423"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox24"  onclick="confirm(24)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn124"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn224"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn324"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn424"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox25"  onclick="confirm(25)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn125"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn225"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn325"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn425"  class="btnMenu view" href="#" >删除</a>						                  
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
													                        <input class="form-check-input" type="checkbox" id="checkbox26"  onclick="confirm(26)">
													                        <label class="form-check-label" for="gridCheck">
													                       		 确认锁定
													                        </label>
													                    </div>															            	
													                    <div class="inline">														            	
															            	<span> | </span><a id="menuBtn126"  href="#" >下载</a>	
															            	<span> | </span><a id="menuBtn226"  class="btnMenu view" href="#" >浏览</a>		
															            	<span> | </span><a id="menuBtn326"  class="btnMenu view" href="#" >上传</a>		
															            	<span> | </span><a id="menuBtn426"  class="btnMenu view" href="#" >删除</a>						                  
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
  <script>
// Get the modal
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

function confirm(x) {
	var checkBox = document.getElementById("checkbox"+x);
	var text1 = document.getElementById("menuBtn1"+x);
	var text2 = document.getElementById("menuBtn2"+x);
	var text3 = document.getElementById("menuBtn3"+x);
	var text4 = document.getElementById("menuBtn4"+x);
	var text5 = document.getElementById("menuBtn5"+x);	
	if (checkBox.checked == true){
		text1.style.color = "gray";
		text1.style.pointerEvents="none";	
		text1.style.textDecoration = "none";
		text2.style.color = "gray";
		text2.style.pointerEvents="none";	
		text2.style.textDecoration = "none";		
		text3.style.color = "gray";
		text3.style.pointerEvents="none";	
		text3.style.textDecoration = "none";		
		text4.style.color = "gray";
		text4.style.pointerEvents="none";	
		text4.style.textDecoration = "none";		
		text5.style.color = "gray";
		text5.style.pointerEvents="none";	
		text5.style.textDecoration = "none";				
	} else {
		text1.style.color = "#6777ef";
		text1.style.pointerEvents="unset";	
		text1.style.textDecoration = "underline";  
		text2.style.color = "#6777ef";
		text2.style.pointerEvents="unset";	
		text2.style.textDecoration = "underline";  		
		text3.style.color = "#6777ef";
		text3.style.pointerEvents="unset";	
		text3.style.textDecoration = "underline";  		
		text4.style.color = "#6777ef";
		text4.style.pointerEvents="unset";	
		text4.style.textDecoration = "underline";  		
		text5.style.color = "#6777ef";
		text5.style.pointerEvents="unset";	
		text5.style.textDecoration = "underline";  			
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
	if (checkBox.checked == true){
		text0.style.pointerEvents="none";	 
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
	} else {
		text0.style.pointerEvents="unset";	 
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
	}
}	
</script>
</body>
</html>