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
	           <h1>客户清单报表</h1>
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
                  <div class="card-body admin_record">

                    <div class="clearfix mb-3"></div>

					<div class="table-responsive">
						<table id="adminRecord" class="table table-striped display" style="width:100%" >
					        <thead>
					            <tr>
		                          <th>UEN</th>
		                          <th>公司名称</th>                         
		                          <th>注册日期</th>
		                          <th>董事</th>
		                          <th>挂名董事</th>
		                          <th>股东</th>                          
		                          <th>秘书</th>                                
		                          <th>联系人</th>                                
		                          <th>注册资本</th>                                
		                          <th>实缴资本</th>  
		                          <th>预计年审时间</th>                          
		                          <th>财务年度时间</th>                                
		                          <th>消费税报税</th>                                
		                          <th>ECI</th>                                
		                          <th>所得税报税</th>                           
		                          <th>所得锐缴税</th>                                               
		                          <th>公司地址 </th>    
		                          <th>服务进度</th>    
		                          <th>渠道方</th>                              
		                          <th>服务记录（时间表）</th>                       
		                          <th>导出公司信息 </th>                                                                                                    
		                          <th>下载全部文件</th>                                                                          
		                          <th>备注</th>  																		                          
					            </tr>
					        </thead>
					    </table>
					</div>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div> 		        
	         
      <div class="">
        <section class="section admin_editRecord">
          <div class="section-body">
            <div class="row mt-4">
              <div class="col-12">
                <div class="card search">
                  <div class="card-header">
                    <div class="section-title" style="padding-right:3%;">条件筛选</div>
                    <div class="form-group" style="width:60%;">
                      <div class="input-group">
                        <select class="custom-select" id="inputGroupSelect05">
                          <option selected>全部</option>
                          <option value="1">公司名称</option>
                          <option value="2">注册日期</option>
                          <option value="3">年审时间</option>
                          <option value="4">财务年度时间</option>
                          <option value="5">关键词</option>                                                   
                        </select>
                        <input type="text" class="form-control">
                        <div class="input-group-append">
                          <button class="btn btn-primary" type="button">搜索</button>
                        </div>
                      </div>
                    </div>
                   <div  style="padding-left:3%;"><div class="badge badge-danger">导出全部</div></div> 
                  </div>
                  <div class="card-body">
                    <div class="clearfix mb-3"></div>

                    <div class="table-responsive">
                      <table class="table table-striped">
                        <tr>
                          <th>UEN</th>
                          <th>公司名称</th>                         
                          <th>注册日期</th>
                          <th>董事</th>
                          <th>挂名董事</th>
                          <th>股东</th>                          
                          <th>秘书</th>                                
                          <th>联系人</th>                                
                          <th>注册资本</th>                                
                          <th>实缴资本</th>  
                          <th>预计年审时间</th>                          
                          <th>财务年度时间</th>                                
                          <th>消费税报税</th>                                
                          <th>ECI</th>                                
                          <th>所得税报税</th>                           
                          <th>所得锐缴税</th>                                               
                          <th>公司地址 </th>    
                          <th>服务进度</th>    
                          <th>渠道方</th>                              
                          <th>服务记录（时间表）</th>                       
                          <th>导出公司信息 </th>                                                                                                    
                          <th>下载全部文件</th>                                                                          
                          <th>备注</th>  																			                          
                        </tr>
                        <tr>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>      
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>                           
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>      
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>                          
                          <th> <div class="badge badge-danger"><a href="#" target="_blank">导出</a></div></th>                                                
                          <th> <div class="badge badge-danger"><a href="#" target="_blank">导出</a></div></th>                          
                          <th><div class="badge badge-danger"><a href="#" target="_blank">下载</a></div></th>
                          <th></th> 																			                          
                        </tr>   
                        <tr>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>      
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>                           
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>      
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>                          
                          <th> <div class="badge badge-danger"><a href="#" target="_blank">导出</a></div></th>                                               
                          <th> <div class="badge badge-danger"><a href="#" target="_blank">导出</a></div></th>                          
                          <th><div class="badge badge-danger"><a href="#" target="_blank">下载</a></div></th>
                          <th></th> 																			                          
                        </tr>   
                        <tr>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>      
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>                           
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>      
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>                          
                          <th> <div class="badge badge-danger"><a href="#" target="_blank">导出</a></div></th>                                                  
                          <th> <div class="badge badge-danger"><a href="#" target="_blank">导出</a></div></th>                          
                          <th><div class="badge badge-danger"><a href="#" target="_blank">下载</a></div></th>
                          <th></th> 																			                          
                        </tr>                           
                         <tr>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>      
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>                           
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>      
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>
                          <th>data</th>                          
                          <th> <div class="badge badge-danger"><a href="#" target="_blank">导出</a></div></th>                                                 
                          <th> <div class="badge badge-danger"><a href="#" target="_blank">导出</a></div></th>                          
                          <th><div class="badge badge-danger"><a href="#" target="_blank">下载</a></div></th>
                          <th></th> 																			                          
                        </tr>                          
                        
                                                                    
                      </table>
                    </div> 
                    <br/><br/>
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
  <script src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>  
  <script src="../../../assets/js/admin_record.js"></script> 
  
</body>
</html>
