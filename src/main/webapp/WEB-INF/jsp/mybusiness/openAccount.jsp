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
  <title>银行开户  &mdash;  睿信集团</title>

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
            <h1>银行开户</h1>
          </div>
			<!--PEN CONTENT -->
			<div class="content">
			  <!--content inner-->
			  <div class="content__inner">
			    <div class="container overflow-hidden">
			      <!--multisteps-form-->
			      <div class="multisteps-form">
			        <!--progress bar-->
			        <div class="row">
			        	<div class="col-12 col-lg-8 ml-auto mr-auto mb-4">
				            <div class="multisteps-form__progress">
				              <button class="multisteps-form__progress-btn js-active" type="button" title="选择服务">选择服务</button>
				              <button class="multisteps-form__progress-btn" type="button" title="填报资料">填报资料</button>
				              <button class="multisteps-form__progress-btn" type="button" title="在线确认">在线确认</button>
				              <button class="multisteps-form__progress-btn" type="button" title="在线支付">在线支付</button>
				            </div>
			        	</div>
			        	<!-- Left side -->
				        <div class="col-lg-8 col-md-12 col-12 col-sm-12  leftside" >
				           <form class="multisteps-form__form" action="/view/registerNewCompany" method="post">
				              <!--single form panel-->
				              <div class="multisteps-form__panel shadow p-4 rounded bg-white ad js-active" data-animation="scaleIn" id="companytype">
				                <h3 class="multisteps-form__title">选择服务</h3>
				                <div class="multisteps-form__content">
				                	<div class="control-label">请从以下选择你需要的服务</div>				                
				                    <div class="section-title">离岸公司新加坡离岸银行户口</div>
				                		<ul class="list-group list-group-flush">
						                  	<li class="list-group-item">
							                  <!--  <label class="custom-switch mt-2 justify-content-between">
								                    <span class="custom-switch-description nc_subttitle">新建坡面签开户</span>
						                        	<input type="checkbox" class="custom-switch-input"  id="openSignatureAccount" onclick="openAccountFunction('openSignatureAccount','openSignatureAccountDetail')"> 
						                        	<span class="custom-switch-indicator  nc_bttextbtn"></span>
								                </label>-->	
													<label> 
															 <div class="row">
																 <div class="col-lg-10 col-md-10 col-sm-10 col-10">
																	<span class="custom-switch-description nc_subttitle">新建坡面签开户</span>	
																 </div>	
														  	 	 <div class="col-lg-2 col-md-2 col-sm-2 col-2 btntop">												
																	<input type="checkbox" class="custom-switch-input"  id="openSignatureAccount" onclick="openAccountFunction('openSignatureAccount','openSignatureAccountDetail')"> 
						                        	            	 <span class="custom-switch-indicator  nc_bttextbtn"></span>
																</div>	
															</div>
														</label>									                
							                	<div class="card-body" id="openSignatureAccountDetail" style="display:none">
								                    <ul class="list-group" >
								                      <li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(0)" >					                      						                      							                    
								                       <div class="form-group" style="margin-bottom: 0px;">
									                      <div class="input-group">
									                        <select class="custom-select" id="selectNewSignAccount" onchange="run(1)">
									                        
									                          <option value="1" selected>1</option>
									                          <option value="2">2</option>
									                          <option value="3">3</option>
									                          <option value="4">4</option>
									                          <option value="5">5</option>
									                          <option value="6">6</option>
									                          <option value="7">7</option>
									                          <option value="8">8</option>	
									                          <option value="9">9</option>
									                          <option value="10">10</option>									                          							                          
									                        </select>
									                        <div class="input-group-append">
									                          <label class="btn">个户口</label>
									                        </div>							                        
									                      </div>
									                    </div>
								                        <span id="pricebvisg" class="badge badge-primary badge-pill">S$2500</span>
								                      </li>
	
								                    </ul>
							                    </div>                						                    
						                    </li>
						                  	<li class="list-group-item">
													<label> 
														  <div class="row">
																 <div class="col-lg-10 col-md-10 col-sm-10 col-10">
																	<span class="custom-switch-description nc_subttitle">远程开户</span>	
																 </div>	
														  	 	 <div class="col-lg-2 col-md-2 col-sm-2 col-2 btntop">												
										                        	<input type="checkbox" class="custom-switch-input"  id="openRemoteAccount" onclick="openAccountFunction('openRemoteAccount','openRemoteAccountDeatil')"> 
										                        	<span class="custom-switch-indicator  nc_bttextbtn"></span>
																</div>	
															</div>
														</label>								                
							                	<div class="card-body" id="openRemoteAccountDeatil" style="display:none">
								                    <ul class="list-group">
								                      <li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(1)" >					                      						                      							                    
								                       <div class="form-group" style="margin-bottom: 0px;">
									                      <div class="input-group">
									                        <select class="custom-select" id="selectRemoteAccount" onchange="run3(1)"  style="border:none;">
									                          <option value="1" selected>1</option>
									                          <option value="2">2</option>
									                          <option value="3">3</option>
									                          <option value="4">4</option>
									                          <option value="5">5</option>
									                          <option value="6">6</option>
									                          <option value="7">7</option>
									                          <option value="8">8</option>	
									                          <option value="9">9</option>
									                          <option value="10">10</option>									                          							                          
									                        </select>
									                        <div class="input-group-append">
									                          <label class="btn">个户口</label>
									                        </div>							                        
									                      </div>
									                    </div>
								                        <span id="pricebvisg3" class="badge badge-primary badge-pill">S$3500</span>
								                      </li>
								                    </ul>
							                    </div>
						                    </li>
				                		</ul>
				                    <div class="section-title">私人银行贵宾户口</div>
				                		<ul class="list-group list-group-flush">
						                  	<li class="list-group-item">
													<label> 
														  <div class="row">
																 <div class="col-lg-10 col-md-10 col-sm-10 col-10">
																	<span class="custom-switch-description nc_subttitle">私人银行贵宾户口</span>	
																 </div>	
														  	 	 <div class="col-lg-2 col-md-2 col-sm-2 col-2 btntop">												
										                        	<input type="checkbox" class="custom-switch-input"  id="openPriviteVIPAccount" onclick="openAccountFunction('openPriviteVIPAccount','openPriviteVIPAccountDeatil')"> 
										                        	<span class="custom-switch-indicator  nc_bttextbtn"></span>
																</div>	
															</div>
														</label>								                
							                	<div class="card-body" id="openPriviteVIPAccountDeatil" style="display:none">
								                    <ul class="list-group" >
								                      <li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(2)" >					                      						                      							                    
								                       <div class="form-group" style="margin-bottom: 0px;">
									                      <div class="input-group">
									                        <select class="custom-select" id="selectVIPAccount" onchange="run1(1)"  style="border:none;">
									                          <option value="1" selected>1</option>
									                          <option value="2">2</option>
									                          <option value="3">3</option>
									                          <option value="4">4</option>
									                          <option value="5">5</option>
									                          <option value="6">6</option>
									                          <option value="7">7</option>
									                          <option value="8">8</option>	
									                          <option value="9">9</option>
									                          <option value="10">10</option>									                          							                          
									                        </select>
									                        <div class="input-group-append">
									                          <label class="btn">个户口</label>
									                        </div>							                        
									                      </div>
									                    </div>
								                        <span id="pricebvisg1" class="badge badge-primary badge-pill">S$1200</span>
								                      </li>	
								                    </ul>
							                    </div>                						                    
						                    </li>
				                		</ul>
				                    <div class="section-title">新加坡公司开户</div>
				                		<ul class="list-group list-group-flush">
						                  	<li class="list-group-item">
													<label> 
														  <div class="row">
																 <div class="col-lg-10 col-md-10 col-sm-10 col-10">
																	<span class="custom-switch-description nc_subttitle">新加坡公司开户</span>	
																 </div>	
														  	 	 <div class="col-lg-2 col-md-2 col-sm-2 col-2 btntop">												
										                        	<input type="checkbox" class="custom-switch-input"  id="openCompanyAccount" onclick="openAccountFunction('openCompanyAccount','openCompanyAccountDeatil')"> 
										                        	<span class="custom-switch-indicator  nc_bttextbtn"></span>
																</div>	
															</div>
														</label>									                
							                	<div class="card-body" id="openCompanyAccountDeatil" style="display:none">
								                    <ul class="list-group" >
								                      <li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(3)" >					                      						                      							                    
								                       <div class="form-group" style="margin-bottom: 0px;">
									                      <div class="input-group">
									                        <select class="custom-select" id="selectOpenCompanyAccount" onchange="run2(1)"  style="border:none;">
									                          <option value="1" selected>1</option>
									                          <option value="2">2</option>
									                          <option value="3">3</option>
									                          <option value="4">4</option>
									                          <option value="5">5</option>
									                          <option value="6">6</option>
									                          <option value="7">7</option>
									                          <option value="8">8</option>	
									                          <option value="9">9</option>
									                          <option value="10">10</option>									                          							                          
									                        </select>
									                        <div class="input-group-append">
									                          <label class="btn">个户口</label>
									                        </div>							                        
									                      </div>
									                    </div>
								                        <span id="pricebvisg2" class="badge badge-primary badge-pill">S$500</span>
								                      </li>	
								                    </ul>
							                    </div>                						                    
						                    </li>
				                		</ul>
				                		

				                    <div class="button-row d-flex mt-4">
					                    <button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
					                    <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
				                  </div>
				                </div>
				              </div>
				              
				
				              <!--single form panel-->
				              <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
				                <h3 class="multisteps-form__title">填报资料</h3>
				                <div class="multisteps-form__content">
				                  
				                  <div class="card-body">
				                	<ul class="list-group list-group-flush" >				                
					                  	<li class="list-group-item" id="InfoBVI" style="display:none;">
						                  	<label class="custom-switch mt-2 justify-content-between">
							                    <span class="custom-switch-description nc_subttitle"><b>离岸公司新加坡离岸银行户口-新建坡面签开户</b> </span>
					                        	<input type="checkbox" class="custom-switch-input"  id="openAccount5" onclick="openAccountFunction('openAccount5','openAccountDeatil5')"> 
					                        	<span class="custom-switch-indicator  nc_bttextbtn"></span>
							                </label>
						                	<div class="card-body" id="openAccountDeatil5" style="display:none">						                	               						                	
									             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">公司名称</label>
							                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司名称"></div>
							                     </div>
									             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">公司注册国家</label>
							                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司注册国家"></div>
							                     </div>                    		
									             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">公司法人信息</label>
							                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司法人信息"></div>
							                     </div>    
		   							             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">联系人电话</label>
							                      		<div class="col-sm-9"><input type="tel" class="form-control"  placeholder="联系人电话"></div>
							                     </div>    							             
							                     <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">联系人邮箱</label>
							                      		<div class="col-sm-9"><input type="email" class="form-control"  placeholder="联系人邮箱"></div>
							                     </div>  	
		   							             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">其它联系方式</label>
							                      		<div class="col-sm-9"><input class="form-control"  placeholder="其它联系方式"></input></div>
							                     </div> 		                    	
						                    </div>
					                    </li>	
					                  	<li class="list-group-item" id="InfoRemote" style="display:none;" >
						                  	<label class="custom-switch mt-2 justify-content-between">
							                    <span class="custom-switch-description nc_subttitle"><b>离岸公司新加坡离岸银行户口-远程开户</b> </span>
					                        	<input type="checkbox" class="custom-switch-input"  id="openAccount6" onclick="openAccountFunction('openAccount6','openAccountDeatil6')"> 
					                        	<span class="custom-switch-indicator  nc_bttextbtn"></span>
							                </label>
						                	<div class="card-body" id="openAccountDeatil6" style="display:none">						                	               						                	
									             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">公司名称</label>
							                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司名称"></div>
							                     </div>
									             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">公司注册国家</label>
							                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司注册国家"></div>
							                     </div>                    		
									             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">公司法人信息</label>
							                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司法人信息"></div>
							                     </div>    
		   							             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">联系人电话</label>
							                      		<div class="col-sm-9"><input type="tel" class="form-control"  placeholder="联系人电话"></div>
							                     </div>    							             
							                     <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">联系人邮箱</label>
							                      		<div class="col-sm-9"><input type="email" class="form-control"  placeholder="联系人邮箱"></div>
							                     </div>  	
		   							             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">其它联系方式</label>
							                      		<div class="col-sm-9"><input class="form-control"  placeholder="其它联系方式"></input></div>
							                     </div> 		                    	
						                    </div>
					                    </li>						                    
					                  	<li class="list-group-item" id="InfoVIP" style="display:none;">
						                  	<label class="custom-switch mt-2 justify-content-between">
							                    <span class="custom-switch-description nc_subttitle"><b>私人银行贵宾户口</b> </span>
					                        	<input type="checkbox" class="custom-switch-input"  id="openAccount7" onclick="openAccountFunction('openAccount7','openAccountDeatil7')"> 
					                        	<span class="custom-switch-indicator  nc_bttextbtn"></span>
							                </label>
						                	<div class="card-body" id="openAccountDeatil67" style="display:none">
									             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">个人姓名</label>
							                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="个人姓名"></div>
							                     </div>
									             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">开户国籍</label>
							                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="开户国籍"></div>
							                     </div>                    		 
		   							             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">联系人电话</label>
							                      		<div class="col-sm-9"><input type="tel" class="form-control"  placeholder="联系人电话"></div>
							                     </div>    							             
							                     <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">联系人邮箱</label>
							                      		<div class="col-sm-9"><input type="email" class="form-control"  placeholder="联系人邮箱"></div>
							                     </div>  	
		   							             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">其它联系方式</label>
							                      		<div class="col-sm-9"><input class="form-control"  placeholder="其它联系方式"></input></div>
							                     </div> 					                    	
						                    </div>
					                    </li>		
					                  	<li class="list-group-item" id="InfoSG" style="display:none;">
						                  	<label class="custom-switch mt-2 justify-content-between">
							                    <span class="custom-switch-description nc_subttitle"><b>新加坡公司开户</b> </span>
					                        	<input type="checkbox" class="custom-switch-input"  id="openAccount8" onclick="openAccountFunction('openAccount8','openAccountDeatil8')"> 
					                        	<span class="custom-switch-indicator  nc_bttextbtn"></span>
							                </label>
						                	<div class="card-body" id="openAccountDeatil8" style="display:none">					                	
									             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">公司名称</label>
							                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司名称"></div>
							                     </div>
									             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">公司注册号</label>
							                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司注册号"></div>
							                     </div>                    		
									             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">公司法人信息</label>
							                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司法人信息"></div>
							                     </div>    
		   							             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">联系人电话</label>
							                      		<div class="col-sm-9"><input type="tel" class="form-control"  placeholder="联系人电话"></div>
							                     </div>    							             
							                     <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">联系人邮箱</label>
							                      		<div class="col-sm-9"><input type="email" class="form-control"  placeholder="联系人邮箱"></div>
							                     </div>  	
		   							             <div class="form-group row">
							                      	 <label  class="col-sm-3 col-form-label">其它联系方式</label>
							                      		<div class="col-sm-9"><input class="form-control"  placeholder="其它联系方式"></input></div>
							                     </div> 					                    	
						                    </div>
					                    </li>					                    			                    				                   
                    				</ul>				                    				                                 				                   				             						                     		                    				                     			                   				                    		                    			                    
				                    <div class="button-row d-flex mt-4">
					                    <button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
					                    <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
				                  </div>
				                </div>
				                </div>
				              </div>

				              
				              <!--single form panel-->
				              <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
				                <h3 class="multisteps-form__title">在线确认</h3>
				                  <div class="button-row d-flex mt-4">
				                    <button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
				                    <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next" onclick="listSummary()">下一步</button>
				                  </div>
				              </div>
				              
				               <!--single form panel-->
				              <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
				                <h3 class="multisteps-form__title">在线支付</h3>
				                <div class="multisteps-form__content">
				                	<div class="card-body" id="summary">
				                    </div>
				                  </div>
				                  <div class="row">
				                    <div class="button-row d-flex mt-4 col-12">
				                      <button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
				                      <button class="btn btn-primary ml-auto js-btn-next" type="submit" title="Send">提交</button>
				                    </div>
				                  </div>
				              </div>
				              
				            </form>
				          </div>
			        		
		        		<!-- right side -->
		        		<div class="col-lg-4 col-md-12 col-12 col-sm-12">
			              <!-- Right side -->
			              <div class="summary-item" id="selected_summary"> </div>
			            </div>
			      </div>
			    </div>
			  </div>
			<!-- partial -->
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

    <script type="text/javascript">

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
    function openInfoDiv(x,y) {
  	  var countDiv = document.getElementById(x);
  	  var text = document.getElementById(y);
  	  if (countDiv.checked == true){
  	    text.style.display = "block";
  	  } else {
  	    text.style.display = "none";
  	  }
  }    

    $(function() {
        $( "#registerDate" ).datepicker();
        $( "#planAuditDate" ).datepicker();
        $( "#actualAuditDate" ).datepicker();
        $( "#financetDate" ).datepicker();
        $( "#gstTaxDate" ).datepicker();
        $( "#formClaimDate" ).datepicker();
        $( "#formTaxDate" ).datepicker();
        $( "#eciClaimDate" ).datepicker();
        $( "#ecitaxDate" ).datepicker();
        $( "#xbrlClaimDate" ).datepicker();
        $( "#openAccountDate" ).datepicker();
        $( "#OpenAccountCompleteDate" ).datepicker();
      });
    
    var services = [];

    $(document).ready(function(){
    	refreshRightSummary();
    });

    function refreshRightSummary() {
        var number = services.length;
        var selectedsummaryhtml = "<h6 class='mt-3'>服务类型详细清单</h6><ul class='list-unstyled list-unstyled-border'>";
        var totalamount = 0;
        
        for (let i=0; i<services.length; i+=1) {
            totalamount = totalamount + services[i].price;
            selectedsummaryhtml += 
                 `<li class="media"><a href="#"><img alt="image" class="mr-3 rounded" width="50" src="../assets/img/products/product-2-50.png"></a>
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
        selectedsummaryhtml += ") </span>  总计金额  (<span class='text-muted media-right'>" + totalamount + "</span>)</h6>";
        document.getElementById("selected_summary").innerHTML = selectedsummaryhtml;
     }        
    	
	  function addGudong () {
		  document.querySelector('#gudongdiv').insertAdjacentHTML('afterend',
		    `<li class="list-group-item">
				<div class="form-group row">
					<label class="col-sm-3 col-form-label">股东</label>
					<div class="col-sm-9"><input type="text" class="form-control" id="gudong2" placeholder="股东">
						<input type="button" value="-" onclick="removeGuDong(this)">
					</div>
					
				</div>
            </li>`      
		  )
	  }
	  function addDongshi () {
		  document.querySelector('#dongshidiv').insertAdjacentHTML('afterend',
		    `<li class="list-group-item">
				<div class="form-group row">
					<label class="col-sm-3 col-form-label">董事</label>
					<div class="col-sm-9"><input type="text" class="form-control" id="dongshi2" placeholder="董事">
					    <input type="button" value="-" onclick="removeDongShi(this)">
					</div>
					
				</div>
            </li>`      
		  )
	  }
	  function removeGuDong (input) {
		  input.parentNode.parentNode.parentNode.remove()
	  }
	  function removeDongShi (input) {
		  input.parentNode.parentNode.parentNode.remove()
	  }

	  function listSummary() {
		  text = "<ul class='list-group'>";
		  for (i = 0; i < sLen; i++) {
		    text += "<li class='list-group-item d-flex justify-content-between align-items-center'>" + services[i] + 
		                "<span class='badge badge-primary badge-pill'>" + services[i]  + "</span>" +
		           "</li>";
		  }
		  text += "</ul>";

		  document.getElementById("summary").innerHTML = text;
	  }

	function choosedsv(x)
	{
		//document.getElementsByClassName("choosedsvr")[x].style.backgroundColor= '#f8fafb'; 	
		var element = document.getElementsByClassName("choosedsvr")[x];
        var btn = document.getElementsByClassName("badge-pill")[x];
        
        if (!element.classList.contains('choosesv')) {
            
        	switch (x) {
            case 0:
            	z.push(document.getElementById("selectNewSignAccount").value);
            	if (services.some(el => el.name === "新建坡面签开户")){
                    services = services.filter(item => item.name !== "新建坡面签开户")
                 }
                 services.push({name:"新建坡面签开户",price:z[0]*2500});
                 refreshRightSummary();
                 z= [];
                 document.getElementById("InfoBVI").style.display="block";
                 break;
            case 1:
            	z.push(document.getElementById("selectRemoteAccount").value);
                if (services.some(el => el.name === "远程开户")){
                    services = services.filter(item => item.name !== "远程开户")
                }
                services.push({name:"远程开户",price:z[0]*3500});
                refreshRightSummary();
                z=[];
                document.getElementById("InfoRemote").style.display="block";
                break;
            case 2:
            	z.push(document.getElementById("selectVIPAccount").value);
            	if (services.some(el => el.name === "私人银行贵宾户口")){
                    services = services.filter(item => item.name !== "私人银行贵宾户口")
                 }
                 services.push({name:"私人银行贵宾户口",price:z[0]*1200});
                 refreshRightSummary();
                 z=[];
                 document.getElementById("InfoVIP").style.display="block";
                 break;
            case 3:
            	z.push(document.getElementById("selectOpenCompanyAccount").value);
            	if (services.some(el => el.name === "新加坡公司开户")){
                    services = services.filter(item => item.name !== "新加坡公司开户")
                 }
                 services.push({name:"新加坡公司开户",price:z[0]*500});
                 refreshRightSummary();
                 z= [];
                 document.getElementById("InfoSG").style.display="block";
                 break;
            }
        } else {        	        	
        	switch (x) {
        	case 0:
                if (services.some(el => el.name === "新建坡面签开户")){
                    services = services.filter(item => item.name !== "新建坡面签开户")
                }
                refreshRightSummary();
                document.getElementById("InfoBVI").style.display="none";
                break;
            case 1:
                if (services.some(el => el.name === "远程开户")){
                    services = services.filter(item => item.name !== "远程开户")
                }
                refreshRightSummary();
                document.getElementById("InfoRemote").style.display="none";
                break;
            case 2:
                if (services.some(el => el.name === "私人银行贵宾户口")){
                    services = services.filter(item => item.name !== "私人银行贵宾户口")
                }
                refreshRightSummary();
                document.getElementById("InfoVIP").style.display="none";
                break;
            case 3:
                if (services.some(el => el.name === "新加坡公司开户")){
                    services = services.filter(item => item.name !== "新加坡公司开户")
                }
                refreshRightSummary();
                document.getElementById("InfoSG").style.display="none";
                break;
            } 
        }
		element.classList.toggle("choosesv");
		btn.classList.toggle("choosedsvbtn");
	}

	var z= [];
    function run(x) {
		z.push(document.getElementById("selectNewSignAccount").value);
		if (z.length ==1){
			document.getElementById("pricebvisg").innerHTML = "S$"+z[0]*2500;
            if (services.some(el => el.name === "新建坡面签开户")){
               services = services.filter(item => item.name !== "新建坡面签开户")
            }
            services.push({name:"新建坡面签开户",price:z[0]*2500});
            refreshRightSummary();
            z= [];            
            openInfoDiv();            
		}		
    }
    function openInfoDiv() {
    	  var checkBox = document.getElementById("selectNewSignAccount").value;
    	  var text = document.getElementById("InfoBVI");
    	  var aaaa = "";
    	  for (var i=0;i<checkBox;i++)
    	  {      
    	 aaaa = aaaa + `<br/><br/>              	
    	    <li class="list-group-item" id="InfoBVI">
    							                  	<label class="custom-switch mt-2 justify-content-between">
    								                    <span class="custom-switch-description nc_subttitle"><b>离岸公司新加坡离岸银行户口-新建坡面签开户</b> </span>
    								                </label>
    							                	<div class="card-body" id="openAccountDeatil5">						                	               						                	
    										             <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">公司名称</label>
    								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司名称"></div>
    								                     </div>
    										             <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">公司注册国家</label>
    								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司注册国家"></div>
    								                     </div>                    		
    										             <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">公司法人信息</label>
    								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司法人信息"></div>
    								                     </div>    
    			   							             <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">联系人电话</label>
    								                      		<div class="col-sm-9"><input type="tel" class="form-control"  placeholder="联系人电话"></div>
    								                     </div>    							             
    								                     <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">联系人邮箱</label>
    								                      		<div class="col-sm-9"><input type="email" class="form-control"  placeholder="联系人邮箱"></div>
    								                     </div>  	
    			   							             <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">其它联系方式</label>
    								                      		<div class="col-sm-9"><input class="form-control"  placeholder="其它联系方式"></input></div>
    								                     </div> 	
    								                  <!--   <div class="col-sm-12" ><input type="button" value="+离岸公司新加坡离岸银行户口" onclick="addFilebank1(1)"></div>	
    								                     <div class="form-group row"  id="addfilebankdiv1">	 --> 		                    	
    							                    </div>
    						                    </li>`;  
    	  }
    	  text.innerHTML = aaaa;
    	}    
    function run1(x) {
		z.push(document.getElementById("selectVIPAccount").value);
		//z.push(document.getElementById("countYear").value);
		if (z.length ==1){
			document.getElementById("pricebvisg1").innerHTML = "S$"+z[0]*1200;
			if (services.some(el => el.name === "私人银行贵宾户口")){
	            services = services.filter(item => item.name !== "私人银行贵宾户口")
	         }
	         services.push({name:"私人银行贵宾户口",price:z[0]*1200});
	         refreshRightSummary();
			z= [];
		}
	}

    function run2(x) {
		z.push(document.getElementById("selectOpenCompanyAccount").value);
		if (z.length ==1){
			document.getElementById("pricebvisg2").innerHTML = "S$"+z[0]*500;
			if (services.some(el => el.name === "新加坡公司开户")){
	            services = services.filter(item => item.name !== "新加坡公司开户")
	         }
	         services.push({name:"新加坡公司开户",price:z[0]*500});
	         refreshRightSummary();
			z= [];
			openInfoSGDiv();
		}
	}   
    function openInfoSGDiv() {
    	  var checkBox = document.getElementById("selectOpenCompanyAccount").value;
    	  var text = document.getElementById("InfoSG");
    	  var aaaa = "";
    	  for (var i=0;i<checkBox;i++)
    	  {      
    	 aaaa = aaaa + `<br/><br/>              	
    	    <li class="list-group-item" id="InfoSG">
    							                  	<label class="custom-switch mt-2 justify-content-between">
    								                    <span class="custom-switch-description nc_subttitle"><b>新加坡公司开户</b> </span>
    								                </label>
    							                	<div class="card-body" id="openAccountDeatil8">						                	               						                	
    										             <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">公司名称</label>
    								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司名称"></div>
    								                     </div>
    										             <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">公司注册号</label>
    								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司注册号"></div>
    								                     </div>                    		
    										             <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">公司法人信息</label>
    								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司法人信息"></div>
    								                     </div>    
    			   							             <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">联系人电话</label>
    								                      		<div class="col-sm-9"><input type="tel" class="form-control"  placeholder="联系人电话"></div>
    								                     </div>    							             
    								                     <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">联系人邮箱</label>
    								                      		<div class="col-sm-9"><input type="email" class="form-control"  placeholder="联系人邮箱"></div>
    								                     </div>  	
    			   							             <div class="form-group row">
    								                      	 <label  class="col-sm-3 col-form-label">其它联系方式</label>
    								                      		<div class="col-sm-9"><input class="form-control"  placeholder="其它联系方式"></input></div>
    								                     </div> 			                    	
    							                    </div>
    						                    </li>`;  
    	  }
    	  text.innerHTML = aaaa;
    	}    
    function run3(x) {
		z.push(document.getElementById("selectRemoteAccount").value);
		//z.push(document.getElementById("countYear").value);
		if (z.length ==1){
			document.getElementById("pricebvisg3").innerHTML = "S$"+z[0]*3500;
	    	if (services.some(el => el.name === "远程开户")){
	            services = services.filter(item => item.name !== "远程开户")
	         }
	         services.push({name:"远程开户",price:z[0]*3500});
	         refreshRightSummary();
			z= [];
			openInfoRemoteDiv();
		}
        
	}   
    function openInfoRemoteDiv() {
  	  var checkBox = document.getElementById("selectRemoteAccount").value;
  	  var text = document.getElementById("InfoRemote");
  	  var aaaa = "";
  	  for (var i=0;i<checkBox;i++)
  	  {      
  	 aaaa = aaaa + `<br/><br/>              	
  	    <li class="list-group-item" id="InfoRemote">
  							                  	<label class="custom-switch mt-2 justify-content-between">
  								                    <span class="custom-switch-description nc_subttitle"><b>离岸公司新加坡离岸银行户口-远程开户</b> </span>
  								                </label>
  							                	<div class="card-body" id="openAccountDeatil6">						                	               						                	
  										             <div class="form-group row">
  								                      	 <label  class="col-sm-3 col-form-label">公司名称</label>
  								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司名称"></div>
  								                     </div>
  										             <div class="form-group row">
  								                      	 <label  class="col-sm-3 col-form-label">公司注册国家</label>
  								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司注册国家"></div>
  								                     </div>                    		
  										             <div class="form-group row">
  								                      	 <label  class="col-sm-3 col-form-label">公司法人信息</label>
  								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司法人信息"></div>
  								                     </div>    
  			   							             <div class="form-group row">
  								                      	 <label  class="col-sm-3 col-form-label">联系人电话</label>
  								                      		<div class="col-sm-9"><input type="tel" class="form-control"  placeholder="联系人电话"></div>
  								                     </div>    							             
  								                     <div class="form-group row">
  								                      	 <label  class="col-sm-3 col-form-label">联系人邮箱</label>
  								                      		<div class="col-sm-9"><input type="email" class="form-control"  placeholder="联系人邮箱"></div>
  								                     </div>  	
  			   							             <div class="form-group row">
  								                      	 <label  class="col-sm-3 col-form-label">其它联系方式</label>
  								                      		<div class="col-sm-9"><input class="form-control"  placeholder="其它联系方式"></input></div>
  								                     </div> 			                    	
  							                    </div>
  						                    </li>`;  
  	  }
  	  text.innerHTML = aaaa;
  	}    
  function run1(x) {
		z.push(document.getElementById("selectVIPAccount").value);
		//z.push(document.getElementById("countYear").value);
		if (z.length ==1){
			document.getElementById("pricebvisg1").innerHTML = "S$"+z[0]*1200;
			if (services.some(el => el.name === "私人银行贵宾户口")){
	            services = services.filter(item => item.name !== "私人银行贵宾户口")
	         }
	         services.push({name:"私人银行贵宾户口",price:z[0]*1200});
	         refreshRightSummary();
			z= [];
			openInfoVIPDiv();
		}
	}
  function openInfoVIPDiv() {
	  var checkBox = document.getElementById("selectVIPAccount").value;
	  var text = document.getElementById("InfoVIP");
	  var aaaa = "";
	  for (var i=0;i<checkBox;i++)
	  {      
	 aaaa = aaaa + `<br/><br/>              	
	    <li class="list-group-item" id="InfoVIP">
							                  	<label class="custom-switch mt-2 justify-content-between">
								                    <span class="custom-switch-description nc_subttitle"><b>私人银行贵宾户口</b> </span>
								                </label>
							                	<div class="card-body" id="openAccountDeatil7">						                	               						                	
										             <div class="form-group row">
								                      	 <label  class="col-sm-3 col-form-label">个人姓名</label>
								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="个人姓名"></div>
								                     </div>
										             <div class="form-group row">
								                      	 <label  class="col-sm-3 col-form-label">开户国籍</label>
								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="开户国籍"></div>
								                     </div>                    		
										             <div class="form-group row">
								                      	 <label  class="col-sm-3 col-form-label">联系人电话</label>
								                      		<div class="col-sm-9"><input type="text" class="form-control"  placeholder="联系人电话"></div>
								                     </div>     							             
								                     <div class="form-group row">
								                      	 <label  class="col-sm-3 col-form-label">联系人邮箱</label>
								                      		<div class="col-sm-9"><input type="email" class="form-control"  placeholder="联系人邮箱"></div>
								                     </div>  	
			   							             <div class="form-group row">
								                      	 <label  class="col-sm-3 col-form-label">其它联系方式</label>
								                      		<div class="col-sm-9"><input class="form-control"  placeholder="其它联系方式"></input></div>
								                     </div> 			                    	
							                    </div>
						                    </li>`;  
	  }
	  text.innerHTML = aaaa;
	} 
	
</script>

  <!-- Template JS File -->
  <script src="../../../assets/js/scripts.js"></script>
  <script src="../../../assets/js/custom.js"></script>
  <script  src="../../../assets/js/multiplepage.js"></script>
  <!-- Page Specific JS File -->
</body>
</html>