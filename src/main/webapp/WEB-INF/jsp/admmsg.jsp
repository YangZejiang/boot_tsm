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
                        <a href="${pageContext.request.contextPath }/admin/message.do" class="active">
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
                <h1 class="page-header">公告通知管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <a href="#" class="btn btn-primary btn-sm" data-toggle="modal"
                   data-target="#addDialog" style="margin-bottom: 5px" onclick="reset()">新建</a>

                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-success">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse" href="#collapseOne"
                                   aria-expanded="true" aria-controls="collapseOne">
                                    正上线
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingOne">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>标题</th>
                                    <th>对象</th>
                                    <th>创建时间</th>
                                    <th>更新时间</th>
                                    <th>创建人</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${doingList}" var="row" varStatus="status">
                                    <tr>
                                        <td style="text-align:center">${row.msgId}</td>
                                        <td style="text-align:center;"><a
                                                style="width: 280px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"
                                                href="#" class="btn btn-xs" data-toggle="modal"
                                                data-target="#mesDialog"
                                                onclick="viewMessageDtl('${row.msgId}')">${row.title}</a></td>
                                        <td style="text-align:center">
                                            <c:choose>
                                                <c:when test="${row.status == 0}">学生</c:when>
                                                <c:when test="${row.status ==1}">教师</c:when>
                                                <c:otherwise>全体师生
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="text-align:center"><fmt:formatDate value="${row.createTime}"
                                                                                      pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td style="text-align:center"><fmt:formatDate value="${row.updateTime}"
                                                                                      pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td style="text-align:center">${row.createBy}</td>
                                        <td style="text-align:center"><a href="#" class="btn btn-danger btn-xs"
                                                                         onclick="offline('${row.msgId}')">下线</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="panel panel-info">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse"
                                   href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                    草稿箱
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel"
                             aria-labelledby="headingTwo">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>标题</th>
                                    <th>对象</th>
                                    <th>创建时间</th>
                                    <th>上次修改</th>
                                    <th>创建人</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${draftList}" var="row" varStatus="status">
                                    <tr>
                                        <td style="text-align:center">${row.msgId}</td>
                                        <td style="text-align:center"><a
                                                style="width: 280px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"
                                                href="#" class="btn btn-xs" data-toggle="modal"
                                                data-target="#mesDialog"
                                                onclick="viewMessageDtl('${row.msgId}')">${row.title}</a></td>
                                        <td style="text-align:center">
                                            <c:choose>
                                                <c:when test="${row.status == 0}">学生</c:when>
                                                <c:when test="${row.status == 1}">教师</c:when>
                                                <c:otherwise>全体师生
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="text-align:center"><fmt:formatDate value="${row.createTime}"
                                                                                      pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td style="text-align:center"><fmt:formatDate value="${row.updateTime}"
                                                                                      pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td style="text-align:center">${row.createBy}</td>
                                        <td style="text-align:center"><a href="#" class="btn btn-warning btn-xs" data-toggle="modal"
                                                                         data-target="#editDialog"
                                                                         onclick="getEditInfo('${row.msgId}')">修改</a> <a
                                                href="#" class="btn btn-success btn-xs"
                                                onclick="online('${row.msgId}')">上线</a>
                                            <a href="#" class="btn btn-primary btn-xs" style="background-color: #777777" onclick="delete1('${row.msgId}')">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- panel-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <b>历史通知</b>
                        </div>
                        <!-- /.panel-heading -->
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>标题</th>
                                <th>对象</th>
                                <th>创建时间</th>
                                <th>下线时间</th>
                                <th>创建人</th>
                                <th>下线人</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.rows}" var="row" varStatus="status">
                                <tr>
                                    <td style="text-align:center">${row.msgId}</td>
                                    <td style="text-align:center"><a
                                            style="width: 280px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"
                                            href="#" class="btn btn-xs" data-toggle="modal"
                                            data-target="#mesDialog"
                                            onclick="viewMessageDtl('${row.msgId}')">${row.title}</a></td>
                                    <td style="text-align:center">
                                        <c:choose>
                                            <c:when test="${row.status == 0}">学生</c:when>
                                            <c:when test="${row.status == 1}">教师</c:when>
                                            <c:otherwise>全体师生
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="text-align:center"><fmt:formatDate value="${row.createTime}"
                                                                                  pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td style="text-align:center"><fmt:formatDate value="${row.updateTime}"
                                                                                  pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td style="text-align:center">${row.createBy}</td>
                                    <td style="text-align:center">${row.updateBy}</td>
                                    <td style="text-align:center"><span class="badge"> </span></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="col-md-12 text-right">
                            <itheima:page url="${pageContext.request.contextPath }/admin/message.do"/>
                        </div>
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
</div>

<!-- 新建模态框 -->
<div class="modal fade" id="addDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建通知</h4>
            </div>
            <form class="form-horizontal" id="addForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="status" class="col-sm-2 control-label">对象</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="status" name="status">
                                <option value="2">全体师生</option>
                                <option value="0">学生</option>
                                <option value="1">教师</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label"><span
                                style="color: red">*</span>标题</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="title" placeholder="*必须" name="title"
                                   required="required"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="msgcontent" class="col-sm-2 control-label">通知内容</label>
                        <div class="col-sm-9">
                            <textarea id="msgcontent" class="form-control" rows="20" placeholder="请在这里输入:"
                                      name="description"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <span style="float: left"><b>操作员：${USER_SESSION.admId}</b></span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" onclick="toDraft()">保存</button>
                    <button type="submit" class="btn btn-success" onclick="toOnline()">上线</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 修改模态框 -->
<div class="modal fade" id="editDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel3">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel3">修改通知</h4>
            </div>
            <form class="form-horizontal" id="editForm">
                <input id="msgId" name="msgId" hidden="hidden" readonly="readonly">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="status" class="col-sm-2 control-label">对象</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="status2" name="status">
                                <option value="2">全体师生</option>
                                <option value="0">学生</option>
                                <option value="1">教师</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label"><span
                                style="color: red">*</span>标题</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="title2" placeholder="*必须" name="title"
                                   required="required"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="msgcontent" class="col-sm-2 control-label">通知内容</label>
                        <div class="col-sm-9">
                            <textarea id="msgcontent2" class="form-control" rows="20" placeholder="请在这里输入:"
                                      name="description"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <span style="float: left"><b>操作员：${USER_SESSION.admId}</b></span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-default" onclick="edit()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 查看公告模态框 -->
<div class="modal fade" id="mesDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2"></h4>
            </div>
            <div class="modal-body">
                <div id="description"></div>

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

    $("div[role=dialog]").modal({
        keyboard: false,
        backdrop: 'static',
        show: false
    })
    function reset() {
        $("#addForm")[0].reset();

    }

    // 通过id获取公告
    function viewMessageDtl(id) {
        //清理之前的数据
        $("#myModalLabel2").empty();
        $("#description").empty();
        $.ajax({
            type: "get",
            url: "<%=basePath%>admin/message/getMessageDtl.do",
            data: {"id": id},
            success: function (data) {
                $("#myModalLabel2").append(data.title);
                $("#description").append(data.description);

            }
        });
    }

    // 下线
    function offline(id) {
        if (confirm("确认下线？")) {
            $.ajax({
                type: "post",
                url: "<%=basePath%>admin/message/offline.do",
                data: {"id": id},
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

    // 上线
    function online(id) {
        if (confirm("确认上线？")) {
            $.ajax({
                type: "post",
                url: "<%=basePath%>admin/message/online.do",
                data: {"id": id},
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

    // 删除通知
    function delete1(id) {
        if (confirm("确认删除？")) {
            $.ajax({
                type: "post",
                url: "<%=basePath%>admin/message/delete.do",
                data: {"id": id},
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

    // 通知保存并上线
    function toOnline() {
        $.post("<%=basePath%>admin/message/toOnline.do",
            $("#addForm").serialize(), function (data) {
                if (data.code == "OK") {
                    window.location.reload();
                } else {
                    alert(data.msg);
                }
            });
    }

    // 通知保存并存入草稿
    function toDraft() {
        $.post("<%=basePath%>admin/message/toDraft.do",
            $("#addForm").serialize(), function (data) {
                if (data.code == "OK") {
                    window.location.reload();
                } else {
                    alert(data.msg);
                }
            });
    }

    // 获取被修改通知的内容
    function getEditInfo(id) {
        $.ajax({
                type: "get",
                url: "<%=basePath%>admin/message/getMessageDtl.do",
                data: {"id": id},
                success: function (data) {
                    $("#msgId").val(data.msgId);
                    $("#title2").val(data.title);
                    $("#msgcontent2").val(data.description);
                    $("#status2").val(data.status);
                }
            }
        );
    }

    // 通知保存并存入草稿
    function edit() {
        $.post("<%=basePath%>admin/message/edit.do",
            $("#editForm").serialize(), function (data) {
                if (data.code == "OK") {
                    window.location.reload();
                } else {
                    alert(data.msg);
                }
            });
    }

</script>
</body>
</html>