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
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
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
<body class="hold-transition skin-blue sidebar-mini" onload="showOrder();">
<div class="wrapper">
    <jsp:include page="../jsp/header.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <section class="content-header">
        </section>
        <div class="box">
            <div class="box-header">
            </div>
            <div class="box-body">
                <div class="block-content collapse in">
                    <div class="span12">
                        <div id="addManager" style="height:30px;width:50px;float:right;margin-right: 5px;">
                            <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="location.href='addlawyer.jsp'">新增</button>
                        </div>
                        <br>
                        <br>
                        <table id="Article" cellpadding="0" cellspacing="0" border="0"  data-click-to-select="true" data-toggle="table" class="table table-striped table-hover table-bordered" >
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>需求意向</th>
                                <th>数量</th>
                                <th>提单人</th>
                                <th>需求类型</th>
                                <th>意向状态</th>
                                <th>联系人</th>
                                <th>联系方式</th>
                                <th>公司</th>
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

    function showOrder() {
        active();
        $.ajax({
            type: "post",
            url: "<%=basePath%>OrderController/ShowOrder",
            dataType: "json",
            error: function () {
            },
            success:function (data) {

                if(data.type == 'nosignin'){
                    alert("无查看权限，请联系管理员！")
                }
                $('#Article').DataTable({
                    scrollX: true,
                    bAutoWidth: false,
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
                        {data: 'id',sClass:"hiddenCol"},
                        {data:'requirename'},
                        {data:'requirenum'},
                        {data:'username'},
                        {data:'mtype[0].name'},
                        {
                            "render": function (data, type, row) {
                                var status = row.requirestatus;
                                if (status == '0') {
                                    var html = "<button style='height:30px;width:60px;border:none;background: steelblue;color:white;margin-left: auto;margin-right: auto;'>申请中</button>"
                                } else if(status == '1'){
                                    var html = "<button style='height:30px;width:60px;border:none;background: darkred;color:white;margin-left: auto;margin-right: auto;'>已下架</button>"
                                }else{
                                    var html = "<button style='height:30px;width:60px;border:none;background: darkgreen;color:white;margin-left: auto;margin-right: auto;'>已推送</button>"
                                }
                                return html;
                            }
                        },
                        {data:'conname'},
                        {data:'conphone'},
                        {data:'company'},
                        {
                            "render": function (data, type, row) {
                                var id=  row.id ;
                                var status = row.requirestatus;
                                if(status == '0'){
                                    var html = "<button style='height:30px;width:50px;border:none;background: steelblue;color:white;' onclick=location.href='editorder.jsp?id="+id+"'>编辑</button>"
                                    html += "&nbsp;&nbsp;&nbsp;"
                                    html += "<button style='height:30px;width:50px;border:none;background: steelblue;color:white;' onclick=\"push('"+id+"')\">推送</button>"
                                    html += "&nbsp;&nbsp;&nbsp;"
                                    html += "<button style='height:30px;width:50px;border:none;background: darkred;color:white;' onclick=\"deleteOrder('"+id+"')\">删除</button>"
                                    return html;
                                }else if(status == '1'){
                                    var html = "<button style='height:30px;width:50px;border:none;background: steelblue;color:white;' onclick=\"StatusOn('"+id+"')\">上架</button>"
                                    html += "&nbsp;&nbsp;&nbsp;"
                                    html += "<button style='height:30px;width:50px;border:none;background: steelblue;color:white;' onclick=location.href='editorder.jsp?id="+id+"'>编辑</button>"
                                    html += "&nbsp;&nbsp;&nbsp;"
                                    html += "<button style='height:30px;width:50px;border:none;background: darkred;color:white;' onclick=\"deleteOrder('"+id+"')\">删除</button>"
                                    return html;
                                }else if(status == '2'){
                                    var html = "<button style='height:30px;width:50px;border:none;background: steelblue;color:white;' onclick=\"StatusOff('"+id+"')\">下架</button>"
                                    html += "&nbsp;&nbsp;&nbsp;"
                                    html += "<button style='height:30px;width:50px;border:none;background: steelblue;color:white;' onclick=location.href='editorder.jsp?id="+id+"'>编辑</button>"
                                    html += "&nbsp;&nbsp;&nbsp;"
                                    html += "<button style='height:30px;width:50px;border:none;background: darkred;color:white;' onclick=\"deleteOrder('"+id+"')\">删除</button>"
                                    return html;
                                }
                            }
                        }
                    ],
                    "fnInitComplete": function() {
                        this.fnAdjustColumnSizing(true);
                    }
                });
            }
        });
    }

    function StatusOn(id){
        $.ajax({
            type: "post",
            url: "<%=basePath%>OrderController/StatusOn",
            data:{id:id},
            cache:false,
            async:true,
            success:function (data) {
                if(data=="OK"){
                    alert("已上架！");
                    location.reload("pforder.jsp");
                }else{
                    alert("操作失败！");
                }
            }
        });
    }

    function StatusOff(id){
        $.ajax({
            type: "post",
            url: "<%=basePath%>OrderController/StatusOff",
            data:{id:id},
            cache:false,
            async:true,
            success:function (data) {
                if(data=="OK"){
                    alert("已下架！");
                    location.reload("pforder.jsp");
                }else{
                    alert("操作失败！");
                }
            }
        });
    }

    function push(id){
        $.ajax({
            type: "post",
            url: "<%=basePath%>OrderController/Push",
            data:{id:id},
            cache:false,
            async:true,
            success:function (data) {
                if(data=="OK"){
                    alert("推送成功！");
                    location.reload("pforder.jsp");
                }else{
                    alert("操作失败！");
                }
            }
        });
    }


    function deleteOrder(id){
        $.ajax({
            type: "post",
            url: "<%=basePath%>OrderController/DeleteOrder",
            data:{id:id},
            cache:false,
            async:true,
            success:function (data) {
                if(data=="OK"){
                    alert("删除成功！");
                    location.reload("pforder.jsp");
                }else{
                    alert("操作失败！");
                }
            }
        });
    }

</script>
</body>
</html>
