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
  <title>新建公司  &mdash;  睿信集团</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  
  <!-- CSS Libraries 
  <link rel="stylesheet" href="../node_modules/bootstrap-social/bootstrap-social.css"> -->

  <!-- Template CSS -->
  <link rel="stylesheet" href="../../../assets/css/style.css">
  <link rel="stylesheet" href="../../../assets/css/components.css">
  <link rel="stylesheet" href="../../../assets/css/multiplepage.css">
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
              <button class="multisteps-form__progress-btn js-active" type="button" title="instruction">概述</button>
              <button class="multisteps-form__progress-btn" type="button" title="services">选择服务</button>
              <button class="multisteps-form__progress-btn" type="button" title="fee">服务费用</button>
              <button class="multisteps-form__progress-btn" type="button" title="processtime">处理时间</button>
              <button class="multisteps-form__progress-btn" type="button" title="contact">联系方式</button>
              <button class="multisteps-form__progress-btn" type="button" title="structure">公司架构</button>
              <button class="multisteps-form__progress-btn" type="button" title="summary">总结</button>
            </div>
          </div>
        </div>
        <!--form panels-->
        <div class="row">
          <div class="col-12 col-lg-8 m-auto">
            <form class="multisteps-form__form" action="/view/registerNewCompany" method="post">
              <!--single form panel-->
              <div class="multisteps-form__panel shadow p-4 rounded bg-white js-active" data-animation="scaleIn">
                <h3 class="multisteps-form__title">概述</h3>
                <div class="multisteps-form__content">
                  
                  <div class="card-body">
                    <div class="list-group">
                      <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
                        <div class="d-flex w-100 justify-content-between">
                          <h5 class="mb-1">第一</h5>
                        </div>
                        <p class="mb-1">你提交的资料，我们会根据PDPA条款进行保存和使用</p>
                      </a>
                      <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between">
                          <h5 class="mb-1">第二</h5>
                          <!-- <small class="text-muted">3 days ago</small> -->
                        </div>
                        <p class="mb-1">请检查并确认你的公司是否正确，当你确认完毕请点击提交按钮</p>
                      </a>
                    </div>
                  </div>
                  
                  <div class="button-row d-flex mt-4">
                    <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
                  </div>
                </div>
              </div>
              
              <!--single form panel-->
              <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                <h3 class="multisteps-form__title">选择服务</h3>
                <div class="multisteps-form__content">
                	<div class="control-label">请从以下选择你需要的服务</div>
                	<ul class="list-group list-group-flush">
	                  	<li class="list-group-item">
		                  	<label class="custom-switch mt-2">
		                        <span class="custom-switch-description">新建新公司</span>
                        		<input type="checkbox" name="newCompany" class="custom-switch-input"  disabled>
		                        <span class="custom-switch-indicator"></span>
		                    </label>
	                    </li>
	                    <li class="list-group-item">
		                    <label class="custom-switch mt-2">
		                        <span class="custom-switch-description">每年公司的助理服务</span>
		                        <input type="checkbox" name="assistService" class="custom-switch-input">
		                        <span class="custom-switch-indicator"></span>
		                    </label>
		                </li>
		                <li class="list-group-item">
		                    <label class="custom-switch mt-2">
		                        <span class="custom-switch-description">每年注册地址服务</span>
		                        <input type="checkbox" name="addressService" class="custom-switch-input">
		                        <span class="custom-switch-indicator"></span>
		                    </label>
		                </li>
		                <li class="list-group-item">
		                    <label class="custom-switch mt-2">
		                        <span class="custom-switch-description">每年本地挂名股东服务</span>
		                        <input type="checkbox" name="annualStockholderService" class="custom-switch-input">
		                        <span class="custom-switch-indicator"></span>
		                    </label>
                    	</li>
	                    <li class="list-group-item">
		                   <label class="custom-switch mt-2">
		                        <span class="custom-switch-description">半年本地挂名股东服务</span>
		                        <input type="checkbox" name="halfyearStockholderService" class="custom-switch-input">
		                        <span class="custom-switch-indicator"></span>
		                    </label>
		                </li>
	            	</ul>
                    <div class="control-label">移民服务</div>
                    <ul class="list-group list-group-flush">
	                    <li class="list-group-item">
		                    <label class="custom-switch mt-2">
		                        <span class="custom-switch-description">工作准证申请</span>
		                        <input type="checkbox" name="applyWorkPromit" class="custom-switch-input">
		                        <span class="custom-switch-indicator"></span>
		                    </label>
	                    </li>
	                    <li class="list-group-item">
		                    <label class="custom-switch mt-2">
		                        <span class="custom-switch-description">家属准证申请</span>
		                        <input type="checkbox" name="applyDependentPromit" class="custom-switch-input">
		                        <span class="custom-switch-indicator"></span>
		                    </label>
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
                <h3 class="multisteps-form__title">服务费用</h3>
                <div class="multisteps-form__content">
                	<div class="control-label">基于以上所选择的服务，你的费用详细如下，</div>
                	<div class="card-body">
	                    <ul class="list-group">
	                      <li class="list-group-item d-flex justify-content-between align-items-center"> 新建公司
	                        <span class="badge badge-primary badge-pill">S$1800</span>
	                      </li>
	                      <li class="list-group-item d-flex justify-content-between align-items-center"> 每年公司的助理服务
	                        <span class="badge badge-primary badge-pill">S$1000</span>
	                      </li>
	                      <li class="list-group-item d-flex justify-content-between align-items-center"> 半年本地挂名股东服务
	                        <span class="badge badge-primary badge-pill">S$2200</span>
	                      </li>
	                    </ul>
                    </div>
                  </div>
                  <div class="button-row d-flex mt-4">
                    <button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
                    <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
                  </div>
              </div>
              
               <!--single form panel-->
              <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                <h3 class="multisteps-form__title">处理时间</h3>
                <div class="multisteps-form__content">
                	<div class="control-label">请让我们知道你计划多久建立公司，</div>
                	<div class="card-body">
	                    <ul class="list-group">
	                      <li class="list-group-item d-flex justify-content-between align-items-center">
	                      	<input class="form-check-input" type="radio" name="processTime" id="inlineRadio1" value="option1"> 我已经准备好了，让我知道下一步骤
	                      </li>
	                      <li class="list-group-item d-flex justify-content-between align-items-center"> 
	                        <input class="form-check-input" type="radio" name="processTime" id="inlineRadio2" value="option2"> 我差不多准备好了，但我有一点问题需要咨询
	                      </li>
	                      <li class="list-group-item d-flex justify-content-between align-items-center"> 
	                        <input class="form-check-input" type="radio" name="processTime" id="inlineRadio3" value="option3"> 我现在只是咨询一下
	                      </li>
	                    </ul>
                    </div>
                  </div>
                  <div class="row">
                    <div class="button-row d-flex mt-4 col-12">
                      <button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
                      <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
                    </div>
                  </div>
              </div>
              
               <!--single form panel-->
              <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                <h3 class="multisteps-form__title">联系方式</h3>
                <div class="multisteps-form__content">
                  
                  <div class="card-body">
                    <div class="alert alert-info">
                      <b>联系方式</b>
                    </div>
                    <div class="form-group">
                      <label>姓名 (必填)</label>
                      <input type="text" class="form-control" required>
                    </div>
                    
                    <div class="form-group">
                      <label>电子邮件 (必填)</label>
                      <input type="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                      <label>手机号码 (必填)</label>
                      <input type="tel" class="form-control" required>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="button-row d-flex mt-4 col-12">
                      <button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
                      <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
                    </div>
                  </div>
                </div>
              </div>
              
              <!--single form panel-->
              <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                <h3 class="multisteps-form__title">公司架构</h3>
                <div class="multisteps-form__content">
                  
                  <div class="card">
	                  <div class="card-header">
	                    <h4>公司名称</h4>
	                    	请按顺序提供3个你提议的公司名称，名称必须符合商标法
	                  </div>
	                  <div class="card-body">
	                    <div class="form-group row">
	                      <label for="inputEmail3" class="col-sm-3 col-form-label">提议的公司</label>
	                      <div class="col-sm-9">
	                        <input type="text" class="form-control" id="preferredname" placeholder="公司名称">
	                      </div>
	                    </div>
	                    <div class="form-group row">
	                      <label>公司后缀</label>
	                      <select class="form-control form-control-sm">
	                        <option>PRIVATE LTD.</option>
	                        <option>PTE. LIMITED</option>
	                        <option>PRIVATE LIMITED</option>
	                        <option>PTE. LTD.</option>
	                      </select>
	                    </div>
	                   </div>
                   
                   		<div class="card-header">
		                    <h4>注册地址</h4>   请提供作为你公司的新加坡地址
		                </div>
		                
		                <div class="card-body">
		                    <div class="form-group">
		                      <label for="inputAddress">注册地址</label>
		                      <input type="text" class="form-control" id="inputAddress" placeholder="请输入详细地址">
		                    </div>
		                    <div class="form-row">
		                      <div class="form-group col-md-6">
		                        <input type="text" class="form-control" id="inputAddress2" placeholder="街道号码或名称">
		                      </div>
		                      <div class="form-group col-md-6">
		                        <input type="text" class="form-control" id="inputAddress32" placeholder="楼层或套层">
		                      </div>
		                    </div>
		                    <div class="form-row">
		                      <div class="form-group col-md-6">
		                        <input type="text" class="form-control" id="inputCity" placeholder="城市，县或邮编">
		                      </div>
		                      <div class="form-group col-md-4">
		                        <select id="country" class="form-control">
		                          <option selected>国家</option>
		                          <option>新加坡</option>
		                          <option>中国</option>
		                          <option>马来西亚</option>
		                        </select>
		                      </div>
		                    </div>
		                  </div>

                  	</div>
                </div>
                  
                  <div class="row">
                    <div class="button-row d-flex mt-4 col-12">
                      <button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
                      <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
                    </div>
                  </div>
              </div>
              
              <!--single form panel-->
              <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                <h3 class="multisteps-form__title">总结</h3>
                <div class="multisteps-form__content">
                  
                  <div class="control-label">你选择的服务</div>
                	<ul class="list-group list-group-flush">
	                  	<li class="list-group-item">
		                  	<label class="custom-switch mt-2">
		                        <span class="custom-switch-description">新建新公司</span>
		                    </label>
	                    </li>
	                    <li class="list-group-item">
		                    <label class="custom-switch mt-2">
		                        <span class="custom-switch-description">每年公司的助理服务</span>
		                    </label>
		                </li>
		                <li class="list-group-item">
		                    <label class="custom-switch mt-2">
		                        <span class="custom-switch-description">每年注册地址服务</span>
		                    </label>
		                </li>
		                <li class="list-group-item">
		                    <label class="custom-switch mt-2">
		                        <span class="custom-switch-description">每年本地挂名股东服务</span>
		                    </label>
                    	</li>
                    </ul>
                   	<div class="control-label">移民服务</div>
                   	<ul class="list-group list-group-flush">
                    	<li class="list-group-item">
		                    <label class="custom-switch mt-2">
		                        <span class="custom-switch-description">工作准证申请</span>
		                    </label>
	                    </li>
	            	</ul>
                    
                  <div class="row">
                    <div class="button-row d-flex mt-4 col-12">
                      <button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
                      <button class="btn btn-primary ml-auto" type="submit" title="Send">提交</button>
                    </div>
                  </div>
                </div>
              </div>
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- partial -->
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
    </div>
  </div>

  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../assets/js/stisla.js"></script>

  <!-- JS Libraies -->

  <!-- Template JS File -->
  <script src="../../../assets/js/scripts.js"></script>
  <script src="../../../assets/js/custom.js"></script>
  <script  src="../../../assets/js/multiplepage.js"></script>
  <!-- Page Specific JS File -->
</body>
</html>