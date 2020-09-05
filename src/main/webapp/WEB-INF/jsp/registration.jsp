<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>注册  &mdash;  睿信集团</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
  <link rel="stylesheet" href="../assets/css/intlTel/intlTelInput.css">
  <link rel="stylesheet" href="./assets/css/intlTel/demo.css">
  <link rel="stylesheet" href="./assets/css/intlTel/countrySelect.css">
  
  <!-- Template CSS -->
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/components.css">
 <style> 
 ::-webkit-input-placeholder {
  color: gray;
}
:-moz-placeholder {/* Firefox 18- */
  color: gray;
}
::-moz-placeholder{/* Firefox 19+ */
 color: gray;
}
:-ms-input-placeholder {
  color: gray;
}
 </style>
  
  
</head>

<body>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">
            <div class="login-brand">
              <a href="/"><img src="../../assets/img/login_logo.jpg" alt="logo" width="100" class="shadow-light rounded-circle"></a>
            </div>

            <div class="card card-primary" >
              <div class="card-header"><h4>注册</h4></div>

              <div class="card-body">
              	<span>${errorMsg}</span> <br/>

                <form:form action="/register" method="post" modelAttribute="userRegistration">
                  <div class="row">
                    <div class="form-group col-6">
                      <form:label path="firstName">名</form:label>
                      <form:input id="firstName" type="text" class="form-control" path="firstName"  placeholder="名" />
                    </div>
                    <div class="form-group col-6">
                      <form:label path="lastName">姓</form:label>
                      <form:input id="lastName" type="text" class="form-control" path="lastName"  placeholder="姓" />
                    </div>
                  </div>
                  <div class="row">
	                  <div class="form-group col-6">
	                   	<label for="email">邮箱</label>
						<input id="email" type="email" class="form-control" placeholder="邮箱" name="email" required oninvalid="this.setCustomValidity('邮箱不能为空,请输入正确的邮箱！')" onchange="this.setCustomValidity('')"/>
	                    <div class="invalid-feedback">
	                    </div>
	                  </div>                  
	                  <div class="form-group col-6">
	                   	 <label for="phone">手机号码</label><br/>
	                   	 <form:input id="phone" type="text" class="telinput chcss" placeholder="手机号码" path="phone" />
	                  </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-6">
                      <form:label path="password" class="d-block">密码</form:label>
                      <form:input id="password" type="password" class="form-control pwstrength" data-indicator="pwindicator" path="password" required="required"  placeholder="密码" />
                      <div id="pwindicator" class="pwindicator">
                        <div class="bar"></div>
                        <div class="label"></div>
                      </div>
                    </div>
                    <div class="form-group col-6">
                      <label class="d-block">确认密码</label>
                      <input id="confirm_password" type="password" class="form-control" name="confirm_password" required  placeholder="确认密码"  />
                    </div>
                  </div>

                  <div class="form-divider"> 地址  </div>
                  <div class="row">
                    <div class="form-group col-6">
                      <form:label path="country">国家</form:label>
						<div class="form-item">
							<form:input id="country"  class="telinput chcss" path="country" type="text" />
							<label for="country" style="display:none;">Select a country here...</label>
						</div>
                    </div>                                   
                    <div class="form-group col-6">
                      <form:label path="province">城市</form:label>
                      <form:input id="province" path="province" type="text" class="form-control" placeholder="城市" />
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-6">
                      <form:label path="city">地址</form:label>
                      <form:input id="city" type="text" class="form-control" path="city"  placeholder="地址" />
                    </div>
                    <div class="form-group col-6">
                      <form:label path="postalCode">邮政编号</form:label>
                      <form:input id="postalCode" type="text" class="form-control" path="postalCode"  placeholder="邮政编号" />
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="custom-control custom-checkbox">
                    	<input type="checkbox" name="agree" class="custom-control-input" id="agree" required oninvalid="this.setCustomValidity('请确认并接受本条款!！')" onchange="this.setCustomValidity('')"/>
                     	<label class="custom-control-label" for="agree">我 阅读并接受条款</label>
                    </div>
                  </div>

                  <div class="form-group">
                    <form:button type="submit" class="btn btn-primary btn-lg btn-block"> 注册  </form:button>
                  </div><br/><br/><br/>
                </form:form>
              </div>
            </div>
            <div class="simple-footer">版权所有 &copy; 睿信集团 2020</div>
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
  <script src="../assets/js/intlTel/intlTelInput.js"></script>

  <!-- JS Libraies -->
  <script src="../node_modules/jquery-pwstrength/jquery.pwstrength.min.js"></script>
  <script src="../node_modules/selectric/public/jquery.selectric.min.js"></script>

  <!-- Template JS File -->
  <script src="../assets/js/scripts.js"></script>
  <script src="../assets/js/custom.js"></script>

  <!-- Page Specific JS File -->
  <script src="../assets/js/page/auth-register.js"></script>
  
  <!-- CountrySelect JS File --> 
  <script src="../assets/js/intlTel/countrySelect.js"></script>
  
  
  <script type="text/javascript" >
	  var input = document.querySelector("#phone");
	  window.intlTelInput(input, {
	    // any initialisation options go here
	  });
  	  var password = document.getElementById("password");
  	  var confirm_password = document.getElementById("confirm_password");

	function validatePassword(){
	  if(password.value != confirm_password.value) {
	    confirm_password.setCustomValidity("两次输入的密码不一致!");
	  } else {
	    confirm_password.setCustomValidity('');
	  }
	}
	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;


	$("#country").countrySelect({
		// defaultCountry: "jp",
		// onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
		// responsiveDropdown: true,
		preferredCountries: ['sg', 'cn', 'my']
	});
	
  </script>
</body>
</html>
