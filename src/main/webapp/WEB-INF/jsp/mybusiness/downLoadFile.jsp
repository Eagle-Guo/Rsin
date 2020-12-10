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
            <h1>公司信息</h1>
          </div>
		  <!--PEN CONTENT -->	
           <div class="row">
              <div class="col-12">
                <div class="card">
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
						            <div class="col-12 col-md-12 col-lg-12 menuBotom" id="readyContent">
						                <div class="card">
						                	<div class="card-body">
						                    	<div id="accordion">
						                      		<div class="accordion">
								                        <div class="accordion-header collapsible1" role="button" data-toggle="collapse" data-target="#panel-body-1" aria-expanded="true">
								                         	<h4>公司基本信息</h4>
								                        </div>
								                        <div class="accordion-body collapse show" id="panel-body-1" data-parent="#accordion">
										                <div class="card">
										                  <div class="card-body">
														    <!--<div class="section-title noteText">公司名称</div>  -->
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
										                          <td>001</td>
										                        </tr>
										                        <tr>
										                          <th scope="row">Account</th>
										                          <td>Markus Ang</td>
										                        </tr>
										                        <tr>
										                          <th scope="row">Partner</th>
										                          <td>(not set)</td>
										                        </tr>
										                        <tr>
										                          <th scope="row">Reg Name</th>
										                          <td>SINC INTERNATIONAL PTE. LTD.</td>
										                        </tr>
										                        <tr>
										                          <th scope="row">Register Date</th>
										                          <td>01.03.2019</td>
										                        </tr>																
										                        <tr>
										                          <th scope="row">Reg No</th>
										                          <td>201906615H</td>
										                        </tr>																	
										                        <tr>
										                          <th scope="row">Reg Address</th>
										                          <td>6 EU TONG SEN STREET #06-21 SINGAPORE 059817</td>
										                        </tr>																	
										                        <tr>
										                          <th scope="row">Proposed Name</th>
										                          <td>SINC INTERNATIONAL</td>
										                        </tr>																
										                        <tr>
										                          <th scope="row">Business Activity 1</th>
										                          <td>Employment agencies (excluding maid agencies)</td>
										                        </tr>																	
										                        <tr>
										                          <th scope="row">Business Activity 2</th>
										                          <td>(not set)</td>
										                        </tr>		
										                        <tr>
										                          <th scope="row">Nominee director</th>
										                          <td>no</td>
										                        </tr>																
										                        <tr>
										                          <th scope="row">Paid Up Capital</th>
										                          <td>5000</td>
										                        </tr>																	
										                        <tr>
										                          <th scope="row">Country</th>
										                          <td>Singapore</td>
										                        </tr>		
										                        <tr>
										                          <th scope="row">Postal Code</th>
										                          <td>59817</td>
										                        </tr>																
										                        <tr>
										                          <th scope="row">Secretary</th>
										                          <td>secretary_eric@php-cpa.com.sg</td>
										                        </tr>																	
										                        <tr>
										                          <th scope="row">Chairman director</th>
										                          <td>marcus@rsin.com</td>
										                        </tr>	
										                        <tr>
										                          <th scope="row">Created</th>
										                          <td>12.02.2019 14:27:17</td>
										                        </tr>											                        									                        
										                      </tbody>
										                    </table>
										                  </div>
										                </div>
								                        </div>
						                      		</div>
						                    	</div>
						                 	 </div>
						                </div>
						            </div>			  		
                                </div> 
							<div class="row">
						            <div class="col-12 col-md-12 col-lg-12 menuBotom" id="">
						                <div class="card">
						                	<div class="card-body">
						                    	<div id="">
						                      		<div class="accordion">
								                        <div class="accordion-header collapsible1" role="button" data-toggle="collapse" data-target="#panel-body-2" aria-expanded="true">
								                         	<h4>公司注册文件</h4>
								                        </div>
								                        <div class="accordion-body collapse show" id="panel-body-2" data-parent="#accordion">
										                <div class="card">
										                  <div class="card-body">
															<div class="row">
														            <div class="col-12 col-md-6 col-lg-6">	
														           	   Constitution of Company			                  
																	</div>
														            <div class="col-12 col-md-6 col-lg-6">	
														            	<a href="#" >下载</a>							                  
																	</div>									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-6 col-lg-6" data-toggle="collapse"  data-target="#AttachedReport	">	
														           	   Attached AML/CFT Report<span style="font-size:1.5rem;">￬</span>                 
																	</div>
														            <div class="col-12 col-md-6 col-lg-6">	
														            	<a href="#" >下载</a>
														            	<a href="#" >浏览</a>								                  
																	</div>								
															</div>								
															<div id="AttachedReport" class="collapse in">							
																<div class="row">
															            <div class="col-12 col-md-6 col-lg-6">	
															           	   28.02.2019 07:44:11		                  
																		</div>
														            <div class="col-12 col-md-6 col-lg-6">	
														            	<a href="#" >下载</a>
														            	<a href="#" >浏览</a>									                  
																	</div>							
																</div>
															</div>		
															<div class="row">
														            <div class="col-12 col-md-6 col-lg-6">	
														           	   Certificate of Incorporation			                  
																	</div>
														            <div class="col-12 col-md-6 col-lg-6">	
														            	<a href="#" >下载</a>	
																		<a href="#" >浏览</a>	
																	</div>									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-6 col-lg-6">	
														           	   First Director Meeting Resolution（Signers: ANG ZHENG LONG, MARCUS）	                  
																	</div>
														            <div class="col-12 col-md-6 col-lg-6">	
														            	<a href="#" >下载</a>	
																		<a href="#" >浏览</a>	
																	</div>									
															</div>		
															<div class="row">
														            <div class="col-12 col-md-6 col-lg-6">	
														           	   Risk Assessment（Signers: ANG ZHENG LONG, MARCUS, Eio Wee How）	                  
																	</div>
														            <div class="col-12 col-md-6 col-lg-6">	
														            	<a href="#" >下载</a>	
																		<a href="#" >浏览</a>	
																	</div>									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-6 col-lg-6">	
														           	   Company info 	                  
																	</div>
														            <div class="col-12 col-md-6 col-lg-6">	
														            	<a href="#" >下载</a>	
																	</div>									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-6 col-lg-6">	
														           	   Constitution of Company 	                  
																	</div>
														            <div class="col-12 col-md-6 col-lg-6">	
														            	<a href="#" >下载</a>		
																	</div>									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-6 col-lg-6">	
														           	   Register of Charges	                  
																	</div>
														            <div class="col-12 col-md-6 col-lg-6">	
														            	<a href="#" >下载</a>	
																	</div>									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-6 col-lg-6">	
														           	   Register of Secretary	                  
																	</div>
														            <div class="col-12 col-md-6 col-lg-6">	
														            	<a href="#" >下载</a>		
																	</div>									
															</div>	
															<div class="row">
														            <div class="col-12 col-md-6 col-lg-6">	
														           	  Risk Assessment Checklist	                  
																	</div>
														            <div class="col-12 col-md-6 col-lg-6">	
														            	<a href="#" >下载</a>	
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