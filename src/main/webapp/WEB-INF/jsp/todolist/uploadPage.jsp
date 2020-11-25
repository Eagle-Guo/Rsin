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
        <section class="section" id="onlineSignature">
          <div class="section-header">
            <h1>在线上传资料</h1>
          </div>    
          <div class="row">
            <div class="col-lg-4 col-md-12 col-12 col-sm-12">
              <div class="card">
                <div class="card-header">
                  <h4>待上传资料清单</h4>
                </div>
                <div class="card-body fixcardhieht">
                  <ul class="list-unstyled list-unstyled-border">
                  
                    <li class="media leftTab active"  id="b-1" onclick="viewPri(1)" onmouseover="viewPri(1)" >
                      <div class="media-body">

                        <div class="">IC(正面)</div>
                        <input type="file" name="fileName" id="fileICFront" accept="image/png, image/jpeg, image/jpg" onchange="checkReviewImage('#fileICFront', '#onLoadImageICFront')">
    					<input type="button" id="submitBtn" class="float-right list_btn"  onclick="checkSubmit('#fileICFront', '11')" value="确认上传"/>
                      </div>
                    </li>
                    <li class="media leftTab active"  id="b-2" onclick="viewPri(2)" onmouseover="viewPri(2)" >
                      <div class="media-body">
                   
                        <div class="">IC(背面) </div>           
                        <input type="file" name="fileName" id="fileICBack" accept="image/png, image/jpeg, image/jpg" onchange="checkReviewImage('#fileICBack', '#onLoadImageICBack')">
    					<input type="button" id="submitBtn" class="float-right list_btn"  onclick="checkSubmit('#fileICBack', '12')" value="确认上传"/>            
                      </div>
                    </li>
                    <li class="media leftTab active"  id="b-3" onclick="viewPri(3)" onmouseover="viewPri(3)" >
                      <div class="media-body">
                     
                        <div class="">护照（有照片页）</div>
						<input type="file" name="fileName" id="filePassport" accept="image/png, image/jpeg, image/jpg" onchange="checkReviewImage('#filePassport', '#onLoadImagePassport')">
    					<input type="button" id="submitBtn" class="float-right list_btn"  onclick="checkSubmit('#filePassport', '13')" value="确认上传"/>
                      </div>
                    </li>   
                    <li class="media leftTab active"  id="b-4" onclick="viewPri(4)" onmouseover="viewPri(4)" >
                      <div class="media-body">
              
                        <div class="">中国身份证</div>
                        <input type="file" name="fileName" id="filePRCIC" accept="image/png, image/jpeg, image/jpg" onchange="checkReviewImage('#filePRCIC', '#onLoadImagePRCIC')">
    					<input type="button" id="submitBtn" class="float-right list_btn"  onclick="checkSubmit('#filePRCIC', '14')" value="确认上传"/>                    
                      </div>
                    </li>
                     <li class="media leftTab active"  id="b-5" onclick="viewPri(5)" onmouseover="viewPri(5)" >
                      <div class="media-body">
              
                        <div class="">住所证明 </div>
                        <input type="file" name="fileName" id="fileAddress" accept="image/png, image/jpeg, image/jpg" onchange="checkReviewImage('#fileAddress', '#onLoadImageAddress')">
    					<input type="button" id="submitBtn" class="float-right list_btn"  onclick="checkSubmit('#fileAddress', '15')" value="确认上传"/>
                      </div>
                    </li>
                    <li class="media leftTab active"  id="b-6" onclick="viewPri(6)" onmouseover="viewPri(6)" >
                      <div class="media-body">
                   
                        <div class="">持护照（打开有照片页）上半身照</div>
                        <input type="file" name="fileName" id="filePersonalPhoto" accept="image/png, image/jpeg, image/jpg" onchange="checkReviewImage('#filePersonalPhoto', '#onLoadImagePersonalPhoto')">
    					<input type="button" id="submitBtn" class="float-right list_btn"  onclick="checkSubmit('#filePersonalPhoto', '16')" value="确认上传"/>
                      </div>
                    </li>                      
                  </ul>                                                     
                </div>
              </div>
            </div>
            <div class="col-lg-8 col-md-12 col-12 col-sm-12">                        
              <div class="card priDesc view img"  id="b1" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>IC(正面)</b></h4><br/>
                     <div id="onLoadImageICFront"></div>
                </div>
              </div>              
              <div class="card priDesc  img"  id="b2" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>IC(背面)</b></h4><br/>
                     <div id="onLoadImageICBack"></div>
                </div>
              </div>   
               <div class="card priDesc  img"  id="b3" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>护照（有照片页）</b></h4><br/>
                     <div id="onLoadImagePassport"></div>
                </div>
              </div>              
              <div class="card priDesc  img"  id="b4" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>中国身份证</b></h4><br/>
                     <div id="onLoadImagePRCIC"></div>
                </div>
              </div>               
              <div class="card priDesc  img"  id="b5" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>住所证明</b></h4><br/>
                     <div id="onLoadImageAddress"></div>
                </div>
              </div>               
              <div class="card priDesc  img"  id="b6" >
                <div class="card-header">
                  <h4>文件查看区</h4>
                </div>
                <div class="card-body fixcardhieht">
                     <h4><b>持护照（打开有照片页）上半身照</b></h4><br/>
                     <div id="onLoadImagePersonalPhoto"></div>
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
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../../../assets/js/uploadPage.js"></script>
  <script src="../../../assets/js/stisla.js"></script>
    <!-- Template JS File -->
  <script src="../../../assets/js/scripts.js"></script>
  <script src="../../../assets/js/custom.js"></script>
</body>
</html>
