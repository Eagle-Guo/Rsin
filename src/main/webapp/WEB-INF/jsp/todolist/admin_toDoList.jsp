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
                  <div class="card-body">
                    <div class="float-left">
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
                    </div>
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
                          <th class="text-center pt-2">
                          </th>
                          <th>公司名称</th>
                          <th>待办事项</th>
                          <th>签订人</th>
                          <th>签订文件</th>
                          <th>状态</th>
                          <th>查看</th>
                        </tr>
                        <tr>
                          <td>
                            <div class="custom-checkbox custom-control">
                              <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-2">
                              <label for="checkbox-2" class="custom-control-label">&nbsp;</label>
                            </div>
                          </td>
                          <td>公司A
                          </td>
                          <td>
                          	  电子签名
                          </td>
                          <td>
                                                                                                    董事1
                          </td>
                          <td>First Ditector Meeting</td>
                          <td><div class="badge badge-primary">完成</div></td>
                          <td><a href="#" class="btn btn-secondary">查看文件</a></td>
                        </tr>
                        <tr>
                          <td>
                            <div class="custom-checkbox custom-control">
                              <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-2">
                              <label for="checkbox-2" class="custom-control-label">&nbsp;</label>
                            </div>
                          </td>
                          <td>公司A
                          </td>
                          <td>
                          	  电子签名
                          </td>
                          <td>
                                                                                                    董事2
                          </td>
                          <td>First Ditector Meeting</td>
                          <td><div class="badge badge-primary">未完成</div></td>
                          <td><a href="#" class="btn btn-secondary">查看文件</a></td>
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
