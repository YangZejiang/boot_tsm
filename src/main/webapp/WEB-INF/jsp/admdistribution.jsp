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
                        <a href="${pageContext.request.contextPath }/admin/distribution.do" class="active">
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
                        <a href="${pageContext.request.contextPath }/admin/system.do">
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
                <h1 class="page-header">教材分发</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/admin/distribution.do">
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
                    <div class="form-group" style="width: 220px">
                        <label for="classId">班级</label>
                        <input type="text" class="form-control" id="classId" placeholder=""
                               value="${classId }" name="classId"/>
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
                        <b>待领取班级</b>
                    </div>
                    <!-- /.panel-heading -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th style="">班级编号</th>
                            <th style="">班长姓名</th>
                            <th style="">手机号</th>
                            <th style=""></th>
                            <th style="">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.rows}" var="row" varStatus="status">
                            <tr>
                                <td style="text-align:center">${row.classId}</td>
                                <td style="text-align:center">${row.stuName}</td>
                                <td style="text-align:center">${row.phone}</td>
                                <td style="text-align:center">
                                    <c:choose>
                                        <c:when test="${row.doneNum > 0}">
                                            <span style="background-color: #5cb85c" class="badge">${row.doneNum}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge">${row.doneNum}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td style="text-align:center"><a href="#" class="btn btn-primary btn-xs"
                                                                 data-toggle="modal"
                                                                 data-target="#viewDtlDialog"
                                                                 onclick="viewDtl('${row.classId}')">查看详细</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <itheima:page url="${pageContext.request.contextPath }/admin/distribution.do"/>
                    </div>
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
</div>
<!-- 查看班级领取详情模态框 -->
<div class="modal fade" id="viewDtlDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">
                <div class="row">
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
    $("#viewDtlDialog").modal({
        keyboard: false,
        backdrop: 'static',
        show: false
    })

    // 清空窗口中的数据
    function clear() {
        $("#myModalLabel").empty();
        $("#content").empty();
    }

    var classId;

    // 通过班级id获取详情
    function viewDtl(id) {
        clear();
        $.ajax({
                type: "get",
                url: "<%=basePath%>admin/distribution/detail.do",
                data: {"classId": id},
                success: function (data) {
                    $('#myModalLabel').append(id);
                    // 存储作为确认领取的参数
                    classId = id;
                    if (data != null) {
                        var html = '<table class="table">' +
                            ' <thead>' +
                            '<tr>' +
                            '<th>书名</th>' +
                            '<th>ISBN</th>' +
                            '<th>数量</th>' +
                            '<th></th>' +
                            '</tr>' +
                            '</thead>' +
                            '<tbody';
                        $.each(data, function (i, row) {
                            html = html + '<tr>' + '<td style="text-align:center">' + row.title + '</td>' +
                                '<td style="text-align:center">' + row.isbn + '</td>' +
                                '<td style="text-align:center" width="50px">' + row.classorderNum + '</td>';
                            if (row.status == 0 && row.stockQuantity >= row.isbnorderNum) {
                                html = html + '<td id="' + row.isbn + '" style="text-align:center" width="100px"><a href="#" class="btn btn-primary btn-xs" onclick="solved(' + row.isbn + ')">确认领取</a> </td>';
                            } else if (row.status == 1) {
                                html = html + '<td style="text-align:center" width="100px"><span class="label label-success">已领取</span></td>';
                            } else {
                                html = html + '<td style="text-align:center" width="100px"><span class="label label-default">库存不足</span></td>';
                            }
                            html = html + '</tr>';
                        });
                        html = html + '</tbody>' + '</table>';
                        $("#content").append(html);

                    }
                }
            }
        );
    }

    // 确认收获
    function solved(isbn) {
        if (confirm("确认领取?")) {
            $.ajax({
                type: "post",
                url: "<%=basePath%>admin/distribution/solved.do",
                data: {"classId": classId, "isbn": isbn},
                success: function (data) {
                    if (data.code = "OK") {
                        $("#" + isbn).empty();
                        $("#" + isbn).append('<td style="text-align:center"><span class="label label-success">已领取</span></td>');
                    } else {
                        alert(data.msg);
                    }
                }
            });
        }


    }

</script>
</body>
</html>