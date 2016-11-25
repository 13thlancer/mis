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
        td,th
        {
            text-align:center;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="ShowPeople();">
<div class="wrapper">
    <jsp:include page="../jsp/header.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <section class="content-header"></section>
        <div class="box">
            <div class="box-body">
                <div class="block-content collapse in">
                    <div class="span12">

                        <div id="addMember" style="height:30px;width:50px;float:right;margin-right: 5px;">
                            <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="location.href='addPeople.jsp'">新增</button>
                        </div>
                        <br>
                        <br>
                        <table id="member" cellpadding="0" cellspacing="0" border="0"  data-click-to-select="true" data-toggle="table" class="table table-striped table-hover table-bordered" >
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>头像</th>
                                <th>会员姓名</th>
                                <th>商会职务</th>
                                <th>所属组织</th>
                                <th>联系方式</th>
                                <th>邮箱</th>
                                <th>籍贯</th>
                                <th>会员类型</th>
<%--
                                <th>个人简介</th>
--%>
                                <th>操作</th>
                            </tr>
                            <tbody>
                            </tbody>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../jsp/footer.jsp"></jsp:include>

</div>
<!-- ./wrapper -->
<!-- jQuery 2.2.3 -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../bootstrap/js/bootstrap-treeview.js"></script>
<!-- DataTables -->
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../bootstrap/js/bootstrap-dialog.js"></script>
<script src="../../dist/js/demo.js"></script>
<!-- page script -->
<script type="text/javascript">


    /*datatable插件赋值及属性设置*/
    function ShowPeople() {
        active();
        $.ajax({
            type: "post",
            url: "<%=basePath%>PeopleController/ShowPeople",
            dataType: "json",
            error: function () {
            },
            success:function (data) {
                if(data.type == 'nosignin'){
                    alert("无查看权限，请联系管理员！")
                }
                $('#member').DataTable({
                    oLanguage : {
                        "sLengthMenu": "每页显示 _MENU_ 条记录",
                        "sZeroRecords": "抱歉， 没有找到",
                        "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                        "sInfoEmpty": "没有数据",
                        "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                        "sZeroRecords": "没有检索到数据",
                        "sSearch": "名称:",
                        "oPaginate": {
                            "sFirst": "首页",
                            "sPrevious": "前一页",
                            "sNext": "后一页",
                            "sLast": "尾页"
                        }
                    },
                    data: data,
                    columns: [
                        {data: 'people[0].id',sClass:"hiddenCol"},
                        {
                            "render": function (data, type, row) {
                                var picpath = null;
                                if(row.people[0] == null){
                                    picpath=null;
                                }else {
                                     picpath = row.people[0].picpath;
                                }
/*
                                alert(row.people[0].picpath);
*/
                                var html="<div style=' width:50px; height:50px; border-radius:50%; overflow:hidden;'><img style='width:50px; height:50px; border-radius:50%; overflow:hidden;' src= '"+picpath+"'></div>"

                                /*
                                                                var html = "<img src= '" + picpath + "'style='height:30px;width:50px;border:none;background: steelblue;color:white;'>"
                                */
                                return html;
                            }
                        },
//                        {data:'userpic'},
                        {data: 'people[0].name'},
                        {data: 'people[0].orgid'},
                        {data: 'people[0].position'},
                        {data: 'telphone'},
                        {data: 'email'},
                        {data: 'people[0].nativeplace'},
                        {data:'userlevel'},
                        /*{data: 'people[0].introduce'},*/
                        {
                            "render": function (data, type, row) {
                                var id= '"' + row.userid + '"';
                                var html = "<button style='height:30px;width:50px;border:none;background: steelblue;color:white;'>启用</button>"
                                html += "&nbsp;&nbsp;&nbsp;"
                                html += "<button style='height:30px;width:50px;border:none;background: steelblue;color:white;'>禁用</button>"
                                return html;
                            }
                        },
                    ],
                    "fnInitComplete": function() {
                        this.fnAdjustColumnSizing(true);
                    }
                });
            }
        });
    }



</script>
</body>
</html>
