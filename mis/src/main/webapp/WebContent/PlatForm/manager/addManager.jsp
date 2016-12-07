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
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap-dialog.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .hiddenCol
        {
            display:none;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="showRole();">
<div class="wrapper">

    <jsp:include page="../jsp/header.jsp"></jsp:include>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->

        <div>
            <ul id="myTab" class="nav nav-tabs">
                <li class="active"> <a href="#home" data-toggle="tab"> 新增管理账号</a> </li>
            </ul>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                            <h4 class="modal-title" id="myModalLabel">新增</h4>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="orgname">组织名称</label>
                                <select class="form-control"  style="width:80%;" name="orgname" id="orgname" onchange="orgChange()">
                                    <option value="">请选择所属组织...</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="username">人员</label>
                                <select class="form-control"  style="width:80%;" name="username" id="username">
                                    <option value="">请选择人员...</option>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="choseuser();">保存</button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <form id="addManager" class="form-horizontal" novalidate="novalidate" style="margin-left: 10%;margin-top:1%;">
                        <fieldset>
                            <input id="id" type="hidden" name="id">

                            <div class="form-group">
                                <label for="employname" class="col-sm-2 control-label">员工</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="employname" id="employname">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="account" class="col-sm-2 control-label">登录帐号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="account" id="account">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="password" id="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="repassword" class="col-sm-2 control-label">确认密码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="repassword" id="repassword">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="roletype">角色类型</label>
                                <div class="controls">
                                    <select class="form-control"  style="width: 200px;" name="roletype" id="roletype">
                                        <option value="">请选择...</option>
                                    </select>
                                </div>
                            </div>
                        </fieldset>

                    </form>
                    <hr style="height:1px;border:none;border-top:1px solid #555555;" />
                    <div style="width:100%;">
                        <div style="width:60%;margin-left: auto;margin-right: auto;">
                            <div id="submit" style="height:30px;width:50px;float:left;margin-left: 30%;">
                                <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="addManager();">提交</button>
                            </div>

                            <div id="return" style="height:30px;width:50px;float:left;margin-left: 10%;">
                                <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="location.href='pfmanager.jsp'">返回</button>
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
<script type="text/javascript">

    $("#employname").click(function () {
        $("#myModalLabel").text("选择人员");
        $('#myModal').modal();
    });

    function orgChange(){
        document.getElementById("username").options.length=1;
        var orgnum = document.getElementById("orgname").value;
        var postdata = {orgnum:orgnum};
        $.ajax({
            type:"POST",
            url:"<%=basePath%>PeopleController/ShowPeopleByOrgnum",
            data:postdata,
            async:false,
            success:function(data){
                var len = data.length;
                for(var i = 0;i<len;i++)
                {
                    $('#username').append('<option value='+data[i].userid+'>'+data[i].people[0].username+'</option>');
                }
            }
        });
    }

    function choseuser(){
      document.getElementById("employname").value = $("#username").find("option:selected").text();
        alert( $("#username ").val());
      document.getElementById("id").value = $("#username ").val();
        alert( document.getElementById("id").value);
    }

    function addManager() {
        var formdata = $('#addManager').serializeArray();
        $.ajax({
            type:"POST",
            url:"<%=basePath%>ManagerController/AddManager",
            async:false,
            data:formdata,
            success:function(data) {
//                var d = eval('(' + data + ')');
//
//                if (d.type == 'nosignin') {
//                    alert("无添加权限，请联系管理员！")
//                } else {
//                    location.href("pfmanager.jsp");
//                }
                if(data == 'OK'){
                    location.href("pfmanager.jsp");
                }else{
                    alert(data);
                }
            }
        });
    }

    function showRole(){
        $.ajax({
            type:"POST",
            url:"<%=basePath%>RoleController/ShowRole",
            async:false,
            success:function(data){
                var rolelen = data.role.length;
                for(var i = 0;i<rolelen;i++)
                {
                    $('#roletype').append('<option value='+data.role[i].rolenum+'>'+data.role[i].rolename+'</option>');
                }
                var orglen = data.org.length;
                for(var j=0;j<orglen;j++){
                    $('#orgname').append('<option value='+data.org[j].orgnumber+'>'+data.org[j].orgname+'</option>');
                }
            }
        });
    }


</script>

</body>
</html>
