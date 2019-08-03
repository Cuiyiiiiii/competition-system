<%@ page import="com.xx.edu.model.User" %><%--
  Created by IntelliJ IDEA.
  User: 崔毅
  Date: 2019/6/27
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Css/side_navigation.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/Scripts/validation.js"></script>
    <title>Personal Page</title>
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
    <div class="side col-1">
        <a href="${pageContext.request.contextPath}/user/userBaseInfo_page" style="background:#27ae60;">基本信息</a>
        <a href="${pageContext.request.contextPath}/user/userChangePassword_page" style="background:#c0392b;">更改密码</a>
        <a href="${pageContext.request.contextPath}/user/userReleaseList_page" style="background:#2c3e50;">我发起的</a>
        <a href="${pageContext.request.contextPath}/user/userParticipateList_page" style="background:#2980b9;">我参与的</a>
        <a href="${pageContext.request.contextPath}/user/userJudgeList_page" style="background:#fbc531;">我评审的</a>
    </div>
    <div id="title" class="col-11 offset-1" style="margin-top: 50px">
        <h1>基本信息</h1>
    </div>
    <div id="base_info_container" class="row col-11 offset-1">
        <div id="text_info_block" style="width: 70%">
            <div id="form_block" style="background-color: #f5f6fa;border-radius: 5%">
                <div id="form_blank" style="height: 20px;"></div>
                <form role="form" id="update_form" class="needs-validation"
                      action="${pageContext.request.contextPath}/user/update" method="post" enctype="multipart/form-data" novalidate>
                    <div id="blank_top" style="margin-top: 15px">
                        <div class="row">
                            <div class="col-7">
                                <div class="form-group offset-4" style="width: 50%;">
                                    <label for="txtUserID" class="control-label">用户ID:</label>
                                    <input type="text" id="txtUserID" name="userID" class="form-control" value="<%out.print(currentUser.getUserID());%>" readonly>
                                </div>
                                <div class="form-group offset-4" style="width: 50%;">
                                    <label for="txtUsername" class="control-label">用户名:</label>
                                    <input type="text" id="txtUsername" name="userName" class="form-control" value="<%out.print(currentUser.getUserName());%>" required>
                                    <div class="invalid-feedback">用户名不可为空！</div>
                                </div>
                                <div class="form-group offset-4" style="width: 50%;">
                                    <label for="inlineFormGradeSelect" class="control-label">年级:</label>
                                    <select class="custom-select mr-sm-2" id="inlineFormGradeSelect" name="grade">
                                        <option value="大一">大一</option>
                                        <option value="大二">大二</option>
                                        <option value="大三">大三</option>
                                        <option value="大四">大四</option>
                                    </select>
                                </div>
                                <div class="form-group offset-4" style="width: 50%;">
                                    <label for="inlineFormMajorSelect" class="control-label">专业:</label>
                                    <select class="custom-select mr-sm-2" id="inlineFormMajorSelect" name="major">
                                        <option value="计算机科学与技术">计算机科学与技术</option>
                                        <option value="艺传">艺传</option>
                                        <option value="汉语言">汉语言</option>
                                    </select>
                                </div>
                                <div class="form-group offset-4" style="width: 50%;">
                                    <button type="submit" class="btn btn-dark btn-block">更新</button>
                                </div>
                            </div>
                            <div class="col-3" style="text-align: center">
                                <div id="blank" style="height: 50px;"></div>
                                <img name="profilePhoto" src="/profilePhotos/<%out.print(currentUser.getProfilePhoto());%>" width="200" height="200">
                                <div>
                                    <label for="profile_photo">上传头像</label>
                                    <input name="profile_photo" id="profile_photo" type="file" style="margin-top: 10px">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div id="form_blank2" style="height: 20px;"></div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>
    window.onload = function (ev) {
        $("#inlineFormGradeSelect").find("option[value='<%out.print(currentUser.getGrade());%>']").attr("selected",true);
        $("#inlineFormMajorSelect").find("option[value='<%out.print(currentUser.getMajor());%>']").attr("selected",true);
    }
</script>