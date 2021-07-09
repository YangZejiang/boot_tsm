<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <title>教材征订系统</title>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .footer {
            border-top: 1px solid rgba(152, 166, 173, .2);
            text-align: center;
            padding: 19px 30px 20px;


            color: #98a6ad;
        }

        html, body {
            min-width: 1170px;
        }
    </style>

    <script>
        // 判断是登录账号和密码是否为空
        function check() {
            var usercode = $("#inputUsercode").val();
            var password = $("#inputPassword").val();
            if (usercode == "" || password == "") {
                $("#message").text("用户名或密码不能为空！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div style="width: 1150px;height: 600px;margin:0px auto">
    <div style="width: 200px;height:200px;margin:15% 100px 0px 20%;float: left;background: url(${pageContext.request.contextPath}/images/bg.png)">
    </div>
    <div style="width: 410px;margin: 15% 0px;float: left">
        <fieldset style="width: auto; margin: 0px auto;">
            <legend style="font-size:30px" face="宋体">
                教材征订系统
            </legend>
            <form class="form-horizontal" action="${pageContext.request.contextPath }/login.do" method="post"
                  onsubmit="return check()">
                <div class="form-group">
                    <label for="inputUsercode" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <c:choose>
                            <c:when test="${W_USERNAME != null}">
                                <input type="text" class="form-control" id="inputUsercode" placeholder="工号/学号"
                                       name="usercode" value="${W_USERNAME}">
                            </c:when>
                            <c:otherwise>
                                <input type="text" class="form-control" id="inputUsercode" placeholder="工号/学号"
                                       name="usercode">
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword" placeholder="密码" name="password">
                        <span id="message" style="color: red">${msg}</span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label class="radio-inline">
                                <input type="radio" name="RadioOptions" id="inlineRadio1" value="0"> 部门
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="RadioOptions" id="inlineRadio2" value="1" checked="checked">
                                学生
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="RadioOptions" id="inlineRadio3" value="2"> 教师
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">登 录</button>
                    </div>
                </div>
            </form>
        </fieldset>
    </div>
</div>
<footer class="footer">
    2020 © 教材征订系统 - YangZejiang
</footer>


</body>
</html>
