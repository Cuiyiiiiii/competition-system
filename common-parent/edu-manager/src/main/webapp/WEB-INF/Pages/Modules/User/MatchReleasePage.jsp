<%@ page import="com.xx.edu.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 崔毅
  Date: 2019/6/27
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Title</title>
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
<div style="background-color: #ecf0f1">
    <div style="height: 80px;">

    </div>

    <div id="container" class="col-8 offset-2">
        <form action="${pageContext.request.contextPath}/user/releaseMatch" method="post" name="release" ID="release">
            <div id="match_pic"
                 style="background-color: #b2bec3;width: 100%;height: 150px;text-align: center;margin-top: 10px">
                match picture
                <%--<img src="">--%>
            </div>
            <div id="submit_block" align="center" style="margin-top: 10px">
                <label for="match_pic_upload">为比赛添加图标：</label>
                <input id="match_pic_upload" name="work" type="file">
            </div>
            <div class="col-8 offset-2">
                <div style="margin-top: 10px">
                    <h1>比赛名称</h1>
                    <hr/>
                    <input name="txt_match_name" type="text" class="form-control">
                </div>
                <div id="match_description">
                    <h3>简介</h3>
                    <hr/>
                    <textarea name="textarea_match_description" class="form-control" style="height: 150px"></textarea>
                </div>
                <div id="match_arrangement">
                    <h3>赛程安排</h3>
                    <hr/>
                    <textarea name="textarea_match_arrangement" class="form-control" style="height: 250px"></textarea>
                </div>
                <div id="match_prize">
                    <h3>奖项设置</h3>
                    <hr/>
                    <textarea name="textarea_match_prize" class="form-control" style="height: 120px"></textarea>
                </div>
                <%--<div id="match_organizer">--%>
                    <%--<h3>主办方</h3>--%>
                    <%--<hr/>--%>
                    <%--<textarea name="textarea_match_organizer" class="form-control" style="height: 100px"></textarea>--%>
                <%--</div>--%>
                <label for="category" style="margin-top: 10px">比赛类别：</label>
                <div id="category">
                    <select class="custom-select mr-sm-2" id="inlineFormCategorySelect" name="category">
                        <c:forEach items="${matchCategoryList}" var="matchCategory" varStatus="status">
                            <option value="${matchCategory.categoryID}">${matchCategory.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div id="btn_submit" style="margin-top: 10px;text-align: center">
                    <button type="submit" class="btn btn-success">去邀请评委</button>
                </div>
            </div>
        </form>
    </div>


    <div style="height: 100px;">

    </div>
</div>

<%--footer--%>
<footer style="background: #95afc0;height: 220px;">

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
</script>

<script>

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
    })

</script>