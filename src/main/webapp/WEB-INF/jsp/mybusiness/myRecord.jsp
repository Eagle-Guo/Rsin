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
            <h1>我的业务</h1>
          </div>
			<!--PEN CONTENT -->
		<!--<div class="row myRecord">
              <div class=" col-12 col-md-6 col-lg-6">
                <div class="card">
                  <div class="card-header">
                    <h4>公司名称A</h4>
                  </div>
                  <div class="card-body">
                    <div class="row">
                      <div class="col-4">
                        <div class="list-group" id="list-tab" role="tablist">
                          <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab">文件下载</a>
                          <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab">新服务</a>
                          <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab">时间表</a>
                        </div>
                      </div>
                      <div class="col-8">
                        <div class="tab-content" id="nav-tabContent">
                          <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
								 <div class="card">
				                  <div class="card-body removePadding">
				                    <ul class="list-group list-group-flush">
				                      <li class="list-group-item">基本信息（选择服务+填报资料）</li>
				                      <li class="list-group-item">文件1</li>
				                      <li class="list-group-item">文件2</li>
				                      <li class="list-group-item">文件3</li>
				                      <li class="list-group-item">文件4</li>
				                    </ul>
				                  </div>
				                </div>
                          </div>
                          <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
								 <div class="card">
				                  <div class="card-body removePadding">
				                    <ul class="list-group list-group-flush">
				                      <li class="list-group-item">服务项1</li>
				                      <li class="list-group-item">服务项2</li>
				                      <li class="list-group-item">服务项3</li>
				                      <li class="list-group-item">服务项4</li>
				                      <li class="list-group-item">服务项5</li>
				                    </ul>
				                  </div>
				                </div>
                          </div>
                          <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
                             <div class="card">
								
								<button class="btn btn-primary" id="myBtn">打开时间表</button>
								
								<div id="myModal" class="modal">
								  
								  <div class="modal-content">
								    <span class="close">&times;</span>
								    <p>时间表显示在此处</p>
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
          </div>	-->		
			
			
			
			
           <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>我的业务清单</h4>
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
                  <div class="card-body p-0">
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <tr>
                          <th>公司名称</th>
                          <th>文件下载</th>                     
                          <th>新服务</th>
                          <th>业务时间表</th>              
                        </tr>
                        <tr>
                          <td>公司AAA</td>
                          <td><div class="badge badge-success" ><a href="/mybusiness/downLoadFile" target="_blank">文件下载</a></div></td>
                          <td><div class="badge badge-warning"><a href="/onekey/oneKeyService" target="_blank">新服务</a></div></td>
                          <td><div class="badge badge-danger">时间表</div></td>
                        </tr>
                        
                        <tr>
                          <td>公司BBB</td>
                          <td><div class="badge badge-success">文件下载</div></td>
                          <td><div class="badge badge-warning"><a href="/onekey/oneKeyService" target="_blank">新服务</a></div></td>
                          <td><div class="badge badge-danger">时间表</div></td>
                        </tr>
                        <tr>
                          <td>公司CCC</td>
                          <td><div class="badge badge-success">文件下载</div></td>
                          <td><div class="badge badge-warning"><a href="/onekey/oneKeyService" target="_blank">新服务</a></div></td>
                          <td><div class="badge badge-danger">时间表</div></td>
                        </tr>
                        <tr>
                          <td>公司DDD</td>
                          <td><div class="badge badge-success">文件下载</div></td>
                          <td><div class="badge badge-warning"><a href="/onekey/oneKeyService" target="_blank">新服务</a></div></td>
                          <td><div class="badge badge-danger">时间表</div></td>
                        </tr>
                      </table>
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