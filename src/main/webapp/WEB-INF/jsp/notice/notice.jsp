<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>睿信集团&mdash; 控制面版</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

  <!-- Template CSS -->
  <link rel="stylesheet" href="../../assets/css/style.css">
  <link rel="stylesheet" href="../../assets/css/components.css">
</head>

<body>
<jsp:include page="../userMenu.jsp" />
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>后台管理</h1>
          </div>
          <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                  <i class="far fa-user"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>待办事项</h4>
                  </div>
                  <div class="card-body"> 2 </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-danger">
                  <i class="far fa-newspaper"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>未付款</h4>
                  </div>
                  <div class="card-body">
                    2
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-warning">
                  <i class="far fa-file"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>一键式服务平台</h4>
                  </div>
                  <div class="card-body">
                    36
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-success">
                  <i class="fas fa-circle"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>最新通告</h4>
                  </div>
                  <div class="card-body">
                   4
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row"  id="notice">
            <div class="col-lg-4 col-md-12 col-12 col-sm-12">
              <div class="card">
                <div class="card-header">
                  <h4>最近通告</h4>
                </div>
                <div class="card-body fixcardhieht">
                  <ul class="list-unstyled list-unstyled-border">
                    <li class="media leftTab active"  id="b-1" onclick="viewPri(1)" onmouseover="viewPri(1)" >
                      <img class="mr-3 rounded-circle" width="50" src="../assets/img/avatar/avatar-6.png" alt="avatar">
                      <div class="media-body">
                        <div class="float-right text-primary">Now</div>
                        <div class="media-title">最近通告标题1</div>
                        <span class="text-small text-muted">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>
                      </div>
                    </li>
                    <li class="media leftTab active"  id="b-2" onclick="viewPri(2)" onmouseover="viewPri(2)" >
                      <img class="mr-3 rounded-circle" width="50" src="../assets/img/avatar/avatar-6.png" alt="avatar">
                      <div class="media-body">
                        <div class="float-right">12m</div>
                        <div class="media-title">最近通告标题2</div>
                        <span class="text-small text-muted">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>
                      </div>
                    </li>

                    <li class="media leftTab active"  id="b-3" onclick="viewPri(3)" onmouseover="viewPri(3)" >
                      <img class="mr-3 rounded-circle" width="50" src="../assets/img/avatar/avatar-6.png" alt="avatar">
                      <div class="media-body">
                        <div class="float-right">12m</div>
                        <div class="media-title">最近通告标题3</div>
                        <span class="text-small text-muted">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>
                      </div>
                    </li>   
                    <li class="media leftTab active"  id="b-4" onclick="viewPri(4)" onmouseover="viewPri(4)" >
                      <img class="mr-3 rounded-circle" width="50" src="../assets/img/avatar/avatar-6.png" alt="avatar">
                      <div class="media-body">
                        <div class="float-right">12m</div>
                        <div class="media-title">最近通告标题4</div>
                        <span class="text-small text-muted">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>
                      </div>
                    </li> 
                  </ul>                                    
                  <div class="text-center pt-1 pb-1">
                    <a href="#" class="btn btn-primary btn-lg btn-round">
                      更多
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-8 col-md-12 col-12 col-sm-12">
              <div class="card priDesc"  id="b4" >
                <div class="card-header">
                  <h4>最近通告标题4444</h4>
                  <div class="card-header-action">
                    <div class="btn-group">                    
                      <a  class="btn btn-primary">日期</a>
                    </div>
                  </div>
                </div>
                <div class="card-body fixcardhieht">
                     <div class="media-title">段落标题</div>
                     <span class="text-small text-muted">内容展示：Cras sit amet nibh ls sit amet nibh libero, in gras sit amet nibh libero, in graibero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>                					   					   
                </div>
              </div>
              <div class="card priDesc"  id="b3" >
                <div class="card-header">
                  <h4>最近通告标题333</h4>
                  <div class="card-header-action">
                    <div class="btn-group">                    
                      <a  class="btn btn-primary">日期</a>
                    </div>
                  </div>
                </div>
                <div class="card-body fixcardhieht">
                     <div class="media-title">段落标题</div>
                     <span class="text-small text-muted">内容展示：Cras sit amet nibh s sit amet nibh libero, in gras sit amet nibh libero, in gras sit amet nibh libero, in gralibero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>                					   					   
                </div>
              </div>  
              <div class="card priDesc"  id="b2" >
                <div class="card-header">
                  <h4>最近通告标题22</h4>
                  <div class="card-header-action">
                    <div class="btn-group">                    
                      <a  class="btn btn-primary">日期</a>
                    </div>
                  </div>
                </div>
                <div class="card-body fixcardhieht">
                     <div class="media-title">段落标题</div>
                     <span class="text-small text-muted">内容展示：Cras sit amet nibh ls sit amet nibh libero, in gras sit amet nibh libero, in gras sit amet nibh libero, in gras sit amet nibh libero, in graibero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>                					   					   
                </div>
              </div>              
              <div class="card priDesc view"  id="b1" >
                <div class="card-header">
                  <h4>最近通告标题1</h4>
                  <div class="card-header-action">
                    <div class="btn-group">                    
                      <a  class="btn btn-primary">日期</a>
                    </div>
                  </div>
                </div>
                <div class="card-body fixcardhieht">
                     <div class="media-title">段落标题</div>
                     <span class="text-small text-muted">内容展示：Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.</span>                					   					   
                </div>
              </div>              
              
              
                          
            </div>

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




    <script type="text/javascript">
    
        function viewPri(x) {
            document.getElementsByClassName("leftTab active")[0].classList.remove("active");
            document.getElementsByClassName("priDesc view")[0].classList.remove("view");
            document.getElementById("b-" + x).classList.add("active");
            document.getElementById("b" + x).classList.add("view");
           /* document.getElementById("rightImgPri").src = "images/abroad/ca/Primary/sc/Ontario/fprivate" + x + ".jpg";*/
        }

        </script>

  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../assets/js/stisla.js"></script>

  <!-- JS Libraies -->
  <script src="../node_modules/simpleweather/jquery.simpleWeather.min.js"></script>
  <script src="../node_modules/chart.js/dist/Chart.min.js"></script>
  <script src="../node_modules/jqvmap/dist/jquery.vmap.min.js"></script>
  <script src="../node_modules/jqvmap/dist/maps/jquery.vmap.world.js"></script>
  <script src="../node_modules/summernote/dist/summernote-bs4.js"></script>
  <script src="../node_modules/chocolat/dist/js/jquery.chocolat.min.js"></script>

  <!-- Template JS File -->
  <script src="../assets/js/scripts.js"></script>
  <script src="../assets/js/custom.js"></script>

  <!-- Page Specific JS File -->
  <script src="../assets/js/page/index-0.js"></script>
</body>
</html>
