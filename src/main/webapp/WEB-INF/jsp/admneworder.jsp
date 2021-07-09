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
    <style>
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
                        <a href="${pageContext.request.contextPath }/admin/neworder.do" class="active">
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
                <h1 class="page-header">教材待订购</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <!-- panel-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b>⚠️学生关闭前，统计不明确。</b>
                    </div>
                    <!-- /.panel-heading -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ISBN</th>
                            <th>教材名称</th>
                            <th>库存</th>
                            <th>需要</th>
                            <th>缺少</th>
                            <th width="10%"></th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="row" varStatus="status">
                            <tr>
                                <td style="text-align:center">${row.isbn}</td>
                                <td style="text-align:center"><a href="#" class="btn btn-xs" data-toggle="modal"
                                                                 data-target="#bookDtlDialog"
                                                                 onclick="viewBookDtl('${row.isbn}')">${row.title}</a>
                                </td>
                                <td style="text-align:center">${row.stockQuantity}</td>
                                <td style="text-align:center">${row.isbnorderNum}</td>
                                <td style="text-align:center;color: red"><b>${row.lack}</b></td>
                                <td style="text-align:center">
                                    <c:if test="${row.isProcessing == 1}">
                                        <span class="badge">存在未完成订单</span>
                                    </c:if>
                                </td>
                                <td style="text-align:center"><a href="#" class="btn btn-primary btn-xs"
                                                                 data-toggle="modal"
                                                                 data-target="#addDialog"
                                                                 onclick="reset('${row.isbn}')">下单</a></td>
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
<!-- 模态框 -->
<div class="modal fade" id="addDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建订单</h4>
            </div>
            <form class="form-horizontal" id="addForm">
                <input id="isbn" hidden="hidden" readonly="readonly" name="isbn">
                <div class="modal-body">
                    <div class="row">
                        <div id="img2" class="col-md-6 col-md-offset-1"></div>
                        <div id="content2" class="col-md-5" style=""></div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="orderFrom" class="col-sm-2 control-label"><span
                                style="color:red;">*</span>供应商</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="orderFrom" placeholder="(*必填)如:淘宝商家/出版社/新华书店..."
                                   name="orderFrom" required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="quantity" class="col-sm-2 control-label"><span style="color:red;">*</span>数量</label>
                        <div class="col-sm-3">
                            <input type="number" class="form-control" id="quantity" name="quantity" step="1" min="0"
                                   required="required" placeholder="*必填"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="unitPrice" class="col-sm-2 control-label"><span
                                style="color:red;">*</span>单价</label>
                        <div class="row">
                            <div class="col-sm-3">
                                <input type="number" class="form-control" id="unitPrice" name="unitPrice" step="0.01"
                                       min="0" required="required" placeholder="*必填"/>
                            </div>
                            <div class="col-sm-6" id="otherprice" style="color: #888888"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="memo" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-8">
                             <textarea id="memo" class="form-control" rows="4" placeholder="..."
                                       name="memo"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <span style="float: left"><b>操作员：${USER_SESSION.admId}</b></span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" onclick="addOrder()">确认</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 查看教材详情模态框 -->
<div class="modal fade" id="bookDtlDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">教材详细</h4>
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

    $("#addDialog").modal({
        keyboard: false,
        backdrop: 'static',
        show: false
    })

    // 查看教材详情
    function viewBookDtl(isbn) {
        //清理之前的数据
        $("#img").empty();
        $("#content").empty();
        $.ajax({
            type: "get",
            url: "<%=basePath%>admin/stock/detail.do",
            data: {"isbn": isbn},
            success: function (data) {
                $("#img").append('<img src="' + data.imgUrl + '" alt="" class="img-rounded">');
                $("#content").append('<p>书名：' + data.title + '</p>');
                $("#content").append('<p>作者：' + data.author + '</p>');
                $("#content").append('<p>出版社：' + data.press + '</p>');
                $("#content").append('<p>ISBN：' + data.isbn + '</p>');
                $("#content").append('<p>价格：' + data.fixedPrice + ' ¥</p>');
            }
        });
    }


    function reset(isbn) {
        //清理之前的数据
        $("#img2").empty();
        $("#content2").empty();
        $("#otherprice").empty();
        $("#addForm")[0].reset();
        $.ajax({
            type: "get",
            url: "<%=basePath%>admin/neworder/getOrderInfo.do",
            data: {"isbn": isbn},
            success: function (data) {
                $("#img2").append('<img src="' + data.tb.imgUrl + '" alt="" class="img-rounded">');
                $("#content2").append('<p>书名：' + data.tb.title + '</p>');
                $("#content2").append('<p>作者：' + data.tb.author + '</p>');
                $("#content2").append('<p>出版社：' + data.tb.press + '</p>');
                $("#content2").append('<p>ISBN：' + data.tb.isbn + '</p>');
                $("#content2").append('<p>价格：' + data.tb.fixedPrice + ' ¥</p>');
                console.log(data.lastPrice);
                console.log(data.minPrice);
                if (data.lastPrice != '0') {
                    $("#otherprice").append('<span>最近价格: ' + data.lastPrice + '</span><br>');
                } else {
                    $("#otherprice").append('<span>最近价格: 暂无</span><br>');
                }
                if (data.minPrice != '0') {
                    $("#otherprice").append('<span>历史最低: ' + data.minPrice + '</span>');
                } else {
                    $("#otherprice").append('<span>历史最低: 暂无</span>');
                }
            }
        });
        $("#isbn").val(isbn);
    }

    // 下单
    function addOrder() {
        $.post("<%=basePath%>admin/order/add.do",
            $("#addForm").serialize(), function (data) {
                if (data.code == "OK") {
                    alert(data.msg);
                    window.location.reload();
                } else {
                    alert(data.msg);
                }
            });
    }


</script>
</body>
</html>