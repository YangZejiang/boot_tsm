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
    <!-- page  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <!-- panel-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b>${title}</b>
                    </div>
                    <!-- /.panel-heading -->
                    <table class="table table-hover table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th style="width: 10%">学号</th>
                            <th style="width: 10%">姓名</th>
                            <th style="">教材名称</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="row" varStatus="status">
                            <tr>
                                <td style="text-align:center">${row.stuId}</td>
                                <td style="text-align:center">${row.stuName}</td>
                                <td style="">${row.titleGroup}</td>
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
                $("#img").append('<img src="<%=basePath%>images/bg.png" style="width:200px;height:200px" alt="教材图片" class="img-rounded">');
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