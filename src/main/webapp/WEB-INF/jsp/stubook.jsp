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
    <style>
        img {
            width: auto;
            height: auto;
            max-width: 100%;
            max-height: 100%;
        }
    </style>
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
                        <a href="${pageContext.request.contextPath }/student/textbook.do" class="active">
                            <i class="fa fa-book fa-fw" aria-hidden="true"></i> 教材选订
                        </a>
                    </li>

                    <c:if test="${USER_SESSION.isMonitor == true}">
                        <li>
                            <a href="${pageContext.request.contextPath }/student/distribution.do">
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
                <h1 class="page-header">教材选订</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/student/textbook.do">
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
                <!--本学期所需教材 panel-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b>本学期所需教材</b>
                    </div>
                    <!-- /.panel-heading -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th style="">课程名称</th>
                            <th style="">课程性质</th>
                            <th style="">教师姓名</th>
                            <th style="">教材名称</th>
                            <th style="">ISBN</th>
                            <c:if test="${access == '10'}">
                                <th style="">操作</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${bookList}" var="row" varStatus="status">
                            <tr>
                                <td style="text-align:center">${row.cdtlName}</td>
                                <td style="text-align:center">${row.nature}</td>
                                <td style="text-align:center">${row.tchName}</td>
                                <td style="text-align:center"><a href="#" class="btn btn-xs" data-toggle="modal"
                                                                 data-target="#bookDtlDialog"
                                                                 onclick="viewBookDtl('${row.applyId}','${row.isbn}')">${row.title}</a>
                                </td>
                                <td style="text-align:center">${row.isbn}</td>
                                <td style="text-align:center">
                                    <c:if test="${access == '10'}">
                                        <a href="#" data-toggle="modal"
                                           onclick="add('${row.applyId}','${selectedSem}','${row.title}')"> <i
                                                class="fa fa-plus-square-o fa-2x" aria-hidden="true"></i></a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.panel -->

                <!--已订购教材 panel-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b>已订购教材</b>
                    </div>
                    <!-- /.panel-heading -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th style=""></th>
                            <th style="">课程名称</th>
                            <th style="">教材名称</th>
                            <th style="">ISBN</th>
                            <th style="">状态</th>
                            <c:if test="${access == '10'}">
                                <th style="">操作</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orderList}" var="row" varStatus="status">
                            <tr>
                                <td style="text-align:center">${status.count}</td>
                                <td style="text-align:center">${row.cdtlName}</td>
                                <td style="text-align:center">${row.title}</td>
                                <td style="text-align:center">${row.isbn}</td>
                                <c:if test="${row.status=='0'}">
                                    <td style="text-align:center">未领取</td>
                                </c:if>
                                <c:if test="${row.status=='1'}">
                                    <td style="text-align:center">已领取</td>
                                </c:if>
                                <c:if test="${row.status=='-1'}">
                                    <td style="text-align:center">已取消</td>
                                </c:if>
                                <c:if test="${access == '10'&& row.status =='0'}">
                                    <td style="text-align:center">
                                        <a href="#" data-toggle="modal"
                                           onclick="cancel('${row.oStuId}','${selectedSem}','${row.title}')"> <i
                                                class="fa fa-remove fa-lg fa-2x" style="color: #dc3545"
                                                aria-hidden="true"></i></a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.panel -->
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

<!-- 查看教材详情模态框 -->
<div class="modal fade" id="bookDtlDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">教材详细</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div id="img" class="col-md-8 col-md-offset-2"></div>
                    <div id="content" class="col-md-8" style="margin: 10px 100px"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
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
<!-- 编写js代码 -->
<script type="text/javascript">

    // 添加购买
    function add(applyId, selectedSem, title) {
        if (confirm("确认购买:" + title + "?")) {
            $.ajax({
                type: "post",
                url: "<%=basePath%>student/textbook/add.do",
                data: {"applyId": applyId, "selectedSem": selectedSem},
                success: function (data) {
                    alert(data.msg);
                    window.location.reload();
                }
            });
        }
    }

    // 取消购买
    function cancel(oStuId, selectedSem, title) {
        if (confirm("确认取消:" + title + "?")) {
            $.ajax({
                type: "post",
                url: "<%=basePath%>student/textbook/cancel.do",
                data: {"id": oStuId, "selectedSem": selectedSem},
                success: function (data) {
                    alert(data.msg);
                    window.location.reload();
                }
            });
        }
    }

    // 查看教材详情
    function viewBookDtl(applyId, isbn) {
        //清理之前的数据
        $("#img").empty();
        $("#content").empty();
        $.ajax({
            type: "get",
            url: "<%=basePath%>student/textbook/detail.do",
            data: {"applyId": applyId, "isbn": isbn},
            success: function (data) {
                $("#img").append('<img src="' + data.imgUrl + '" alt="" class="img-rounded">');
                console.log(data.imgUrl);
                $("#content").append('<p>书名：' + data.title + '</p>');
                $("#content").append('<p>作者：' + data.author + '</p>');
                $("#content").append('<p>出版社：' + data.press + '</p>');
                $("#content").append('<p>ISBN：' + data.isbn + '</p>');
                $("#content").append('<p>价格：' + data.price + ' ¥</p>');

            }
        });
    }


</script>
</body>
</html>