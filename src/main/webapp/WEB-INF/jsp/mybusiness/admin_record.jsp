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
	           <h1>报表查询</h1>
	        </div>  
      <div class="">
        <section class="section">
          <div class="section-body">
            <div class="row mt-4">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>请选择报表</h4>
                  </div>
                  <div class="card-body">
                    <div class="float-left">
                      <select class="form-control selectric" style="display:inline;">
                        <option>新加坡公司注册</option>
                        <option>新加坡银行开户</option>
                        <option>离岸银行开户</option>
                        <option>新加坡商标与执照申请</option>
                        <option>新加坡消费税申请</option>
                        <option>新加坡公司年审</option>                        
                        <option>新加坡会计服务</option>
                        <option>呼叫转移服务</option>
                        <option>新加坡共享办公室</option>                        
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
                          <th>UEN</th>
                          <th>公司名称</th>
                          <th>公司类型</th>
                          <th>挂名董事</th>
                          <th>董事1</th>
                          <th>股东1</th>
                          <th>秘书</th>     
                          <th>联系人电话</th>                          
                          <th>邮箱</th>                          
                          <th>注册资本 </th>                          
                          <th>实缴资本</th>                          
                          <th>注册时间</th>
                          <th>预计年审时间</th>                          
                          <th>实际年审时间</th>                          
                          <th>财务年度时间</th>  
                          <th>消费税报税</th>                          
                          <th>所得税报税</th>                          
                          <th>服务记录</th>                                                                                                     
                          <th>服务进度</th>                          
                          <th>渠道方地址</th>                          
                          <th>备注</th>  																			                          
                        </tr>
                        <tr>
                          <th class="text-center pt-2">
                          </th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th></th>     
                          <th></th>                          
                          <th></th>                          
                          <th> </th>                          
                          <th></th>                          
                          <th></th>
                          <th></th>                          
                          <th></th>                          
                          <th></th>  
                          <th></th>                          
                          <th></th>                          
                          <th></th>                                                                                                     
                          <th></th>                          
                          <th></th>                          
                          <th></th>  																			                          
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
