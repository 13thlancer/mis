<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
HttpSession s = request.getSession();
String username=(String)s.getAttribute("username");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!-- release v4.1.8, copyright 2014 - 2015 Kartik Visweswaran -->
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Krajee JQuery Plugins - &copy; Kartik</title>
    <link href="../plugins/bootstrap-fileinput/css/bootstrap.min.css" rel="stylesheet">
    <link href="../plugins/bootstrap-fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <script src="../plugins/bootstrap-fileinput/js/jquery-2.0.3.min.js"></script>
    <script src="../plugins/bootstrap-fileinput/js/fileinput.js" type="text/javascript"></script>
    <script src="../plugins/bootstrap-fileinput/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../plugins/bootstrap-fileinput/js/fileinput_locale_zh.js" type="text/javascript"></script>
</head>
<body>
<div class="container kv-main">

    <br>
    <form enctype="multipart/form-data">

        <div class="form-group">
            <input id="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="1" name="img">
        </div>

    </form>
</div>
</body>
<script>

    $("#file-1").fileinput({
        uploadUrl: "<%=basePath%>MemberController/upload", // you must set a valid URL here else you will get an error
        allowedFileExtensions : ['jpg', 'png','gif'],
        language: 'zh', //设置语言
        overwriteInitial: false,
        showUpload: false, //是否显示上传按钮
        showCaption: true,//是否显示标题
        maxFileSize: 1000,
        maxFilesNum: 10,
        browseClass: "btn btn-primary", //按钮样式
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
</html>