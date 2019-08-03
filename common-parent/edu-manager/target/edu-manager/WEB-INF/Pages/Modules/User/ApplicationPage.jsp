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
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/competition_page">Competitions</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Resources</a>
            </li>
        </ul>
        <button id="btn_signIn" type="button" class="btn btn-light" onclick="window.location.href='signUp_page'">Sign up</button>
        <button id="btn_signUp" type="button" class="btn btn-outline-dark" onclick="window.location.href='signIn_page'">Sign In</button>
        <div class="text-center">
            <div class="btn-group dropleft">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
            </div>
        </div>
    </div>

    <div id="application_form" class="col-10 offset-1">
        <form name="application_form" method="post" action="" enctype="multipart/form-data">
            <div class="row" style="height: 300px;">
                <div id="team" class="col-6">
                    <div class="col-8 offset-1">
                        <label for="team_leader">队长:</label>
                        <input id="team_leader" type="text" class="form-control" value="${currentUser.userName}" readonly>
                    </div>

                     <div style="margin-top: 20px" class="col-8 offset-1">
                         <label for="crew">队员：</label>
                         <div>
                             <ul id="crew" class="list-group"></ul>
                         </div>
                     </div>
                </div>
                <div style="width: 1px;background: #63747c"></div>
                <div class="col-5" style="margin-left: 10px">
                    <div class="row form-inline offset-1">
                        <input id="txtSearch" type="text" placeholder="请输入队友昵称..." class="form-control">
                        <button id="btnSearch" type="button" class="btn btn-outline-info" style="margin-left: 10px" onclick="search()">搜索</button>
                    </div>
                    <div style="margin-top: 10px" class="offset-1">
                        <ul id="candidate" class="list-group"></ul>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-success offset-8" style="width: 200px;margin-top: 30px;" onclick="team()">参加！</button>
        </form>
    </div>
</div>
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


    function search() {
        var userName = document.getElementById("txtSearch").value;
        $.getJSON("searchUser", {"userName": userName}, function (data) {
            $("#candidate").empty();
            $.each(data, function (i, item) {
                $("#candidate").append(
                    '<li class="list-group-item">' + item["userName"] + '</li>'
                )
            })
        })
    }

    $(function () {
        $("#candidate").on("click","li",function () {
            var userName =  $(this).html();
            $(this).remove();
            $("#crew").append('<li class="list-group-item">' + userName + '</li>')
        })
    });

    $(function () {
        $("#crew").on("click","li",function () {
            // alert($(this).html());
            // var userName =  $(this).html();
            $(this).remove();

        })
    });
    
    function team() {
        var leader = document.getElementById("team_leader").value;
        var teammates;
        $("#crew").find('li').each(function () {
            teammates += ($(this).text()+",");
        });

        $.post("teamUp",{"leader":leader,"teammates":teammates,"matchID":${match.matchID}});
        alert("报名成功!");
        window.location.href="competition_page";

    }
</script>