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
    <meta http-equiv="content-type" content="text/html">
    <title>MIS</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%--<link rel="stylesheet" href="../ckeditor/samples/css/samples.css">--%>
    <%--<link rel="stylesheet" href="../ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">--%>
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap-dialog.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" type="text/css" href="../../wangEditor-2.1.20/dist/css/wangEditor.min.css">
    <%--<link rel="stylesheet" href="../summernote/summernote.css">--%>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <style type="text/css">
        .hiddenCol
        {
            display:none;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="showType()">
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
                    <form id="addLawyer" class="form-horizontal" novalidate="novalidate">
                        <fieldset>
                            <input id="ID" type="hidden" name="id">

                            <div style="margin-left: 10%;margin-top:1%;">
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="name" id="name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="Type">律师类型</label>
                                    <div class="controls">
                                        <select class="form-control"  style="width:75%;" name="type" id="type">
                                            <option value="">请选择...</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="phone" class="col-sm-2 control-label">联系方式</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="phone" id="phone">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="Pic" class="col-sm-2 control-label">律师头像</label>
                                    <div class="col-sm-10">
                                        <input type="file" class="form-control" name="Pic" id="Pic" style="width:80%;" onchange="javascript:setImagePreviews();" accept="image/*" >
                                        <div id="view" style=" width:100%;"></div>
                                    </div>
                                </div>

                                <div class="form-group" >
                                    <label for="Intro" class="col-sm-2 control-label">律师介绍</label>
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
                        <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="addLawyer();">提交</button>
                    </div>

                    <div id="return" style="height:30px;width:50px;float:left;margin-left: 10%;">
                        <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="location.href='pflawyer.jsp'">返回</button>
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

    function addLawyer() {
        var html = editor.$txt.html();
        var formData = new FormData($( "#addLawyer" )[0]);
        formData.append("introduce",html);
        $.ajax({
            type:"POST",
            url:"<%=basePath%>LawyerController/AddLawyer",
            async:false,
            data:formData,
            contentType:false,
            processData:false,
            success:function(data) {
                var d = eval('(' + data + ')');

                if (d.type == 'nosignin') {
                    alert("无添加权限，请联系管理员！")
                } else {
                    window.location.href = "pflawyer.jsp";
                }
            }
        });
    }

    function showType(){
        $.ajax({
            type:"POST",
            url:"<%=basePath%>ArticleController/ShowType",
            data:{pnum:'20'},
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
