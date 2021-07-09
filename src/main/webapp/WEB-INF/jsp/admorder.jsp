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
        td {
            text-align: center;
        }

        img {
            width: auto;
            height: auto;
            max-width: 80%;
            max-height: 80%;
        }
    </style>
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
                        <a href="${pageContext.request.contextPath }/admin/order.do" class="active">
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
                <h1 class="page-header">对外购书订单管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/admin/order.do">
                    <div class="form-group" style="width: 170px">
                        <label for="status">订单状态</label>
                        <select class="form-control" id="status" name="status">
                            <option value="2"  <c:if test="${status == 2}"> selected</c:if>>全部</option>
                            <option value="0" <c:if test="${status == 0}"> selected</c:if>>进行中</option>
                            <option value="1" <c:if test="${status == 1}"> selected</c:if>>已完成</option>
                            <option value="-1" <c:if test="${status == -1}"> selected</c:if>>已取消</option>
                        </select>
                    </div>
                    <div class="form-group" style="width: 180px">
                        <label for="title"></label>
                        <input type="text" class="form-control" id="title" placeholder="请输入教材名称查询"
                               value="${title}" name="title"/>
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
                    <%--                    <div class="panel-heading">--%>
                    <%--                        <b>历史订单</b>--%>
                    <%--                    </div>--%>
                    <!-- /.panel-heading -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>订单号</th>
                            <th>教材名称</th>
                            <th>ISBN</th>
                            <th>供应商</th>
                            <th>状态</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.rows}" var="row" varStatus="status">
                            <tr>
                                <td>${row.oAdId}</td>
                                <td>${row.title}</td>
                                <td>${row.isbn}</td>
                                <td>${row.orderFrom}</td>
                                <td><c:choose><c:when test="${row.status ==0}"><span
                                        class="label label-primary">进行中</span></c:when>
                                    <c:when test="${row.status ==1}"><span
                                            class="label label-success">已完成</span></c:when>
                                    <c:otherwise><span
                                            class="label label-default">已取消</span></c:otherwise></c:choose></td>
                                <td><fmt:formatDate value="${row.createTime}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td><a href="#" class="btn btn-primary btn-xs"
                                       data-toggle="modal"
                                       data-target="#DtlDialog"
                                       onclick="viewOrderDtl('${row.oAdId}','${row.isbn}')">查看</a>
                                    <c:if test="${row.status ==0}">
                                        <a href="#" class="btn btn-success btn-xs"
                                           onclick="inStock('${row.oAdId}')">入库</a>
                                        <a href="#" class="btn btn-danger btn-xs"
                                           onclick="cancelOrder('${row.oAdId}')">取消</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <itheima:page url="${pageContext.request.contextPath }/admin/order.do"/>
                    </div>
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
</div>

<!-- 模态框 -->
<div class="modal fade" id="DtlDialog" tabindex="-1" role="dialog"
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
                    <div class="col-md-12">
                    <div id="img" class="col-md-6 col-md-offset-1"></div>
                    <div id="content1" class="col-md-5"></div>
                </div>
                   <hr class="col-md-11">
                    <div id="content2" class="col-md-11 col-md-offset-1"></div>
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

    // 入库
    function inStock(id) {
        if (confirm("确认入库？")) {
            $.ajax({
                type: "post",
                url: "<%=basePath%>admin/order/instock.do",
                data: {"oAdId": id},
                success: function (data) {
                    if (data.code == "OK") {
                        window.location.reload();
                    } else {
                        alert(data.msg);
                    }
                }
            });
        }
    }

    // 取消
    function cancelOrder(id) {
        if (confirm("确认取消此订单？")) {
            $.ajax({
                type: "post",
                url: "<%=basePath%>admin/order/cancel.do",
                data: {"oAdId": id},
                success: function (data) {
                    if (data.code == "OK") {
                        window.location.reload();
                    } else {
                        alert(data.msg);
                    }
                }
            });
        }
    }

    function viewOrderDtl(oAdId, isbn) {
        //清理之前的数据
        $("#img").empty();
        $("#content1").empty();
        $("#content2").empty();

        $.ajax({
            type: "get",
            url: "<%=basePath%>admin/order/detail.do",
            data: {"oAdId": oAdId, "isbn": isbn},
            success: function (data) {
                $("#img").append('<img src="' + data.tb.imgUrl + '" alt="" class="img-rounded">');
                $("#content1").append('<p>书名：' + data.tb.title + '</p>');
                $("#content1").append('<p>作者：' + data.tb.author + '</p>');
                $("#content1").append('<p>出版社：' + data.tb.press + '</p>');
                $("#content1").append('<p>ISBN：' + data.tb.isbn + '</p>');
                $("#content1").append('<p>价格：' + data.tb.fixedPrice + ' ¥</p>');

                $
                $("#content2").append('<p>订单号：' + data.or.oAdId + '</p>');
                $("#content2").append('<p>供货商：' + data.or.orderFrom + '</p>');
                $("#content2").append('<p>数量：' + data.or.quantity + '</p>');
                $("#content2").append('<p>单价：' + data.or.unitPrice + '</p>');
                $("#content2").append('<p>备注：' + data.or.memo + '</p>');
                $("#content2").append('<p>创建时间：' + data.or.createTime + '    创建员：' + data.or.createBy + '</p>');
                if (data.or.status == 1) {
                    $("#myModalLabel").append("已完成");
                    $("#content2").append('<p>入库时间：' + data.or.updateTime + '    入库员：' + data.or.updateBy + '</p>');
                } else if (data.or.status == -1) {
                    ("#myModalLabel").append("已取消");
                    $("#content2").append('<p>取消时间：' + data.or.updateTime + '    操作员：' + data.or.updateBy + '</p>');
                } else {
                    ("#myModalLabel").append("进行中");
                    $("#content2").append('<p>入库时间：</p>');
                }
            }
        });
    }


</script>
</body>
</html>