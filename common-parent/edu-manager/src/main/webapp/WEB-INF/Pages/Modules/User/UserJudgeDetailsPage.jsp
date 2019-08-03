<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.xx.edu.model.User" %><%--
  Created by IntelliJ IDEA.
  User: 崔毅
  Date: 2019/6/27
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Application Page</title>
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
        <%--<button type="button" class="btn btn-light" onclick="window.location.href='signUp_page'">Sign up</button>--%>
        <%--<button type="button" class="btn btn-outline-dark" onclick="window.location.href='signIn_page'">Sign In--%>
        <%--</button>--%>
        <div class="text-center">
            <div class="btn-group dropleft">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="/profilePhotos/<%out.print(currentUser.getProfilePhoto());%>" width="40" height="40"
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

<div id="container" class="col-8 offset-2" style="margin-top: 80px">
    <div class="shadow p-3 mb-5 bg-white rounded">
        <div class="media">
            <img src="/matchPhotos/${match.picture}" width="220" height="150" class="align-self-center mr-3" alt="...">
            <div class="media-body row" style="margin-left: 20px">
                <div>
                    <h5 class="mt-0">${match.matchName}</h5>
                    <p>${match.overview}</p>
                    <p>
                        <small class="text-warning">${match.status}</small>
                    </p>
                    <p>
                        <small class="text-muted">${match.releaseTime}</small>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">作品ID</th>
            <th scope="col">组ID</th>
            <th scope="col">描述</th>
            <th scope="col">提交的作品</th>
            <th scope="col">分数</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody id="tbody_works">

        <c:forEach items="${works}" var="work" varStatus="status">
            <tr id="${status.count}">
                <th scope="row">${status.count}</th>
                <td id="workID">${work.workID}</td>
                <td >${work.groupID}</td>
                <td><input value="${work.message}" class="form-control" readonly></td>
                <td><a id="download" href="${pageContext.request.contextPath}/user/download?filename=${work.content}">${work.content}</a></td>
                <td width="15%" id="score"><input value="${work.score}" class="form-control score"></td>
                <td><button type="button" class="btn btn-primary" onclick="submitScore()">提交</button></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<footer style="background: #95afc0;height: 220px;margin-top: 100px">

</footer>
</body>
</html>

<script>
    // function submitScore() {
    //     var trNode = $(this).parent().parent();
    //     var input = trNode.find($("td[id=score]")).children("input").val();
    //     alert(input);
    // }

    $('#tbody_works').on("click","tr",function () {
        var workID = $(this).find($("td[id=workID]")).html();
        var score = $(this).find($("td[id=score]")).children("input").val();
        window.location.href="mark?workID="+workID+"&score="+score;
    })

</script>