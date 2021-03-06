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
  <title>登录  &mdash;  睿信集团</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="../node_modules/bootstrap-social/bootstrap-social.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="../../assets/css/style.css">
  <link rel="stylesheet" href="../../assets/css/components.css">
  <link rel="stylesheet" href="../../assets/css/rsin.css">
  
  <script>
	  window.watsonAssistantChatOptions = {
	      integrationID: "03bcc283-79bf-4d6f-b557-d217f8b3c019", // The ID of this integration.
	      region: "us-south", // The region your integration is hosted in.
	      serviceInstanceID: "b27aa3d7-6130-4a0a-948a-25a012766cb7", // The ID of your service instance.
	      onLoad: function(instance) { instance.render(); }
	    };
	  setTimeout(function(){
	    const t=document.createElement('script');
	    t.src="https://web-chat.global.assistant.watson.appdomain.cloud/loadWatsonAssistantChat.js";
	    document.head.appendChild(t);
	  });
  </script>
  
</head>

<body>
  <div id="app">
    <section class="section">
      <div class="d-flex flex-wrap align-items-stretch">
        <div class="col-lg-4 col-md-6 col-12 order-lg-1 min-vh-100 order-2 bg-white">
          <div class="p-4 m-3">
            <img src="../../assets/img/login_logo.jpg" alt="logo" width="100" class="shadow-light rounded-circle mb-5 mt-2">
            <h4 class="text-dark font-weight-normal">欢迎登录 <span class="font-weight-bold">睿信集团管理系统</span></h4>
            <p class="text-muted">在您开始之前，请登录系统，或者您还没有创建帐户请点击 <a href="${pageContext.request.contextPath}/register">注册</a></p>
            <form method="POST" action="${contextPath}/login" class="needs-validation" novalidate="">
			
			  <span>${msg}</span>
              <div class="form-group">
                <label for="email"> 用户名</label>
                <input id="username" type="email" class="form-control" name="username" tabindex="1" required autofocus>
                <div class="invalid-feedback">请填写您的邮箱用户名 </div>
              </div>

              <div class="form-group">
                <div class="d-block">
                  <label for="password" class="control-label">密码</label>
                </div>
                <input id="password" type="password" class="form-control" name="password" tabindex="2" required>
                <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                <div class="invalid-feedback">请填写您的密码 </div>
              </div>
			  <span>${errorMsg}</span>
			  
              <div class="form-group">
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" name="remember-me" class="custom-control-input" tabindex="3" id="remember-me">
                  <label class="custom-control-label" for="remember-me">记住我</label>
                </div>
              </div>

              <div class="form-group text-right">
                <a href="auth-forgot-password.html" class="float-left mt-3"> 忘记密码?  </a>
                <button type="submit" class="btn btn-primary btn-lg btn-icon icon-right" tabindex="4">登录 </button>
              </div>

              <div class="mt-5 text-center">没还有账户? <a href="${pageContext.request.contextPath}/register">创建新账户</a>  <!--  <a href="auth-register.html">创建新账户</a> -->
              </div>
            </form>

            <div class="text-center mt-5 text-small">
                                版权所有 &copy; 睿信集团
              <div class="mt-2">
                <a href="#">隐私政策</a>
                <div class="bullet"></div>
                <a href="#">服务条款</a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-8 col-12 order-lg-2 order-1 min-vh-100 background-walk-y position-relative overlay-gradient-bottom" data-background="../../assets/img/unsplash/login-bg.jpg">
          <div class="absolute-bottom-left index-2">
            <div class="text-light p-5 pb-2">
              <div class="mb-5 pb-3">
                <h1 class="mb-2 display-4 font-weight-bold">早上好</h1>
                <h5 class="font-weight-normal text-muted-transparent">Bali, Indonesia</h5>
              </div>
              Photo by <a class="text-light bb" target="_blank">Justin Kauffman</a> on <a class="text-light bb" target="_blank">Unsplash</a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../assets/js/stisla.js"></script>

  <!-- Template JS File -->
  <script src="../assets/js/scripts.js"></script>
  <script src="../assets/js/custom.js"></script>
  
  <script>
  $(".toggle-password").click(function() {
	  $(this).toggleClass("fa-eye fa-eye-slash");
	  var input = $($(this).attr("toggle"));
	  if (input.attr("type") == "password") {
	    input.attr("type", "text");
	  } else {
	    input.attr("type", "password");
	  }
	});
  </script>

</body>
</html>