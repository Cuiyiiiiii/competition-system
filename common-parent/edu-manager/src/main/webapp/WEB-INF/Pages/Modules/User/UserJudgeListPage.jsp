<%@ page import="com.xx.edu.model.User" %><%--
  Created by IntelliJ IDEA.
  User: 崔毅
  Date: 2019/6/28
  Time: 0:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/side_navigation.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>User Release List Page</title>
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
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/competition_page">Competitions</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Resources</a>
            </li>
        </ul>
        <div class="text-center">
            <div class="btn-group dropleft">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="/profilePhotos/<%out.print(currentUser.getProfilePhoto());%>" width="40" height="40"
                         class="rounded" alt="" style="margin-left: 5px">
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">个人中心</a>
                    <a class="dropdown-item" href="#">发布比赛</a>
                    <%--<hr/>--%>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">登出</a>
                </div>
            </div>

        </div>
    </div>
</nav>

<div id="container">
    <div class="side col-1">
        <a href="${pageContext.request.contextPath}/user/userBaseInfo_page" style="background:#27ae60;">基本信息</a>
        <a href="${pageContext.request.contextPath}/user/userChangePassword_page" style="background:#c0392b;">更改密码</a>
        <a href="${pageContext.request.contextPath}/user/userReleaseList_page" style="background:#2c3e50;">我发起的</a>
        <a href="${pageContext.request.contextPath}/user/userParticipateList_page" style="background:#2980b9;">我参与的</a>
        <a href="${pageContext.request.contextPath}/user/userJudgeList_page" style="background:#fbc531;">我评审的</a>
    </div>
    <div id="title" class="col-11 offset-1" style="margin-top: 50px">
        <h1>我评审的比赛</h1>
        <hr/>
    </div>

    <div id="base_info_container" class="row col-10 offset-1">
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">比赛ID</th>
                <th scope="col">比赛名称</th>
                <th scope="col">类别</th>
                <th scope="col">开始时间</th>
                <th scope="col">状态</th>
            </tr>
            </thead>
            <tbody id="tbody_judges">
                <c:forEach items="${IJudgeMatchList}" var="match" varStatus="status">
                    <tr>
                        <th scope="row">${status.count}</th>
                        <td id="matchID">${match.matchID}</td>
                        <td>${match.matchName}</td>
                        <td>${match.categoryID}</td>
                        <td>${match.releaseTime}</td>
                        <td>${match.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

<script>
    $(function () {
        $("#tbody_judges").on("click","tr",function () {
            var matchID =$(this).find($('td[id=matchID]')).html();
            window.location.href='userJudgeDetails_page?matchID='+matchID;
        })
    })

</script>