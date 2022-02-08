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
		<link rel="stylesheet" href="../../../assets/css/intlTel/countrySelect.css">
		<link rel="stylesheet" href="../../../assets/css/intlTel/intlTelInput.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
		
		<link rel="stylesheet" type="text/css" href="../../../assets/css/fileupload.css" >
	</head>

	<body>
		<jsp:include page="../userMenu.jsp" />
		<!-- Main Content -->
		<div class="main-content" id="newcompany">
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
											<button class="multisteps-form__progress-btn js-active" type="button" title="选择服务">选择服务</button>
											<button class="multisteps-form__progress-btn" type="button" title="信息填报">信息填报</button>
											<button class="multisteps-form__progress-btn" type="button" title="在线支付">在线支付</button>
											<button class="multisteps-form__progress-btn" type="button" title="电子签名" onclick="top.location='/onlineSignature'">电子签名</button>
											<button class="multisteps-form__progress-btn" type="button" title="上传资料"  onclick="top.location='/uploadPage'">上传资料</button>
											<button class="multisteps-form__progress-btn disable-button" type="button" title="注册受理中">注册受理中</button>
											<button class="multisteps-form__progress-btn disable-button" type="button" title="注册完成、查看文件">注册完成</button>																					
										</div>
									</div> 

						            <div class="col-12 col-md-12 col-lg-12" id="readyContent">
						                <div class="card">
						                	<div class="card-body">
						                    	<div id="accordion">
						                      		<div class="accordion">
								                        <div class="accordion-header collapsible1" role="button" data-toggle="collapse" data-target="#panel-body-1" aria-expanded="true">
								                         	<h4>准备提示</h4>
								                        </div>
								                        <div class="accordion-body collapse show" id="panel-body-1" data-parent="#accordion">
								                        	<p class="mb-0">此申请步骤约需20分钟；申请前请准备好以下资料，以方便更快填报信息。<br/>
																			1、新加坡公民或PR，需准备IC；<br/>
																			2、中国公民，需准备护照、中国身份证；<br/>
																			3、其它国家公民，需准备护照、住所证明。<br/>
																			备注：请确保所填内容是英文形式。
															</p>
								                        </div>
						                      		</div>
						                    	</div>
						                 	 </div>
						                </div>
						            </div>

									<!-- signature part -->									
						            <div class="col-12 col-md-12 col-lg-12" id="signatureContent" style="display:none;">
						                <div class="card">
						                	<div class="card-body">
									          <div class="section-body">
									            <h2 class="section-title">“在线签名”步骤</h2>
									            <p class="section-lead">
									                                  请点击<a href="/onlineSignature"> "此处" </a>完成 "在线签名" 步骤。
									            </p> </div>
						                 	 </div>
						                </div>
						            </div>	

									<!-- signature part -->									
						            <div class="col-12 col-md-12 col-lg-12" id="uploadInfo" style="display:none;">
						                <div class="card">
						                	<div class="card-body">
									          <div class="section-body">
									            <h2 class="section-title">“上传资料”步骤</h2>
									            <p class="section-lead">
									             1、新加坡公民或PR，需准备IC；<br/>
												 2、中国公民，需准备护照、中国身份证；<br/>
												 3、其它国家公民，需准备护照、住所证明。<br/>
									            </p> </div>
						                 	 </div>
						                </div>
						            </div>	



									<!-- Left side -->
									<div class="col-lg-8 col-md-12 col-12 col-sm-12 leftside newCompany multisteps-form__form">
											<!--single form panel-->
											<div class="multisteps-form__panel shadow p-4 rounded bg-white ad js-active" data-animation="scaleIn" id="companytype">
												<form class="newCompany multisteps-form__form" action="/view/registerNewCompany" 
										method="post" enctype="multipart/form-data" id="newcompanyForm">
												<h3 class="multisteps-form__title">选择服务</h3>
												<div class="multisteps-form__content">
													<div class="section-title">新注册公司类型</div>
													<fieldset id="company_type">
														<div class="custom-control custom-radio">
															<input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" value="private" checked="checked"/> 
															<label class="custom-control-label" for="customRadio1"> 私人豁免有限公司Exempt Private Limited Company (PTE LTD)</label>
														</div>
														<div class="custom-control custom-radio ">
															<input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" value="public"  disabled />
															<label class="custom-control-label" for="customRadio2">公众有限责任公司(Ltd.)(如需选择此类型，请联系我们的服务顾问。)</label>
														</div>
													</fieldset>
													<div class="section-title">可选服务</div>
													<ul class="list-group list-group-flush scroll">
														<li class="list-group-item">
															<label>
																<div class="row">
																	<div class="col-lg-10 col-md-10 col-sm-10 col-10">
																		<span class="custom-switch-description nc_subttitle">新注册新加坡公司开户</span>
																	</div>
																	<div class="col-lg-2 col-md-2 col-sm-2 col-2 btntop">
																		<input type="checkbox" class="custom-switch-input" id="openAccount" onclick="openAccountFunction('openAccount','openAccountDeatil')">
																		<span class="custom-switch-indicator  nc_bttextbtn"></span>
																	</div>
																</div>
														   </label>
															<div class="card-body" id="openAccountDeatil" style="display: none">
																<ul class="list-group">
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(0)">1个户口 
																		<span class="badge badge-primary badge-pill">S$300</span>
																	</li>
																</ul>
															</div>
														</li>
														<li class="list-group-item">
															<label>
																<div class="row">
																	<div class="col-lg-10 col-md-10 col-sm-10 col-10">
																		<span class="custom-switch-description nc_subttitle">挂名董事</span>
																	</div>
																	<div class="col-lg-2 col-md-2 col-sm-2 col-2 btntop">
																		<input type="checkbox" class="custom-switch-input" id="openAccount2" onclick="openAccountFunction('openAccount2','openAccountDeatil2')">
																		<span class="custom-switch-indicator  nc_bttextbtn"></span>
																	</div>
																</div>
															</label>
															<div class="card-body" id="openAccountDeatil2" style="display: none">
																<ul class="list-group">
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(1)">1年
																		<span id="priceDongshi" class="badge badge-primary badge-pill dontshileft">S$2000</span>
																	</li>																
																</ul>
															</div>
														</li>
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
															<div class="card-body" id="openAccountDeatil6" style="display: none">
																<ul class="list-group">
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(2)">
																		一次性注册 
																		<span class="badge badge-primary badge-pill">S$400</span>
																	</li>
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(3)">
																		申请加4次申报配套 
																		<span class="badge badge-primary badge-pill">S$1200</span>
																	</li>
																</ul>
															</div>
														</li>
														<li class="list-group-item">
															<label>
																<div class="row">
																	<div class="col-lg-10 col-md-10 col-sm-10 col-10">
																		<span class="custom-switch-description nc_subttitle">虚拟电话</span>
																	</div>
																	<div class="col-lg-2 col-md-2 col-sm-2 col-2 btntop">
																		<input type="checkbox" class="custom-switch-input" id="openAccount7" onclick="openAccountFunction('openAccount7','openAccountDeatil7')">
																		<span class="custom-switch-indicator  nc_bttextbtn"></span>
																	</div>
																</div>
															</label>
															<div class="card-body" id="openAccountDeatil7" style="display: none">
																<ul class="list-group">
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(4)">
																		<span style="margin-top: 0rem;">新加坡固定座机无人应答</span>
																		<div class="form-group" style="margin-bottom: 0px;">
																			<div class="input-group">
																				<select class="custom-select" id="countsgtel" onchange="runsgtel(1)" style="border: none;">
																					<option value="1" selected>1</option>
																					<option value="2">2</option>
																					<option value="3">3</option>
																					<option value="4">4</option>
																				</select>
																				<div class="input-group-append">
																					<button class="btn" disabled="disabled">季度</button>
																				</div>
																			</div>
																		</div> <span id="pricesgtel" class="badge badge-primary badge-pill telleft">S$200</span>
																		<br />
																	</li>
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(5)">
																		<span style="margin-top: 0rem;">新加坡固定座机全球呼叫转移（话费另算）</span>
																		<div class="form-group" style="margin-bottom: 0px;">
																			<div class="input-group">
																				<select class="custom-select" id="countglotel" onchange="runglotel(1)" style="border: none;">
																					<option selected>1</option>
																					<option value="2">2</option>
																					<option value="3">3</option>
																					<option value="4">4</option>
																				</select>
																				<div class="input-group-append">
																					<button class="btn" disabled="disabled">季度</button>
																				</div>
																			</div>
																		</div> 
																		<span id="priceglotel" class="badge badge-primary badge-pill telleft2">S$500</span>
																		<br />
																	</li>
																</ul>
															</div>
														</li>
														<li class="list-group-item">
															<label>
																<div class="row">
																	<div class="col-lg-10 col-md-10 col-sm-10 col-10">
																		<span class="custom-switch-description nc_subttitle">收信转寄服务</span>
																	</div>
																	<div class="col-lg-2 col-md-2 col-sm-2 col-2 btntop">
																		<input type="checkbox" class="custom-switch-input" id="openAccount8" onclick="openAccountFunction('openAccount8','openAccountDeatil8')">
																		<span class="custom-switch-indicator  nc_bttextbtn"></span>
																	</div>
																</div>
															</label>
															<div class="card-body" id="openAccountDeatil8" style="display: none">
																<ul class="list-group">
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(6)">
																		<span style="margin-top: 0rem;">寄信服务12次（邮费倒付）</span>
																		<div class="form-group" style="margin-bottom: 0px;">
																			<div class="input-group">
																				<select class="custom-select" id="countmail" onchange="runmail(1)" style="border: none;">
																					<option value="1" selected>1</option>
																					<option value="2">2</option>
																					<option value="3">3</option>
																				</select>
																				<div class="input-group-append">
																					<button class="btn" disabled="disabled">年</button>
																				</div>
																			</div>
																		</div> 
																		<span id="pricemail" class="badge badge-primary badge-pill emailleft">S$600</span>
																		<br />
																	</li>
																</ul>
															</div>
														</li>
														<li class="list-group-item">
															<label>
																<div class="row">
																	<div class="col-lg-10 col-md-10 col-sm-10 col-10">
																		<span class="custom-switch-description nc_subttitle">会计记账</span>
																	</div>
																	<div class="col-lg-2 col-md-2 col-sm-2 col-2 btntop">
																		<input type="checkbox" class="custom-switch-input" id="openAccount9" onclick="openAccountFunction('openAccount9','openAccountDeatil9')">
																		<span class="custom-switch-indicator  nc_bttextbtn"></span>
																	</div>
																</div>
															</label>
															<div class="card-body" id="openAccountDeatil9"
																style="display: none">
																<ul class="list-group">
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(7)">
																		<div class="form-group" style="margin-bottom: 0px;">
																			<div class="input-group">
																				<select class="custom-select c-select-v2" id="countaccounting" onchange="runaccounting(1)" style="border: none;">
																					<option value="300" selected>0-50笔交易</option>
																					<option value="450">50-150笔交易</option>
																					<option value="800">150-300笔交易</option>
																					<option value="1000">300-500笔交易</option>
																					<option value="1500">500-1000笔交易</option>
																				</select>
																			</div>
																		</div> 
																		<span id="priceaccounting" class="badge badge-primary badge-pill accleft">S$300</span>
																		<br />
																	</li>
																</ul>
															</div>
														</li>
														<li class="list-group-item">
															<label>
																<div class="row">
																	<div class="col-lg-10 col-md-10 col-sm-10 col-10">
																		<span class="custom-switch-description nc_subttitle">注册加急</span>
																	</div>
																	<div class="col-lg-2 col-md-2 col-sm-2 col-2 btntop">
																		<input type="checkbox" class="custom-switch-input" id="openAccount10" onclick="openAccountFunction('openAccount10','openAccountDeatil10')">
																		<span class="custom-switch-indicator  nc_bttextbtn"></span>
																	</div>
																</div>
														    </label>
															<div class="card-body" id="openAccountDeatil10" style="display: none">
																<ul class="list-group">
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(8)">正常（正常情况下5个工作日以内） 
																		<span class="badge badge-primary badge-pill">S$0</span>
																	</li>
																	<li class="list-group-item d-flex justify-content-between align-items-center choosedsvr" onclick="choosedsv(9)">加急（加急3个工作日以内） 
																		<span class="badge badge-primary badge-pill">S$300</span>
																	</li>
																</ul>
															</div>
														</li>
													</ul>

													<div class="button-row d-flex mt-4">
														<button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
													</div>
												</div>
												</form>
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
																<input type="text" class="form-control" id="companyName"
																	placeholder="限英文，填写示范：ABC TRADE"  onkeyup="value=value.replace(/[^\w\.\s\/]/ig,'')">
															</div>
														</div>
														<div class="form-group row">
															<label class="col-sm-3 col-form-label">公司备用名称</label>
															<div class="col-sm-9">
																<input type="text" class="form-control"
																	id="companyBackupName" placeholder="限英文，填写示范：EFD TRADE" onkeyup="value=value.replace(/[^\w\.\s\/]/ig,'')">
															</div>
														</div>
														<div class="form-group row">
															<label class="col-sm-3 col-form-label">公司类型</label>
															<div class="col-sm-9">
																<select class="custom-select c-select-info appinfo " disabled="disabled"
																	id="companyType">
																	<option selected>私人有限公司 (PTE. LTD.)</option>
																	<option value="1">公众有限责任公司(Ltd.)</option>
																</select>
															</div>
														</div>
														<div class="form-group row" style="display:none;">
															<label class="col-sm-3 col-form-label">发行股份资本（总）</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" disabled="disabled" id="registeredCapital1" placeholder="自动计算">
															</div>
														</div>
														<div class="form-group row" style="display:none;">
															<label class="col-sm-3 col-form-label">实缴股份资本（总）</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" disabled="disabled" id="registeredCapital2" placeholder="自动计算">
															</div>
														</div>
														<div class="form-group row">
															<label class="col-sm-3 col-form-label">公司商业活动1</label>
															<div class="col-sm-9" style="width:300px;">
																<input type="text" class="form-control" id="businessEvent1" placeholder="请输入英文关键词进行搜索" ></input>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-sm-3 col-form-label">公司商业活动2</label>
															<div class="col-sm-9" style="width:300px;">
																<input type="text" class="form-control" id="businessEvent2" placeholder="请输入英文关键词进行搜索" ></input>
															</div>
														</div>													
														<div class="form-group row">
														<label class="col-sm-3 col-form-label">公司地址及邮编</label>
														<div class="col-sm-9">
															<textarea class="form-control textareaheight"
																id="conpanyAddressAndPostalCode" placeholder="默认为我司提供的商业地址，如需修改，请参照以下格式填写：111 North Bridge Rd, Peninsula Plaza #29-06A, Singapore 179098"  onkeyup="value=value.replace(/[^\w\.\s\#\,\-\'\\\&\*\·\/]/ig,'')"></textarea>
														</div>
													</div>
													    <div  id="nomineeDirector" style="display:none;">
															<div class="section-title">挂名董事资料</div>				
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">挂名董事姓名</label>
																<div class="col-sm-9">
																	<input type="text" disabled="disabled" class="form-control"  value="挂名董事（由Rsin提供）" >
																</div>
															</div>
														</div>																										
														<div class="section-title">董事、股东、联系人资料</div>
														<div class="infoPart scroll">		
															<!--  <div class="form-group row"  id="nomineeDirector" style="display:none;">
																<label class="col-sm-3 col-form-label">姓名</label>
																<div class="col-sm-9">
																	<input type="text" disabled="disabled" class="form-control"  value="持名董事（由公司提供）" >
																</div>
															</div>	-->																																																																				
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">职位类型（可多选）</label>
																<div class="col-sm-9">
																	<div class="form-group">
																		<div class="form-check form-check-inline">
																			<input class="form-check-input" type="checkbox" id="checkb_dongshi0"> 
																			<label style="height: auto;" class="form-check-label">董事</label>
																		</div>
																		<div class="form-check form-check-inline">
																			<input class="form-check-input" type="checkbox" id="checkb_gudong0" onclick="addMoreQ(0)">
																			<label style="height: auto;" class="form-check-label">股东</label>
																		</div>
																		<div class="form-check form-check-inline">
																			<input class="form-check-input" type="checkbox" id="checkb_contactpeople0"> 
																			<label style="height: auto;" class="form-check-label">联系人</label>
																		</div>
																	</div>
		
																</div>
															</div>
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">全名(护照姓名)</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="fullName0" placeholder="限英文"  onkeyup="value=value.replace(/[^\w\.\s\#\,\-\'\\\&\*\·\/]/ig,'')">
																</div>
															</div>	
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">性别</label>
																<div class="col-sm-9">
																	<select class="custom-select c-select-info  appinfo" id="gender0">
																		<option value="男" selected>男</option>
																		<option value="女">女</option>
																	</select>
																</div>
															</div>
										                    <div class="form-group row">
										                      <label class="col-sm-3 col-form-label">国籍</label>
																<div class="form-item  col-sm-9">
																	<input id="country0" class="form-control" type="text"/>
																	<label for="country0" style="display:none;">Select a country here...</label>
																</div>
										                    </div>
	
															<div class="form-group row">
						 										<label class="col-sm-3 col-form-label">证件类型</label>
																<div class="col-sm-9">
																	<select class="custom-select c-select-info  appinfo" id="ICType0">
																		<option value="公民" selected>新加坡公民(NRIC)</option>
																		<option value="永久居民">新加坡PR(NRIC)</option>
																		<option value="其他">国际护照</option>
																	</select>
																</div>
															</div>
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">证件号码</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="ICNumber0" placeholder="证件号码">
																</div>
															</div>
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">电子邮箱</label>
																<div class="col-sm-9">
																	<input type="email" class="form-control" id="email0" placeholder="电子邮箱"  onkeyup="value=value.replace(/[^\w\.\s\#\,\-\'\\\&\*\·\@\/]/ig,'')">
																</div>
															</div>
															<div class="form-group row">
											                   	 <label for="phone0" class="col-sm-3 col-form-label">联系电话</label><br/>
											                   	 <div class="col-sm-9">
											                   	    <input style="padding-left:3rem;" id="phone0" type="text" class="form-control telinput" placeholder="联系电话"/>
											                   	 </div>
											                </div>
															<div style="display: none;" id="addmoreqtext0">
																<div class="form-group row">
																	<label class="col-sm-3 col-form-label">发行股份数量</label>
																	<div class="col-sm-9">
																		<input type="tel" class="form-control" id="calcNumberofSharesIssued0" placeholder="建议10000-50000股"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
																	</div>
																</div>
																<div class="form-group row">
																	<label class="col-sm-3 col-form-label">实缴股份数量</label>
																	<div class="col-sm-9">
																		<input type="tel" class="form-control" id="calcNumberofPaid-inShares0" placeholder="建议与发行股份一致"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
																	</div>
																</div>
																<div class="form-group row">
																	<label class="col-sm-3 col-form-label">每股价值S$</label>
																	<div class="col-sm-9">
																		<input type="tel" class="form-control" id="calcPerShare0" placeholder="每股价值" value="1"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
																	</div>
																</div>
															</div>
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">个人地址及邮编</label>
																<div class="col-sm-9">
																	<textarea class="form-control textareaheight"
																		id="personalAddressAndPostalCode0" placeholder="限英文，填写示范：111 North Bridge Rd, Peninsula Plaza #29-06A, Singapore 179098"  onkeyup="value=value.replace(/[^\w\.\s\#\,\-\'\\\&\*\·\/]/ig,'')"></textarea>
																</div>
														    </div>						
															<br /> <br />
															
															<div class="form-group row" id="addContactPDiv0"></div>											
															<div class="row addInfoBtn">
																<a class="btn btn-icon icon-left btn-warning" onclick="addContactP()">
																	<i class="far fa-user"></i>增加填报人员
																</a>
															</div>																																											
														</div>	
														<div class="button-row d-flex mt-4">
															<button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
															<button class="btn btn-primary saveBtn" type="button" title="save" onclick="saveToBackend()">保存所填信息</button>
															<%-- <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next" onclick="listSummary()" id="step2next">下一步</button> --%>
															<button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next" onclick="showServiceTable()" id="step2next">下一步</button>
														</div>
													</div>
												</div>
											</div>
											
											<!--single form panel-->
											<div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn"> 
												<h3 class="multisteps-form__title">在线支付</h3>
												<div class="multisteps-form__content">
													<div class="card-body" id="summary">													
														<div class="">
													        <section class="section">
													          <div class="section-body">
													            <div class="invoice">
													              <div class="invoice-print">
													                <div class="row mt-12">
													                  <div class="col-md-12">
													                    <div class="section-title">订单详情</div>
													                    <p class="section-lead">这里的服务不能删除，需要重新选择服务，请点击上一步进行修改</p>

													                    <div class="table-responsive" id="companyinfo_summary">

													                    </div>
													                    <div class="row mt-4">
													                      <div class="col-lg-8">
													                        <div class="section-title">Payment Method</div>
													                        <p class="section-lead">The payment method that we provide is to make it easier for you to pay invoices.</p>
													                        <div class="d-flex">
													                          <div class="mr-2 bg-visa" data-width="61" data-height="38"></div>
													                          <div class="mr-2 bg-jcb" data-width="61" data-height="38"></div>
													                          <div class="mr-2 bg-mastercard" data-width="61" data-height="38"></div>
													                          <div class="bg-paypal" data-width="61" data-height="38"></div>
													                        </div>
													                      </div>
													                      <div class="col-lg-4 text-right">
													                        <div class="invoice-detail-item">
													                          <div class="invoice-detail-name">Subtotal</div>
													                          <div class="invoice-detail-value" id="subtotal">$0</div>
													                        </div>
													                        <div class="invoice-detail-item">
													                          <div class="invoice-detail-name">Shipping</div>
													                          <div class="invoice-detail-value" id="shipping">$0</div>
													                        </div>
													                        <hr class="mt-2 mb-2">
													                        <div class="invoice-detail-item">
													                          <div class="invoice-detail-name">Total</div>
													                          <div class="invoice-detail-value invoice-detail-value-lg" id="total">$0</div>
													                        </div>
													                      </div>
													                    </div>
													                  </div>
													                </div>
													              </div>
													              <hr>
													            </div>
													          </div>
													        </section>
													      </div>								
													
													</div>
												</div>
												<div class="row">
													<div class="button-row d-flex mt-4 col-12">
														<button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
														<form action="/create-checkout-session" method="POST">
														    <input type="hidden" id="paymentamount" name="paymentamount">
													        <button class="btn btn-primary ml-auto js-btn-next" type="submit" title="Send" id="checkout-button">确定付款</button>
													    </form>
													</div>
												</div>
											</div>
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
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.0-rc.2/jquery-ui.js"></script>
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
	    <script src="../../../assets/js/newcompany.js"></script>
	    <script src="../../../assets/js/fileupload.js"></script>  
        <script src="../../../assets/js/intlTel/countrySelect.js"></script>
        <script src="../../../assets/js/intlTel/intlTelInput.js"></script>
        <script src="https://js.stripe.com/v3/"></script>
        <script>
        var input = document.querySelector("#phone0");
	  	  window.intlTelInput(input, {
	  	    // any initialisation options go here
	  	});
        $("#country0").countrySelect({
    		preferredCountries: ['sg', 'cn', 'my']
    	});
        </script>
	</body>
</html>