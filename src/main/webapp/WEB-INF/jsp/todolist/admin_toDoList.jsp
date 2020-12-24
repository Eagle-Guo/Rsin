<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>睿信集团&mdash; 控制面版</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" >
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="../../../assets/css/style.css">
  <link rel="stylesheet" href="../../../assets/css/components.css">
</head>

<body>
<jsp:include page="../userMenu.jsp" />
      <!-- Main Content -->
      <div class="main-content">  
        <section class="section" id="onlineSignature">
	        <div class="section-header">
	           <h1>待办事项</h1>
	        </div>  
      <div class="">
        <section class="section">
          <div class="section-body">
            <div class="row mt-4">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>待办事项清单</h4>
                  </div>
                  <div class="card-body admin_toDoList">
                    <!--<div class="float-left">
                      <select class="form-control selectric" style="display:inline;">
                        <option>公司A</option>
                        <option>公司B</option>
                        <option>公司C</option>
                      </select>
                      <select class="form-control selectric" style="display:inline;">
                        <option>电子签名</option>
                        <option>资料上传</option>
                        <option>待完成步骤</option>
                      </select>
                    </div>  -->
                    <div class="float-right">
                      <form>
                        <div class="input-group">
                          <input type="text" class="form-control" placeholder="Search">
                          <div class="input-group-append">
                            <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                          </div>
                        </div>
                      </form>
                    </div>

                    <div class="clearfix mb-3"></div>

                    <div class="table-responsive">
                      <table class="table table-striped">
                        <tr>
                          <th>创建日期</th>
                          <th>公司名称</th>
                          <th>待办事项</th>
                          <th>其它</th>
                        </tr>
                        <tr>
                          <td>
                          20/12/2020
                          </td>
                          <td>公司A
                          </td>
                          <td>
                          	  <div class="badge badge-danger"><a href="/adminDownLoadFile" target="_blank">新公司注册</a></div>
                          	  <!-- <a href="#" class="btn btn-secondary">新公司注册</a>
                          	  <a href="#" class="btn btn-secondary">查看文件</a> -->
                          </td>
                          <td>                                                        
                          </td>
                        </tr>  
                        <tr>
                          <td>
                          20/12/2020
                          </td>
                          <td>公司A
                          </td>
                          <td>
                          	  <div class="badge badge-danger"><a href="/adminTimeLine" target="_blank">时间表</a></div>
                          	  <!-- <a href="#" class="btn btn-secondary">新公司注册</a>
                          	  <a href="#" class="btn btn-secondary">查看文件</a> -->
                          </td>
                          <td>                                                        
                          </td>
                        </tr>                                                                      
                      </table>
                    </div>
                    <div class="float-right">
                      <nav>
                        <ul class="pagination">
                          <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                              <span class="sr-only">Previous</span>
                            </a>
                          </li>
                          <li class="page-item active">
                            <a class="page-link" href="#">1</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link" href="#">2</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link" href="#">3</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                              <span class="sr-only">Next</span>
                            </a>
                          </li>
                        </ul>
                      </nav>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
  <!-- <script src="../../../assets/js/html2canvas.js"></script> -->
  
  <script src="../../../assets/js/page/index-0.js"></script>
  <script src="../../../assets/js/onlineSignature.js"></script>
  <script src="../../../assets/js/signaturePad/signature_pad.umd.js"></script>
  <script src="../../../assets/js/signaturePad/app.js"></script>
</body>
</html>
