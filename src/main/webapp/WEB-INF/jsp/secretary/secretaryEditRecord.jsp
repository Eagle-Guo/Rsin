<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	           <h1>快速服务</h1>
	        </div>  
		      <div class="">
		        <section class="section">
		          <div class="section-body">
		            <div class="row mt-4">
		              <div class="col-12">
		                <div class="card">
		                  <div class="card-header">
		                    <h4>客户信息</h4>
		                  </div>
		                  <div class="card-body admin_editRecord">
		
		                    <div class="clearfix mb-3"></div>
		
							<div class="table-responsive">
								<table id="adminEditRecord" class="table table-striped display" style="width:100%" >
							        <thead>
							            <tr>
				                          <th>UEN</th>
				                          <th>公司名称</th>                         
				                          <th>注册日期</th>
				                          <th>年审时间</th>
				                          <th>财务年度时间</th>
				                          <th>信息修改</th>                                                                                                    
				                          <th>备注</th>  																			                          
							            </tr>
							        </thead>
							        <tfoot>
								        <tr>
								          <th>UEN</th>
				                          <th>公司名称</th>                         
				                          <th>注册日期</th>
				                          <th>年审时间</th>
				                          <th>财务年度时间</th>
				                          <th>信息修改</th>                                                                                                    
				                          <th>备注</th>  	
								        </tr>
								    </tfoot>
							    </table>
							</div>
		
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
		        </section>
		      </div> 	        
			<table style="float: right">
	      		<tr>
					<td class="badge badge-danger" colspan="5">
						<form method="get" action="/api/admin/export/allCompanies">
							<input type="button" value="导出文件" class="label" onclick="exportFile('export')"/>
						</form>
					</td>
				</tr>
		    </table>		   
        </section>
      </div>
      
      <jsp:include page="../footer.jsp" />

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
  <script src="../../../assets/js/admin_editRecord.js"></script>
</body>
</html>
