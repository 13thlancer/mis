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
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap-dialog.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../bootstrap/css/ionicons.min.css">
    <link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
    <link href="../../plugins/bootstrap-fileinput/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../plugins/bootstrap-fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <script src="../../bootstrap/js/html5shiv.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/respond.min.js"　type="text/javascript"></script>
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
                <%--<li> <a href="#intro" data-toggle="tab">会员介绍</a> </li>--%>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div id="baseinfo" class="tab-pane fade in active" >
                    <form id="addPeople" class="form-horizontal" novalidate="novalidate">
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
                                    <label for="userlevel" class="col-sm-2 control-label">会员等级</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="userlevel" id="userlevel">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="Pic" class="col-sm-2 control-label">会员头像</label>
                                    <div class="col-sm-10">
                                        <input type="file" class="form-control" name="Pic" id="Pic" style="width:80%;" onchange="javascript:setImagePreviews();" accept="image/*" >
                                        <div id="view" style=" width:100%;"></div>
                                    </div>
                                </div>

                                <div class="form-group" >
                                    <label for="Intro" class="col-sm-2 control-label">会员介绍</label>
                                    <div style="margin-left:15%;width:60%;">
                                        <!--用当前元素来控制高度-->
                                        <div id="Intro" name="Intro" style="height:300px;max-height:400px;">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </form>
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
<script src="../../plugins/bootstrap-fileinput/js/jquery-2.0.3.min.js"></script>
<script src="../../plugins/bootstrap-fileinput/js/fileinput.js" type="text/javascript"></script>
<script src="../../plugins/bootstrap-fileinput/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../../plugins/bootstrap-fileinput/js/fileinput_locale_zh.js" type="text/javascript"></script>
<script src="../../bootstrap/js/bootstrap-treeview.js"></script>
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../../plugins/fastclick/fastclick.js"></script>
<script src="../../dist/js/app.min.js"></script>
<script src="../../bootstrap/js/bootstrap-dialog.js"></script>
<script src="../../dist/js/demo.js"></script>
<link rel="stylesheet" type="text/css" href="../../wangEditor-2.1.20/dist/css/wangEditor.min.css">

<script type="text/javascript" src="../../wangEditor-2.1.20/dist/js/wangEditor.min.js"></script>

<script type="text/javascript">

    var editor = new wangEditor('Intro');
    editor.config.uploadImgUrl = '<%=basePath%>PeopleController/upload';
    editor.config.uploadImgFileName = 'upload'
    editor.create();


    function setImagePreviews() {
        var docObj = document.getElementById("Pic");
        var view = document.getElementById("view");
        view.innerHTML = "";
        var fileList = docObj.files;
        for (var i = 0; i < fileList.length; i++) {
            view.innerHTML += "<div style='float:left' > <img id='img" + i + "'  /> </div>";
            var imgObjPreview = document.getElementById("img"+i);
            if (docObj.files && docObj.files[i]) {
                //火狐下，直接设img属性
                imgObjPreview.style.display = 'block';
                imgObjPreview.style.width = '100px';
                imgObjPreview.style.height = '100px';
                //imgObjPreview.src = docObj.files[0].getAsDataURL();
                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
                imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);
            }
            else {
                //IE下，使用滤镜
                docObj.select();
                var imgSrc = document.selection.createRange().text;
                alert(imgSrc)
                var localImagId = document.getElementById("img" + i);
                //必须设置初始大小
                localImagId.style.width = "100px";
                localImagId.style.height = "100px";
                //图片异常的捕捉，防止用户修改后缀来伪造图片
                try {
                    localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                }
                catch (e) {
                    alert("您上传的图片格式不正确，请重新选择!");
                    return false;
                }
                imgObjPreview.style.display = 'none';
                document.selection.empty();
            }
        }
        return true;
    }

    function addPeople() {
        var html = editor.$txt.html();
        var formData = new FormData($( "#addPeople" )[0]);
        formData.append("Intro",html);
        $.ajax({
            type:"POST",
            url:"<%=basePath%>PeopleController/AddPeople",
            async:false,
            data:formData,
            contentType:false,
            processData:false,
            success:function(data){
                window.location.href="pfpeople.jsp";
            }
        });
    }









    <%--$("#file-1").fileinput({--%>
    <%--uploadUrl: "<%=basePath%>PeopleController/upload", // you must set a valid URL here else you will get an error--%>
    <%--allowedFileExtensions : ['jpg', 'png'],--%>
    <%--language: 'zh', //设置语言--%>
    <%--overwriteInitial: false,--%>
    <%--showUpload: false, //是否显示上传按钮--%>
    <%--showCaption: true,//是否显示标题--%>
    <%--maxFileSize: 1000,--%>
    <%--maxFilesNum: 10,--%>
    <%--enctype: 'multipart/form-data',--%>
    <%--//        browseClass: "btn btn-primary", //按钮样式--%>
    <%--//        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"})--%>
    <%--//allowedFileTypes: ['image', 'video', 'flash'],--%>
    <%--slugCallback: function(filename) {--%>
    <%--return filename.replace('(', '_').replace(']', '_');--%>
    <%--}--%>
    <%--});--%>
    <%--$('#file-1').on('fileuploaded', function(event, data, previewId, index) {--%>
    <%--var form = data.form, files = data.files, extra = data.extra,--%>
    <%--response = data.response, reader = data.reader;--%>
    <%--console.log(response);//打印出返回的json--%>
    <%--console.log(response.paths);//打印出路径--%>
    <%--});--%>

</script>

</body>
</html>
