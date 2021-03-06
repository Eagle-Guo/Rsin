<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg main-navbar">
    <form class="form-inline mr-auto">
        <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
            <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
        </ul>
        <div class="search-element">
            <input class="form-control" type="search" placeholder="搜索" aria-label="Search" data-width="250">
            <button class="btn" type="submit">
                <i class="fas fa-search"></i>
            </button>
            <div class="search-backdrop"></div>

            <!-- header search -->
            <div class="search-result">
                <div class="search-header">历史记录</div>
                <div class="search-item">
                    <a href="mybusiness/newCompany">新建公司</a> <a href="#" class="search-close"><i class="fas fa-times"></i></a>
                </div>
                <div class="search-item">
                    <a href="#">公司名称查询</a> <a href="#" class="search-close"><i class="fas fa-times"></i></a>
                </div>
                <div class="search-item">
                    <a href="#">申请状态</a> <a href="#" class="search-close"><i class="fas fa-times"></i></a>
                </div>
                <div class="search-header">搜索结果</div>
                <div class="search-item">
                    <a href="#"> <img class="mr-3 rounded" width="30" src="../assets/img/products/product-3-50.png" alt="product">注册流程 </a>
                </div>
                <div class="search-item">
                    <a href="#"> <img class="mr-3 rounded" width="30" src="../assets/img/products/product-2-50.png" alt="product">注册文档 </a>
                </div>
                <div class="search-item">
                    <a href="#"> <img class="mr-3 rounded" width="30" src="../assets/img/products/product-1-50.png" alt="product">注册公司处理时间 </a>
                </div>
                <div class="search-header">快捷通道</div>
                <div class="search-item">
                    <a href="#">
                        <div class="search-icon bg-danger text-white mr-3">
                            <i class="fas fa-code"></i>
                        </div> 注册公司文档链接
                    </a>
                </div>
                <div class="search-item">
                    <a href="#">
                        <div class="search-icon bg-primary text-white mr-3">
                            <i class="fas fa-laptop"></i>
                        </div> 公司名称验证
                    </a>
                </div>
            </div>
        </div>
    </form>
    <ul class="navbar-nav navbar-right">
        <li class="dropdown dropdown-list-toggle">
        	<a href="#" data-toggle="dropdown" class="nav-link nav-link-lg message-toggle beep"><i class="far fa-envelope"></i></a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right">
                <div class="dropdown-header"> 消息
                    <div class="float-right"> <a href="#">标识所有为已读</a> </div>
                </div>
                <div class="dropdown-list-content dropdown-list-message">
                    <a href="#" class="dropdown-item dropdown-item-unread">
                        <div class="dropdown-item-avatar">
                            <img alt="image" src="../assets/img/avatar/avatar-1.png" class="rounded-circle">
                            <div class="is-online"></div>
                        </div>
                        <div class="dropdown-item-desc">
                            <b>管理员通知</b>
                            <p>您好，尊敬的客户</p>
                            <div class="time">1 小时前</div>
                        </div>
                    </a> 
                    <a href="#" class="dropdown-item dropdown-item-unread">
                        <div class="dropdown-item-avatar">
                            <img alt="image" src="../assets/img/avatar/avatar-2.png" class="rounded-circle">
                        </div>
                        <div class="dropdown-item-desc">
                            <b>系统消息</b>
                            <p>恭喜您成功注册了新的用户，以下是您的下一步</p>
                            <div class="time">8 小时前</div>
                        </div>
                    </a> 
                    <a href="#" class="dropdown-item dropdown-item-unread">
                        <div class="dropdown-item-avatar">
                            <img alt="image" src="../assets/img/avatar/avatar-3.png" class="rounded-circle">
                            <div class="is-online"></div>
                        </div>
                        <div class="dropdown-item-desc">
                            <b>系统消息</b>
                            <p>您好，我是的系统管家，您有任何问题可以在这里找到答案</p>
                            <div class="time">12 小时前</div>
                        </div>
                    </a> 
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-avatar">
                            <img alt="image" src="../assets/img/avatar/avatar-4.png" class="rounded-circle">
                        </div>
                        <div class="dropdown-item-desc">
                            <b>如何进行新公司的注册</b>
                            <p>恭喜您成为我们的客户， 您可以从根据以下资料</p>
                            <div class="time">16 小时前</div>
                        </div>
                    </a> 
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-avatar">
                            <img alt="image" src="../assets/img/avatar/avatar-5.png" class="rounded-circle">
                        </div>
                        <div class="dropdown-item-desc">
                            <b>新注册用户</b>
                            <p>恭喜您成功注册了新的用户，</p>
                            <div class="time">昨天</div>
                        </div>
                    </a>
                </div>
                <div class="dropdown-footer text-center">
                    <a href="#">查看所有 <i class="fas fa-chevron-right"></i></a>
                </div>
            </div>
        </li>
        <li class="dropdown dropdown-list-toggle">
        	<a href="#" data-toggle="dropdown" class="nav-link notification-toggle nav-link-lg beep"><i class="far fa-bell"></i></a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right">
                <div class="dropdown-header">通知
                    <div class="float-right">  <a href="#">标识所有为已读</a> </div>
                </div>
                <div class="dropdown-list-content dropdown-list-icons">
                    <a href="#" class="dropdown-item dropdown-item-unread">
                        <div class="dropdown-item-icon bg-primary text-white">
                            <i class="fas fa-code"></i>
                        </div>
                        <div class="dropdown-item-desc">
                            Template update is available now!
                            <div class="time text-primary">2 分钟前</div>
                        </div>
                    </a> 
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-icon bg-info text-white">
                            <i class="far fa-user"></i>
                        </div>
                        <div class="dropdown-item-desc">
                            <b>You</b> and <b>Dedik Sugiharto</b> are now friends
                            <div class="time">10 小时前</div>
                        </div>
                    </a> 
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-icon bg-success text-white">
                            <i class="fas fa-check"></i>
                        </div>
                        <div class="dropdown-item-desc">
                            <b>Kusnaedi</b> has moved task <b>Fix bug header</b> to <b>Done</b>
                            <div class="time">12 小时前</div>
                        </div>
                    </a> 
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-icon bg-danger text-white">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>
                        <div class="dropdown-item-desc">
                            Low disk space. Let's clean it!
                            <div class="time">17 小时前</div>
                        </div>
                    </a> 
                    <a href="#" class="dropdown-item">
                        <div class="dropdown-item-icon bg-info text-white">
                            <i class="fas fa-bell"></i>
                        </div>
                        <div class="dropdown-item-desc">
                            Welcome to template!
                            <div class="time">昨天</div>
                        </div>
                    </a>
                </div>
                <div class="dropdown-footer text-center">
                    <a href="#">查看所有 <i class="fas fa-chevron-right"></i></a>
                </div>
            </div>
        </li>
        <li class="dropdown">
        	<a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image" src="../assets/img/avatar/avatar-1.png" class="rounded-circle mr-1">
                <div class="d-sm-none d-lg-inline-block">您好，<%=session.getAttribute("loginUser")%></div>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <div class="dropdown-title">已登录5分钟</div>
                <a href="features-profile.html" class="dropdown-item has-icon"> <i class="far fa-user"></i> 个人资料 </a> 
                <a href="features-activities.html" class="dropdown-item has-icon"> <i class="fas fa-bolt"></i> 动态  </a> 
                <a href="features-settings.html" class="dropdown-item has-icon"> <i class="fas fa-cog"></i> 设置 </a>
                <div class="dropdown-divider"></div>
                <a href="/logout" class="dropdown-item has-icon text-danger"> <i class="fas fa-sign-out-alt"></i> 退出
                </a>
            </div>
        </li>
    </ul>
</nav>
