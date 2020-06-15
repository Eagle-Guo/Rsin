<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>睿信集团&mdash; 控制面版</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

  <!-- Template CSS -->
  <link rel="stylesheet" href="../../assets/css/style.css">
  <link rel="stylesheet" href="../../assets/css/components.css">
</head>

<body>
<jsp:include page="../menu.jsp" />
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>后台管理</h1>
          </div>
          <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                  <i class="far fa-user"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>待办事项</h4>
                  </div>
                  <div class="card-body"> 2 </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-danger">
                  <i class="far fa-newspaper"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>未付款</h4>
                  </div>
                  <div class="card-body">
                    2
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-warning">
                  <i class="far fa-file"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>一键式服务平台</h4>
                  </div>
                  <div class="card-body">
                    36
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-success">
                  <i class="fas fa-circle"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>最新通告</h4>
                  </div>
                  <div class="card-body">
                   4
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row" id="oneKeyService">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="card">
                <div class="card-header">
                  <h4>一键式服务平台</h4>
                  <div class="card-header-action">
                    <div class="dropdown">
                      <a href="#" class="dropdown-toggle btn btn-primary" data-toggle="dropdown">操作指引</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="summary">
                    <div class="summary-info">
                      	<img src="../assets/img/onekeyservice/oks_bg_1.jpg" alt="Notebook" style="width:100%;">
	                    <div class="content">
	                     	 <h4>新加坡与海外离岸公司注册</h4>
	                     	<div class="text-muted">新加坡最便捷、性价比最高的公司注册平台。</div>
	                     	 <div class="d-block mt-2">
	                       		 <a href="#">马上注册</a>
	                     	 </div> 
	                      </div>
                    </div>
                    
                    <div class="summary-item">
                      <h6>服务类型 <span class="text-muted">(7项)</span></h6>
                      <ul class="list-unstyled list-unstyled-border">
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                            <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="/mybusiness/newCompany">新加坡公司注册</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司注册平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-2-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">香港公司注册</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司注册平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-3-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">开曼群岛公司注册</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司注册平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">BVI公司注册</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司注册平台。</div>
                          </div>
                        </li>                        
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-5-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">马绍尔公司注册</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司注册平台。</div>
                          </div>
                        </li>  
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">塞舌尔公司注册</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司注册平台。</div>
                          </div>
                        </li>  
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-2.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡现成壳公司转让</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司注册平台。</div>
                          </div>
                        </li>                                                                          
                      </ul>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card">
                <div class="card-header">
                  <h4>一键式服务平台</h4>
                  <div class="card-header-action">
                    <div class="dropdown">
                      <a href="#" class="dropdown-toggle btn btn-primary" data-toggle="dropdown">操作指引</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="summary">
                    <div class="summary-info">
                      	<img src="../assets/img/onekeyservice/oks_bg_1.jpg" alt="Notebook" style="width:100%;">
	                    <div class="content">
	                     	 <h4>商业服务</h4>
	                     	<div class="text-muted">新加坡最便捷、性价比最高的公司注册平台。</div>
	                     	 <div class="d-block mt-2">
	                       		 <a href="#">马上注册</a>
	                     	 </div> 
	                      </div>
                    </div>
                    
                    <div class="summary-item">
                      <h6>服务类型 <span class="text-muted">(11项)</span></h6>
                      <ul class="list-unstyled list-unstyled-border">
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-3.jpg" alt="product">
                          </a>
                          <div class="media-body">
                            <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="/mybusiness/newCompany">新加坡银行开户</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">离岸银行开户</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-5.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">签证工作准证申请与更新</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡PR申请与延期</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>                        
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-2-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡商标与执照申请</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>  
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-3-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡消费税申请</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>  
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡税务局民申请</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>      
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-5-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡公积金户口申请</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>  
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">海关进出口号申请</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>                          
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-2.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡商品条形码申请</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>                          
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-3.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">SingPass 与 CorpPass 申请</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>                          
                                                                                                                    
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-lg-6 col-md-6 col-12">
              <div class="card">
                <div class="card-header">
                  <h4>一键式服务平台</h4>
                  <div class="card-header-action">
                    <div class="dropdown">
                      <a href="#" class="dropdown-toggle btn btn-primary" data-toggle="dropdown">操作指引</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="summary">
                    <div class="summary-info">
                      	<img src="../assets/img/onekeyservice/oks_bg_1.jpg" alt="Notebook" style="width:100%;">
	                    <div class="content">
	                     	 <h4>公司管理维护</h4>
	                     	<div class="text-muted">新加坡最便捷、性价比最高的公司管理平台。</div>
	                     	 <div class="d-block mt-2">
	                       		 <a href="#">马上注册</a>
	                     	 </div> 
	                      </div>
                    </div>
                    
                    <div class="summary-item">
                      <h6>服务类型 <span class="text-muted">(6项)</span></h6>
                      <ul class="list-unstyled list-unstyled-border">
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-2-50.png" alt="product">
                          </a>
                          <div class="media-body">
                            <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="/mybusiness/newCompany">新加坡公司年审</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-5-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">海外公司年审</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡公司审计</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡会计服务</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司平台。</div>
                          </div>
                        </li>                        
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-3-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡公司税务服务</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司平台。</div>
                          </div>
                        </li>  
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-3.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡公司代理记账</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司平台。</div>
                          </div>
                        </li>                                                                        
                      </ul>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card">
                <div class="card-header">
                  <h4>一键式服务平台</h4>
                  <div class="card-header-action">
                    <div class="dropdown">
                      <a href="#" class="dropdown-toggle btn btn-primary" data-toggle="dropdown">操作指引</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="summary">
                    <div class="summary-info">
                      	<img src="../assets/img/onekeyservice/oks_bg_1.jpg" alt="Notebook" style="width:100%;">
	                    <div class="content">
	                     	 <h4>云商业服务</h4>
	                     	<div class="text-muted">新加坡最便捷、性价比最高的公司平台。</div>
	                     	 <div class="d-block mt-2">
	                       		 <a href="#">马上注册</a>
	                     	 </div> 
	                      </div>
                    </div>                    
                    <div class="summary-item">
                      <h6>服务类型 <span class="text-muted">(4项)</span></h6>
                      <ul class="list-unstyled list-unstyled-border">
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-3.jpg" alt="product">
                          </a>
                          <div class="media-body">
                            <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="/mybusiness/newCompany">云会计系统/应用</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">呼叫转移服务</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-5.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡共享办公室</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡虚拟办公室</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>                                                                                                                     
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="card">
                <div class="card-header">
                  <h4>一键式服务平台</h4>
                  <div class="card-header-action">
                    <div class="dropdown">
                      <a href="#" class="dropdown-toggle btn btn-primary" data-toggle="dropdown">操作指引</a>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="summary">
                    <div class="summary-info">
                      	<img src="../assets/img/onekeyservice/oks_bg_1.jpg" alt="Notebook" style="width:100%;">
	                    <div class="content">
	                     	 <h4>法律服务</h4>
	                     	<div class="text-muted">新加坡最便捷、性价比最高的公司平台。</div>
	                     	 <div class="d-block mt-2">
	                       		 <a href="#">马上注册</a>
	                     	 </div> 
	                      </div>
                    </div>                    
                    <div class="summary-item">
                      <h6>服务类型 <span class="text-muted">(8项)</span></h6>
                      <ul class="list-unstyled list-unstyled-border">
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-3.jpg" alt="product">
                          </a>
                          <div class="media-body">
                            <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="/mybusiness/newCompany">新加坡公司法务</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡企业重组与并购</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-5.jpg" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡交易支援</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-5-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡企业上市</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>     
                        
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡文件认证</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>                         
                         <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-3-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡鉴证</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>                        
                         <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-2-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">跨境投资与返程投资</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>                        
                         <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">离岸运营管理</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>                        
                        
                                                                                                                                        
                      </ul>
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
  <script src="../node_modules/simpleweather/jquery.simpleWeather.min.js"></script>
  <script src="../node_modules/chart.js/dist/Chart.min.js"></script>
  <script src="../node_modules/jqvmap/dist/jquery.vmap.min.js"></script>
  <script src="../node_modules/jqvmap/dist/maps/jquery.vmap.world.js"></script>
  <script src="../node_modules/summernote/dist/summernote-bs4.js"></script>
  <script src="../node_modules/chocolat/dist/js/jquery.chocolat.min.js"></script>

  <!-- Template JS File -->
  <script src="../assets/js/scripts.js"></script>
  <script src="../assets/js/custom.js"></script>

  <!-- Page Specific JS File -->
  <script src="../assets/js/page/index-0.js"></script>
</body>
</html>
