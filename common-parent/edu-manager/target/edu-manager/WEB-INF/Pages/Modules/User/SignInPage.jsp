<%--
  Created by IntelliJ IDEA.
  User: 崔毅
  Date: 2019/6/26
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/Scripts/validation.js"></script>
    <title>Sign In Page</title>
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
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/user/competition_page">Competitions</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Others
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Datasets</a>
                </div>
            </li>
        </ul>

        <button type="button" class="btn btn-outline-dark" onclick="window.location.href='signUp_page'">Sign up</button>
    </div>
</nav>
<div id="container">
    <%--main content--%>
    <div class="container" style="margin-top: 20px">
        <div class="row justify-content-center">
            <h1>Login</h1>
        </div>
        <hr/>
        <div class="mainContainer row">
            <div id="pic_block" class="col-8" style="text-align: center">
                <img src="${pageContext.request.contextPath}/assets/Images/signin_pic.jpg" width="50%">
            </div>
            <div id="form_block" class="col-4"
                 style="margin-top: 30px;background-color: #f5f6fa;border-radius: 5%;margin-bottom: 40px">
                <div id="blank_top" style="height: 20px">

                </div>
                <form role="form" class="needs-validation" action="${pageContext.request.contextPath}/user/login"
                      method="post" novalidate>
                    <div class="form-group">
                        <label for="txtUserId">账号:</label>
                        <input type="text" class="form-control" id="txtUserID" name="userID" placeholder="账号"
                               required>
                        <div class="invalid-feedback">账号不可为空！</div>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">密码:</label>
                        <input type="password" class="form-control" id="txtPassword" name="password" placeholder="密码"
                               required>
                        <div class="invalid-feedback">密码不可为空！</div>
                    </div>
                    <div class="form-group" style="margin-top: 30px;text-align: center">
                        <%--<button type="reset" class="btn btn-secondary">重置</button>--%>
                        <button type="submit" class="btn btn-dark btn-block">登录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%--footer--%>
    <footer style="background: #95afc0;height: 220px;margin-top: 50px">

    </footer>
</div>

</body>
</html>