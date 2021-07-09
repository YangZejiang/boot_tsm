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
            <a class="navbar-brand" href="<%=basePath%>teacher/message.do">教材征订系统 - 教师端</a>
        </div>

        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <span>欢迎，${USER_SESSION.tchName} 老师！</span>
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i>
                        用户：${USER_SESSION.tchName}
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
                        <a href="${pageContext.request.contextPath }/teacher/profile.do">
                            <i class="fa fa-user fa-fw" aria-hidden="true"></i> 个人信息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/teacher/message.do">
                            <i class="fa fa-bullhorn fa-fw" aria-hidden="true"></i> 公告通知
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/teacher/apply.do" class="active">
                            <i class="fa fa-book fa-fw" aria-hidden="true"></i> 教材填报
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左侧显示列表部分 end-->
    </nav>

    <!-- 列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">教材填报</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/teacher/apply.do">
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
                        <b>本学期课程</b>
                    </div>
                    <!-- /.panel-heading -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th style="">课程代码</th>
                            <th style="">课程名称</th>
                            <th style="">课程性质</th>
                            <th style="">学分</th>
                            <th style="">学时</th>
                            <th style="">校区</th>
                            <th style="">系</th>
                            <c:if test="${access == '01'}">
                                <th style="">操作</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${courseList}" var="row" varStatus="status">
                            <tr>
                                <td style="text-align:center">${row.cdtlId}</td>
                                <td style="text-align:center">${row.cdtlName}</td>
                                <td style="text-align:center">${row.nature}</td>
                                <td style="text-align:center">${row.credit}</td>
                                <td style="text-align:center">${row.creditHour}</td>
                                <td style="text-align:center">${row.campusCode}</td>
                                <td style="text-align:center">${row.college}</td>
                                <td style="text-align:center">
                                    <c:if test="${access == '01'}">
                                        <a href="#" data-toggle="modal"
                                           data-target="#AddDialog"
                                           onclick="saveCdtlId('${row.corsId}','${row.cdtlId}')"><i
                                                class="fa fa-plus-square-o fa-fw" aria-hidden="true"></i></a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.panel -->

                <!-- panel-->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b>已填报教材</b>
                    </div>
                    <!-- /.panel-heading -->
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th style=""></th>
                            <th style="">课程代码</th>
                            <th style="">课程名称</th>
                            <th style="">教材名称</th>
                            <th style="">ISBN</th>
                            <c:if test="${access == '01'}">
                                <th style="">操作</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${applyList}" var="row" varStatus="status">
                            <tr>
                                <td style="text-align:center">${status.count}</td>
                                <td style="text-align:center">${row.cdtlId}</td>
                                <td style="text-align:center">${row.cdtlName}</td>
                                <td style="text-align:center">${row.title}</td>
                                <td style="text-align:center">${row.isbn}</td>
                                <c:if test="${access == '01'}">
                                    <td style="text-align:center">
                                        <a href="#" data-toggle="modal"
                                           data-target="#EditDialog"
                                           onclick="getEditInfo('${row.applyId}')"><i
                                                class="fa fa-edit fa-fw" aria-hidden="true"></i></a>
                                        <a href="#"
                                           onclick="cancel('${row.applyId}')"><i
                                                class="fa fa-remove fa-fw" aria-hidden="true"
                                                style="color: #dc3545"></i></a>
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

<!-- 添加模态框 -->
<div class="modal fade" id="AddDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">添加教材</h4>
            </div>
            <form class="form-horizontal" id="addForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="isbn" class="col-sm-2 control-label"><span style="color: red">*</span>ISBN</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="isbn" placeholder="13位数字" name="isbn"
                                   required="required"/>
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
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="hidesoon()">取消</button>
                    <button type="submit" class="btn btn-primary" onclick="add()">确认</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 修改模态框 -->
<div class="modal fade" id="EditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">教材信息修改</h4>
            </div>
            <form class="form-horizontal" id="editForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="isbn2" class="col-sm-2 control-label"><span style="color: red">*</span>ISBN</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="isbn2" placeholder="13位数字" name="isbn"
                                   readonly="readonly"/>
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
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" onclick="edit()">保存修改</button>
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
    var corsId;
    var applyId;
    // 确保提交修改表单时isbn未被修改
    var isbn;

    $("div[role=dialog]").modal({
        keyboard: false,
        backdrop: 'static',
        show: false
    })

    //这个是弹窗必须的js代码
    $(function () {
        $("[data-toggle='popover']").popover();
    });

    //这个函数用来控制几秒后消失，这里是1500ms
    function hide() {
        setTimeout(function () {						//也就是1.5秒后消失
            $("[data-toggle='popover']").popover('hide');
        }, 2000);
    }
    // 解决模态框关掉后popover还存在的问题
    function hidesoon() {
        $("[data-toggle='popover']").popover('hide');
    }

    function saveCdtlId(id, cdtlId) {
        corsId = id;
        //清空新建窗口中的数据
        $('#addForm')[0].reset();
        $('#imgView')[0].src = '';
        $('#AddDialog .btn-warning').remove();
        $.ajax({
                type: "get",
                url: "<%=basePath%>teacher/apply/getQuickFillInInfo.do",
                data: {"cdtlId": cdtlId},
                success: function (data) {
                    if (data.code == "HAVE") {
                        var html = "<button type='button' class='btn btn-warning' style='float: left' onclick='quickFillIn(" + data.applyId + ")'>快速填写:《" + data.title + "》</button>";
                        $('#AddDialog .modal-footer').prepend(html)
                    } else {
                        var html = "<button type='button' class='btn btn-warning' style='float:left;' " +
                            "onclick='hide()' data-toggle='popover' data-container='body' data-placement='right' data-content='此课程还未有老师推荐过教材!'>快速填写:暂无</button>";
                        $('#AddDialog .modal-footer').prepend(html)
                        $("[data-toggle='popover']").popover();
                    }
                }
            }
        );
    }



    var imgUrl;

    // 通过id获取快速填写的信息
    function quickFillIn(id) {
        $.ajax({
                type: "get",
                url: "<%=basePath%>teacher/apply/getInfo.do",
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


    // 提交教材填报
    function add() {
        var formData = new FormData($('#addForm')[0]);
        formData.append("corsId", corsId);
        formData.append("imgUrl", imgUrl);
        $.ajax({
            url: "<%=basePath%>teacher/apply/add.do",
            type: "post",
            data: formData,
            async: false,
            cache: false,
            dataType: "json",
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.code == "OK") {
                    window.location.reload();
                } else {
                    alert(data.msg);
                }
            }
        });
    }

    // 通过id获取修改的信息
    function getEditInfo(id) {
        applyId = id;
        $.ajax({
                type: "get",
                url: "<%=basePath%>teacher/apply/getInfo.do",
                data: {"id": id},
                success: function (data) {
                    $("#isbn2").val(data.isbn);
                    $("#title2").val(data.title);
                    $("#author2").val(data.author);
                    $("#press2").val(data.press);
                    $("#fixedPrice2").val(data.fixedPrice);
                    $("#imgView2")[0].src = data.imgUrl;
                    isbn = data.isbn;
                    corsId = data.corsId;
                }
            }
        );
    }

    // 保存修改
    function edit() {
        var formData = new FormData($('#editForm')[0]);
        formData.append("applyId", applyId);
        formData.append("corsId", corsId);
        if (isbn != formData.get("isbn")) {
            alert("isbn不可修改，若要修改请删除！");
            return false;
        }
        $.ajax({
            url: "<%=basePath%>teacher/apply/edit.do",
            type: "post",
            data: formData,
            async: false,
            cache: false,
            dataType: "json",
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.code == "OK") {
                    window.location.reload();
                } else {
                    alert(data.msg);
                }
            }
        });
    }

    // 取消教材填报
    function cancel(applyId) {
        if (confirm("确认删除此教材?")) {
            $.ajax({
                type: "post",
                url: "<%=basePath%>teacher/apply/cancel.do",
                data: {"id": applyId},
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

    // $("#imgFile").change(function(){
    //     $("#imgView").attr("src",URL.createObjectURL($(this)[0].files[0]));
    // });

</script>
</body>
</html>