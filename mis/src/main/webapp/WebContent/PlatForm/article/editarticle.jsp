<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    HttpSession s = request.getSession();
    String username=(String)s.getAttribute("username");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>MIS</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap-dialog.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" type="text/css" href="../../wangEditor-2.1.20/dist/css/wangEditor.min.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <style type="text/css">
        .hiddenCol
        {
            display:none;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="showArticleByid();">
<div class="wrapper">

    <jsp:include page="../jsp/header.jsp"></jsp:include>
    <div class="content-wrapper">

        <div>
            <ul id="myTab" class="nav nav-tabs">
                <li class="active"> <a href="#home" data-toggle="tab">编辑内容</a> </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <form id="updateArticle" class="form-horizontal"  novalidate="novalidate" enctype="multipart/form-data;" accept-charset="UTF-8" style="margin-left: 10%;margin-top:1%;">
                    <fieldset>
                        <input id="Id" type="hidden" name="id">

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="type">文章类型</label>
                            <div class="controls">
                                <select class="form-control"  style="width:75%;" name="type" id="type">
                                    <option value="">请选择...</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="Seq" class="col-sm-2 control-label">文章序号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Seq" id="Seq" style="width:80%;">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="Title" class="col-sm-2 control-label">标题内容</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Title" id="Title" style="width:80%;">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="isad">广告位</label>
                            <div class="controls">
                                <select class="form-control"  style="width:75%;" name="isad" id="isad">
                                    <option value="0">否</option>
                                    <option value='1'>是</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="TitlePicpath" class="col-sm-2 control-label">标题图片</label>
                            <div class="col-sm-10">
                                <input type="file" class="form-control" name="TitlePicpath" id="TitlePicpath" style="width:80%;" onchange="javascript:setImagePreviews();" accept="image/*" >
                                <div id="view" style=" width:100%;"></div>
                            </div>
                        </div>

                        <div style="width:90%">
                            <!--用当前元素来控制高度-->
                            <div id="editor" name="Content" style="height:400px;max-height:500px;">
                            </div>
                        </div>
                    </fieldset>
                </form>

                <div style="width:100%;">
                    <div style="width:60%;margin-left: auto;margin-right: auto;">
                        <div id="submit" style="height:30px;width:50px;float:left;margin-left: 30%;">
                            <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="updateArticle()">提交</button>
                        </div>

                        <div id="return" style="height:30px;width:50px;float:left;margin-left: 10%;">
                            <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="location.href='pfarticle.jsp'">返回</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<jsp:include page="../jsp/footer.jsp"></jsp:include>
</div>
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../bootstrap/js/bootstrap-treeview.js"></script>
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../../plugins/fastclick/fastclick.js"></script>
<script src="../../dist/js/app.min.js"></script>
<script src="../../bootstrap/js/bootstrap-dialog.js"></script>
<script src="../../dist/js/demo.js"></script>
<script type="text/javascript" src="../../wangEditor-2.1.20/dist/js/wangEditor.min.js"></script>
<script type="text/javascript">
    var reg = new RegExp("(^|&)id=([^&]*)(&|$)","i");
    var treg = new RegExp("(^|&)mtype=([^&]*)(&|$)","i");
    var t = window.location.search.substr(2).match(treg);
    var r = window.location.search.substr(1).match(reg);

    var editor = new wangEditor('editor');
    editor.config.uploadImgUrl = '<%=basePath%>PeopleController/upload';
    editor.config.uploadImgFileName = 'upload'
    editor.create();


    function setImagePreviews() {
        var docObj = document.getElementById("TitlePicpath");
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


    function showArticleByid(){
        showType();
        var postdata={
            id:r[2]
        }
        $.ajax({
            type:"POST",
            url:"<%=basePath%>ArticleController/ShowArticleById",
            async:false,
            data:postdata,
            success:function(data){
                if(data.type == 'nosignin'){
                    alert("无修改权限，请联系管理员！")
                }
                document.getElementById("Id").value = data.articleId;

                document.getElementById("type").value = data.messagetype;
                document.getElementById("Title").value = data.title;
                document.getElementById("Seq").value = data.seq;
                var html = "<div style='float:left;height:100px;width:100px;' > <img src= '" + data.titlePicpath + "'style='height:100px;width:100px;'  /> </div>";
                $('#view').append(html);
                editor.$txt.append(data.content);

            }
        });
    }


    function updateArticle(){
        var html = editor.$txt.html();
        var formData = new FormData($( "#updateArticle" )[0]);
        formData.append("content",html);
        $.ajax({
            type:"POST",
            url:"<%=basePath%>ArticleController/UpdateArticle",
            async:false,
            data:formData,
            contentType:false,
            processData:false,
            success:function(data){
                var d = eval('('+data+')');

                if(d.type == 'nosignin'){
                    alert("无添加权限，请联系管理员！")
                }else {
                    window.location.href = "pfarticle.jsp?mtype=" + t[2] + "";
                }
            }
        });
    }

    function showType(){
        var postdata={
            pnum:t[2]
        }
        $.ajax({
            type:"POST",
            url:"<%=basePath%>ArticleController/ShowType",
            data:postdata,
            async:false,
            success:function(data){
                var length = data.length;
                for(var i = 0;i<length;i++)
                {
                    $('#type').append('<option value='+data[i].num+'>'+data[i].name+'</option>');
                }
            }
        });
    }

</script>

</body>
</html>
