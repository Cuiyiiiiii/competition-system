<%@ page import="com.xx.edu.model.User" %><%--
  Created by IntelliJ IDEA.
  User: 崔毅
  Date: 2019/6/26
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Introduction Page</title>
</head>

<%
    User currentUser = (User) session.getAttribute("currentUser");
%>

<body>
<%--navigation bar--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand">
        <img src="${pageContext.request.contextPath}/assets/Images/trophy.png" width="30" height="30"
             class="d-inline-block align-top" alt="">
    </a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/introduction_page">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/competition_page">Competitions</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/resources_page">Resources</a>
            </li>
        </ul>

        <button id="btn_signUp" type="button" class="btn btn-light" onclick="window.location.href='signUp_page'">Sign
            up
        </button>
        <button id="btn_signIn" type="button" class="btn btn-outline-dark" onclick="window.location.href='signIn_page'">
            Sign In
        </button>
        <div class="text-center">
            <div class="btn-group dropleft">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img id="img_profilePhoto" src="/profilePhotos/${currentUser.profilePhoto}" width="40" height="40"
                         class="rounded" alt="" style="margin-left: 5px">
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/userBaseInfo_page">个人中心</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/matchRelease_page">发布比赛</a>
                    <%--<hr/>--%>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout">登出</a>
                </div>
            </div>
        </div>
    </div>
</nav>
<div id="container">
    <%--intro slide--%>
    <div id="slide">
        <div class="bd-intro">
            <div id="carouselIntroCaptions" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselPhotographyCaptions" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselDataCaptions" data-slide-to="1"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active" style="height: 665px">
                        <img src="${pageContext.request.contextPath}/assets/Images/photography.jpg"
                             class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>摄影大赛</h5>
                            <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                        </div>
                    </div>
                    <div class="carousel-item" style="height: 665px">
                        <img src="${pageContext.request.contextPath}/assets/Images/data.jpg" height="100%"
                             class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>大数据开发者大赛</h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselIntroCaptions" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselIntroCaptions" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
    <div id="judges_container" style="background-color: #ecf0f1">
        <div id="judges information" class="col-8 offset-2">
            <div style="height: 20px"></div>
            <div id="judge_title" style="text-align: center;">
                <h2>Judges</h2>
            </div>
            <div style="height: 20px"></div>
            <div class="card-deck">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/assets/Images/judge1.png" class="card-img-top"
                         alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Zhang San</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to
                            additional content. This content is a little bit longer.</p>
                        <%--<p class="card-text">--%>
                            <%--<small class="text-muted">Last updated 3 mins ago</small>--%>
                        <%--</p>--%>
                    </div>
                </div>
                <div class="card">
                    <img src="${pageContext.request.contextPath}/assets/Images/judge2.png" class="card-img-top"
                         alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Li Si</h5>
                        <p class="card-text">This card has supporting text below as a natural lead-in to additional
                            content.</p>
                        <%--<p class="card-text">--%>
                            <%--<small class="text-muted">Last updated 3 mins ago</small>--%>
                        <%--</p>--%>
                    </div>
                </div>
                <div class="card">
                    <img src="${pageContext.request.contextPath}/assets/Images/judge3.png" class="card-img-top"
                         alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Wang Wu</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                            additional content. This card has even longer content than the first to show that equal
                            height action.</p>
                        <%--<p class="card-text">--%>
                            <%--<small class="text-muted">Last updated 3 mins ago</small>--%>
                        <%--</p>--%>
                    </div>
                </div>
            </div>
            <div style="height: 50px"></div>
        </div>
    </div>
    <%--footer--%>
    <footer style="background: #95afc0;height: 220px">

    </footer>

</div>

</body>
</html>

<script>
    <%
        if(currentUser != null){
    %>
            $("#btn_signIn").hide();
            $("#btn_signUp").hide();
    <%
        }else{
    %>
            $("#navbarDropdownMenuLink").hide();
    <%
        }
    %>
</script>