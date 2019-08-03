<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.xx.edu.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Competition Page</title>
</head>

<%
    User currentUser = (User) session.getAttribute("currentUser");
%>

<body>
<%--navigation bar--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="${pageContext.request.contextPath}/assets/Images/trophy.png" width="30" height="30"
             class="d-inline-block align-top" alt="">
    </a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/introduction_page">Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/competition_page">Competitions</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Resources</a>
            </li>
        </ul>
        <button id="btn_signUp" type="button" class="btn btn-light" onclick="window.location.href='signUp_page'">Sign up</button>
        <button id="btn_signIn" type="button" class="btn btn-outline-dark" onclick="window.location.href='signIn_page'">Sign In
        </button>
        <div class="text-center">
            <div class="btn-group dropleft">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="/profilePhotos/${currentUser.profilePhoto}" width="40" height="40"
                         class="rounded" alt="" style="margin-left: 5px">
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/userBaseInfo_page">个人中心</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/matchRelease_page">发布比赛</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout">登出</a>
                </div>
            </div>
        </div>
    </div>
</nav>

<div id="container">
    <%--main content--%>
    <nav class="col-8 offset-2" style="margin-top: 60px">
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a class="nav-item nav-link active" id="nav-general-tab" data-toggle="tab" href="#nav-general" role="tab"
               aria-controls="nav-general" aria-selected="true">General</a>
            <a class="nav-item nav-link" id="nav-class-tab" data-toggle="tab" href="#nav-class" role="tab"
               aria-controls="nav-class" aria-selected="false">In Class</a>
        </div>
    </nav>
    <div class="tab-content col-8 offset-2" id="nav-tabContent">
        <%--General--%>
        <div class="tab-pane fade show active" id="nav-general" role="tabpanel" aria-labelledby="nav-general-tab">
            <%--Search--%>
            <div class="col-4 offset-8" style="margin-top: 20px">
                <form id="searchForm_general" action="" method="post" class="form-inline">
                    <input type="text" id="txtSearch_general" name="userName" class="form-control" placeholder="全部"
                           style="margin-right: 20px">
                    <button type="submit" class="btn btn-outline-dark">搜索</button>
                </form>
            </div>
            <div id="competitions_general" style="margin-top: 5px">
                <div class="accordion" id="accordion_general">
                    <div class="card">
                        <div class="card-header" id="heading_active">
                            <h2 class="mb-0">
                                <button class="btn" type="button" data-toggle="collapse" data-target="#collapse_active"
                                        aria-expanded="true" aria-controls="collapse_active">
                                    ${activeMatch.size()}项 正在比赛中
                                </button>
                            </h2>
                        </div>
                        <div id="collapse_active" class="collapse show" aria-labelledby="heading_active"
                             data-parent="#accordion_general">
                            <div class="card-body">
                                <c:forEach items="${activeMatch}" var="active" varStatus="status">
                                    <div id="${active.matchID}" class="media">
                                            <img src="/matchPhotos/${active.picture}" class="align-self-center mr-3" width="220" height="150" alt="...">
                                        <div class="media-body">
                                            <h5 class="mt-0">${active.matchName}</h5>
                                            <p>${active.overview}</p>
                                            <p>
                                                <small class="text-warning">${active.status}</small>
                                            </p>
                                            <p>
                                                <small class="text-muted">${active.releaseTime}</small>
                                            </p>
                                        </div>
                                    </div>
                                    <hr/>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="heading_overdue">
                            <h2 class="mb-0">
                                <button class="btn collapsed" type="button" data-toggle="collapse"
                                        data-target="#collapse_overdue" aria-expanded="false"
                                        aria-controls="collapse_overdue">
                                    ${finishedMatch.size()}项 已结束
                                </button>
                            </h2>
                        </div>
                        <div id="collapse_overdue" class="collapse" aria-labelledby="heading_overdue"
                             data-parent="#accordion_general">
                            <div class="card-body">
                                <c:forEach items="${finishedMatch}" var="finished" varStatus="status">
                                    <div id="${finished.matchID}" class="media">
                                        <img src="/matchPhotos/${finished.picture}" class="align-self-center mr-3" width="220" height="150" alt="...">
                                        <div class="media-body">
                                            <h5 class="mt-0">${finished.matchName}</h5>
                                            <p>${finished.overview}</p>
                                            <p>
                                                <small class="text-warning">${finished.status}</small>
                                            </p>
                                            <p>
                                                <small class="text-muted">${finished.releaseTime}</small>
                                            </p>
                                        </div>
                                    </div>
                                    <hr/>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--In Class--%>
        <div class="tab-pane fade" id="nav-class" role="tabpanel" aria-labelledby="nav-class-tab">
            <%--Search--%>
            <div class="col-4 offset-8" style="margin-top: 20px">
                <form id="searchForm_class" action="" method="post" class="form-inline">
                    <input type="text" id="txtSearch_class" name="userName" class="form-control" placeholder="全部"
                           style="margin-right: 20px">
                    <button type="submit" class="btn btn-outline-dark">搜索</button>
                </form>
            </div>
            <div class="accordion" id="accordion_class" style="margin-top: 5px">
                <%--photograpy--%>
                <div class="card">
                    <div class="card-header" id="heading_photography">
                        <h2 class="mb-0">
                            <button class="btn" type="button" data-toggle="collapse" data-target="#collapse_photography"
                                    aria-expanded="true" aria-controls="collapse_photography">
                                共${photographyMatch.size()}项 摄影比赛
                            </button>
                        </h2>
                    </div>
                    <div id="collapse_photography" class="collapse show" aria-labelledby="heading_photography"
                         data-parent="#accordion_class">
                        <div class="card-body">
                            <c:forEach items="${photographyMatch}" var="photography" varStatus="status">
                                <div id="${photography.matchID}" class="media">
                                    <img src="/matchPhotos/${photography.picture}" class="align-self-center mr-3" width="220" height="150" alt="...">
                                    <div class="media-body">
                                        <h5 class="mt-0">${photography.matchName}</h5>
                                        <p>${photography.overview}</p>
                                        <p>
                                            <small class="text-warning">${photography.status}</small>
                                        </p>
                                        <p>
                                            <small class="text-muted">${photography.releaseTime}</small>
                                        </p>
                                    </div>
                                </div>
                                <hr/>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <%--data--%>
                <div class="card">
                    <div class="card-header" id="heading_data">
                        <h2 class="mb-0">
                            <button class="btn" type="button" data-toggle="collapse" data-target="#collapse_data"
                                    aria-expanded="true" aria-controls="collapse_data">
                                共${dataMatch.size()}项 数据比赛
                            </button>
                        </h2>
                    </div>
                    <div id="collapse_data" class="collapse" aria-labelledby="heading_data"
                         data-parent="#accordion_class">
                        <div class="card-body">
                            <c:forEach items="${dataMatch}" var="data" varStatus="status">
                                <div id="${data.matchID}" class="media">
                                    <img src="/matchPhotos/${data.picture}" class="align-self-center mr-3" width="220" height="150" alt="...">
                                    <div class="media-body">
                                        <h5 class="mt-0">${data.matchName}</h5>
                                        <p>${data.overview}</p>
                                        <p>
                                            <small class="text-warning">${data.status}</small>
                                        </p>
                                        <p>
                                            <small class="text-muted">${data.releaseTime}</small>
                                        </p>
                                    </div>
                                </div>
                                <hr/>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--&lt;%&ndash;footer&ndash;%&gt;--%>
    <%--<footer style="background: #95afc0;height: 220px;margin-top: 50px;margin-bottom: 0">--%>

    <%--</footer>--%>
</div>
</body>
</html>

<script>
    $(document).ready(function () {
        $(function () {
            $('#competitions_general').find($('.card-body')).on('click', '.media', function () {
                var matchID = $(this).attr("id");
                // alert(matchID);
                window.location.href = '${pageContext.request.contextPath}/user/matchDetails_page?matchID=' + matchID;
            })
        })
    })
</script>

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