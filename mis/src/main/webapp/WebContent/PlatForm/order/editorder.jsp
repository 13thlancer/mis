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
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="showOrderById();">
<div class="wrapper">

    <jsp:include page="../jsp/header.jsp"></jsp:include>
    <div class="content-wrapper">

        <div>
            <ul id="myTab" class="nav nav-tabs">
                <li class="active"> <a href="#home" data-toggle="tab">编辑内容</a> </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <form id="updateOrder" class="form-horizontal"  novalidate="novalidate"  accept-charset="UTF-8" style="margin-left: 10%;margin-top:1%;">
                    <fieldset>
                        <input id="Id" type="hidden" name="id">

                        <div class="form-group">
                            <label for="requirename" class="col-sm-2 control-label">需求意向</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="requirename" id="requirename" style="width:80%;">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="requirenum" class="col-sm-2 control-label">数量</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="requirenum" id="requirenum" style="width:80%;">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">提单人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="username" id="username" style="width:80%;">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="requiretype">需求类型</label>
                            <div class="controls">
                                <select class="form-control"  style="width:75%;" name="requiretype" id="requiretype">
                                    <option value="">请选择...</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="conname" class="col-sm-2 control-label">联系人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="conname" id="conname" style="width:80%;">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="conphone" class="col-sm-2 control-label">联系方式</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="conphone" id="conphone" style="width:80%;">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="company" class="col-sm-2 control-label">公司</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="company" id="company" style="width:80%;">
                            </div>
                        </div>

                    </fieldset>
                </form>

                <div style="width:100%;">
                    <div style="width:60%;margin-left: auto;margin-right: auto;">
                        <div id="submit" style="height:30px;width:50px;float:left;margin-left: 30%;">
                            <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="updateOrder()">提交</button>
                        </div>

                        <div id="return" style="height:30px;width:50px;float:left;margin-left: 10%;">
                            <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="location.href='pforder.jsp'">返回</button>
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

    function showOrderById(){
        var reg = new RegExp("(^|&)id=([^&]*)(&|$)","i");
        var r = window.location.search.substr(1).match(reg);
        var postdata={
            id:r[2]
        }
        $.ajax({
            type:"POST",
            url:"<%=basePath%>OrderController/ShowOrderById",
            async:false,
            data:postdata,
            success:function(data){
                document.getElementById("Id").value = data.Order[0].id;
                document.getElementById("requirename").value = data.Order[0].requirename;
                document.getElementById("requirenum").value = data.Order[0].requirenum;
                document.getElementById("username").value = data.Order[0].username;
                document.getElementById("requiretype").value = data.Order[0].requiretype;
                document.getElementById("conname").value = data.Order[0].conname;
                document.getElementById("conphone").value = data.Order[0].conphone;
                document.getElementById("company").value = data.Order[0].company;
                var length = data.Type.length;
                for(var i = 0;i<length;i++) {
                    $('#requiretype').append('<option value=' + data.Type[i].number + '>' + data.Type[i].name + '</option>');
                }
            }
        });
    }

    function updateOrder(){
        var formdata = $('#updateOrder').serializeArray();
        $.ajax({
            type:"POST",
            url:"<%=basePath%>OrderController/UpdateOrder",
            async:false,
            data:formdata,
            success:function(data) {
              if(data == 'OK'){
                window.location.href = "pforder.jsp";
              }
            }
        });
    }

</script>

</body>
</html>
