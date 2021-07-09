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
        td {
            text-align: center;
        }

        img {
            width: auto;
            height: auto;
            max-width: 100%;
            max-height: 100%;
        }

        #editDialog img {
            width: auto;
            height: auto;
            max-width: 60%;
            max-height:60%;
        }

        #addOrderDialog img {
            width: auto;
            height: auto;
            max-width: 80%;
            max-height:80%;
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
                        <a href="${pageContext.request.contextPath }/admin/stock.do" class="active">
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
                <h1 class="page-header">教材库存与信息管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/admin/stock.do">
                    <div class="form-group" style="width: 260px">
                        <label for="title">教材名称</label>
                        <input type="text" class="form-control" id="title" placeholder=""
                               value="${title }" name="title"/>
                    </div>
                    <div class="form-group" style="width: 220px">
                        <label for="isbn">ISBN</label>
                        <input type="text" class="form-control" id="isbn" placeholder=""
                               value="${isbn}" name="isbn"/>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->

        <div class="row">
            <div class="col-lg-12">
                <a href="#" class="btn btn-primary btn-sm" data-toggle="modal"
                   data-target="#addDialog" style="margin-bottom: 5px" onclick="reset()">新建</a>
                <!-- panel-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b>教材信息表</b>
                    </div>
                    <!-- /.panel-heading -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ISBN</th>
                            <th>教材名称</th>
                            <th>作者</th>
                            <th>出版社</th>
                            <th>单价</th>
                            <th>库存</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.rows}" var="row" varStatus="status">
                            <tr>
                                <td>${row.isbn}</td>
                                <td><a tabindex="0" role="button" data-toggle="popover"
                                       data-content='<img src="${row.imgUrl}">'>${row.title}</a></td>
                                <td>${row.author}</td>
                                <td>${row.press}</td>
                                <td>${row.fixedPrice}</td>
                                <td>${row.stockQuantity}</td>
                                <td><a href="#" class="btn btn-primary btn-xs"
                                       data-toggle="modal"
                                       data-target="#addOrderDialog"
                                       onclick="addOrder('${row.isbn}')">下单</a>
                                    <a href="#" class="btn btn-warning btn-xs"
                                       data-toggle="modal"
                                       data-target="#editDialog"
                                       onclick="getEditInfo('${row.isbn}')">修改</a>
                                    <a href="#" class="btn btn-danger btn-xs" onclick="stockDelete('${row.isbn}')">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <itheima:page url="${pageContext.request.contextPath }/admin/stock.do"/>
                    </div>
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
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
                <h4 class="modal-title" id="myModalLabel">新建教材信息词条</h4>

            </div>
            <form class="form-horizontal" id="addForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="isbn2" class="col-sm-2 control-label"><span style="color: red">*</span>ISBN</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="isbn2" placeholder="13位数字" name="isbn"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title2" class="col-sm-2 control-label"><span style="color: red">*</span>书名</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="title2" placeholder="书名" name="title"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="author2" class="col-sm-2 control-label"><span style="color: red">*</span>作者</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="author2" placeholder="作者" name="author"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="press2" class="col-sm-2 control-label"><span style="color: red">*</span>出版社</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="press2" placeholder="出版社" name="press"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fixedPrice2" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-3">
                            <input type="number" class="form-control" id="fixedPrice2" name="fixedPrice" step="0.01"
                                   min="0"/>
                        </div>

                        <label for="stockQuantity2" class="col-sm-2 control-label">库存</label>
                        <div class="col-sm-3">
                            <input type="number" class="form-control" id="stockQuantity2" name="stockQuantity" step="1"
                                   min="0" value="0"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="imgFile2" class="col-sm-2 control-label">上传图片</label>
                        <div class="col-sm-5">
                            <input type="file" id="imgFile2" name="imgFile" accept="image/png,image/jpeg"/>
                            <p style="color: #9d9d9d">限制格式：jpg/png且小于3M</p>
                        </div>
                    </div>
                    <div style="margin: 0px 100px">
                        <img id="imgView2" src="" alt="" class="img-rounded">
                    </div>
                </div>
                <div class="modal-footer">
                    <span style="float: left"><b>操作员：${USER_SESSION.admId}</b></span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" onclick="add()">确认</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 修改模态框 -->
<div class="modal fade" id="editDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">修改信息</h4>

            </div>
            <form class="form-horizontal" id="editForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="isbn3" class="col-sm-2 control-label"><span style="color: red">*</span>ISBN</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="isbn3" placeholder="13位数字" name="isbn"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title3" class="col-sm-2 control-label"><span style="color: red">*</span>书名</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="title3" placeholder="书名" name="title"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="author3" class="col-sm-2 control-label"><span style="color: red">*</span>作者</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="author3" placeholder="作者" name="author"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="press3" class="col-sm-2 control-label"><span style="color: red">*</span>出版社</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="press3" placeholder="出版社" name="press"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fixedPrice3" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-3">
                            <input type="number" class="form-control" id="fixedPrice3" name="fixedPrice" step="0.01"
                                   min="0"/>
                        </div>

                        <label for="stockQuantity3" class="col-sm-2 control-label">库存</label>
                        <div class="col-sm-3">
                            <input type="number" class="form-control" id="stockQuantity3" name="stockQuantity" step="1"
                                   min="0"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="imgFile3" class="col-sm-2 control-label">上传图片</label>
                        <div class="col-sm-5">
                            <input type="file" id="imgFile3" name="imgFile" accept="image/png,image/jpeg"/>
                            <p style="color: #9d9d9d">限制格式：jpg/png且小于3M</p>
                        </div>
                    </div>
                    <div style="margin: 0px 100px">
                        <img id="imgView3" src="" alt="" class="img-rounded">
                    </div>
                </div>
                <div class="modal-footer">
                    <span style="float: left"><b>操作员：${USER_SESSION.admId}</b></span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" onclick="edit()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 下单模态框 -->
<div class="modal fade" id="addOrderDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel3">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel3">新建订单</h4>
            </div>
            <form class="form-horizontal" id="addOrderForm">
                <input id="isbn4" hidden="hidden" readonly="readonly" name="isbn">
                <div class="modal-body">
                    <div class="row">
                        <div id="img4" class="col-md-6 col-md-offset-1"></div>
                        <div id="content4" class="col-md-5" style=""></div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="orderFrom4" class="col-sm-2 control-label"><span
                                style="color:red;">*</span>供应商</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="orderFrom4"
                                   placeholder="(*必填)如:淘宝商家/出版社/新华书店..."
                                   name="orderFrom" required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="quantity4" class="col-sm-2 control-label"><span
                                style="color:red;">*</span>数量</label>
                        <div class="col-sm-3">
                            <input type="number" class="form-control" id="quantity4" name="quantity" step="1" min="0"
                                   required="required" placeholder="*必填"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="unitPrice4" class="col-sm-2 control-label"><span
                                style="color:red;">*</span>单价</label>
                        <div class="row">
                            <div class="col-sm-3">
                                <input type="number" class="form-control" id="unitPrice4" name="unitPrice" step="0.01"
                                       min="0" required="required" placeholder="*必填"/>
                            </div>
                            <div class="col-sm-6" id="otherprice4" style="color: #888888"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="memo4" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-8">
                             <textarea id="memo4" class="form-control" rows="4" placeholder="..."
                                       name="memo"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <span style="float: left"><b>操作员：${USER_SESSION.admId}</b></span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" onclick="pushOrder()">确认</button>
                </div>
            </form>
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

    $('a[data-toggle=popover]').popover({
        trigger: 'hover',//鼠标以上时触发弹出提示框
        placement: 'top',
        html: true,//开启html 为true的话，data-content里就能放html代码了
    });

    function reset() {
        //清空新建窗口中的数据
        $('#addForm')[0].reset();
        $('#imgView2')[0].src = '';
    }
    // 删除
    function stockDelete(isbn) {
        if (confirm("删除将清除库存数据，请确认？")) {
            $.ajax({
                type: "post",
                url: "<%=basePath%>admin/stock/delete.do",
                data: {"isbn": isbn},
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

    // 添加操作
    function add() {
        var formData = new FormData($('#addForm')[0]);
        $.ajax({
            url: "<%=basePath%>admin/stock/add.do",
            type: "post",
            data: formData,
            async: false,
            cache: false,
            dataType: "json",
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.code == "OK") {
                    alert(data.msg);
                    window.location.reload();
                } else if (data.code == "FAIL") {
                    alert(data.msg);
                }
            }
        });
    }

    var imgUrl;

    // 通过isbn获取修改的信息
    function getEditInfo(isbn) {
        $.ajax({
                type: "get",
                url: "<%=basePath%>admin/stock/detail.do",
                data: {"isbn": isbn},
                success: function (data) {
                    $("#isbn3").val(data.isbn);
                    $("#title3").val(data.title);
                    $("#author3").val(data.author);
                    $("#press3").val(data.press);
                    $("#fixedPrice3").val(data.fixedPrice);
                    $("#stockQuantity3").val(data.stockQuantity);
                    $("#imgView3")[0].src = data.imgUrl;
                    imgUrl = data.imgUrl;
                }
            }
        );
    }

    // 保存修改
    function edit() {
        var formData = new FormData($('#editForm')[0]);
        formData.append("imgUrl", imgUrl);
        $.ajax({
            url: "<%=basePath%>admin/stock/edit.do",
            type: "post",
            data: formData,
            async: false,
            cache: false,
            dataType: "json",
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.code == "OK") {
                    alert(data.msg);
                    window.location.reload();
                } else {
                    alert(data.msg);
                }
            }
        });
    }

    // 限制图片大小，预览图片
    $('#imgFile2').change(function () {
            // 获取input file的files文件数组;
            // $('#filed')获取的是jQuery对象，.get(0)转为原生对象;
            // 这边默认只能选一个，但是存放形式仍然是数组，所以取第一个元素使用[0];
            var file = $('#imgFile2').get(0).files[0];
            var fileSize = 0;
            var fileMaxSize = 1024 * 3;//3M
            var filePath = $('#imgFile2').get(0).value;
            if (filePath) {
                fileSize = file.size;
                var size = fileSize / 1024;
                console.log("图片大小==" + size);
                if (size > fileMaxSize) {
                    alert("图片大小不能大于3M！");
                    $('#imgFile2').get(0).value = "";
                    return false;
                }
            }
            // 预览图片
            // 创建用来读取此文件的对象
            var reader = new FileReader();
            // 使用该对象读取file文件
            reader.readAsDataURL(file);
            // 读取文件成功后执行的方法函数
            reader.onload = function (e) {
                // 读取成功后返回的一个参数e，整个的一个进度事件
                console.log(e);
                // 选择所要显示图片的img，要赋值给img的src就是e中target下result里面的base64编码格式的地址
                $('#imgView2').get(0).src = e.target.result;
            }
        }
    )

    function addOrder(isbn) {
        //清理之前的数据
        $("#img4").empty();
        $("#content4").empty();
        $("#otherprice4").empty();
        $("#addOrderForm")[0].reset();

        console.log(isbn);
        $.ajax({
            type: "get",
            url: "<%=basePath%>admin/neworder/getOrderInfo.do",
            data: {"isbn": isbn},
            success: function (data) {
                $("#img4").append('<img src="' + data.tb.imgUrl + '" alt="" class="img-rounded">');
                $("#content4").append('<p>书名：' + data.tb.title + '</p>');
                $("#content4").append('<p>作者：' + data.tb.author + '</p>');
                $("#content4").append('<p>出版社：' + data.tb.press + '</p>');
                $("#content4").append('<p>ISBN：' + data.tb.isbn + '</p>');
                $("#content4").append('<p>价格：' + data.tb.fixedPrice + ' ¥</p>');

                if (data.lastPrice != '0') {
                    $("#otherprice4").append('<span>最近价格: ' + data.lastPrice + '</span><br>');
                } else {
                    $("#otherprice4").append('<span>最近价格: 暂无</span><br>');
                }
                if (data.minPrice != '0') {
                    $("#otherprice4").append('<span>历史最低: ' + data.minPrice + '</span>');
                } else {
                    $("#otherprice4").append('<span>历史最低: 暂无</span>');
                }
            }
        });
        $("#isbn4").val(isbn);
    }

    // 下单
    function pushOrder() {
        $.post("<%=basePath%>admin/order/add.do",
            $("#addOrderForm").serialize(), function (data) {
                if (data.code == "OK") {
                    alert(data.msg);
                    window.location.reload();
                } else {
                    alert(data.msg);
                }
            });
    }

    // 限制图片大小，预览图片
    $('#imgFile3').change(function () {
            // 获取input file的files文件数组;
            // $('#filed')获取的是jQuery对象，.get(0)转为原生对象;
            // 这边默认只能选一个，但是存放形式仍然是数组，所以取第一个元素使用[0];
            var file = $('#imgFile3').get(0).files[0];
            var fileSize = 0;
            var fileMaxSize = 1024 * 3;//3M
            var filePath = $('#imgFile3').get(0).value;
            if (filePath) {
                fileSize = file.size;
                var size = fileSize / 1024;
                console.log("图片大小==" + size);
                if (size > fileMaxSize) {
                    alert("图片大小不能大于3M！");
                    $('#imgFile3').get(0).value = "";
                    return false;
                }
            }
            // 预览图片
            // 创建用来读取此文件的对象
            var reader = new FileReader();
            // 使用该对象读取file文件
            reader.readAsDataURL(file);
            // 读取文件成功后执行的方法函数
            reader.onload = function (e) {
                // 读取成功后返回的一个参数e，整个的一个进度事件
                console.log(e);
                // 选择所要显示图片的img，要赋值给img的src就是e中target下result里面的base64编码格式的地址
                $('#imgView3').get(0).src = e.target.result;
            }
        }
    )

</script>
</body>
</html>