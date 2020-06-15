<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
	name="viewport">
<meta name="description" content="">
<meta name="author" content="">
<title>新建公司 &mdash; 睿信集团</title>

<!-- General CSS Files -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />

<!-- Template CSS -->
<link rel="stylesheet" href="../../../assets/css/style.css">
<link rel="stylesheet" href="../../../assets/css/components.css">
<link rel="stylesheet" href="../../../assets/css/multiplepage.css">
<link rel="stylesheet" href="../../../assets/css/jquery-ui.css">

</head>

<body>
	<jsp:include page="../menu.jsp" />
	<!-- Main Content -->
	<div class="main-content">
		<section class="section">
			<div class="section-header">
				<h1>创建新公司</h1>
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
										<button class="multisteps-form__progress-btn js-active"
											type="button" title="选择服务">选择服务</button>
										<button class="multisteps-form__progress-btn" type="button"
											title="填报资料">填报资料</button>
										<button class="multisteps-form__progress-btn" type="button"
											title="在线确认">在线确认</button>
										<button class="multisteps-form__progress-btn" type="button"
											title="在线支付">在线支付</button>
									</div>
								</div>
								<!-- Left side -->
								<div class="col-lg-8 col-md-12 col-12 col-sm-12">
									<form class="multisteps-form__form"
										action="/view/registerNewCompany" method="post">
										<!--single form panel-->
										<div
											class="multisteps-form__panel shadow p-4 rounded bg-white ad js-active"
											data-animation="scaleIn" id="companytype">
											<h3 class="multisteps-form__title">选择服务</h3>
											<div class="multisteps-form__content">
												<div class="control-label">请从以下选择你需要的服务</div>
												<div class="section-title">新注册公司类型</div>
												<div class="custom-control custom-radio">
													<input type="radio" id="customRadio1" name="customRadio"
														class="custom-control-input"> <label
														class="custom-control-label" for="customRadio1">私人豁免有限公司Exempt
														Private Limited Company (PTE LTD)</label>
												</div>
												<div class="custom-control custom-radio">
													<input type="radio" id="customRadio2" name="customRadio"
														class="custom-control-input"> <label
														class="custom-control-label" for="customRadio2">公众有限责任公司Public
														Limited Company(Ltd.)</label>
												</div>
												<div class="section-title">可选服务</div>

												<ul class="list-group list-group-flush">

													<li class="list-group-item"><label
														class="custom-switch mt-2 justify-content-between">
															<span class="custom-switch-description nc_subttitle">新注册新加坡公司开户</span>
															<input type="checkbox" class="custom-switch-input"
															id="openAccount"
															onclick="openAccountFunction('openAccount','openAccountDeatil')">
															<span class="custom-switch-indicator  nc_bttextbtn"></span>
													</label>
														<div class="card-body" id="openAccountDeatil"
															style="display: none">
															<ul class="list-group">
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(0)">1个户口 <span
																	class="badge badge-primary badge-pill">S$300</span>
																</li>

															</ul>
														</div></li>
													<li class="list-group-item"><label
														class="custom-switch mt-2 justify-content-between">
															<span class="custom-switch-description nc_subttitle">挂名董事</span>
															<input type="checkbox" class="custom-switch-input"
															id="openAccount2"
															onclick="openAccountFunction('openAccount2','openAccountDeatil2')">
															<span class="custom-switch-indicator  nc_bttextbtn"></span>
													</label>
														<div class="card-body" id="openAccountDeatil2"
															style="display: none">
															<ul class="list-group">
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(1)">
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="input-group">
																			<select class="custom-select" id="inputGroupSelect04"
																				onchange="run(1)" style="border: none;">
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
																				<button class="btn">人</button>
																			</div>
																			<select class="custom-select" id="countYear"
																				onchange="run(2)" style="border: none;">
																				<option value="1" selected>1</option>
																				<option value="2">2</option>
																				<option value="3">3</option>
																				<option value="4">4</option>
																				<option value="5">5</option>
																				<option value="6">6</option>
																			</select>
																			<div class="input-group-append">
																				<button class="btn">年</button>
																			</div>
																		</div>
																	</div> <span id="priceDongshi"
																	class="badge badge-primary badge-pill">S$1800</span> <br />
																	<span style="margin-top: 0rem;">押金</span> <span
																	class="badge badge-primary badge-pill">S$1500</span>
																</li>
															</ul>
														</div></li>

													<li class="list-group-item"><label
														class="custom-switch mt-2 justify-content-between">
															<span class="custom-switch-description nc_subttitle">挂名股东</span>
															<input type="checkbox" class="custom-switch-input"
															id="openAccount3"
															onclick="openAccountFunction('openAccount3','openAccountDeatil3')">
															<span class="custom-switch-indicator  nc_bttextbtn"></span>
													</label>
														<div class="card-body" id="openAccountDeatil3"
															style="display: none">
															<ul class="list-group">
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(2)">
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="input-group">
																			<select class="custom-select" id="countGuDong"
																				onchange="runGuDong(1)" style="border: none;">
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
																				<button class="btn">人</button>
																			</div>
																			<select class="custom-select" id="countYearGuDong"
																				onchange="runGuDong(2)" style="border: none;">
																				<option value="1" selected>1</option>
																				<option value="2">2</option>
																				<option value="3">3</option>
																				<option value="4">4</option>
																				<option value="5">5</option>
																				<option value="6">6</option>
																			</select>
																			<div class="input-group-append">
																				<button class="btn">年</button>
																			</div>
																		</div>
																	</div> <span id="priceGuDong"
																	class="badge badge-primary badge-pill">S$1000</span>
																</li>
															</ul>
														</div></li>

													<li class="list-group-item"><label
														class="custom-switch mt-2 justify-content-between">
															<span class="custom-switch-description nc_subttitle">共享办公室</span>
															<input type="checkbox" class="custom-switch-input"
															id="openAccount4"
															onclick="openAccountFunction('openAccount4','openAccountDeatil4')">
															<span class="custom-switch-indicator  nc_bttextbtn"></span>
													</label>
														<div class="card-body" id="openAccountDeatil4"
															style="display: none">
															<ul class="list-group">
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(3)">
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="input-group">
																			<select class="custom-select" id="countoffice"
																				onchange="runoffice(1)" style="border: none;">
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
																				<button class="btn">卡位</button>
																			</div>
																			<select class="custom-select" id="countMoffice"
																				onchange="runoffice(2)" style="border: none;">
																				<option value="3" selected>3</option>
																				<option value="6">6</option>
																				<option value="12">12</option>
																			</select>
																			<div class="input-group-append">
																				<button class="btn">个月</button>
																			</div>
																		</div>
																	</div> <span id="priceoffice"
																	class="badge badge-primary badge-pill">S$2400</span>
																</li>
															</ul>
														</div></li>


													<li class="list-group-item"><label
														class="custom-switch mt-2 justify-content-between">
															<span class="custom-switch-description nc_subttitle">商标注册</span>
															<input type="checkbox" class="custom-switch-input"
															id="openAccount5"
															onclick="openAccountFunction('openAccount5','openAccountDeatil5')">
															<span class="custom-switch-indicator  nc_bttextbtn"></span>
													</label>
														<div class="card-body" id="openAccountDeatil5"
															style="display: none">
															<ul class="list-group">
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(4)">
																	<div class="form-group"
																		style="margin-right: 5rem; margin-bottom: 0rem;">
																		<label for="inputPassword5">请填写商标分类编号</label> <input
																			type="text" id="inputPassword5" class="form-control"
																			aria-describedby="passwordHelpBlock"> <small
																			id="passwordHelpBlock" class="form-text text-muted">
																			备注：如不清楚商标分类编号，请填写您的所在行业范围，客户将于24小时与您核实。 </small>
																	</div> <span class="badge badge-primary badge-pill">S$1200</span>
																</li>

																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(5)">是否需要附加大类 <span
																	class="badge badge-primary badge-pill">S$900</span>
																</li>
															</ul>
														</div></li>


													<li class="list-group-item"><label
														class="custom-switch mt-2 justify-content-between">
															<span class="custom-switch-description nc_subttitle">GST消费税注册
														</span> <input type="checkbox" class="custom-switch-input"
															id="openAccount6"
															onclick="openAccountFunction('openAccount6','openAccountDeatil6')">
															<span class="custom-switch-indicator  nc_bttextbtn"></span>
													</label>
														<div class="card-body" id="openAccountDeatil6"
															style="display: none">
															<ul class="list-group">
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(6)">一次性注册 <span
																	class="badge badge-primary badge-pill">S$400</span>
																</li>
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(7)"><span
																	style="margin-top: 0rem;">GST申报</span>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="input-group">
																			<select class="custom-select" id="countapgst"
																				onchange="rungst(1)" style="border: none;">
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
																				<button class="btn">次</button>
																			</div>
																		</div>
																	</div> <span id="priceapgst"
																	class="badge badge-primary badge-pill">S$300</span> <br />
																</li>
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(8)">申请加4次申报配套 <span
																	class="badge badge-primary badge-pill">S$1400</span>
																</li>
															</ul>
														</div></li>

													<li class="list-group-item"><label
														class="custom-switch mt-2 justify-content-between">
															<span class="custom-switch-description nc_subttitle">虚拟电话
														</span> <input type="checkbox" class="custom-switch-input"
															id="openAccount7"
															onclick="openAccountFunction('openAccount7','openAccountDeatil7')">
															<span class="custom-switch-indicator  nc_bttextbtn"></span>
													</label>
														<div class="card-body" id="openAccountDeatil7"
															style="display: none">
															<ul class="list-group">
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(9)"><span
																	style="margin-top: 0rem;">新加坡固定座机无人应答</span>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="input-group">
																			<select class="custom-select" id="countsgtel"
																				onchange="runsgtel(1)" style="border: none;">
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
																				<button class="btn">季度</button>
																			</div>
																		</div>
																	</div> <span id="pricesgtel"
																	class="badge badge-primary badge-pill">S$200</span> <br />
																</li>
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(10)"><span
																	style="margin-top: 0rem;">新加坡固定座机全球呼叫转移（话费另算）</span>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="input-group">
																			<select class="custom-select" id="countglotel"
																				onchange="runglotel(1)" style="border: none;">
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
																				<button class="btn">季度</button>
																			</div>
																		</div>
																	</div> <span id="priceglotel"
																	class="badge badge-primary badge-pill">S$500</span> <br />
																</li>
															</ul>
														</div></li>


													<li class="list-group-item"><label
														class="custom-switch mt-2 justify-content-between">
															<span class="custom-switch-description nc_subttitle">收信转寄服务
														</span> <input type="checkbox" class="custom-switch-input"
															id="openAccount8"
															onclick="openAccountFunction('openAccount8','openAccountDeatil8')">
															<span class="custom-switch-indicator  nc_bttextbtn"></span>
													</label>
														<div class="card-body" id="openAccountDeatil8"
															style="display: none">
															<ul class="list-group">
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(11)"><span
																	style="margin-top: 0rem;">寄信服务1次*12次（邮费倒付）</span>
																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="input-group">
																			<select class="custom-select" id="countmail"
																				onchange="runmail(1)" style="border: none;">
																				<option selected>1</option>
																				<option value="2">2</option>
																				<option value="3">3</option>
																			</select>
																			<div class="input-group-append">
																				<button class="btn">年</button>
																			</div>
																		</div>
																	</div> <span id="pricemail"
																	class="badge badge-primary badge-pill">S$600</span> <br />
																</li>
															</ul>
														</div></li>

													<li class="list-group-item"><label
														class="custom-switch mt-2 justify-content-between">
															<span class="custom-switch-description nc_subttitle">会计记账
														</span> <input type="checkbox" class="custom-switch-input"
															id="openAccount9"
															onclick="openAccountFunction('openAccount9','openAccountDeatil9')">
															<span class="custom-switch-indicator  nc_bttextbtn"></span>
													</label>
														<div class="card-body" id="openAccountDeatil9"
															style="display: none">
															<ul class="list-group">
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(12)">

																	<div class="form-group" style="margin-bottom: 0px;">
																		<div class="input-group">
																			<select class="custom-select" id="countaccounting"
																				onchange="runaccounting(1)" style="border: none;">
																				<option value="300" selected>0-50笔交易</option>
																				<option value="450">50-150笔交易</option>
																				<option value="800">150-300笔交易</option>
																				<option value="1000">300-500笔交易</option>
																				<option value="1500">500-1000笔交易</option>
																			</select>
																		</div>
																	</div> <span id="priceaccounting"
																	class="badge badge-primary badge-pill">S$300</span> <br />
																</li>
															</ul>
														</div></li>

													<li class="list-group-item"><label
														class="custom-switch mt-2 justify-content-between">
															<span class="custom-switch-description nc_subttitle">注册时间
														</span> <input type="checkbox" class="custom-switch-input"
															id="openAccount10"
															onclick="openAccountFunction('openAccount10','openAccountDeatil10')">
															<span class="custom-switch-indicator  nc_bttextbtn"></span>
													</label>
														<div class="card-body" id="openAccountDeatil10"
															style="display: none">
															<ul class="list-group">
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(13)">正常（正常懦况下5个工作日以内） <span
																	class="badge badge-primary badge-pill">S$0</span>
																</li>
																<li
																	class="list-group-item d-flex justify-content-between align-items-center choosedsvr"
																	onclick="choosedsv(14)">加急（加急3个工作日以内） <span
																	class="badge badge-primary badge-pill">S$300</span>
																</li>
															</ul>
														</div></li>

													<!-- <li class="list-group-item">
                                            <label class="custom-switch mt-2">
                                                  <span class="list-group-item d-flex justify-content-between align-items-center">挂名董事
                                                    <span class="badge badge-primary badge-pill">S$1800/年</span>
                                                  </span>
                                                  <input type="checkbox" class="custom-switch-input" id="guamingdongshi"> 
                                                  <span class="custom-switch-indicator"></span>
                                            </label>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="form-group">
                                                  <span class="list-group-item d-flex justify-content-between align-items-center">挂名股东
                                                    <span class="badge badge-primary badge-pill">S$1000/年</span>
                                                  </span>
                                                  <input type="checkbox" class="custom-switch-input" id="guaminggudong"> 
                                                  <span class="custom-switch-indicator"></span>
                                            </div>
                                        </li> 
                                        <li class="list-group-item">
                                            <div class="form-group row">
                                                <label>共享办公室</label>
                                                  <select class="form-control form-control-sm">
                                                    <option>3个月 - 2400 </option>
                                                    <option>6个月 - 4800</option>
                                                    <option>12个月 - 9600</option>
                                                  </select>
                                            </div>
                                        </li>
                                        
                                        <li class="list-group-item"> 
                                            <div class="form-group">
                                                  <div class="list-group-item d-flex justify-content-between align-items-center">商标注册
                                                    <span class="badge badge-primary badge-pill">S$1200/年</span>
                                                  </div>
                                                  <input type="checkbox" class="custom-switch-input"  id="guamingdongshi"> 
                                            </div>
                                        </li>

                                        

                                        <li class="list-group-item">
                                            <div id="dongshidiv"></div>
                                        </li>
                                        
                                        <li class="list-group-item">
                                            <div class="form-group row">
                                                  <label for="inputEmail3" class="col-sm-3 col-form-label">股东</label>
                                                  <div class="col-sm-9"><input type="text" class="form-control" id="gudong" placeholder="股东"></div>
                                            </div>
                                        </li>
                                        <li class="list-group-item">
                                            <div id="gudongdiv"></div>
                                            <div id="content"></div>
                                        </li>

                                        <li class="list-group-item">
                                            <div class="form-group row">
                                                  <label for="inputEmail3" class="col-sm-3 col-form-label">秘书</label>
                                                  <div class="col-sm-9"><input type="text" class="form-control" id="mishu" placeholder="秘书"></div>
                                            </div>
                                        </li>
                                        
                                        <li class="list-group-item">
                                            <div class="form-group row">
                                                  <label for="inputEmail3" class="col-sm-3 col-form-label">联系人</label>
                                                  <div class="col-sm-9"><input type="text" class="form-control" id="lianxiren" placeholder="联系人"></div>
                                            </div>
                                        </li>
                                        
                                        <li class="list-group-item">
                                            <div class="form-group row">
                                                  <label for="inputEmail3" class="col-sm-3 col-form-label">电话/邮箱</label>
                                                  <div class="col-sm-9"><input type="email" class="form-control" id="lianxiren" placeholder="电话/邮箱"></div>
                                            </div>
                                        </li> -->
												</ul>
												<div class="button-row d-flex mt-4">
													<button class="btn btn-primary js-btn-prev" type="button"
														title="Prev">上一步</button>
													<button class="btn btn-primary ml-auto js-btn-next"
														type="button" title="Next">下一步</button>
												</div>
											</div>
										</div>

										<!--single form panel-->
										<div
											class="multisteps-form__panel shadow p-4 rounded bg-white"
											data-animation="scaleIn">
											<h3 class="multisteps-form__title">填报资料</h3>
											<div class="multisteps-form__content">
												<div class="card-body">
													<!-- <div class="alert alert-info"><b>联系方式</b></div> -->
													<div class="section-title">公司资料</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">公司名称</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="companyName"
																placeholder="公司名称">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">公司备用名称</label>
														<div class="col-sm-9">
															<input type="text" class="form-control"
																id="companyBackupName" placeholder="公司备用名称">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">公司类型</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="companyType"
																placeholder="公司类型">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">注册资本</label>
														<div class="col-sm-9">
															<input type="text" class="form-control"
																id="registeredCapital" placeholder="注册资本">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">公司商业活动</label>
														<div class="col-sm-9">
															<textarea class="form-control" id="businessEvent"
																placeholder="公司商业活动"></textarea>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">公司地址及邮编</label>
														<div class="col-sm-9">
															<textarea class="form-control"
																id="conpanyAddressAndPostalCode" placeholder="公司地址及邮编"></textarea>
														</div>
													</div>
													<div class="section-title">董事、股东、联系人资料</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">职位填报类型</label>
														<div class="col-sm-9">
															<select class="custom-select" id="positionType">
																<option selected>请选择</option>
																<option value="董事">董事</option>
																<option value="股东">股东</option>
																<option value="联系人">联系人</option>
															</select>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">全名（护照姓名）*</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="fullName"
																placeholder="全名（护照姓名）">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">国籍*</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="nationality"
																placeholder="国籍">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">性别</label>
														<div class="col-sm-9">
															<select class="custom-select" id="gender">
																<option selected>男</option>
																<option value="1">女</option>
															</select>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">身份证类型</label>
														<div class="col-sm-9">
															<select class="custom-select" id="ICType">
																<option value="公民" selected>NRIC（公民）</option>
																<option value="永久居民">NRIC（永久居民）</option>
																<option value="FIN">FIN</option>
																<option value="护照/其他">护照/其他</option>
															</select>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">证件号码*</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="ICNumber"
																placeholder="证件号码">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">出生国家*</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="birthCountry"
																placeholder="出生国家">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">出生日期*</label>
														<div class="col-sm-9">
															<input type="date" class="form-control" id="dateOfBirth"
																placeholder="出生日期">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">电子邮箱*</label>
														<div class="col-sm-9">
															<input type="email" class="form-control" id="email"
																placeholder="电子邮箱">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">联系电话*</label>
														<div class="col-sm-9">
															<input type="tel" class="form-control"
																id="contractNumber" placeholder="联系电话">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">个人地址及邮编</label>
														<div class="col-sm-9">
															<textarea class="form-control"
																id="personalAddressAndPostalCode" placeholder="个人地址及邮编"></textarea>
														</div>
													</div>
													<div class="form-group row" style="margin-top: 1rem;">
														<label class="col-sm-3 col-form-label">NRIC / ID /
															FIN /护照/其他</label>
														<div class="col-sm-8">
															<input type="file" class="form-control" id="uploadIC1"
																placeholder="资料上传">
														</div>
														<div class="col-sm-1"
															style="margin-top: .5rem; padding-left: 0;">
															<input type="button" value="+" onclick="addFile(1)">
														</div>
													</div>
													<div class="form-group row" id="addfilediv"></div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">住所证明（海外）（3个月内出具）</label>
														<div class="col-sm-8">
															<input type="file" class="form-control"
																id="uploadAddress1" placeholder="资料上传">
														</div>
														<div class="col-sm-1"
															style="margin-top: .5rem; padding-left: 0;">
															<input type="button" value="+" onclick="addFileadd(1)">
														</div>
													</div>
													<div class="form-group row" id="addfiledivadd"></div>
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">持护照(打开有照片页)正面头部照(董事和股东需要)</label>
														<div class="col-sm-8">
															<input type="file" class="form-control"
																id="uploadpassport1" placeholder="资料上传">
														</div>
														<div class="col-sm-1"
															style="margin-top: .5rem; padding-left: 0;">
															<input type="button" value="+" onclick="addFilepimg(1)">
														</div>
													</div>
													<div class="form-group row" id="addfiledivpimg"></div>

													<div class="button-row d-flex mt-4">
														<button class="btn btn-primary js-btn-prev" type="button"
															title="Prev">上一步</button>
														<button class="btn btn-primary ml-auto js-btn-next"
															type="button" title="Next" onclick="listSummary()">下一步</button>
													</div>
												</div>
											</div>
										</div>

										<!--single form panel-->
										<div
											class="multisteps-form__panel shadow p-4 rounded bg-white"
											data-animation="scaleIn">
											<h3 class="multisteps-form__title">在线确认</h3>
											<div class="card-body">

												<div class="section-title">公司资料</div>
												<div class="form-group row">
													<div id="companyinfo_summary"></div>
													<!-- <label  class="col-sm-3 col-form-label">公司名称</label>
                                              <div class="col-sm-9"><input type="text" class="form-control"  placeholder="公司名称"></div> -->
												</div>

												<div class="section-title">董事、股东、联系人资料</div>
												<div class="form-group row">
													<div id="shareholder_summary"></div>
												</div>
											</div>
											<div class="button-row d-flex mt-4">
												<button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
												<button class="btn btn-primary js-btn-prev" type="button" title="SendEmail" onclick="confirmAndSend()">发送确认邮件</button>
												<button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
											</div>
										</div>

										<!--single form panel-->
										<div
											class="multisteps-form__panel shadow p-4 rounded bg-white"
											data-animation="scaleIn">
											<h3 class="multisteps-form__title">在线支付</h3>
											<div class="multisteps-form__content">
												<div class="card-body" id="summary">
													<!--  <ul class="list-group">
                                                <li class="list-group-item d-flex justify-content-between align-items-center"> 新建公司
                                                  <span class="badge badge-primary badge-pill">S$1800</span>
                                                </li>
                                                <li class="list-group-item d-flex justify-content-between align-items-center"> 每年公司的助理服务
                                                  <span class="badge badge-primary badge-pill">S$1000</span>
                                                </li>
                                                <li class="list-group-item d-flex justify-content-between align-items-center"> 半年本地挂名股东服务
                                                  <span class="badge badge-primary badge-pill">S$2200</span>
                                                </li>
                                       </ul> -->
												</div>
											</div>
											<div class="row">
												<div class="button-row d-flex mt-4 col-12">
													<button class="btn btn-primary js-btn-prev" type="button"
														title="Prev">上一步</button>
													<button class="btn btn-primary ml-auto js-btn-next"
														type="submit" title="Send">提交</button>
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
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script src="../../../assets/js/stisla.js"></script>
	<!-- Template JS File -->
	<script src="../../../assets/js/scripts.js"></script>
	<script src="../../../assets/js/custom.js"></script>
	<script src="../../../assets/js/multiplepage.js"></script>
	<!-- Page Specific JS File -->

	<script type="text/javascript">
    function openAccountFunction(x,y) {
          // Get the checkbox
          var checkBox = document.getElementById(x);
          // Get the output text
          var text = document.getElementById(y);
          // If the checkbox is checked, display the output text
          
          if (checkBox.checked == true){
            text.style.display = "block";

            switch (x) {
            case "openAccount":
                z.push(document.getElementById("inputGroupSelect04").value);
                z.push(document.getElementById("countYear").value);
                if (services.some(el => el.name === "新注册新加坡公司开户")){
                    services = services.filter(item => item.name !== "新注册新加坡公司开户")
                }
                services.push({name:"新注册新加坡公司开户",price:300});
                refreshRightSummary();
                z=[];
                break;
            case "openAccount2":
                z.push(document.getElementById("inputGroupSelect04").value);
                z.push(document.getElementById("countYear").value);
                if (services.some(el => el.name === "挂名董事")){
                    services = services.filter(item => item.name !== "挂名董事")
                    services = services.filter(item => item.name !== "押金")
                }
                services.push({name:"挂名董事",price:z[0]*z[1]*1800});
                services.push({name:"押金",price:1500});
                refreshRightSummary();
                z=[];
                break;
            case "openAccount3":
                  z.push(document.getElementById("countGuDong").value);
                  z.push(document.getElementById("countYearGuDong").value);
                  if (services.some(el => el.name === "挂名股东")){
                      services = services.filter(item => item.name !== "挂名股东")
                  }
                  services.push({name:"挂名股东",price:z[0]*z[1]*1000});
                  refreshRightSummary();
                  z=[];
                  break;
            case "openAccount4":
                z.push(document.getElementById("countoffice").value);
                  z.push(document.getElementById("countMoffice").value);
                  if (services.some(el => el.name === "共享办公室")){
                      services = services.filter(item => item.name !== "共享办公室")
                  }
                  services.push({name:"共享办公室",price:z[0]*z[1]*800});
                  refreshRightSummary();
                  z=[];
                  break;
            case "openAccount5":
                  if (services.some(el => el.name === "商标注册")){
                      services = services.filter(item => item.name !== "商标注册")
                  }
                  services.push({name:"商标注册",price:2100});
                  refreshRightSummary();
                  z=[];
                  break;
            case "openAccount6":
                  z.push(document.getElementById("countapgst").value);
                  if (services.some(el => el.name === "GST消费税注册")){
                      services = services.filter(item => item.name !== "GST消费税注册")
                  }
                  services.push({name:"GST消费税注册",price:z[0]*300+1800});
                  refreshRightSummary();
                  z=[];
                  break;
            case "openAccount7":
                  z.push(document.getElementById("countsgtel").value);
                  z.push(document.getElementById("countglotel").value);
                  if (services.some(el => el.name === "虚拟电话")){
                      services = services.filter(item => item.name !== "虚拟电话")
                  }
                  services.push({name:"虚拟电话",price:z[0]*200+z[1]*500});
                  refreshRightSummary();
                  z=[];
                  break;
            case "openAccount8":
                  z.push(document.getElementById("countmail").value);
                  if (services.some(el => el.name === "收信转寄服务")){
                      services = services.filter(item => item.name !== "收信转寄服务")
                  }
                  services.push({name:"收信转寄服务",price:z[0]*600});
                  refreshRightSummary();
                  z=[];
                  break; 
            case "openAccount9":
                  z.push(document.getElementById("countaccounting").value);
                  if (services.some(el => el.name === "会计记账")){
                      services = services.filter(item => item.name !== "会计记账")
                  }
                  services.push({name:"会计记账",price:z[0]});
                  refreshRightSummary();
                  z=[];
                  break;   
            case "openAccount10":
                  if (services.some(el => el.name === "注册时间")){
                      services = services.filter(item => item.name !== "注册时间")
                  }
                  services.push({name:"注册时间",price:300});
                  refreshRightSummary();
                  z=[];
                  break;     
            }
          
          } else {
            text.style.display = "none";
            switch (x) {
            case "openAccount":
                if (services.some(el => el.name === "新注册新加坡公司开户")){
                    services = services.filter(item => item.name !== "新注册新加坡公司开户")
                }
                refreshRightSummary();
                break;
            case "openAccount2":
                if (services.some(el => el.name === "挂名董事")){
                    services = services.filter(item => item.name !== "挂名董事")
                    services = services.filter(item => item.name !== "押金")
                }
                refreshRightSummary();
                break;
            case "openAccount3":
                  if (services.some(el => el.name === "挂名股东")){
                      services = services.filter(item => item.name !== "挂名股东")
                  }
                  refreshRightSummary();
                  break;
            case "openAccount4":
                  if (services.some(el => el.name === "共享办公室")){
                      services = services.filter(item => item.name !== "共享办公室")
                  }
                  refreshRightSummary();
                  break;
            case "openAccount5":
                  if (services.some(el => el.name === "商标注册")){
                      services = services.filter(item => item.name !== "商标注册")
                  }
                  refreshRightSummary();
                  break;
            case "openAccount6":
                  if (services.some(el => el.name === "GST消费税注册")){
                      services = services.filter(item => item.name !== "GST消费税注册")
                  }
                  refreshRightSummary();
                  break;
            case "openAccount7":
                  if (services.some(el => el.name === "虚拟电话")){
                      services = services.filter(item => item.name !== "虚拟电话")
                  }
                  refreshRightSummary();
                  break;
            case "openAccount8":
                  if (services.some(el => el.name === "收信转寄服务")){
                      services = services.filter(item => item.name !== "收信转寄服务")
                  }
                  refreshRightSummary();
                  break; 
            case "openAccount9":
                  if (services.some(el => el.name === "会计记账")){
                      services = services.filter(item => item.name !== "会计记账")
                  }
                  refreshRightSummary();
                  break;   
            case "openAccount10":
                  if (services.some(el => el.name === "注册时间")){
                      services = services.filter(item => item.name !== "注册时间")
                  }
                  refreshRightSummary();
                  break;     
            } 
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
      input.parentNode.parentNode.parentNode.remove();
    }
    function removeDongShi (input) {
      input.parentNode.parentNode.parentNode.remove();
    }

    function listSummary() {
        var companyInfos = [];
        var shareholderInfos = [];
        if (document.getElementById("companyName").value!="") {
            companyInfos.push({name:"公司名称",description:document.getElementById("companyName").value});
        }
        if (document.getElementById("companyBackupName").value!="") {
            companyInfos.push({name:"公司备用名称",description:document.getElementById("companyBackupName").value});
        }
        if (document.getElementById("companyType").value!="") {
            companyInfos.push({name:"公司类型",description:document.getElementById("companyType").value});
        }
        if (document.getElementById("registeredCapital").value!="") {
            companyInfos.push({name:"注册资本",description:document.getElementById("registeredCapital").value});
        }
        if (document.getElementById("businessEvent").value!="") {
            companyInfos.push({name:"公司商业活动",description:document.getElementById("businessEvent").value});
        }
        if (document.getElementById("conpanyAddressAndPostalCode").value!="") {
            companyInfos.push({name:"公司地址及邮编",description:document.getElementById("conpanyAddressAndPostalCode").value});
        }
        if (document.getElementById("positionType").value!="" && document.getElementById("positionType").value!="请选择" ) {
            shareholderInfos.push({name:"职位填报类型",description:document.getElementById("positionType").value});
        }
        if (document.getElementById("fullName").value!="") {
            shareholderInfos.push({name:"全名（护照姓名）",description:document.getElementById("fullName").value});
        }
        if (document.getElementById("nationality").value!="") {
            shareholderInfos.push({name:"国籍",description:document.getElementById("nationality").value});
        }
        if (document.getElementById("gender").value!="") {
            shareholderInfos.push({name:"性别",description:document.getElementById("gender").value});
        }
        if (document.getElementById("ICType").value!="") {
            shareholderInfos.push({name:"身份证类型",description:document.getElementById("ICType").value});
        }
        if (document.getElementById("ICNumber").value!="") {
            shareholderInfos.push({name:"证件号码",description:document.getElementById("ICNumber").value});
        }
        if (document.getElementById("birthCountry").value!="") {
            shareholderInfos.push({name:"出生国家",description:document.getElementById("birthCountry").value});
        }
        if (document.getElementById("dateOfBirth").value!="") {
            shareholderInfos.push({name:"出生日期",description:document.getElementById("dateOfBirth").value});
        }
        if (document.getElementById("email").value!="") {
            shareholderInfos.push({name:"电子邮箱",description:document.getElementById("email").value});
        }
        if (document.getElementById("contractNumber").value!="") {
            shareholderInfos.push({name:"联系电话",description:document.getElementById("contractNumber").value});
        }
        if (document.getElementById("personalAddressAndPostalCode").value!="") {
            shareholderInfos.push({name:"个人地址及邮编",description:document.getElementById("personalAddressAndPostalCode").value});
        }
        if (document.getElementById("uploadIC1").value!="") {
            shareholderInfos.push({name:"NRIC/ID/FIN/护照/其他",description:document.getElementById("uploadIC1").value});
        }
        if (document.getElementById("uploadAddress1").value!="") {
            shareholderInfos.push({name:"住所证明（海外）（3个月内出具）",description:document.getElementById("uploadAddress1").value});
        }
        if (document.getElementById("uploadpassport1").value!="") {
            shareholderInfos.push({name:"持护照(打开有照片页)正面头部照(董事和股东需要)",description:document.getElementById("uploadpassport1").value});
        }

        companytext = "<ul class='list-group'>";
        for (i = 0; i < companyInfos.length; i++) {
            companytext += "<li class='list-group-item d-flex justify-content-between align-items-center'>" + companyInfos[i].name + 
                        "<span style='text-align: right;' class='badge badge-primary badge-pill'>" + companyInfos[i].description  + "</span>" +
                   "</li>";
        }
        companytext += "</ul>";
        document.getElementById("companyinfo_summary").innerHTML = companytext;
        
        shareholdertext = "<ul class='list-group'>";
        for (i = 0; i < shareholderInfos.length; i++) {
            shareholdertext += "<li class='list-group-item d-flex justify-content-between align-items-center'>" + shareholderInfos[i].name + 
                        "<span style='text-align: right;' class='badge badge-primary badge-pill'>" + shareholderInfos[i].description  + "</span>" +
                   "</li>";
        }
        shareholdertext += "</ul>";

        document.getElementById("shareholder_summary").innerHTML = shareholdertext;
    }

    /* function confirmAndSend() {
    	alert("submit and confirm");
    	$.post("/api/newcompany/sendemail",
    	{
        	"This is Test"
    	    //name: "Donald Duck",
    		//city: "Duckburg"
    	},
    	function(data, status){ //Call back function
    		alert("Data: " + data + "\nStatus: " + status);
    	});
    } */
        
    function choosedsv(x) {
        //document.getElementsByClassName("choosedsvr")[x].style.backgroundColor= '#f8fafb';     
        var element = document.getElementsByClassName("choosedsvr")[x];
        element.classList.toggle("choosesv");    
    }
    var z= [];
    function run(x) {
            z.push(document.getElementById("inputGroupSelect04").value);
            z.push(document.getElementById("countYear").value);
            if (z.length == 2){
                document.getElementById("priceDongshi").innerHTML = "S$"+z[0]*z[1]*1800;
                if (services.some(el => el.name === "挂名董事")){
                    services = services.filter(item => item.name !== "挂名董事")
                }
            services.push({name:"挂名董事",price:z[0]*z[1]*1800});
            refreshRightSummary();
            z= [];
        }
    }
    
    function runGuDong(x) {
        z.push(document.getElementById("countGuDong").value);
        z.push(document.getElementById("countYearGuDong").value);
        if (z.length ==2){
            document.getElementById("priceGuDong").innerHTML = "S$"+z[0]*z[1]*1000;
            if (services.some(el => el.name === "挂名股东")){
                services = services.filter(item => item.name !== "挂名股东")
            }
            services.push({name:"挂名股东",price:z[0]*z[1]*1000});
            refreshRightSummary();
            z= [];
        }
    }
    
    function runoffice(x) {
        z.push(document.getElementById("countoffice").value);
        z.push(document.getElementById("countMoffice").value);
        if (z.length ==2){
            document.getElementById("priceoffice").innerHTML = "S$"+z[0]*z[1]*800;
            if (services.some(el => el.name === "共享办公室")){
                services = services.filter(item => item.name !== "共享办公室")
            }
            services.push({name:"共享办公室",price:z[0]*z[1]*800});
            refreshRightSummary();
            z= [];
        }    
    }       

    function rungst(x) {
        z.push(document.getElementById("countapgst").value);
        //z.push(document.getElementById("countMoffice").value);
        if (z.length ==1){
            document.getElementById("priceapgst").innerHTML = "S$"+z[0]*300;
            if (services.some(el => el.name === "GST申报")){
                services = services.filter(item => item.name !== "GST申报")
            }
            services.push({name:"GST申报",price:z[0]*300});
            refreshRightSummary();
            z= [];
        }    
    } 

    function runsgtel(x) {
        z.push(document.getElementById("countsgtel").value);
        if (z.length ==1){
            document.getElementById("pricesgtel").innerHTML = "S$"+z[0]*200;
            if (services.some(el => el.name === "新加坡固定座机无人应答")){
                services = services.filter(item => item.name !== "新加坡固定座机无人应答")
            }
            services.push({name:"新加坡固定座机无人应答",price:z[0]*200});
            refreshRightSummary();
            z= [];
        }    
    } 

      function runglotel(x) {
          z.push(document.getElementById("countglotel").value);
          if (z.length ==1){
              document.getElementById("priceglotel").innerHTML = "S$"+z[0]*500;
              if (services.some(el => el.name === "新加坡固定座机全球呼叫转移")){
                services = services.filter(item => item.name !== "新加坡固定座机全球呼叫转移")
            }
            services.push({name:"新加坡固定座机全球呼叫转移",price:z[0]*500});
            refreshRightSummary();
              z= [];
        }    
    }

    function runmail(x) {
             z.push(document.getElementById("countmail").value);
             if (z.length ==1){
                  document.getElementById("pricemail").innerHTML = "S$"+z[0]*600;
                  if (services.some(el => el.name === "寄信服务")){
                    services = services.filter(item => item.name !== "寄信服务")
                }
                services.push({name:"寄信服务",price:z[0]*500});
                refreshRightSummary();
                  z= [];    
             }    
      }  

      function runaccounting(x) {
          z.push(document.getElementById("countaccounting").value);
          if (z.length ==1){
              document.getElementById("priceaccounting").innerHTML = "S$"+z[0];
              if (services.some(el => el.name === "会计记账")){
                services = services.filter(item => item.name !== "会计记账")
            }
            services.push({name:"会计记账",price:z[0]*500});
            refreshRightSummary();
              z= [];        
         }    
    }  

    function addFile (x) {
        document.querySelector('#addfilediv').insertAdjacentHTML('afterend',
            ` <div class="form-group row"  style="padding-left:15px;">
              <label class="col-sm-3 col-form-label">NRIC / ID / FIN /护照/其他</label>
              <div class="col-sm-8"><input type="file" class="form-control"  placeholder="联系电话"></div>
              <div class="col-sm-1" style="margin-top:.5rem;padding-left:0;"><input type="button" value="-" onclick="removeFile(this)"></div>                  
                 </div>         
            </li>`      
        )
    }         
    function removeFile (input) {
        input.parentNode.parentNode.remove()
    }

      function addFileadd (x) {
          document.querySelector('#addfiledivadd').insertAdjacentHTML('afterend',
            ` <div class="form-group row"  style="padding-left:15px;">
              <label class="col-sm-3 col-form-label">住所证明（海外）（3个月内出具）</label>
              <div class="col-sm-8"><input type="file" class="form-control"  placeholder="联系电话"></div>
              <div class="col-sm-1" style="margin-top:.5rem;padding-left:0;"><input type="button" value="-" onclick="removeFileadd(this)"></div>                  
                 </div>         
            </li>`      
          )
      }         
      function removeFileadd (input) {
          input.parentNode.parentNode.remove()
      }

      function addFilepimg (x) {
          document.querySelector('#addfiledivpimg').insertAdjacentHTML('afterend',
            ` <div class="form-group row"  style="padding-left:15px;">
              <label class="col-sm-3 col-form-label">持护照(打开有照片页)正面头部照(董事和股东需要)</label>
              <div class="col-sm-8"><input type="file" class="form-control"  placeholder="联系电话"></div>
              <div class="col-sm-1" style="margin-top:.5rem;padding-left:0;"><input type="button" value="-" onclick="removeFilepimg(this)"></div>                  
                 </div>         
            </li>`      
          )
      }         
      function removeFilepimg (input) {
          input.parentNode.parentNode.remove()
      }
</script>
   
</body>
</html>