<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.xx.edu.model.User" %><%--
  Created by IntelliJ IDEA.
  User: 崔毅
  Date: 2019/6/26
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Match Details</title>
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

<div id="container" class="col-8 offset-2" style="margin-top: 80px">
    <div class="shadow p-3 mb-5 bg-white rounded">
        <div class="media">
            <img src="/matchPhotos/${match.picture}" class="align-self-center mr-3" width="220" height="150" alt="...">
            <div class="media-body row">
                <div class="col-9">
                    <h5 class="mt-0">${match.matchName}</h5>
                    <p>${match.overview}</p>
                    <p>
                        <small class="text-warning">${match.status}</small>
                    </p>
                    <p>
                        <small class="text-muted">${match.releaseTime}</small>
                    </p>
                </div>

                <div class="col-3" style="background-color: #4cd137;text-align: center"
                     onclick="window.location.href='${pageContext.request.contextPath}/user/application_page?matchID=${match.matchID}'">
                    <div style="margin-top: 30%">
                        <h1 id="text">报名</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--main content--%>
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a class="nav-item nav-link active" id="nav-overview-tab" data-toggle="tab" href="#nav-overview" role="tab"
               aria-controls="nav-overview" aria-selected="true">Overview</a>
            <a class="nav-item nav-link" id="nav-submission-tab" data-toggle="tab" href="#nav-submission" role="tab"
               aria-controls="nav-submission" aria-selected="false">My submission</a>
        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-overview" role="tabpanel" aria-labelledby="nav-overview-tab">
            <div id="match_pic"
                 style="background-color: #b2bec3;width: 100%;height: 150px;text-align: center;margin-top: 10px">
                match picture
                <%--<img src="">--%>
            </div>
            <div id="match_name" style="margin-top: 10px">
                <h1>比赛名称</h1>
                <hr/>
                <input id="text_match_name" class="form-control" value="${match.matchName}" readonly>
            </div>
            <div id="match_description">
                <h3>简介</h3>
                <hr/>
                <textarea id="textarea_match_description" class="form-control" style="height: 150px" readonly>${match.overview}</textarea>
            </div>
            <div id="match_arrangement">
                <h3>赛程安排</h3>
                <hr/>
                <textarea id="textarea_match_arrangement" class="form-control" style="height: 250px" readonly>${match.arrangement}</textarea>
            </div>
            <div id="match_prize">
                <h3>奖项设置</h3>
                <hr/>
                <textarea id="textarea_match_prize" class="form-control" style="height: 120px" readonly>${match.prize}</textarea>
            </div>
            <div id="match_organizer">
                <h3>组织者</h3>
                <hr/>
                <textarea id="textarea_match_organizer" class="form-control" style="height: 100px" readonly>${match.organizer}</textarea>
            </div>

        </div>
        <div class="tab-pane fade" id="nav-submission" role="tabpanel" aria-labelledby="nav-submission-tab">
            <div style="margin-top: 10px">
                <h1>我的提交</h1>
                <hr/>
                <div id="main_submission" class="col-8 offset-2">
                    <h3>得分:${work.score}分</h3>
                    <form id="form_submission" action="${pageContext.request.contextPath}/user/submitWork" method="post" enctype="multipart/form-data">
                        <div id="submit_block" align="center">
                            <label for="download">已提交:</label>
                            <a id="download" href="${pageContext.request.contextPath}/user/download?filename=${work.content}">${work.content}</a>
                            <br/>
                            <label>提交作品：</label>
                            <input type="file" name="work">
                        </div>
                        <hr/>
                        <div id="comment_block">
                            <label for="message">描述：</label>
                            <textarea id="message" name="message" class="form-control"></textarea>
                        </div>
                        <input name="matchID" value="${match.matchID}" style="display: none">
                        <button type="submit" class="btn btn-success offset-5" style="margin-top: 20px">提交作品</button>
                    </form>
                    <%--<div id="judgeComment_block">--%>
                        <%--<c:forEach items="" var="" varStatus="status">--%>
                            <%--<label for="judgeComment"></label>--%>
                            <%--<textarea id="judgeComment" name="judgeComment" class="form-control"></textarea>--%>
                        <%--</c:forEach>--%>
                    <%--</div>--%>
                </div>
            </div>

        </div>
    </div>
</div>
<%--footer--%>
<footer style="background: #95afc0;height: 220px;margin-top: 100px">

</footer>
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

    if(${isCompetitor}){
        $("#text").text("已报名");
    }
</script>

