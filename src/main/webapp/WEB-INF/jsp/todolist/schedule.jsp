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
  <link rel="stylesheet" href="../../../assets/css/multiplepage.css">
  <link rel="stylesheet" href="../../../assets/css/jquery-ui.css">
  <!-- TimeLine CSS -->  
  <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
  <link href="../../../assets/css/timeline.min.css" rel="stylesheet">  
</head>

<body>
<jsp:include page="../userMenu.jsp" />
      <!-- Main Content -->
      <div class="main-content">
        <section class="section" id="">
          <div class="section-header">
            <h1>时间表</h1>
          </div> 
			 <!--<div class="timeline">
			  <div class="container done left">
			    <div class="content">
			      <h5>11.11.2018</h5>
			      <p>注册日期</p>
			    </div>
			  </div>
			  <div class="container notFinish right">
			    <div class="content">
			      <h5>31.10.2019</h5>
			      <p>公司年审</p>
			    </div>
			  </div>
			  <div class="container now left">
			    <div class="content">
			      <h5>11.11.2020</h5>
			      <p>现在日期</p>
			    </div>
			  </div>
			  <div class="container right">
			    <div class="content">
			      <h5>31.10.2021</h5>
			      <p>公司年审</p>
			    </div>
			  </div>
			  <div class="container left">
			    <div class="content">
			      <h5>31.10.2022</h5>
			      <p>公司年审</p>
			    </div>
			  </div>
			</div>
			<br/><br/>
			<div class="row">
				<div class="col-12 col-md-1 col-lg-1">	
					<div class="doneBall"></div><span>完成事项</span>                  
				</div>
				<div class="col-12 col-md-1 col-lg-1">	
					<div class="needToDoBall"></div><span>末来事项</span>
				</div>		
				<div class="col-12 col-md-1 col-lg-1">	
					<div class="notFinishBall"></div><span>待处理</span>		                  
				</div>																									
			</div>-->
       
   <main style="margin:50px 0 0px 0">
    <h1></h1>
    <section class="page-section">
      <div class="container">
        <div class="timeline">
          <div class="timeline__wrap">
            <div class="timeline__items">
              <div class="timeline__item done">
                <div class="timeline__content">
                  <h2>11/11/2018</h2>
                  <p>注册日期</p>
                </div>
              </div>
              <div class="timeline__item notFinish">
                <div class="timeline__content">
                  <h2>31/10/2019</h2>
                  <p>公司年审</p>
                </div>
              </div>
              <div class="timeline__item  now">
                <div class="timeline__content">
                  <h2>11/11/2020</h2>
                  <p>现在日期</p>
                </div>
              </div>
              <div class="timeline__item">
                <div class="timeline__content">
                  <h2>4/1/2021</h2>
                  <p>报帐</p>
                </div>
              </div>              
              <div class="timeline__item">
                <div class="timeline__content">
                  <h2>4/2/2021</h2>
                  <p>报帐</p>
                </div>
              </div>              
              <div class="timeline__item">
                <div class="timeline__content">
                  <h2>4/3/2021</h2>
                  <p>报帐</p>
                </div>
              </div>                            
              <div class="timeline__item">
                <div class="timeline__content">
                  <h2>31/10/2021</h2>
                  <p>公司年审</p>
                </div>
              </div>
              <div class="timeline__item">
                <div class="timeline__content">
                  <h2>31/10/2022</h2>
                  <p>公司年审</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    			<br/><br/>
			<div class="row">
				<div class="col-12 col-md-1 col-lg-1">	
					<div class="doneBall"></div><span>完成事项</span>                  
				</div>
				<div class="col-12 col-md-1 col-lg-1">	
					<div class="needToDoBall"></div><span>末来事项</span>
				</div>		
				<div class="col-12 col-md-1 col-lg-1">	
					<div class="notFinishBall"></div><span>待处理</span>		                  
				</div>																									
			</div>
  </main>      
 <script type="text/javascript" src="../../../assets/js/timeline.min.js"></script>
  <script>
    timeline(document.querySelectorAll('.timeline'), {
      forceVerticalMode: 700,
      mode: 'horizontal',
      verticalStartPosition: 'left',
      visibleItems: 6
    });
  </script>      
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
