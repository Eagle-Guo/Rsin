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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
  
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
				        <div class="col-lg-8 col-md-12 col-12 col-sm-12">
				           <form class="multisteps-form__form" action="/view/registerNewCompany" method="post">
				              <!--single form panel-->
				              <div class="multisteps-form__panel shadow p-4 rounded bg-white ad js-active" data-animation="scaleIn" id="companytype">
				                <h3 class="multisteps-form__title">选择服务</h3>
				                <div class="multisteps-form__content">
				                	<div class="control-label">请从以下选择你需要的服务</div>
				                	
				                	<span class="custom-switch-description">公司类型</span>
				                	<ul class="list-group">
				                      <li class="list-group-item d-flex justify-content-between align-items-center">
				                      	<input class="form-check-input" type="radio" name="companyType" id="companyType1" value="companyType1">私人豁免有限公司Exempt Private Limited Company (PTE LTD)
				                      </li>
				                      <li class="list-group-item d-flex justify-content-between align-items-center"> 
				                        <input class="form-check-input" type="radio" name="companyType" id="companyType2" value="companyType2">公众有限责任公司Public Limited Company(Ltd.)
				                      </li>
				                    </ul>

									<div class="control-label">可选服务</div>
				                	<ul class="list-group list-group-flush">
					                  	<li class="list-group-item">
						                  	<label class="custom-switch mt-2">
							                    <span class="custom-switch-description">新注册新加坡公司开户</span>
					                        	<input type="checkbox" class="custom-switch-input"  id="openAccount" onclick="openAccountFunction()"> 
					                        	<span class="custom-switch-indicator"></span>
							                </label>
						                	<div class="card-body" id="openAccountDeatil" style="display:none">
							                    <ul class="list-group">
							                      <li class="list-group-item d-flex justify-content-between align-items-center">1个户口
							                        <span class="badge badge-primary badge-pill">S$300</span>
							                      </li>
							                      <li class="list-group-item d-flex justify-content-between align-items-center">押金
							                        <span class="badge badge-primary badge-pill">S$1500</span>
							                      </li>
							                    </ul>
						                    </div>
					                    </li>
				                		<li class="list-group-item">
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
							                <div class="form-group row">
					                      		<label for="inputEmail3" class="col-sm-3 col-form-label">挂名董事</label>
					                      		<div class="col-sm-9"><input type="text" class="form-control" id="guamingdongshi" placeholder="挂名董事"></div> 
					                    	</div>
                    					</li>
                    					
                    					<li class="list-group-item">
							                <div class="form-group row">
					                      		<label for="inputEmail3" class="col-sm-3 col-form-label">董事</label>
					                      		<div class="col-sm-9"><input type="text" class="form-control" id="dongshi" placeholder="董事"></div>
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
                    					</li>
                    				</ul>
				                    <div class="button-row d-flex mt-4">
					                    <button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
					                    <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
				                  </div>
				                </div>
				              </div>
				              
				              <!--single form panel
				              <div class="multisteps-form__panel shadow p-4 rounded bg-white ad js-active" data-animation="scaleIn" id="companytype">
				                <h3 class="multisteps-form__title">填报资料</h3>
				                <div class="multisteps-form__content">
				                	<div class="control-label">请从以下选择你需要的服务</div>
				                	
				                	<ul class="list-group list-group-flush">
					                  	<li class="list-group-item">
						                  	<label class="custom-switch mt-2">
							                    <span class="custom-switch-description">Renewal </span>
					                        	<input type="checkbox" name="Renewal" class="custom-switch-input"> 
					                        	<span class="custom-switch-indicator"></span>
							                </label>
					                    </li>
				                		<li class="list-group-item">
							                <div class="form-group">
							                      <label for="inputAddress">UEN</label>
							                      <input type="text" class="form-control" id="inputAddress" placeholder="请输入UEN">
							                </div>
							            </li>
							            <li class="list-group-item">
							                <div class="form-group">
							                      <label for="companyName">公司名称</label>
							                      <input type="text" class="form-control" id="companyName" placeholder="请输入公司名称">
							                </div>
						                </li> 
						                <li class="list-group-item">
						                    <div class="form-group row">
						                    	<label>公司类型</label>
						                      	<select class="form-control form-control-sm">
						                        	<option>PRIVATE LTD.</option>
						                        	<option>PTE. LIMITED</option>
						                        	<option>PRIVATE LIMITED</option>
						                        	<option>PTE. LTD.</option>
						                      	</select>
						                    </div>
                    					</li>
                    					
                    					<li class="list-group-item"> 
                    						<input type="button" value="添加董事" class="btn btn-primary" onclick="addDongshi()">
                    						<input type="button" value="添加股东" class="btn btn-primary" onclick="addGudong()">
                    					</li>
                    					<li class="list-group-item">
							                <div class="form-group row">
					                      		<label for="inputEmail3" class="col-sm-3 col-form-label">挂名董事</label>
					                      		<div class="col-sm-9"><input type="text" class="form-control" id="guamingdongshi" placeholder="挂名董事"></div> 
					                    	</div>
                    					</li>
                    					
                    					<li class="list-group-item">
							                <div class="form-group row">
					                      		<label for="inputEmail3" class="col-sm-3 col-form-label">董事</label>
					                      		<div class="col-sm-9"><input type="text" class="form-control" id="dongshi" placeholder="董事"></div>
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
                    					</li>
                    				</ul>
				                    <div class="button-row d-flex mt-4">
					                    <button class="btn btn-primary js-btn-prev" type="button" title="Prev">上一步</button>
					                    <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">下一步</button>
				                  </div>
				                </div>
				              </div>-->
				
				              <!--single form panel-->
				              <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
				                <h3 class="multisteps-form__title">填报资料</h3>
				                <div class="multisteps-form__content">
				                  
				                  <div class="card-body">
				                    <!-- <div class="alert alert-info"><b>联系方式</b></div> -->
				                    <div class="form-group row">
					                      <label for="registerAmount" class="col-sm-3 col-form-label">注册资本</label>
					                      <div class="col-sm-9">
					                        <input type="number" class="form-control" id="registerAmount" required>
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="actualAmount" class="col-sm-3 col-form-label">实缴资本</label>
					                      <div class="col-sm-9">
					                        <input type="number" class="form-control" id="actualAmount" required>
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="" class="col-sm-3 col-form-label">注册时间</label>
					                      <div class="col-sm-9">
					                        <input type="text" class="form-control" id="registerDate" required>
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="planAuditDate" class="col-sm-3 col-form-label">预计年审时间</label>
					                      <div class="col-sm-9">
					                        <input type="text" class="form-control" id="planAuditDate">
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="financetDate" class="col-sm-3 col-form-label">财务年度时间</label>
					                      <div class="col-sm-9">
					                        <input type="text" class="form-control" id="financetDate">
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="gstTaxDate" class="col-sm-3 col-form-label">GST 报税</label>
					                      <div class="col-sm-9">
					                        <input type="text" class="form-control" id="gstTaxDate">
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="formClaimDate" class="col-sm-3 col-form-label">FORM C-S 申报</label>
					                      <div class="col-sm-9">
					                        <input type="text" class="form-control" id="formClaimDate">
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="formTaxDate" class="col-sm-3 col-form-label">FORM C-S 完税</label>
					                      <div class="col-sm-9">
					                        <input type="text" class="form-control" id="formTaxDate">
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="eciClaimDate" class="col-sm-3 col-form-label">ECI申报</label>
					                      <div class="col-sm-9">
					                        <input type="text" class="form-control" id="eciClaimDate">
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="ecitaxDate" class="col-sm-3 col-form-label">ECI完税</label>
					                      <div class="col-sm-9">
					                        <input type="text" class="form-control" id="ecitaxDate">
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="xbrlClaimDate" class="col-sm-3 col-form-label">XBRL申报</label>
					                      <div class="col-sm-9">
					                        <input type="text" class="form-control" id="xbrlClaimDate">
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="openAccountDate" class="col-sm-3 col-form-label">开户时间</label>
					                      <div class="col-sm-9">
					                        <input type="text" class="form-control" id="openAccountDate">
					                      </div>
					                </div>
					                <div class="form-group row">
					                      <label for="OpenAccountCompleteDate" class="col-sm-3 col-form-label">开户完成时间</label>
					                      <div class="col-sm-9">
					                        <input type="text" class="form-control" id="OpenAccountCompleteDate">
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
				              </div>
				              
				              <!--single form panel-->
				              <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
				                <h3 class="multisteps-form__title">在线确认</h3>
				                	<div class="card-body">
					                    <div class="form-group">
					                      <label>服务记录</label>
					                      <input type="text" id="serviceRecord" class="form-control">
					                    </div>
					                    <div class="form-group">
					                      <label>服务进度</label>
					                      <input type="text" id="serviceProgress" class="form-control" disabled value="新建">
					                    </div>
					                    <div class="form-group">
					                      <label>介绍人</label>
					                      <input type="text" id="serviceInstrutor" class="form-control">
					                    </div>
					                    <div class="form-group">
					                      <label>地址</label>
					                      <input type="text" id="serivceAddress" class="form-control">
					                    </div>
					                    <div class="form-group">
					                      <label>备注</label>
					                      <textarea id="comment" id="serviceComment" rows="4" class="form-control"></textarea>
					                    </div>
					                </div>
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
			              <div class="summary-item">
	                        <h6 class="mt-3">服务类型 总计  (<span class="text-muted" id="total_service"></span>)</h6>
	                        <ul class="list-unstyled list-unstyled-border">
	                        
	                          <li class="media">
	                            <a href="#">
	                              <img alt="image" class="mr-3 rounded" width="50" src="../assets/img/products/product-2-50.png">
	                            </a>
	                            <div class="media-body">
	                              <div class="media-right"><span class="text-muted" id="price"></span></div>
	                              <div class="media-title"><a href="#">公司名称: <span class="text-muted" id="company_name"></span></a></div>
	                            </div>
	                          </li>
	                        </ul>
	                      </div>
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

    function openAccountFunction() {
    	  // Get the checkbox
    	  var checkBox = document.getElementById("openAccount");
    	  // Get the output text
    	  var text = document.getElementById("openAccountDeatil");
    	  // If the checkbox is checked, display the output text
    	  if (checkBox.checked == true){
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
    services.push("创建新公司");

    $(document).ready(function(){
    	  $("#companyName").change(function(){
    		  $("#company_name").text($("#companyName").val());
    		  $("#price").text("S$1000");
    	  });

    	  var number = services.length;
    	  if (number == 1) {document.getElementById("total_service").innerHTML = number + " Item";}
    	  else {document.getElementById("total_service").innerHTML = number + " Items";}
    	  
    	});
	
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
    </script>

  <!-- Template JS File -->
  <script src="../../../assets/js/scripts.js"></script>
  <script src="../../../assets/js/custom.js"></script>
  <script  src="../../../assets/js/multiplepage.js"></script>
  <!-- Page Specific JS File -->
</body>
</html>