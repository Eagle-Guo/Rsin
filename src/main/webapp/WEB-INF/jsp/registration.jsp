<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>注册  &mdash;  睿信集团</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="../node_modules/selectric/public/selectric.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/components.css">
</head>

<body>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">
            <div class="login-brand">
              <img src="../../assets/img/login_logo.jpg" alt="logo" width="100" class="shadow-light rounded-circle">
            </div>

            <div class="card card-primary">
              <div class="card-header"><h4>注册</h4></div>

              <div class="card-body">
              
                <form:form action="/register" method="post" modelAttribute="user">
                  <div class="row">
                    <div class="form-group col-6">
                      <label for="frist_name">名</label>
                      <input id="frist_name" type="text" class="form-control" name="frist_name" autofocus />
                    </div>
                    <div class="form-group col-6">
                      <label for="last_name">姓</label>
                      <input id="last_name" type="text" class="form-control" name="last_name" />
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="email">邮箱</label>
                    <input id="email" type="email" class="form-control" name="email" />
                    <div class="invalid-feedback">
                    </div>
                  </div>

                  <div class="row">
                    <div class="form-group col-6">
                      <label for="password" class="d-block">密码</label>
                      <input id="password" type="password" class="form-control pwstrength" data-indicator="pwindicator" name="password" />
                      <div id="pwindicator" class="pwindicator">
                        <div class="bar"></div>
                        <div class="label"></div>
                      </div>
                    </div>
                    <div class="form-group col-6">
                      <label for="password2" class="d-block">确认密码</label>
                      <input id="password2" type="password" class="form-control" name="password-confirm" />
                    </div>
                  </div>

                  <div class="form-divider"> 地址  </div>
                  <div class="row">
                    <div class="form-group col-6">
                      <label>国家</label>
                      <select id="country" class="form-control selectric">
                        <option>新加坡</option>
                        <option>中国</option>
                        <option>马来西亚</option>
                        <option>泰国</option>
                        <option>印度尼西亚</option>
                      </select>
                    </div>
                    <div class="form-group col-6">
                      <label>省</label>
                      <input id="province" type="text" class="form-control" />
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-6">
                      <label>城市</label>
                      <input id="city" type="text" class="form-control" />
                    </div>
                    <div class="form-group col-6">
                      <label>邮政编号</label>
                      <input id="postalcode" type="text" class="form-control" />
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" name="agree" class="custom-control-input" id="agree" />
                      <label class="custom-control-label" for="agree">我 阅读并接受条款</label>
                    </div>
                  </div>

                  <div class="form-group">
                    <form:button type="submit" class="btn btn-primary btn-lg btn-block"> 注册  </form:button>
                  </div>
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
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../assets/js/stisla.js"></script>

  <!-- JS Libraies -->
  <script src="../node_modules/jquery-pwstrength/jquery.pwstrength.min.js"></script>
  <script src="../node_modules/selectric/public/jquery.selectric.min.js"></script>

  <!-- Template JS File -->
  <script src="../assets/js/scripts.js"></script>
  <script src="../assets/js/custom.js"></script>

  <!-- Page Specific JS File -->
  <script src="../assets/js/page/auth-register.js"></script>
</body>
</html>
