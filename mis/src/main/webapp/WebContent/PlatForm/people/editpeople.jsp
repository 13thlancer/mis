
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
    <script src="../../bootstrap/js/html5shiv.min.js" type="text/javascript"></script>
    <script src="../../bootstrap/js/respond.min.js"　type="text/javascript"></script>
    <style type="text/css">
        .hiddenCol
        {
            display:none;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="showPeople()">
<div class="wrapper">

    <jsp:include page="../jsp/header.jsp"></jsp:include>
    <div class="content-wrapper">
        <div>
            <ul id="myTab" class="nav nav-tabs">
                <li class="active"> <a href="#baseinfo" data-toggle="tab"> 基本信息 </a> </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div id="baseinfo" class="tab-pane fade in active" >
                    <form id="addPeople" class="form-horizontal" novalidate="novalidate">
                        <fieldset>
                            <input id="id" type="hidden" name="id">
                            <div style="margin-left: 10%;margin-top:1%;">

                                <div class="form-group">
                                    <label for="username" class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="username" id="username" style="width:80%;">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="orgid" class="col-sm-2 control-label">商会职务</label>
                                    <div class="col-sm-10">
                                        <select class="form-control"  style="width:80%;" name="orgid" id="orgid">
                                            <option value="">请选择所属组织...</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="seq" class="col-sm-2 control-label">资历排序</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="seq" id="seq" style="width:80%;">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="telphone" class="col-sm-2 control-label">联系方式</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="telphone" id="telphone" style="width:80%;">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="email" id="email" style="width:80%;">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="nativeplace" class="col-sm-2 control-label">籍贯</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="nativeplace" id="nativeplace" style="width:80%;">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="company" class="col-sm-2 control-label">公司职位</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="company" id="company" style="width:80%;">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="companytype" class="col-sm-2 control-label">公司及职位</label>
                                    <div class="col-sm-10">
                                        <select class="form-control"  style="width:80%;" name="companytype" id="companytype">
                                            <option value="">请选择公司类型...</option>
                                        </select>
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
                        <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="updatePeople();">提交</button>
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
    var reg = new RegExp("(^|&)id=([^&]*)(&|$)","i");
    var r = window.location.search.substr(1).match(reg);


    var editor = new wangEditor('Intro');
    editor.config.uploadImgUrl = '<%=basePath%>PeopleController/upload';
    editor.config.uploadImgFileName = 'upload';
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
            } else {
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

    function showPeople(){
        var postdata={id:r[2]};
        $.ajax({
            type:"POST",
            url:"<%=basePath%>PeopleController/ShowPeoplById",
            async:false,
            data:postdata,
            success:function(data) {
                var length = data.Type.length;
                for(var i = 0;i<length;i++) {
                    $('#companytype').append('<option value=' + data.Type[i].number + '>' + data.Type[i].name + '</option>');
                }

                var len = data.Org.length;
                for(var j = 0;j<len;j++) {
                    $('#orgid').append('<option value='+data.Org[j].orgnumber+'>'+data.Org[j].orgname+'</option>');
                }

                document.getElementById("id").value =  data.User[0].people[0].id;
                document.getElementById("username").value =  data.User[0].people[0].username;
//                document.getElementById("orgname").value = data.User[0].people[0].orgname;

                $("#orgname").val(data.User[0].people[0].orgid);
                document.getElementById("seq").value = data.User[0].people[0].seq;
                document.getElementById("telphone").value = data.User[0].people[0].telphone;
                document.getElementById("email").value = data.User[0].people[0].email;
                document.getElementById("nativeplace").value = data.User[0].people[0].nativeplace;
                document.getElementById("company").value = data.User[0].people[0].company;
//                document.getElementById("companytype").value = data.User[0].people[0].companytype;
                $("#companytype").val(data.User[0].people[0].companytype);

                var html = "<div style='float:left;height:100px;width:100px;'> <img src= '" + data.User[0].people[0].picpath + "'style='height:100px;width:100px;'  /> </div>";
                $('#view').append(html);
                editor.$txt.append(data.User[0].people[0].introduce);
            }
        });
    }

    function updatePeople() {
        var html = editor.$txt.html();
        var formData = new FormData($( "#addPeople" )[0]);
        formData.append("introduce",html);
        $.ajax({
            type:"POST",
            url:"<%=basePath%>PeopleController/UpdatePeople",
            async:false,
            data:formData,
            contentType:false,
            processData:false,
            success:function(data) {
//                var d = eval('(' + data + ')');
                if (data.type == 'nosignin') {
                    alert("无添加权限，请联系管理员！")
                } else {
                    window.location.href = "pfpeople.jsp";
                }
            }
        });
    }

</script>

</body>
</html>
