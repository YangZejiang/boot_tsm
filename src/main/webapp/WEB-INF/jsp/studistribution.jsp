<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>教材征订系统</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"/>
    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet"/>
    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet"/>
    <!-- Custom CSS -->
    <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet"/>
    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/boot-tsm.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>student/message.do">教材征订系统 - 学生端</a>
        </div>

        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <span>欢迎，${USER_SESSION.stuName} 同学！</span>
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i>
                        用户：${USER_SESSION.stuName}
                    </a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="${pageContext.request.contextPath }/logout.do">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul>

        <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="查询内容...">
                            <span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
                        </div>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/student/profile.do">
                            <i class="fa fa-user fa-fw" aria-hidden="true"></i> 个人信息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/student/message.do">
                            <i class="fa fa-bullhorn fa-fw" aria-hidden="true"></i> 公告通知
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/student/textbook.do">
                            <i class="fa fa-book fa-fw" aria-hidden="true"></i> 教材选订
                        </a>
                    </li>

                    <c:if test="${USER_SESSION.isMonitor == true}">
                        <li>
                            <a href="${pageContext.request.contextPath }/student/distribution.do" class="active">
                                <i class="fa fa-hand-lizard-o fa-fw" aria-hidden="true"></i> 教材领取与发放
                            </a>
                        </li>
                    </c:if>

                </ul>
            </div>
        </div>
        <!-- 左侧显示列表部分 end-->
    </nav>

    <!-- page  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">教材领取与发放</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/student/distribution.do">
                    <!-- 学期 -->
                    <div class="form-group" style="width: 160px">
                        <label for="semester">学期</label>
                        <select class="form-control" id="semester" name="semester">
                            <c:forEach items="${dictSemester}" var="item">
                                <option value="${item.dictItemCode}"
                                        <c:if test="${item.dictItemCode == selectedSem}"> selected</c:if>>
                                        ${item.dictItemName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->

        <div class="row">
            <div class="col-lg-12">
                <!-- panel-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b>本班教材订购情况</b>
                    </div>
                    <!-- /.panel-heading -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th style="">ISBN</th>
                            <th style="">教材名称</th>
                            <th style="">作者</th>
                            <th style="">出版社</th>
                            <th style="">数量</th>
                            <th style="">状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${distributionList}" var="row" varStatus="status">
                            <tr>
                                <td style="text-align:center">${row.isbn}</td>
                                <td style="text-align:center">${row.title}</td>
                                <td style="text-align:center">${row.author}</td>
                                <td style="text-align:center">${row.press}</td>
                                <td style="text-align:center">${row.num}</td>
                                <td style="text-align:center">
                                    <c:if test="${row.status == 1}">
                                        已领取
                                    </c:if>
                                    <c:if test="${row.status == 0}">
                                        未领取
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.panel -->
                <p style="text-align: center">
                    <a href="${pageContext.request.contextPath }/student/distribution/detail.do?semester=${selectedSem}&classId=${USER_SESSION.classId}"
                       class="btn btn-primary btn-lg" role="button" target="_blank">查看详细</a></p>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- page  end-->
    <footer class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    2020 © 教材征订系统 - YangZejiang
                </div>
            </div>
        </div>
    </footer>
</div>

<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
</body>
</html>