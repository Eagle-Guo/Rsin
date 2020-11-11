<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<div class="navbar-bg"></div>

<jsp:include page="header.jsp" />

<!-- left side menu  -->
<div class="main-sidebar">
	<aside id="sidebar-wrapper">
		<div class="sidebar-brand">
			<a href="/notice/notice">睿信集团</a>
		</div>
		<div class="sidebar-brand sidebar-brand-sm">
			<a href="/notice/notice">睿信</a>
		</div>
		
		<security:authorize access="hasAnyRole('ROLE_USER')">	 
			<ul class="sidebar-menu">
				<li class="menu-header">后台管理</li>
				<li class="">
					<a href="/notice/notice" class="nav-link">
						<i class="fas fa-fire"></i>
						<span>最新通告</span>
					</a>
				</li>
				<li class="">
					<a href="/toDoList" class="nav-link">
						<i class="fas fa-square"></i>
						<span>待办事项</span>
					</a>
				</li>			
				<li class="menu-header">快速服务</li>
				<li class="">
					<a href="/onekey/oneKeyService" class="nav-link">
						<i class="fas fa-columns"></i>
						<span>所有服务</span>
					</a>
				</li>							
				<li class="menu-header">我的业务</li>
				<li class="">
					<a href="/mybusiness/myRecord" class="nav-link">
						<i class="fas fa-th-large"></i>
						<span>我的业务</span>
					</a>
				</li>			
				<li class="">
					<a href="#" class="nav-link">
						<i class="fas fa-file-alt"></i>
						<span>我的付款</span>
					</a>
				</li>																	
				<li class="nav-item dropdown">
					<a href="#" class="nav-link has-dropdown"><i class="fas fa-map-marker-alt"></i>
						<span>我的帐号</span></a>
					<ul class="dropdown-menu">
						<li><a href="coming.html">个人帐户信息</a></li>
					</ul>
				</li>
				<li class="nav-item dropdown">
					<a href="#" class="nav-link has-dropdown"><i class="fas fa-plug"></i> <span>帮助中心</span></a>
				</li>
			</ul>
		</security:authorize>

		<security:authorize access="hasAnyRole('ROLE_ADMIN')">
			<ul class="sidebar-menu">
            <li class="menu-header">管理员后台</li>
            <li><a href="/notice/admin_notice" class="nav-link"><i class="fas fa-fire"></i><span>最新通知设置</span></a></li>
            <li>
                <a href="/todolist/admin_toDoList" class="nav-link"><i class="fas fa-square"></i><span>待办事项</span></a>
            </li>
            <li class="menu-header">快速服务</li>
            <li>
                <a href="/mybusiness/admin_record" class="nav-link"><i class="fas fa-columns"></i><span>业务报表查询</span></a>
            </li>            
            <!--<li class="nav-item dropdown">
                <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-columns"></i> <span>业务报表查询</span></a>
                <ul class="dropdown-menu">
                    <li><a class="nav-link" href="/mybusiness/newCompany">新加坡公司注册</a></li>
                    <li><a class="nav-link" href="/mybusiness/openAccount">新加坡银行开户</a></li>
                    <li><a class="nav-link" href="/onekey/oneKeyService">离岸银行开户</a></li>
                    <li><a class="nav-link" href="/onekey/oneKeyService">新加坡商标与执照申请</a></li>
                    <li><a class="nav-link" href="/onekey/oneKeyService">新加坡消费税申请</a></li>
                    <li><a class="nav-link" href="/onekey/oneKeyService">新加坡公司年审</a></li>
                    <li><a class="nav-link" href="/onekey/oneKeyService">新加坡会计服务</a></li>
                    <li><a class="nav-link" href="/onekey/oneKeyService">呼叫转移服务</a></li>
                    <li><a class="nav-link" href="/onekey/oneKeyService">新加坡共享办公室</a></li>
                </ul>
            </li>  -->
            <li class="menu-header">客户清单</li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-th-large"></i> <span>客户清单</span></a>
            </li>
            <li class="nav-item dropdown">
                <a href="#" class="nav-link has-dropdown"><i class="far fa-file-alt"></i> <span>收款明细</span></a>
            </li>
        </ul>
		</security:authorize>
		<div class="mt-4 mb-4 p-3 hide-sidebar-mini">
			<a href="https://getstisla.com/docs"
				class="btn btn-primary btn-lg btn-block btn-icon-split"> <i
				class="fas fa-rocket"></i> 支持文档
			</a>
		</div>
	</aside>
</div>
