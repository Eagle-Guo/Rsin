<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <ul class="sidebar-menu">
            <li class="menu-header">公司后台管理</li>
            <li><a href="/notice/notice" class="nav-link"><i
                    class="fas fa-fire"></i><span>最新通告</span></a></li>
            <li class="nav-item dropdown active"><a href="#" class="nav-link has-dropdown"><i class="fas fa-square beep"></i><span>待办事项</span></a>
                <ul class="dropdown-menu">
                    <li class="active"><a class="nav-link" href="/onlineSignature">在线签名</a></li>
                    <li class="active"><a class="nav-link" href="/uploadPage">上传资料</a></li>
                    <li class="active"><a class="nav-link" href="/annualReviewList">年审安排</a></li>
                </ul>
            </li>
            <li class="menu-header">快速服务</li>
            <li class="nav-item dropdown">
            	<a href="#" class="nav-link has-dropdown" data-toggle="dropdown">
            		<i class="fas fa-columns"></i> <span>一键式服务平台</span>
            	</a>
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
            </li>
            <li class="menu-header">我的业务</li>
            <li class="nav-item dropdown"><a href="#" class="nav-link has-dropdown"><i class="fas fa-th-large"></i> <span>我的业务</span></a>
                <!-- <ul class="dropdown-menu">
                    <li><a class="nav-link" href="/mybusiness/newCompany">公司注册</a></li>
                    <li><a class="nav-link beep beep-sidebar" href="/mybusiness/openAccount">银行开户</a></li>
                    <li><a class="nav-link" href="/coming">其它选择业务记录</a></li>
                </ul> -->
            </li>
            <li class="nav-item dropdown"><a href="#" class="nav-link has-dropdown"><i class="far fa-file-alt"></i> <span>我的付款</span></a>
                <!-- <ul class="dropdown-menu">
                    <li><a class="nav-link" href="/coming">已完成记录</a></li>
                    <li><a class="nav-link" href="/coming">已付款，进行中业务</a></li>
                    <li><a class="nav-link" href="/coming">已提交末付款业务</a></li>
                    <li><a class="nav-link" href="/coming">关闭业务</a></li>
                    <li><a class="nav-link" href="/userWelcome">其它付款</a></li>
                </ul> -->
            </li>
            <li class="nav-item dropdown"><a href="#" class="nav-link has-dropdown"><i class="fas fa-map-marker-alt"></i> <span>我的帐号</span></a>
                <!-- <ul class="dropdown-menu">
                    <li><a href="coming.html">个人帐户信息</a></li>
                </ul> -->
            </li>
            <li class="nav-item dropdown"><a href="#" class="nav-link has-dropdown"><i class="fas fa-plug"></i> <span>帮助中心</span></a>
                <!-- <ul class="dropdown-menu">
                    <li><a class="nav-link" href="/coming">支持文档查询</a></li>
                    <li><a class="nav-link" href="/coming">客服联系方式</a></li>
                    <li><a class="nav-link" href="/coming">在线咨询或邮件咨询</a></li>
                </ul> -->
            </li>
        </ul>

        <div class="mt-4 mb-4 p-3 hide-sidebar-mini">
            <a href="https://www.rsion.com.sg/docs" class="btn btn-primary btn-lg btn-block btn-icon-split"> <i class="fas fa-rocket"></i> 支持文档
            </a>
        </div>
    </aside>
</div>
