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
  <link rel="stylesheet" href="../../../assets/css/style.css">
  <link rel="stylesheet" href="../../../assets/css/components.css">
</head>

<body>
<jsp:include page="../userMenu.jsp" />
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>最新通告设置</h1>
          </div>
      <div class="admin_notice">
        <section class="section">
          <div class="section-body">
            <div class="row mt-4">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>全部通告</h4>
		            <div class="section-header-button">
		              <a href="/notice/admin_notice_create" class="btn btn-primary">增加通知</a>
		            </div>
                  </div>
                  <div class="card-body">
                <div class="float-left" style="display:inline;">
                  <div class="">
                    <ul class="nav nav-pills">
                      <li class="nav-item">
                        <a class="nav-link active" href="#">全部<span class="badge badge-white">5</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">过期通告<span class="badge badge-primary">4</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">有效通告 <span class="badge badge-primary">1</span></a>
                      </li>
                    </ul>
                  </div>
                </div>
                    <div class="float-right"  style="display:inline;">
                      <form>
                        <div class="input-group">
                          <input type="text" class="form-control" placeholder="Search">
                          <div class="input-group-append">
                            <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                          </div>
                        </div>
                      </form>
                    </div>

                    <div class="clearfix mb-3"></div>

                    <div class="table-responsive">
                      <table class="table table-striped">
                        <tr>
                          <th class="text-center pt-2">
                          </th>
                          <th>通告名称</th>
                          <th>类型</th>
                          <th>通告人</th>
                          <th>创建日期</th>
                          <th>有效日期</th>                          
                          <th>状态</th>
                        </tr>
                        <tr>
                          <td>
                            <div class="custom-checkbox custom-control">
                              <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-2">
                              <label for="checkbox-2" class="custom-control-label">&nbsp;</label>
                            </div>
                          </td>
                          <td>通告名称1
                            <div class="table-links">
                              <a href="#">查看</a>
                              <div class="bullet"></div>
                              <a href="#">编辑</a>
                              <div class="bullet"></div>
                              <a href="#" class="text-danger">删除</a>
                            </div>
                          </td>
                          <td>
                            <a href="#">通知类型</a>,
                            <a href="#">所属</a>
                          </td>
                          <td>2020-01-20</td>
                          <td>2020-02-20</td>
                          <td><div class="badge badge-primary">有效通告中</div></td>
                        </tr>
                        <tr>
                          <td>
                            <div class="custom-checkbox custom-control">
                              <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-1">
                              <label for="checkbox-1" class="custom-control-label">&nbsp;</label>
                            </div>
                          </td>
                          <td>通告名称2
                            <div class="table-links">
                              <a href="#">查看</a>
                              <div class="bullet"></div>
                              <a href="#">编辑</a>
                              <div class="bullet"></div>
                              <a href="#" class="text-danger">删除</a>
                            </div>
                          </td>
                          <td>
                            <a href="#">通知类型</a>,
                            <a href="#">所属</a>
                          </td>
                          <td>2020-01-20</td>
                          <td>2020-01-30</td>
                          <td><div class="badge badge-warning">通知过期</div></td>
                        </tr>
                        <tr>
                          <td>
                            <div class="custom-checkbox custom-control">
                              <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-1">
                              <label for="checkbox-1" class="custom-control-label">&nbsp;</label>
                            </div>
                          </td>
                          <td>通告名称2
                            <div class="table-links">
                              <a href="#">查看</a>
                              <div class="bullet"></div>
                              <a href="#">编辑</a>
                              <div class="bullet"></div>
                              <a href="#" class="text-danger">删除</a>
                            </div>
                          </td>
                          <td>
                            <a href="#">通知类型</a>,
                            <a href="#">所属</a>
                          </td>
                          <td>2020-01-20</td>
                          <td>2020-01-30</td>
                          <td><div class="badge badge-warning">通知过期</div></td>
                        </tr>                        
                        <tr>
                          <td>
                            <div class="custom-checkbox custom-control">
                              <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-1">
                              <label for="checkbox-1" class="custom-control-label">&nbsp;</label>
                            </div>
                          </td>
                          <td>通告名称2
                            <div class="table-links">
                              <a href="#">查看</a>
                              <div class="bullet"></div>
                              <a href="#">编辑</a>
                              <div class="bullet"></div>
                              <a href="#" class="text-danger">删除</a>
                            </div>
                          </td>
                          <td>
                            <a href="#">通知类型</a>,
                            <a href="#">所属</a>
                          </td>
                          <td>2020-01-20</td>
                          <td>2020-01-30</td>
                          <td><div class="badge badge-warning">通知过期</div></td>
                        </tr>                        
                        <tr>
                          <td>
                            <div class="custom-checkbox custom-control">
                              <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input" id="checkbox-1">
                              <label for="checkbox-1" class="custom-control-label">&nbsp;</label>
                            </div>
                          </td>
                          <td>通告名称2
                            <div class="table-links">
                              <a href="#">查看</a>
                              <div class="bullet"></div>
                              <a href="#">编辑</a>
                              <div class="bullet"></div>
                              <a href="#" class="text-danger">删除</a>
                            </div>
                          </td>
                          <td>
                            <a href="#">通知类型</a>,
                            <a href="#">所属</a>
                          </td>
                          <td>2020-01-20</td>
                          <td>2020-01-30</td>
                          <td><div class="badge badge-warning">通知过期</div></td>
                        </tr>                        
                        
                        
                      </table>
                    </div>
                    <div class="float-right">
                      <nav>
                        <ul class="pagination">
                          <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                              <span class="sr-only">Previous</span>
                            </a>
                          </li>
                          <li class="page-item active">
                            <a class="page-link" href="#">1</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link" href="#">2</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link" href="#">3</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                              <span class="sr-only">Next</span>
                            </a>
                          </li>
                        </ul>
                      </nav>
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
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="../../../assets/js/stisla.js"></script>

  <!-- JS Libraies 
  <script src="../node_modules/simpleweather/jquery.simpleWeather.min.js"></script>
  <script src="../node_modules/chart.js/dist/Chart.min.js"></script>
  <script src="../node_modules/jqvmap/dist/jquery.vmap.min.js"></script>
  <script src="../node_modules/jqvmap/dist/maps/jquery.vmap.world.js"></script>
  <script src="../node_modules/summernote/dist/summernote-bs4.js"></script>
  <script src="../node_modules/chocolat/dist/js/jquery.chocolat.min.js"></script>-->

  <!-- Template JS File -->
  <script src="../../../assets/js/scripts.js"></script>
  <script src="../../../assets/js/custom.js"></script>

  <!-- Page Specific JS File -->
  <script src="../../../assets/js/page/index-0.js"></script>
</body>
</html>
