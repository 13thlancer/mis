<!--
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    HttpSession s = request.getSession();
    String username=(String)s.getAttribute("username");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>MIS</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-dialog.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../bootstrap/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">


    <link href="../plugins/bootstrap-fileinput/css/bootstrap.min.css" rel="stylesheet">
    <link href="../plugins/bootstrap-fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />


    <script src="../bootstrap/js/html5shiv.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/respond.min.js"　type="text/javascript"></script>

    <style type="text/css">
        .hiddenCol
        {
            display:none;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="../jsp/header.jsp"></jsp:include>
    <div class="content-wrapper">
        <div>
            <ul id="myTab" class="nav nav-tabs">
                <li class="active"> <a href="#baseinfo" data-toggle="tab"> 基本信息 </a> </li>
                <li> <a href="#intro" data-toggle="tab">会员介绍</a> </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div id="baseinfo" class="tab-pane fade in active" >
                    <form id="addPeople" class="form-horizontal" novalidate="novalidate"  enctype="multipart/form-data">
                        <fieldset>
                            <input id="ID" type="hidden" name="id">

                           <div style="margin-left: 10%;margin-top:1%;">
                            <div class="form-group">
                                <label for="username" class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="username" id="username">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="orgname" class="col-sm-2 control-label">所属组织</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="orgname" id="orgname">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="telphone" class="col-sm-2 control-label">联系方式</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="telphone" id="telphone">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="email" id="email">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="userorigo" class="col-sm-2 control-label">籍贯</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="userorigo" id="userorigo">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="usertype" class="col-sm-2 control-label">会员类型</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="usertype" id="usertype">
                                </div>
                            </div>

                           </div>
                            <div class="form-group" style="width:80%;margin-left: auto;margin-right: auto;">
                                <input id="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="1" name="img">
                            </div>
                        </fieldset>
                        </form>
                    </div>


                <div id="intro" class="tab-pane fade" >
                    <div class="container kv-main">
                        <br>
                        <form id="MemberIntro" enctype="multipart/form-data">

                            <div class="form-group">
                                <label for="userintro" class="col-sm-2 control-label">个人简介</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="userintro" id="userintro">
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

            <hr style="height:1px;border:none;border-top:1px solid #555555;" />
            <div style="width:100%;">
                <div style="width:60%;margin-left: auto;margin-right: auto;">
                    <div id="submit" style="height:30px;width:50px;float:left;margin-left: 30%;">
                        <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="addPeople();">提交</button>
                    </div>

                    <div id="return" style="height:30px;width:50px;float:left;margin-left: 10%;">
                        <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="location.href='pfpeople.jsp'">返回</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <jsp:include page="../jsp/footer.jsp"></jsp:include>
</div>
<script src="../plugins/bootstrap-fileinput/js/jquery-2.0.3.min.js"></script>
<script src="../plugins/bootstrap-fileinput/js/fileinput.js" type="text/javascript"></script>
<script src="../plugins/bootstrap-fileinput/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../plugins/bootstrap-fileinput/js/fileinput_locale_zh.js" type="text/javascript"></script>
<script src="../bootstrap/js/bootstrap-treeview.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../dist/js/app.min.js"></script>
<script src="../bootstrap/js/bootstrap-dialog.js"></script>
<script src="../dist/js/demo.js"></script>
<script type="text/javascript">



    function addPeople() {
        var formdata = $('#addPeople').serializeArray();
//        var userintro = document.getElementById("userintro").value;
//        alert(form);
        $.ajax({
            type:"POST",
            url:"<%=basePath%>PeopleController/AddPeople",
            async:false,
            data:formdata,
            success:function(data){
               window.location.href="pfpeople.jsp";
            }
        });
    }


    $("#file-1").fileinput({
        uploadUrl: "<%=basePath%>PeopleController/upload", // you must set a valid URL here else you will get an error
        allowedFileExtensions : ['jpg', 'png'],
        language: 'zh', //设置语言
        overwriteInitial: false,
        showUpload: false, //是否显示上传按钮
        showCaption: true,//是否显示标题
        maxFileSize: 1000,
        maxFilesNum: 10,
        enctype: 'multipart/form-data',
//        browseClass: "btn btn-primary", //按钮样式
//        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"})
        //allowedFileTypes: ['image', 'video', 'flash'],
        slugCallback: function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });
    $('#file-1').on('fileuploaded', function(event, data, previewId, index) {
        var form = data.form, files = data.files, extra = data.extra,
                response = data.response, reader = data.reader;
        console.log(response);//打印出返回的json
        console.log(response.paths);//打印出路径
    });

</script>

</body>
</html>
