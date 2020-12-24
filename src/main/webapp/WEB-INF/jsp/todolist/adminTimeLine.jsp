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
            <h1>时间表</h1>
          </div>
		  <!--PEN CONTENT -->	
           <div class="row">
              <div class="col-12">
                <div class="card ">
                  <div class="card-header">
                    <h4>公司AAA</h4>
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
								                        <div class="accordion-header collapsible1" role="button" data-toggle="collapse" data-target="#panel-body-1" aria-expanded="true">
								                         	<h4>时间表</h4>
								                        </div>
								                        <div class="accordion-body collapse show" id="panel-body-1" data-parent="#accordion">
										                <div class="card">
										                  <div class="card-body">
										                    <table class="table table-sm">
										                      <thead>
										                        <tr>
										                          <th scope="col">项目</th>
										                          <th scope="col">预计时间</th>
										                          <th scope="col">实际时间</th>	
										  						  <th scope="col">备注</th>                         				  
										                        </tr>
										                      </thead>
										                      <tbody>
										                        <tr>
										                          <th scope="row">注册时间</th>
										                          <td>11/1/2018</td>
										                          <td></td>
										                          <td>                      
                      											</td>
										                        </tr>
										                        <tr>
										                          <th scope="row">年审时间</th>
										                          <td>10/31/2019</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="请填入实际时间"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>
										                        <tr>
										                          <th scope="row">财务年度时间</th>
										                          <td>10/31/2019</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="请填入实际时间"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>
										                        <tr>
										                          <th scope="row">ECI</th>
										                          <td>财务年度后3个月一次性</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="ECI"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>
										                        <tr>
										                          <th scope="row">消费税</th>
										                          <td>3个月一次</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="请填入开始时间"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>
										                        <tr>
										                          <th scope="row">所得税报税</th>
										                          <td>每一年的12月15日之前完成</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="请填入实际时间"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>										                        
										                        <tr>
										                          <th scope="row">所得锐缴税</th>
										                          <td>所得税报税完成后，1-2个月上网缴税，通知客户去操作</td>
										                          <td><input type="text" class="form-control form-control-sm" placeholder="请填入实际时间"></td>
										                          <td>										                          
											                          <div class="form-check">
												                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
												                        <label class="form-check-label" for="defaultCheck1">
												                      			  已完成
												                        </label>
												                      </div>
											                      </td>
										                        </tr>										                        				                        									                        
										                      </tbody>
										                    </table>
											                <div class="buttons">
										                      <a href="#" class="btn btn-icon icon-left btn-success"><i class="fas fa-check"></i>确认</a>                      
															  <a href="#" class="btn btn-icon icon-left btn-primary"><i class="far fa-edit"></i>修改</a>
															  <a href="#" class="btn btn-icon icon-left btn-info"><i class="far fa-file"></i>增加服务项</a>
										                    </div>	
										                    
				                 
														</div>
										                </div>
														<div class="card">
										                  <div class="card-body">					                
																<div class="row">	
																	<div class="col-12 col-md-12 col-lg-12">	                    
													                    <div class="form-group">
													                      <label>服务进展</label>
													                      <textarea class="form-control"></textarea>
													                    </div>												                    
													                    <div class="buttons">
													                      <a href="#" class="btn btn-icon icon-left btn-success"><i class="fas fa-check"></i>确认</a>                      
																		  <a href="#" class="btn btn-icon icon-left btn-primary"><i class="far fa-edit"></i>修改</a>
													                    </div>	
												                    </div>												                    
									                    										                    										                    
																 </div>											                
									                        </div>
							                      		</div>	
														<div class="card">
										                  <div class="card-body">					                
																<div class="row">	
																	<div class="col-12 col-md-12 col-lg-12">	                    
													                    <div class="form-group">
													                      <label>渠道方</label>
													                      <textarea class="form-control"></textarea>
													                    </div>												                    
													                    <div class="buttons">
													                      <a href="#" class="btn btn-icon icon-left btn-success"><i class="fas fa-check"></i>确认</a>                      
																		  <a href="#" class="btn btn-icon icon-left btn-primary"><i class="far fa-edit"></i>修改</a>
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