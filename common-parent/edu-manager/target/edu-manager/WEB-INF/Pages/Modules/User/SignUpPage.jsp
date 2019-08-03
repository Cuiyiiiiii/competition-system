<%--
  Created by IntelliJ IDEA.
  User: 崔毅
  Date: 2019/6/26
  Time: 13:40
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
    <title>SignUp Page</title>
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
        <button type="button" class="btn btn-outline-dark" onclick="window.location.href='signIn_page'">Sign In</button>
    </div>
</nav>
<div id="container">
    <%--sign up content--%>
    <div class="container" style="margin-top: 20px">
        <div class="row justify-content-center">
            <h1 class="text-center">Register</h1>
        </div>
        <hr/>
        <div class="mainContainer row">
            <div id="pic_block" class="col-8" style="text-align: center;margin-top: 20px">
                <img src="${pageContext.request.contextPath}/assets/Images/signup_pic.png" width="90%">
            </div>

            <div id="form_block" class="col-4" style="background-color: #f5f6fa;border-radius: 5%">
                <form role="form" id="signUp_form" class="needs-validation"
                      action="${pageContext.request.contextPath}/user/register" method="post" novalidate>
                    <div id="blank_top" style="margin-top: 15px">
                    </div>
                    <div class="form-group">
                        <label for="txtUsername" class="control-label">用户名:</label>
                        <input type="text" id="txtUsername" name="userName" class="form-control" placeholder="请输入用户名"
                               required>
                        <div class="invalid-feedback">用户名不可为空！</div>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword" class="control-label">密码:</label>
                        <input type="password" id="txtPassword" name="password" class="form-control" placeholder="请输入密码"
                               required>
                        <div class="invalid-feedback">密码不可为空！</div>
                    </div>
                    <div class="form-group">
                        <label for="inlineFormGradeSelect" class="control-label">年级:</label>
                        <select class="custom-select mr-sm-2" id="inlineFormGradeSelect" name="grade">
                            <option value="大一" selected>大一</option>
                            <option value="大二">大二</option>
                            <option value="大三">大三</option>
                            <option value="大四">大四</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inlineFormMajorSelect" class="control-label">专业:</label>
                        <select class="custom-select mr-sm-2" id="inlineFormMajorSelect" name="major">
                            <option value="计算机科学与技术" selected>计算机科学与技术</option>
                            <option value="艺传">艺传</option>
                            <option value="汉语言">汉语言</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-dark btn-block">注册</button>
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