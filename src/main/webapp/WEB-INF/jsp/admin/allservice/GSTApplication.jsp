<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>新建公司 &mdash; 睿信集团</title>
		
		<!-- General CSS Files -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
		
		<!-- Template CSS -->
		<link rel="stylesheet" href="../../../assets/css/style.css">
		<link rel="stylesheet" href="../../../assets/css/components.css">
		<link rel="stylesheet" href="../../../assets/css/multiplepage.css">
		<link rel="stylesheet" href="../../../assets/css/jquery-ui.css">
		
		<link rel="stylesheet" type="text/css" href="../../../assets/css/fileupload.css" >
	</head>

	<body>
		<jsp:include page="../userMenu.jsp" />
		<!-- Main Content -->
		<div class="main-content" id="newcompany">
			<section class="section">
				<div class="section-header">
					<h1>新加坡消费税申请</h1>
				</div>
				<!--PEN CONTENT -->
				<div class="content" style="overflow: auto;">
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
											<button class="multisteps-form__progress-btn" type="button" title="在线确认">在线支付</button>
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-12 col-sm-12  alert alert-primary alert-dismissible show fade" style="margin: 15px;">
										<div class="alert-body">
											<button class="close" data-dismiss="alert"> <span>&times;</span> </button>
											<p> <b>申请前提示</b> </p>
											<p>1. 此申请步骤约需20分钟；</p>
											<p>2. 在申请前请先准备以下相关资料，以备登记相关信息所需: 
											    1>新加坡公司BIZFILE ; 2>董事和股东个人信息；</p>
											<p>3. 请确保所填内容是英文形式。</p>
										</div>
									</div>

									<!-- Left side -->
									<div class="col-lg-8 col-md-12 col-12 col-sm-12 leftside">
										<form style="overflow:unset;height: 600px;" class="multisteps-form__form" action="/view/registerNewCompany" method="post" enctype="multipart/form-data" id="newcompanyForm">

											<!--single form panel-->
											<div class="multisteps-form__panel shadow p-4 rounded bg-white ad js-active" data-animation="scaleIn" id="companytype">
												<h3 class="multisteps-form__title">选择服务</h3>
												<div class="multisteps-form__content">

													<div class="section-title">可选服务</div>
													<ul class="list-group list-group-flush">
														
														<li class="list-group-item">
															<label>
																<div class="row">
																	<div class="col-lg-10 col-md-10 col-sm-10 col-10">
																		<span class="custom-switch-description nc_subttitle">GST消费税注册</span>
																	</div>
																	<div class="col-lg-2 col-md-2 col-sm-2 col-2 btntop">
																		<input type="checkbox" class="custom-switch-input" id="openAccount6" onclick="openAccountFunction('openAccount6','openAccountDeatil6')">
																		<span class="custom-switch-indicator nc_bttextbtn"></span>
																	</div>
																</div>
														 	</label>
															<div class="card-body" id="openAccountDeatil6" >
																<ul class="list-group">
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(0)">
																		一次性注册 
																		<span class="badge badge-primary badge-pill">S$400</span>
																	</li>
																	<li class="list-group-item justify-content-between align-items-center choosedsvr" onclick="choosedsv(1)">
																		<div class="row">
																			<div class="col-lg-4 col-md-4 col-sm-4 col-4" style="margin-top: 0rem;">GST申报</div>
																			<div class="form-group col-lg-4 col-md-4 col-sm-4 col-4" style="margin-bottom: 0px;">
																				<div class="input-group">
																					<select class="custom-select" id="countapgst" onchange="reCalcgst(0)" style="border: none;">
																						<option selected>1</option>
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
																						<button class="btn" disabled="disabled">次</button>
																					</div>
																				</div>
																			</div>
																			<div class="col-lg-4 col-md-4 col-sm-4 col-4 right">
																				<div id="priceapgst" class="badge badge-primary badge-pill">S$300</div>
																			</div>
																			<br />
																		</div>
																	</li>
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(2)">
																		申请加4次申报配套 
																		<span class="badge badge-primary badge-pill">S$1400</span>
																	</li>
																</ul>
															</div>
														</li>	


													</ul>

													<div class="button-row d-flex mt-4">
														<button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
													</div>
												</div>
											</div>
	
											<!--single form panel-->
											<div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
												<h3 class="multisteps-form__title">填报资料</h3>
												<div class="multisteps-form__content c_top">
													<div class="card-body">														
														<div class="section-title">公司资料</div>
														<div class="form-group row">
															<label class="col-sm-3 col-form-label">公司名称</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="companyName" value="默认为注册公司名称"
																	placeholder="限英文，填写示范：RSIN GROUP" onkeypress="return /[a-z ]/i.test(event.key)">
															</div>
														</div>																									
												   </div>
											    </div>
											    <div class="button-row d-flex mt-4">
													<button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
													<button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next" onclick="listSummary()">下一步</button>
												</div>
											</div>

											<!--single form panel-->
											<div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
												<h3 class="multisteps-form__title">在线确认</h3>
												<div class="card-body">
													<div class="section-title">公司资料</div>
													<div class="form-group row">
														<div id="companyinfo_summary"></div>
													</div>
												</div>
												
												<div class="button-row d-flex mt-4">
													<button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
													<!-- <button class="btn btn-primary js-btn-prev" type="button" title="SendEmail" id="send_email">发送确认邮件</button> -->
													<button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
												</div>
											</div>
	
											<!--single form panel-->
											<div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
												<h3 class="multisteps-form__title">在线支付</h3>
												<div class="multisteps-form__content">
													<div class="card-body" id="summary"></div>
												</div>
												<div class="row">
													<div class="button-row d-flex mt-4 col-12">
														<button class="btn btn-primary js-btn-prev" type="button"
															title="Prev">上一步</button>
														<button class="btn btn-primary ml-auto js-btn-next" type="submit" title="Send">提交</button>
													</div>
												</div>
											</div>
	
										</form>
									</div>
	
									<!-- right side -->
									<div class="col-lg-4 col-md-12 col-12 col-sm-12">
										<!-- Right side -->
										<div class="summary-item" id="selected_summary"></div>
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
				版权所有 &copy; 2020
				<div class="bullet"></div>
				设计是由 <a href="#">睿信集团</a>
			</div>
			<div class="footer-right">1.1.0</div>
		</footer>
	
		<!-- General JS Scripts -->
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		<script src="../../../assets/js/stisla.js"></script>
		<!-- Template JS File -->
		<script src="../../../assets/js/scripts.js"></script>
		<script src="../../../assets/js/custom.js"></script>
		<script src="../../../assets/js/multiplepage.js"></script>
		<!-- Page Specific JS File -->
	     <script src="../../../assets/js/GSTApplication.js"></script>
	    <script src="../../../assets/js/fileupload.js" type="text/javascript"></script>
	</body>
</html>