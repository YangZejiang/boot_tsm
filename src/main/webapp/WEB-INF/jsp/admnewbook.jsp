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
            max-width: 60%;
            max-height: 60%;
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
                        <a href="${pageContext.request.contextPath }/admin/newbook.do" class="active">
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
                <h1 class="page-header">教材信息未录入</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <!-- panel-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b>⚠️认真核对，确保无误！若有问题，联系对应教师询问。</b>
                    </div>
                    <!-- /.panel-heading -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>申报编号</th>
                            <th>教工号</th>
                            <th>教材名称</th>
                            <th>ISBN</th>
                            <th>作者</th>
                            <th>出版社</th>
                            <th>价格</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="row" varStatus="status">
                            <tr>
                                <td style="text-align:center">${row.applyId}</td>
                                <td style="text-align:center"><a tabindex="0" role="button" data-toggle="popover"
                                                                 data-trigger="focus"
                                                                 title="${row.faculty} | ${row.tchName}"
                                                                 data-content="联系方式：${row.phone}">${row.tchId}</a>
                                </td>
                                <td style="text-align:center">${row.title}</td>
                                <td style="text-align:center">${row.isbn}</td>
                                <td style="text-align:center">${row.author}</td>
                                <td style="text-align:center">${row.press}</td>
                                <td style="text-align:center">${row.fixedPrice}</td>
                                <td style="text-align:center"><a href="#" class="btn btn-primary btn-xs"
                                                                 data-toggle="modal"
                                                                 data-target="#addDialog"
                                                                 onclick="getEditInfo('${row.applyId}')">添加</a></td>
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
                <h4 class="modal-title" id="myModalLabel">新建教材信息词条</h4>

            </div>
            <form class="form-horizontal" id="addForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="isbn" class="col-sm-2 control-label"><span style="color: red">*</span>ISBN</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="isbn" placeholder="13位数字" name="isbn"
                                   readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label"><span style="color: red">*</span>书名</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="title" placeholder="书名" name="title"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="author" class="col-sm-2 control-label"><span style="color: red">*</span>作者</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="author" placeholder="作者" name="author"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="press" class="col-sm-2 control-label"><span style="color: red">*</span>出版社</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="press" placeholder="出版社" name="press"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fixedPrice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-3">
                            <input type="number" class="form-control" id="fixedPrice" name="fixedPrice" step="0.01"
                                   min="0" value="0"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="imgFile" class="col-sm-2 control-label">上传图片</label>
                        <div class="col-sm-5">
                            <input type="file" id="imgFile" name="imgFile" accept="image/png,image/jpeg"/>
                            <p style="color: #9d9d9d">限制格式：jpg/png且小于3M</p>
                        </div>
                    </div>
                    <div style="margin: 0px 100px">
                        <img id="imgView" src="" alt="" class="img-rounded">
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

    $("[data-toggle='popover']").popover();
    var imgUrl;

    // 添加操作
    function add() {
        var formData = new FormData($('#addForm')[0]);
        formData.append("imgUrl", imgUrl);
        $.ajax({
            url: "<%=basePath%>admin/newbook/add.do",
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

    // 通过id获取修改的信息
    function getEditInfo(id) {
        $('#addForm')[0].reset();
        $.ajax({
                type: "get",
                url: "<%=basePath%>admin/newbook/getInfo.do",
                data: {"id": id},
                success: function (data) {
                    $("#isbn").val(data.isbn);
                    $("#title").val(data.title);
                    $("#author").val(data.author);
                    $("#press").val(data.press);
                    $("#fixedPrice").val(data.fixedPrice);
                    $("#imgView")[0].src = data.imgUrl;
                    imgUrl = data.imgUrl;
                }
            }
        );
    }

    // 限制图片大小，预览图片
    $('#imgFile').change(function () {
            // 获取input file的files文件数组;
            // $('#filed')获取的是jQuery对象，.get(0)转为原生对象;
            // 这边默认只能选一个，但是存放形式仍然是数组，所以取第一个元素使用[0];
            var file = $('#imgFile').get(0).files[0];
            var fileSize = 0;
            var fileMaxSize = 1024 * 3;//3M
            var filePath = $('#imgFile').get(0).value;
            if (filePath) {
                fileSize = file.size;
                var size = fileSize / 1024;
                console.log("图片大小==" + size);
                if (size > fileMaxSize) {
                    alert("图片大小不能大于3M！");
                    $('#imgFile').get(0).value = "";
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
                $('#imgView').get(0).src = e.target.result;
            }
        }
    )

</script>
</body>
</html>