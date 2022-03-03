<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
  <!-- table sorter -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/css/jquery.tablesorter.pager.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/jquery.tablesorter.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/extras/jquery.tablesorter.pager.min.js"></script>

  <style type="text/css">
	.tableheader {
		font-family: verdana, arial, helvetica, sans-serif;
		font-size: 14px;
		color: #FFFFFF;
		font-weight: bold;
		background: #3964A9;
		text-align: center;
	}
	.tableRowEven {
		background-color: #F2F2F2;
		font-family:Verdana, Arial, Helvetica, sans-serif;
		font-size: 14px;
		line-height: normal;
		color: #FFFFFF;
	}
	.tableRowOdd {
		background-color: #CCCCCC;
		font-family:Verdana, Arial, Helvetica, sans-serif;
		font-size: 14px;
		line-height: normal;
		color: #FFFFFF;
	}
	.label {
	color: black;
	}
  </style>

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
                    <div class="clearfix mb-3"></div>

					<div class="table-responsive">
                   		<table id="companysTable" class="tablesorter" border="0" cellpadding="2" cellspacing="1" width="100%">
                   			<thead>
                   				<tr>
                   					<th class="tableheader header headerSortDown" width="5%">序号</th>
                   					<th class="tableheader header" width="30%">公司名称</th>
                                	<th class="tableheader header" width="30%">公司备用名称</th>
                                    <th class="tableheader header" width="10%">UEN</th>
                                    <th class="tableheader header" width="10%">待办服务</th>
                                    <th class="tableheader header" width="10%">待办日期</th>
                                    <th class="tableheader header" width="15%">待办事项</th>
                                </tr>
                   			</thead>
                   			<tbody>
                   			 	<c:forEach items="${allCompanies}" var="company" varStatus="companyStatus">
                    			 	<tr align="right">
                    			 		<td class="label" align="center">
                    						<c:out value="${companyStatus.index+1}"/>
                    					</td>
                    					<td class="label" align="center">
                    						<c:out value="${company.name}"/>
	                                    </td>
	                                    <td class="label" align="center">
                    						<c:out value="${company.backupName}"/>
	                                    </td>
	                                    <td class="label" align="center">
	                                    	<c:out value="${company.uen}"/>
	                                    </td>
	                                    <td class="label" align="center">
	                                    	<c:out value="${company.service}"/>
	                                    </td>
	                                    <td class="label" align="center">
	                                    	<fmt:formatDate pattern="dd/MM/yyyy" value="${company.dueDate}" />
	                                    </td>
	                                    <td class="label" align="center">
	                                        <c:forEach var="companyDetail" items="${companiesServices}">
											    <c:if test="${company.name eq companyDetail.name}">
											       <div class="badge badge-danger"><a href="/admin/adminManageCompany?id=${company.id}" target="_blank">新公司注册</a></div> 
											    </c:if>
											</c:forEach>
	                                    	<c:forEach var="companyTimetable" items="${companyTimetables}">
											    <c:if test="${company.name eq companyTimetable.name}">
											       <div class="badge badge-danger"><a href="/admin/adminTimeLine?id=${company.id}" target="_blank">时间表</a></div> 
											    </c:if>
											</c:forEach>
	                                    </td>
                    				</tr>
                                  	</c:forEach>
                   			</tbody>
                           </table>
					</div>
					<div id="pager" class="pager">
						<form>
							<img src="../../../assets/icons/first.png" class="first"/>
							<img src="../../../assets/icons/prev.png" class="prev"/>
							<input type="text" class="pagedisplay"/>
							<img src="../../../assets/icons/next.png" class="next"/>
							<img src="../../../assets/icons/last.png" class="last"/>
							<select class="pagesize">
								<option value="10" selected="selected">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="40">40</option>
							</select>
						</form>
						<!-- <table style="float: right">
				      		<tr>
								<td class="badge badge-danger" colspan="5">
									<form method="get" action="file.doc">
									   <button type="submit" class="label">导出文件</button>
									</form>
								</td>
							</tr>
					    </table> -->
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
      
      <jsp:include page="../footer.jsp" />  
  

  <!-- General JS Scripts -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../../../assets/js/admin_toDolist.js"></script>
  
  
</body>
</html>
