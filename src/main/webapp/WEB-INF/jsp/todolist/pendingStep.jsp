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
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="../../assets/css/style.css">
  <link rel="stylesheet" href="../../assets/css/components.css">
</head>

<body>
<jsp:include page="../userMenu.jsp" />
      <!-- Main Content -->
      <div class="main-content">
        <section class="section" >
          <div class="section-header">
            <h1>待完成服务步骤</h1>
          </div>    
      <div class="">
        <section class="section">
          <div class="section-header">
            <h1>公司- ${company.name} 注册步骤</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="#">继续</a></div>
              <div class="breadcrumb-item">删除</div>
            </div>
          </div>
          <div class="section-body">
            <div class="row">
              <div class="col-12  col-md-6 col-lg-6">
                <div class="activities">
                  <div class="activity">
                    <div class="activity-icon bg-primary text-white shadow-primary">
                      <i class="fas fa-comment-alt"></i>
                    </div>
                    <div class="activity-detail">
                      <div class="mb-2">
                        <span class="text-job">${statusTime.services != null? statusTime.services: "待完成。。。"}</span>
                        <span class="bullet"></span>
                        <a class="text-job" href="#">查看</a>
                      </div>
                      <p>已选择了公司注册服务类型</p>
                    </div>
                  </div>
                  <div class="activity">
                    <div class="activity-icon bg-primary text-white shadow-primary">
                      <i class="fas fa-arrows-alt"></i>
                    </div>
                    <div class="activity-detail">
                      <div class="mb-2">
                        <span class="text-job">${statusTime.information != null? statusTime.information: "待完成。。。"}</span>
                        <span class="bullet"></span>
                        <a class="text-job" href="#">查看</a>
                      </div>
                      <p>已完成公司注册信息填报内容</p>
                    </div>
                  </div>
                  <div class="activity">
                    <div class="activity-icon bg-primary text-white shadow-primary">
                      <i class="fas fa-sign-out-alt"></i>
                    </div>
                    <div class="activity-detail">
                      <div class="mb-2">
                        <span class="text-job text-primary">${statusTime.payment != null? statusTime.payment: "待完成。。。"}</span>
                      </div>
                      <p>在线支付</p>
                    </div>
                  </div>
                  <div class="activity">
                    <div class="activity-icon bg-primary text-white shadow-primary">
                      <i class="fas fa-sign-out-alt"></i>
                    </div>
                    <div class="activity-detail">
                      <div class="mb-2">
                        <span class="text-job  text-primary">${statusTime.signature != null? statusTime.signature: "待完成。。。"}</span>
                      </div>
                      <p>电子签名</p>
                    </div>
                  </div>
                  <div class="activity">
                    <div class="activity-icon bg-primary text-white shadow-primary">
                      <i class="fas fa-sign-out-alt"></i>
                    </div>
                    <div class="activity-detail">
                      <div class="mb-2">
                        <span class="text-job  text-primary">${statusTime.uploadfile != null? statusTime.uploadfile: "待完成。。。"}</span>
                      </div>
                      <p>上传资料</p>
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
  <script src="../../../assets/js/uploadPage.js"></script>
   <script src="../assets/js/stisla.js"></script>
</body>
</html>
