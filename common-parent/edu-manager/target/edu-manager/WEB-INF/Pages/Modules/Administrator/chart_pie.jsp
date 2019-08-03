<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>后台模板</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/amazeui.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/core.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/menu.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/index.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/admin.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/page/typography.css" />
	</head>
	<body>
		<!-- Begin page -->
		<header class="am-topbar am-topbar-fixed-top">		
			<div class="am-topbar-left am-hide-sm-only">
                <a href="${pageContext.request.contextPath}/admin/administrator_page" class="logo"><span>Admin<span>to</span></span><i class="zmdi zmdi-layers"></i></a>
            </div>
	
			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">
					<li><h4 class="page-title">饼状图</h4></li>
				</ul>
				
				<%--<ul class="am-nav am-navbar-nav am-navbar-right">--%>
					<%--<li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>--%>
					<%--<li class="hidden-xs am-hide-sm-only">--%>
                        <%--<form role="search" class="app-search">--%>
                            <%--<input type="text" placeholder="Search..." class="form-control">--%>
                            <%--<a href=""><img src="${pageContext.request.contextPath}/assets/Images/search.png"></a>--%>
                        <%--</form>--%>
                    <%--</li>--%>
				<%--</ul>--%>
			</div>
		</header>
		<!-- end page -->
		
		
		<div class="admin">
                  <!-- sidebar start -->
				  <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
				    <div class="am-offcanvas-bar admin-offcanvas-bar">
				    	<!-- User -->
						<div class="user-box am-hide-sm-only">
	                        <div class="user-img">
	                            <img src="${pageContext.request.contextPath}/assets/Images/avatar-1.jpg" alt="user-img" title="Mat Helme" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                        <h5><a href="#">Mat Helme</a> </h5>
	                        <ul class="list-inline">
	                            <li>
	                                <a href="#">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>
	                                </a>
	                            </li>
	
	                            <li>
	                                <a href="#" class="text-custom">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>
	                                </a>
	                            </li>
	                        </ul>
	                    </div>
	                    <!-- End User -->
	            
						 <ul class="am-list admin-sidebar-list">
						    <li><a href="${pageContext.request.contextPath}/admin/administrator_page"><span class="am-icon-home"></span> 首页</a></li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-table"></span> 表格 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
						        <li><a href="${pageContext.request.contextPath}/admin/table_complete_page">完整表格</a></li>
						      </ul>
						    </li>
						    <li class="admin-parent">
						      <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><i class="am-icon-line-chart" aria-hidden="true"></i> 统计图表 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
						      <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav2">
						        <li><a href="${pageContext.request.contextPath}/admin/chart_pie_page" class="am-cf"> <span>饼状图</span></a></li>
						      </ul>
						    </li>

						  </ul>
				</div>
				  </div>
				  <!-- sidebar end -->
		<!-- ========== Left Sidebar end ========== -->

		<!-- Start right Content here -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="am-g">
					<div class="am-u-md-6" >
						<!-- 折线图堆叠 -->
						<div class="card-box">
							<div  id="pie1" style="width: 100%;height: 400px;"></div>
						</div>
					</div>

					<div class="am-u-md-6">
						<!-- 堆叠区域图  -->
						<div class="card-box">
							<div  id="pie2" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
				</div>
				
				<div class="am-g">
					<div class="am-u-md-6">
						<!-- Step Line -->
						<div class="card-box">
							<div  id="pie3" style="width: 100%;height: 400px;"></div>
						</div>
					</div>

					<div class="am-u-md-6">
						<!-- 大数据面积图  -->
						<div class="card-box">
							<div  id="pie4" style="width: 100%;height: 400px;"></div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<!-- end right Content here -->
		<!--</div>-->
		</div>
		</div>
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/amazeui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/app.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/blockUI.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/charts/echarts.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/Scripts/charts/pieChart.js" ></script>
	</body>
	
</html>
