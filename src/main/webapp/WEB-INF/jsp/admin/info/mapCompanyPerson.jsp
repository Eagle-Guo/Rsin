<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<meta name="description" content="">
<meta name="author" content="">
<title>睿信集团 &mdash; 睿信集团</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />

<!-- Template CSS -->
<link rel="stylesheet" href="../../../../assets/css/style.css">
<link rel="stylesheet" href="../../../../assets/css/components.css">
<link rel="stylesheet" href="../../../../assets/css/multiplepage.css">
<link rel="stylesheet" href="../../../../assets/css/jquery-ui.css">
<link rel="stylesheet" href="../../../../assets/css/rsin.css">
</head>

<body>
	<jsp:include page="../../userMenu.jsp" />
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
											<button class="btn btn-primary">
												<i class="fas fa-search"></i>
											</button>
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
												<div class="accordion-body" id="panel-body-1" data-parent="#accordion">
													<div class="card">
														<div class="card-body">
															<form id="companyDetailForm">
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
																			<td><input type="text" class="form-control form-control-sm" name="txt_uen" readonly value="${company.uen }"></td>
																		</tr>
																		<tr>
																			<th scope="row">公司名称</th>
																			<td><input type="text" class="form-control form-control-sm" name="txt_name" readonly value="${company.name }"></td>
																		</tr>
																		<tr>
																			<th scope="row">公司类型</th>
																			<td><input type="text" class="form-control form-control-sm" name="txt_type" readonly value="${company.type }"></td>
																		</tr>
																		<tr>
																			<th scope="row">商业 活动1</th>
																			<td><input type="text" class="form-control form-control-sm" name="txt_activity1" readonly value="${company.activityOne }"></td>
																		</tr>
																		<tr>
																			<th scope="row">商业 活动2</th>
																			<td><input type="text" class="form-control form-control-sm" name="txt_activity2" readonly value="${company.activityTwo }"></td>
																		</tr>
																		<tr>
																			<th scope="row">挂名董事</th>
																			<td><input type="text" class="form-control form-control-sm" name="txt_nominated" 
																			    <c:if test="${company.lockFlag }">disabled</c:if> value="${company.nominatedDirector }"></td>
																		</tr>
																		<tr>
																			<th scope="row">秘书</th>
																			<td><input type="text" class="form-control form-control-sm" name="txt_secretary" 
																				<c:if test="${company.lockFlag }">disabled</c:if> value="${company.secretary }"></td>
																		</tr>
																		
																		<tr>
																			<th scope="row">原董事</th>
																			<td><input type="text" class="form-control form-control-sm" readonly value="${oldDirector}"></td>
																		</tr>
																		<tr>
																			<th scope="row">原股东</th>
																			<td><input type="text" class="form-control form-control-sm" readonly value="${oldShareholder}">/td>
																		</tr>
																		<tr>
																			<th scope="row">原联系人</th>
																			<td><input type="text" class="form-control form-control-sm" readonly value="${oldContactPerson}"></td>
																		</tr>
																		<tr>
																			<th scope="row"></th>
																			<td>
																				<select class="select-control" id="select_name">
																					<c:forEach items="${allPersons}" var="personInfo" varStatus="per_count">
																						<option value="${personInfo.id}_${personInfo.name}">${personInfo.name} - (${personInfo.email})</option>
																					</c:forEach>
																				</select>
																				<select class="select-control" id="select_type">
																					<option value="董事">董事</option>
																					<option value="股东">股东</option>
																					<option value="联系人">联系人</option>
																				</select>
																				<a class="btn btn-icon icon-left btn-warning" onclick="addName()"><i class="far fa-user"></i>增加</a>
																			</td>
																		</tr>
																		<tr>
																			<th scope="row">董事</th>
																			<td id="director_name"></td>
																		</tr>
																		<tr>
																			<th scope="row">股东</th>
																			<td id="shareholder_name"></td>
																		</tr>
																		<tr>
																			<th scope="row">联系人</th>
																			<td id="contact_name"></td>
																		</tr>
																		<tr>
																			<th scope="row">注册资本</th>
																			<td><input type="text" class="form-control form-control-sm" name="txt_totalStock" readonly value="${company.totalStockCapital }"></td>
																		</tr>
																		<tr>
																			<th scope="row">实缴资本</th>
																			<td><input type="text" class="form-control form-control-sm" name="txt_actualStock" readonly value="${company.actualStockCapital }"></td>
																		</tr>
																		<tr>
																			<th scope="row">注册时间</th>
																			<td><input type="text" class="form-control form-control-sm" name="txt_registrationDate" readonly 
																			     value="<fmt:formatDate pattern = 'dd/MM/yyyy' value='${company.registrationDate}' />"></td>
																		</tr>
																	</tbody>
																</table>
															</form>
															<div class="row">
																<div class="col-12 col-md-4 col-lg-4"></div>
																<div class="col-12 col-md-4 col-lg-4"></div>
																<div class="col-12 col-md-4 col-lg-4">
																    <div class="form-check"><button type="button" onclick="confirmCompanyInfo()">确认修改</button></div>																	
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
	 <jsp:include page="../../footer.jsp" />  

	<!-- General JS Scripts -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script src="../assets/js/stisla.js"></script>

	<!-- Template JS File -->
	<script src="../../../assets/js/scripts.js"></script>
	<script src="../../../assets/js/custom.js"></script>
	<!-- Page Specific JS File -->
	<script src="../../../../assets/js/admin/mapCompanyPerson.js"></script>
</body>
</html>