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
<jsp:include page="../menu.jsp" />
      <!-- Main Content -->
      <div class="main-content">
        <section class="section" id="onlineSignature">
          <div class="section-header">
            <h1>在线上传资料</h1>
          </div>    
          <div class="row">
            <div class="col-lg-6 col-md-12 col-12 col-sm-12">
              <div class="card">
                <div class="card-header">
                  <h4>待上传资料清单</h4>
                </div>
                <div class="card-body fixcardhieht">
                  <ul class="list-unstyled list-unstyled-border">
                  
                    <li class="media leftTab active"  id="b-1" onclick="viewPri(1)" onmouseover="viewPri(1)" >
                      <div class="media-body">
                        <div class="float-right list_btn">上传</div>
                        <div class="float-right list_btn marginright1">下载</div>
                        <div class="">IC(正面)</div>                       
                      </div>
                    </li>
                    <li class="media leftTab active"  id="b-2" onclick="viewPri(2)" onmouseover="viewPri(2)" >
                      <div class="media-body">
                         <div class="float-right list_btn">上传</div>
                        <div class="float-right list_btn  marginright1">下载</div>
                        <div class="">IC(背面) </div>                       
                      </div>
                    </li>
                    <li class="media leftTab active"  id="b-3" onclick="viewPri(3)" onmouseover="viewPri(3)" >
                      <div class="media-body">
                         <div class="float-right list_btn">上传</div>
                        <div class="float-right list_btn  marginright1">下载</div>
                        <div class="">护照（有照片页）</div>                       
                      </div>
                    </li>   
                    <li class="media leftTab active"  id="b-4" onclick="viewPri(4)" onmouseover="viewPri(4)" >
                      <div class="media-body">
                         <div class="float-right list_btn">上传</div>
                        <div class="float-right list_btn  marginright1">下载</div>
                        <div class="">中国身份证</div>                       
                      </div>
                    </li>
                     <li class="media leftTab active"  id="b-5" onclick="viewPri(5)" onmouseover="viewPri(5)" >
                      <div class="media-body">
                         <div class="float-right list_btn">上传</div>
                        <div class="float-right list_btn  marginright1">下载</div>
                        <div class="">住所证明 </div>                       
                      </div>
                    </li>
                    <li class="media leftTab active"  id="b-6" onclick="viewPri(6)" onmouseover="viewPri(6)" >
                      <div class="media-body">
                         <div class="float-right list_btn">上传</div>
                        <div class="float-right list_btn  marginright1">下载</div>
                        <div class="">持护照（打开有照片页）上半身照</div>                       
                      </div>
                    </li>                      
                  </ul>                                                     
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-12 col-12 col-sm-12">                        
              <div class="card priDesc view"  id="b1" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>IC(正面)</b></h4><br/>
                </div>
              </div>              
              <div class="card priDesc"  id="b2" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>IC(背面)</b></h4><br/>
                </div>
              </div>   
               <div class="card priDesc"  id="b3" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>护照（有照片页）</b></h4><br/>
                </div>
              </div>              
              <div class="card priDesc"  id="b4" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>中国身份证</b></h4><br/>
                </div>
              </div>               
              <div class="card priDesc"  id="b5" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>住所证明</b></h4><br/>
                </div>
              </div>               
              <div class="card priDesc"  id="b6" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>持护照（打开有照片页）上半身照</b></h4><br/>
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
  
  <script type="text/javascript">    
        function viewPri(x) {
            document.getElementsByClassName("leftTab active")[0].classList.remove("active");
            document.getElementsByClassName("priDesc view")[0].classList.remove("view");
            document.getElementById("b-" + x).classList.add("active");
            document.getElementById("b" + x).classList.add("view");
           /* document.getElementById("rightImgPri").src = "images/abroad/ca/Primary/sc/Ontario/fprivate" + x + ".jpg";*/
        }

        function openCity(evt, cityName) {
          var i, tabcontent, tablinks;
          tabcontent = document.getElementsByClassName("tabcontent");
          for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
          }
          tablinks = document.getElementsByClassName("tablinks");
          for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
          }
          document.getElementById(cityName).style.display = "block";
          evt.currentTarget.className += " active";
        }

	</script>
</body>
</html>
