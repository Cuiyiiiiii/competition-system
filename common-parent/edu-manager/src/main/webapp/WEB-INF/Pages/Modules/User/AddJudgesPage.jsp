<%--
  Created by IntelliJ IDEA.
  User: 崔毅
  Date: 2019/6/29
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Add Judges Page</title>
</head>
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
        <div>
            <div class="row" style="margin-top: 20px;height: 300px;">
                <div id="team" class="col-5">
                    <div class="col-12">
                        <label for="crew">评委团：</label>
                        <div>
                            <ul id="crew" class="list-group"></ul>
                        </div>
                    </div>
                </div>
                <div style="width: 2px;background: #63747c"></div>
                <div class="col-6" style="margin-left: 10px">
                    <div class="row form-inline offset-1">
                        <input id="txtSearch" type="text" placeholder="请输入用户昵称..." class="form-control">
                        <button id="btnSearch" type="button" class="btn btn-outline-info" onclick="search()"
                                style="margin-left: 10px">搜索
                        </button>
                    </div>
                    <div style="margin-top: 10px" class="offset-1">
                        <ul id="candidate" class="list-group"></ul>
                    </div>
                </div>
            </div>
            <button class="btn btn-success col-4 offset-4" type="button" style="margin-top: 20px" onclick="addJudge()">申请发布比赛</button>
        </div>

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

    function addJudge() {
        var judges;
        $("#crew").find('li').each(function () {
            judges += ($(this).text()+",");
        });
        // alert(judges);

        $.post("addJudge",{"judges":judges,"matchID":${matchID}});
        alert("已申请发布比赛！");
        window.location.href="competition_page";
    }
</script>