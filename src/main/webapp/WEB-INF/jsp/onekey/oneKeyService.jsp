<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>睿信集团&mdash; 控制面版</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="../../../assets/css/style.css">
  <link rel="stylesheet" href="../../../assets/css/components.css">
</head>

<body>
<jsp:include page="../userMenu.jsp" />
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>所有服务</h1>
          </div>
          
     <!--<div class="row">
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
          </div>-->

          <div class="row" id="oneKeyService">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="card">
               <!--<div class="card-header">
                  <h4>一键式服务平台</h4>
                  <div class="card-header-action">
                    <div class="dropdown">
                      <a href="#" class="dropdown-toggle btn btn-primary" data-toggle="dropdown">操作指引</a>
                    </div>
                  </div>
                </div>-->
                <div class="card-body">
                  <div class="summary">
                    <div class="summary-info">
                      	<img src="../assets/img/onekeyservice/oks_bg_1.jpg" alt="Notebook" style="width:100%;">
	                    <div class="content">
	                     	 <h4>新加坡与海外离岸公司注册</h4>
	                     	<!--<div class="text-muted">新加坡最便捷、性价比最高的公司注册平台。</div>
	                     	 <div class="d-block mt-2">
	                       		 <a href="#">马上注册</a>
	                     	 </div>  --> 
	                      </div>
                    </div>
                    
                    <div class="summary-item">
                      <h6>服务类型 <span class="text-muted">(6项)</span></h6>
                      <ul class="list-unstyled list-unstyled-border">
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                            <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-warning">在线注册</a></div>
                            <div class="media-title"><a href="/mybusiness/newCompany">新加坡公司注册</a></div>
                            <div class="text-muted text-small">所有的公司都必须在新加坡会计与企业管制局 (ACRA) 登记注册。其中包括为外国公司开展业务的个人、公司或企业。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="#" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">香港公司注册</a></div>
                            <div class="text-muted text-small">香港是四大离岸金融中心之一，蕴藏着无限商机，是通往全球经贸的平台，香港的优势广为人知。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="#" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">开曼群岛公司注册</a></div>
                            <div class="text-muted text-small">开曼群岛完全没有直接税收，无论是对个人、公司还是信托行业都不征任何直接税，因此它获得了“避税天堂”的美称。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="#" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">BVI公司注册</a></div>
                            <div class="text-muted text-small">英属维尔京群岛（BVI）无须缴税，无外汇管制，任何货币的流通都没有限制。</div>
                          </div>
                        </li>                        
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="#" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">马绍尔公司注册</a></div>
                            <div class="text-muted text-small">马绍尔群岛（Marshall Islands）无须缴税，无外汇管制，任何货币的流通都没有限制。</div>
                          </div>
                        </li>  
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="#" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">塞舌尔公司注册</a></div>
                            <div class="text-muted text-small">塞舌尔（Seychelles）实行单一税，国际商业公司不必就在塞舌尔共和国以外地方进行的商业活动或交易纳税。</div>
                          </div>
                        </li>  
                     <!--   <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">新加坡现成壳公司转让</a></div>
                            <div class="text-muted text-small">我们为客户提供新加坡现成壳公司转让服务，欢迎在线咨询。</div>
                          </div>
                        </li>     -->                                                                     
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card">
               <!--  <div class="card-header">
                  <h4>一键式服务平台</h4>
                  <div class="card-header-action">
                    <div class="dropdown">
                      <a href="#" class="dropdown-toggle btn btn-primary" data-toggle="dropdown">操作指引</a>
                    </div>
                  </div>
                </div>--> 
                <div class="card-body">
                  <div class="summary">
                    <div class="summary-info">
                      	<img src="../assets/img/onekeyservice/oks_bg_3.jpg" alt="Notebook" style="width:100%;">
	                    <div class="content">
	                     	 <h4>公司管理维护</h4>
	                      </div>
                    </div>
                    
                    <div class="summary-item">
                      <h6>服务类型 <span class="text-muted">(4项)</span></h6>
                      <ul class="list-unstyled list-unstyled-border">
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                            <div class="float-right"><a  href="/mybusiness/annualReview" class="btn btn-warning">在线注册</a></div>
                            <div class="media-title"><a href="/mybusiness/annualReview">新加坡公司年审</a></div>
                            <div class="text-muted text-small">为客户提供新加坡公司年审服务。根据新加坡公司法的规定，每家新加坡公司都必须在规定时间内完成公司年报，否则将会产生罚款。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="#" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">海外公司年审</a></div>
                            <div class="text-muted text-small">为客户提供海外公司年审服务。各国对公司年审要求不同，我们可以帮助您处理各类年审事务。</div>
                          </div>
                        </li>
                       <!--   <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">新加坡公司审计</a></div>
                            <div class="text-muted text-small">我们有专业的审计流程，是基于客户的业务流程、商业目标及发展策略而制定。我们确保客户的财务报告符合国际/新加坡会计准则和相关国家准则的要求，在审计过程中，也会识别并指出可能会影响业务的存在风险。</div>
                          </div>
                        </li>-->
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/accountingServices" class="btn btn-warning">在线注册</a></div>
                            <div class="media-title"><a href="/mybusiness/accountingServices">新加坡会计服务</a></div>
                            <div class="text-muted text-small">为客户提供新加坡会计服务。</div>
                          </div>
                        </li>                        
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="#" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">新加坡公司税务服务</a></div>
                            <div class="text-muted text-small">所有新加坡公司都必须做纳税申报。申报时间取决于公司的财政年度截止日。我们能协助您准备并递交符合要求的税务申报表。</div>
                          </div>
                        </li>  
                       <!--  <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">新加坡公司代理记账</a></div>
                            <div class="text-muted text-small">新加坡公司法Sec199. (1) 规定，在新加坡成立的公司需要做账并保留相关原始凭证至少五年；我们提供高质量的记帐服务。</div>
                          </div>
                        </li>       -->                                                                  
                      </ul>
                    </div>
                  </div>
                </div>
              </div>

            </div>
            
            <div class="col-lg-6 col-md-6 col-12">
              <div class="card">
              <!--  <div class="card-header">
                  <h4>一键式服务平台</h4>
                  <div class="card-header-action">
                    <div class="dropdown">
                      <a href="#" class="dropdown-toggle btn btn-primary" data-toggle="dropdown">操作指引</a>
                    </div>
                  </div>
                </div>-->
                <div class="card-body">
                  <div class="summary">
                    <div class="summary-info">
                      	<img src="../assets/img/onekeyservice/oks_bg_2.jpg" alt="Notebook" style="width:100%;">
	                    <div class="content">
	                     	 <h4>商业服务</h4>
	                      </div>
                    </div>
                    
                    <div class="summary-item">
                      <h6>服务类型 <span class="text-muted">(6项)</span></h6>
                      <ul class="list-unstyled list-unstyled-border">
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                            <div class="float-right"><a  href="/mybusiness/openAccount" class="btn btn-warning">在线注册</a></div>
                            <div class="media-title"><a href="/mybusiness/openAccount">新加坡银行开户</a></div>
                            <div class="text-muted text-small">各银行的业务和优势不尽相同，我们能够依据客户的业务需求，为客户推荐和办理各类的银行服务。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/openAccount" class="btn btn-warning">在线注册</a></div>
                            <div class="media-title"><a href="/mybusiness/openAccount">离岸银行开户</a></div>
                            <div class="text-muted text-small">为客户提供离岸银行开户服务。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="#" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">签证工作准证申请与更新</a></div>
                            <div class="text-muted text-small">为客户提供短期商务签证、工作准证、企业家准证、家属准证DP或长期社访准证LTVP等各类签证的申请服务。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="#" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">新加坡PR申请与延期</a></div>
                            <div class="text-muted text-small">为客户提供新加坡PR申请与延期服务，其中新加坡PR申请有2种，分别是工作准证持有人申请PR方式和通过全球投资者计划方式。</div>
                          </div>
                        </li>                        
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/licenseApplication" class="btn btn-warning">在线注册</a></div>
                            <div class="media-title"><a href="/mybusiness/licenseApplication">新加坡商标与执照申请</a></div>
                            <div class="text-muted text-small">为客户提供新加坡商标TRADMARK申请和新加坡商业执照LICENCE申请的服务。</div>
                          </div>
                        </li>  
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/GSTApplication" class="btn btn-warning">在线注册</a></div>
                            <div class="media-title"><a href="/mybusiness/GSTApplication">新加坡消费税申请</a></div>
                            <div class="text-muted text-small">为客户提供快捷的新加坡消费税申请和代缴服务。新加坡的消费税，即货物和劳务税(Goods and Services Tax，简称GST)。</div>
                          </div>
                        </li>  
                      <!--  <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">新加坡税务局民申请</a></div>
                            <div class="text-muted text-small">为客户提供新加坡税务局民申请服务。</div>
                          </div>
                        </li>      
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">新加坡公积金户口申请</a></div>
                            <div class="text-muted text-small">为客户提供快捷的新加坡公积金户口申请和代缴服务。</div>
                          </div>
                        </li>  
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">海关进出口号申请</a></div>
                            <div class="text-muted text-small">为客户提供快捷的新加坡海关进出口号UEN申请和代理清关务。新加坡海关进出口号是新加坡海关发出给需要将货物进出口新加坡，或者指定清关代理申请海关进出口转运许可证的机构和个人的的海关识别号。</div>
                          </div>
                        </li>                          
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">新加坡商品条形码申请</a></div>
                            <div class="text-muted text-small">为客户提供快捷的新加坡商品条形码口申请服务。新加坡条形码协会全面会员会籍分为三个类别，收费也有所不同。</div>
                          </div>
                        </li>                          
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">SingPass 与 CorpPass 申请</a></div>
                            <div class="text-muted text-small">协助客户申请SingPass 与 CorpPass。SingPass是在线登陆新加坡政府网站和办理事务的电子账户。CorpPass是为企业和其他实体而设，用于登录政府机构网站处理事务的新企业数字标示。</div>
                          </div>
                        </li>                          
                                  -->                                                                                    
                      </ul>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card">
               <!--  <div class="card-header">
                  <h4>一键式服务平台</h4>
                  <div class="card-header-action">
                    <div class="dropdown">
                      <a href="#" class="dropdown-toggle btn btn-primary" data-toggle="dropdown">操作指引</a>
                    </div>
                  </div>
                </div>--> 
                <div class="card-body">
                  <div class="summary">
                    <div class="summary-info">
                      	<img src="../assets/img/onekeyservice/oks_bg_4.jpg" alt="Notebook" style="width:100%;">
	                    <div class="content">
	                     	 <h4>云商业服务</h4>
	                      </div>
                    </div>                    
                    <div class="summary-item">
                      <h6>服务类型 <span class="text-muted">(3项)</span></h6>
                      <ul class="list-unstyled list-unstyled-border">
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                            <div class="float-right"><a  href="#" class="btn btn-primary">在线咨询</a></div>
                            <div class="media-title"><a href="#">云会计系统/应用</a></div>
                            <div class="text-muted text-small">我们提供云会计系统/应用服务，欢迎咨询。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/callService" class="btn btn-warning">在线注册</a></div>
                            <div class="media-title"><a href="/mybusiness/callService">呼叫转移服务</a></div>
                            <div class="text-muted text-small">我们提供新加坡固定座机全球呼叫转移和新加坡固定座机无人应笘的虚拟电话服务。</div>
                          </div>
                        </li>
                        <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-4-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/officeService" class="btn btn-warning">在线注册</a></div>
                            <div class="media-title"><a href="/mybusiness/officeService">新加坡共享办公室</a></div>
                            <div class="text-muted text-small">共享服务式办公室是新加坡创业初始或办公人员不多的情况下，最适宜的选择！我们提供3个月、6个月和12个月为周期的新加坡共享办公室服务。</div>
                          </div>
                        </li>
                      <!--  <li class="media">
                          <a href="#">
                            <img class="mr-3 rounded" width="50" src="../assets/img/products/product-1-50.png" alt="product">
                          </a>
                          <div class="media-body">
                             <div class="float-right"><a  href="/mybusiness/newCompany" class="btn btn-primary">马上注册</a></div>
                            <div class="media-title"><a href="#">新加坡虚拟办公室</a></div>
                            <div class="text-muted text-small">新加坡最便捷、性价比最高的公司管理平台。</div>
                          </div>
                        </li>     -->                                                                                                                  
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              
       <!--        <div class="card">
                <div class="card-body">
                  <div class="summary">
                    <div class="summary-info">
                      	<img src="../assets/img/onekeyservice/oks_bg_5.jpg" alt="Notebook" style="width:100%;">
	                    <div class="content">
	                     	 <h4>法律服务</h4>

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
                  -->           
            </div>
                        
          </div>
          

        </section>
      </div>
      <jsp:include page="../footer.jsp" />

  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../assets/js/stisla.js"></script>

  <!-- JS Libraies 
  <script src="../node_modules/simpleweather/jquery.simpleWeather.min.js"></script>
  <script src="../node_modules/chart.js/dist/Chart.min.js"></script>
  <script src="../node_modules/jqvmap/dist/jquery.vmap.min.js"></script>
  <script src="../node_modules/jqvmap/dist/maps/jquery.vmap.world.js"></script>
  <script src="../node_modules/summernote/dist/summernote-bs4.js"></script>
  <script src="../node_modules/chocolat/dist/js/jquery.chocolat.min.js"></script>-->

  <!-- Template JS File -->
  <script src="../../../assets/js/scripts.js"></script>
  <script src="../../../assets/js/custom.js"></script>

  <!-- Page Specific JS File -->
  <script src="../../../assets/js/page/index-0.js"></script>
</body>
</html>
