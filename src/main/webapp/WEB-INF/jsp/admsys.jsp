<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="referrer" content="no-referrer">
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
    <link href="<%=basePath%>css/titatoggle-dist-min.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>admin/profile.do">教材征订系统 - 部门端</a>
        </div>

        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <span>欢迎，${USER_SESSION.admName} 管理员！</span>
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i>
                        用户：${USER_SESSION.admName}
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
                        <a href="${pageContext.request.contextPath }/admin/profile.do">
                            <i class="fa fa-user fa-fw" aria-hidden="true"></i> 个人信息
                        </a>
                    </li>
                    <br>
                    <li>
                        <a href="${pageContext.request.contextPath }/admin/newbook.do">
                            <i class="fa fa-pencil fa-fw" aria-hidden="true"></i> 教材信息未录入
                            <span class="badge" style="background-color: #dc3545">${badgeMap.badge1}</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/admin/neworder.do">
                            <i class="fa fa-cart-arrow-down fa-fw" aria-hidden="true"></i> 教材待订购
                            <span class="badge" style="background-color: #dc3545">${badgeMap.badge2}</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/admin/distribution.do">
                            <i class="fa fa-hand-lizard-o fa-fw" aria-hidden="true"></i> 教材分发
                            <span class="badge" style="background-color: #dc3545">${badgeMap.badge3}</span>
                        </a>
                    </li>
                    <br>
                    <li>
                        <a href="${pageContext.request.contextPath }/admin/tchapply.do">
                            <i class="fa fa-book fa-reorder" aria-hidden="true"></i> 教师教材填报管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/admin/stock.do">
                            <i class="fa fa-book fa-fw" aria-hidden="true"></i> 教材库存与信息管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/admin/order.do">
                            <i class="fa fa-sticky-note fa-fw" aria-hidden="true"></i> 对外购书订单管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/admin/message.do">
                            <i class="fa fa-bullhorn fa-fw" aria-hidden="true"></i> 公告通知管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/admin/system.do" class="active">
                            <i class="fa fa-cog fa-fw" aria-hidden="true"></i> 系统管理
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左侧显示列表部分 end-->
    </nav>

    <!-- page  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">系统管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-6">
                <!-- panel-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b>[TYPECODE:100]前端开放</b>
                    </div>
                    <!-- /.panel-heading -->
                    <table class="table table-hover table-bordered">

                        <thead>
                        <tr>
                            <th>学期</th>
                            <th>角色</th>
                            <th width="100px">状态
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="row">
                            <tr>
                                <td style="text-align:center;vertical-align: middle"
                                    rowspan="2">${row.dictItemCode}</td>
                                <td style="text-align:center">学生
                                </td>
                                <td style="text-align:center">
                                    <div class="form-check checkbox-slider--b checkbox-slider--default">
                                        <label>
                                            <c:choose>
                                                <c:when test="${row.dictItemName == '10'}">
                                                    <input type="checkbox" checked
                                                           data-cd="S${row.dictItemCode}${row.dictItemName}"
                                                           onclick="check(this)">
                                                    <span data-cd="S${row.dictItemCode}${row.dictItemName}">打开</span>
                                                </c:when>
                                                <c:otherwise> <input type="checkbox"
                                                                     data-cd="S${row.dictItemCode}${row.dictItemName}"
                                                                     onclick="check(this)">
                                                    <span data-cd="S${row.dictItemCode}${row.dictItemName}">关闭</span></c:otherwise>
                                            </c:choose>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center">教师</td>
                                <td style="text-align:center">
                                    <div class="form-check checkbox-slider--b checkbox-slider--default">
                                        <label>
                                            <c:choose>
                                                <c:when test="${row.dictItemName == '01'}">
                                                    <input type="checkbox" checked
                                                           data-cd="T${row.dictItemCode}${row.dictItemName}"
                                                           onclick="check(this)">
                                                    <span data-cd="T${row.dictItemCode}${row.dictItemName}">打开</span>
                                                </c:when>
                                                <c:otherwise> <input type="checkbox"
                                                                     data-cd="T${row.dictItemCode}${row.dictItemName}"
                                                                     onclick="check(this)">
                                                    <span data-cd="T${row.dictItemCode}${row.dictItemName}">关闭</span></c:otherwise>
                                            </c:choose>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <th colspan="4">⚠️学生端/教师端不可同时开启！</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
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

<script>
    function check(e) {
        var p = $(e).attr("data-cd");
        console.log("---p:---" + p);
        $.ajax({
            type: "post",
            url: "<%=basePath%>admin/system/frontCtrl.do",
            data: {"p": p},
            success: function (data) {
                console.log("---data.code---" + data.code);
                if (data.code == 'OK') {
                    if (typeof ($(e).attr("checked")) == "undefined") {
                        $(e).attr("checked", "checked");
                        $("span[data-cd=" + p + "]").text("打开");
                    } else {
                        $(e).removeAttr("checked");
                        $("span[data-cd=" + p + "]").text("关闭");
                    }
                    $(e).attr("data-cd", data.re);
                    $("span[data-cd=" + p + "]").attr("data-cd", data.re);
                } else {
                    alert(data.msg);
                    if (typeof ($(e).attr("checked")) == "undefined") {
                        $(e).removeAttr("checked");
                    } else {
                        $(e).attr("checked", "checked");
                    }
                }

            }
        });


    }
</script>
</body>
</html>