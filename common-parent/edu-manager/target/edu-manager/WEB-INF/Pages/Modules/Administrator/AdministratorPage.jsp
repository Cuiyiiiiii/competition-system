<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理后台</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/amazeui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}assets/Css/core.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/menu.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/admin.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/page/typography.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/page/form.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/component.css"/>
</head>
<body>
<!-- Begin page -->
<header class="am-topbar am-topbar-fixed-top">
    <div class="am-topbar-left am-hide-sm-only">
        <a href="${pageContext.request.contextPath}/admin/administrator_page" class="logo"><span>Admin<span>to</span></span><i class="zmdi zmdi-layers"></i></a>
    </div>

    <div class="contain">
        <ul class="am-nav am-navbar-nav am-navbar-left">

            <li><h1 class="page-title">后台管理系统</h1></li>
        </ul>
    </div>
</header>
<!-- end page -->


<div class="admin">
    <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
        <div class="am-offcanvas-bar admin-offcanvas-bar">
            <!-- User -->
            <div class="user-box am-hide-sm-only">
                <div class="user-img">
                    <img src="${pageContext.request.contextPath}/assets/Images/avatar-1.jpg" alt="user-img" title="Mat Helme"
                         class="img-circle img-thumbnail img-responsive">
                    <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
                </div>
                <h5><a href="#">Mat Helme</a></h5>
            </div>
            <ul class="am-list admin-sidebar-list">
                <li><a href="${pageContext.request.contextPath}/admin/administrator_page"><span class="am-icon-home"></span>首页</a></li>
                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table"></span> 比赛 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
                        <li><a href="${pageContext.request.contextPath}/admin/under_review_page">待审核</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/on_the_march_page">进行中</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/finished_page">已结束</a></li>
                    </ul>
                </li>
                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><i class="am-icon-line-chart" aria-hidden="true"></i> 统计图表 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2">
                        <li><a href="${pageContext.request.contextPath}/admin/chart_pie_page" class="am-cf"> <span>统计</span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<!-- navbar -->
<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-2.1.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/amazeui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/blockUI.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/charts/echarts.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/charts/indexChart.js"></script>

</body>

</html>
