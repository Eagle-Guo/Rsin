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
           <div class="row">
              <div class="col-12">
                <div class="card ">
                  <div class="card-header">
                    <h4>公司 ${company.name }</h4>
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
										                          <td>${company.id }</td>
										                        </tr>
										                        <tr>
										                          <th scope="row">UEN(注册号)</th>
										                          <td>${company.uen }</td>
										                        </tr>
										                        <tr>
										                          <th scope="row">公司名称</th>
										                          <td>${company.name }</td>
										                        </tr>
										                        <tr>
										                          <th scope="row">公司类型</th>
										                          <td>${company.type }</td>
										                        </tr>
										                        <tr>
										                          <th scope="row">商业 活动1</th>
										                          <td>${company.activityOne }</td>
										                        </tr>										                        
										                        <tr>
										                          <th scope="row">商业 活动2</th>
										                          <td>${company.activityTwo }</td>
										                        </tr>										                        
										                        <tr>
										                          <th scope="row">挂名董事</th>
										                          <td>挂名董事1,挂名董事2</td>
										                        </tr>																
										                        <tr>
										                          <th scope="row">董事</th>
										                          <td>董事1,董事2</td>
										                        </tr>																	
										                        <tr>
										                          <th scope="row">股东</th>
										                          <td>股东1,股东2</td>
										                        </tr>																	
										                        <tr>
										                          <th scope="row">秘书</th>
										                          <td>秘书1</td>
										                        </tr>																
										                        <tr>
										                          <th scope="row">注册资本</th>
										                          <td>${company.totalStockCapital }</td>
										                        </tr>																	
										                        <tr>
										                          <th scope="row">实缴资本</th>
										                          <td>${company.actualStockCapital }</td>
										                        </tr>		
										                        <tr>
										                          <th scope="row">注册时间</th>
										                          <td>${company.registrationDate }</td>
										                        </tr>																						                        									                        
										                      </tbody>
										                    </table>
										                  </div>
										                </div>
										                <div class="card">
										                  <div class="card-body">
															<div class="row">
													            <div class="col-12 col-md-5 col-lg-5">	
													           	   <b>Constitution of Company（公司章程）</b>			                  
																</div>
													            <div class="col-12 col-md-5 col-lg-5"></div>		
													            <div class="col-12 col-md-2 col-lg-2">	
													            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5" data-toggle="collapse"  data-target="#AttachedReport" style="cursor: pointer">	
														           	    <b>Attached AML/CFT Report</b><span style="color: #6777ef;">(最新版)</span>                 
																	</div>
														            <div class="col-12 col-md-5 col-lg-5"></div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>								
															</div>								
															<div id="AttachedReport" class="collapse in">							
																<div class="row">
																		<div class="col-12 col-md-1 col-lg-1"></div>		
															            <div class="col-12 col-md-6 col-lg-6">	
															           	 <span>修改记录：</span> 28.02.2019 07:44:11	
																		</div>
														            <div class="col-12 col-md-4 col-lg-4">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>										                  
																	</div>		
																	<div class="col-12 col-md-1 col-lg-1"></div>					
																</div>
															</div>		
															<div class="row">
													            <div class="col-12 col-md-5 col-lg-5">	
													           	   <b>Certificate of Incorporation（公司注册证书）</b>			                  
																</div>
													            <div class="col-12 col-md-5 col-lg-5"></div>		
													            <div class="col-12 col-md-2 col-lg-2">	
													            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>First Director Meeting Resolution</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            		签名人员：签名人1(已签名)、签名人2（待签名）、签名人3	（已签名）			                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>		
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>Risk Assessment（风险评估）</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            		签名人员：签名人1(已签名)、签名人2（待签名）、签名人3	（已签名）		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>	
															<div class="row">
													            <div class="col-12 col-md-5 col-lg-5">	
													           	   <b>Risk Assessment Checklist（风险评估清单）</b>			                  
																</div>
													            <div class="col-12 col-md-5 col-lg-5">	
													            					                  
																</div>		
													            <div class="col-12 col-md-2 col-lg-2">	
													            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																</div>																									
															</div>	
															<div class="row">
													            <div class="col-12 col-md-5 col-lg-5">	
													           	   <b>Secretary Agreement（秘书协议）</b>			                  
																</div>
													            <div class="col-12 col-md-5 col-lg-5">	
													            		签名人员：签名人1(已签名)、签名人2（待签名）、签名人3	（已签名）			                  
																</div>		
													            <div class="col-12 col-md-2 col-lg-2">	
													            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																</div>																									
															</div>	
															<div class="row">
													            <div class="col-12 col-md-5 col-lg-5">	
													           	   <b>Company info（公司信息）</b>			                  
																</div>
													            <div class="col-12 col-md-5 col-lg-5">	
													            					                  
																</div>		
													            <div class="col-12 col-md-2 col-lg-2">	
													            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																</div>																									
															</div>	
															<div class="row">
													            <div class="col-12 col-md-5 col-lg-5">	
													           	   <b>Register of Charges（收费登记册）</b>			                  
																</div>
													            <div class="col-12 col-md-5 col-lg-5">	
													            					                  
																</div>		
													            <div class="col-12 col-md-2 col-lg-2">	
													            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																</div>																									
															</div>	
															<div class="row">
													            <div class="col-12 col-md-5 col-lg-5">	
													           	   <b>Register of Secretary（秘书名册）</b>			                  
																</div>
													            <div class="col-12 col-md-5 col-lg-5">	
													            				                  
																</div>		
													            <div class="col-12 col-md-2 col-lg-2">	
													            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
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
														           	    <b>AAA个人基本信息</b><span style="color: #6777ef;">(点击查看详情)</span>                 
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
														                          <td>AAA</td>
														                          <th scope="row">性别</th>
														                          <td>女</td>										                          
														                        </tr>
														                        <tr>
														                          <th scope="row">国籍</th>
														                          <td>中国</td>
														                          <th scope="row">证件类型</th>
														                          <td>护照</td>										                          
														                        </tr>
														                        <tr>
														                          <th scope="row">证件号码</th>
														                          <td>W2222222222</td>
														                          <th scope="row">电子邮箱</th>
														                          <td>test@gmail.com</td>										                          
														                        </tr>
														                        <tr>
														                          <th scope="row">联系电话</th>
														                          <td>65+83627182</td>
														                          <th scope="row">发行股份数量</th>
														                          <td>5000</td>										                          
														                        </tr>
														                        <tr>
														                          <th scope="row">实缴股份数量</th>
														                          <td>5000</td>
														                          <th scope="row">每股价值S$</th>
														                          <td>1</td>										                          
														                        </tr>										                        
														                        <tr>
														                          <th scope="row">个人地址及邮编</th>
														                          <td>test</td>
														                        </tr>										                        																						                        									                        
														                      </tbody>
														                    </table>	                  
																		</div>	
																	<div class="col-12 col-md-1 col-lg-1"></div>					
																</div>
															</div>																
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>ANNEX B - Notice for Controllers</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	签名人员：AAA（待签名）	                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>Application of Shares</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	签名人员：AAA（待签名）		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>								
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>Client Acceptance Form</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	签名人员：AAA（待签名）		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>Form 45 / 201</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	签名人员：AAA（已签名）		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>Share Certificate</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	签名人员：AAA（待签名）		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>								
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>Register of member </b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>Register of director </b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>															
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>Register of Auditor</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>								
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>Register of Controllers </b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>Register of Beneficial Owner</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>IC正面</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	人员：AAA（待上传）		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>								
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>IC背面</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	人员：AAA（待上传）		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b> 护照（有照片页）</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	人员：AAA（待上传）		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>																														
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>中国身份证</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	人员：AAA（待上传）		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>持护照（打开有照片页）上半身照</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	人员：AAA（待上传）		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
																	</div>																									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-5 col-lg-5">	
														           	   <b>住所证明</b>			                  
																	</div>
														            <div class="col-12 col-md-5 col-lg-5">	
														            	人员：AAA（待上传）		                  
																	</div>		
														            <div class="col-12 col-md-2 col-lg-2">	
														            	<a href="#" >下载</a>	<span> | </span><a href="#" >浏览</a>						                  
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
</script>
</body>
</html>