<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    HttpSession s = request.getSession();
    String username=(String)s.getAttribute("username");
    String phone=(String)s.getAttribute("phone");
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
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-dialog.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>-->
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <style type="text/css">
        select,
        textarea,
        input[type="text"],
        input[type="password"],
        input[type="datetime"],
        input[type="datetime-local"],
        input[type="date"],
        input[type="month"],
        input[type="time"],
        input[type="week"],
        input[type="number"],
        input[type="email"],
        input[type="url"],
        input[type="search"],
        input[type="tel"],
        input[type="color"],
        .uneditable-input {
            display: inline-block;
            height: 20px;
            padding: 4px 6px;
            margin-bottom: 10px;
            font-size: 14px;
            line-height: 20px;
            color: #555555;
            vertical-align: middle;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }
        .input-block-level {
            display: block;
            width: 100%;
            min-height: 30px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="showMyList();">



                        <div id="order" class="container" style="display: none;width: 100%">
                            <br>
                            <div>
                                <button class="btn btn-large btn-primary" style="width: 20%;float:left;" type="submit" onclick="back();return false;">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </button>
                                <span class="form-signin-heading" style="font-size:20px;text-align: center;">请添加订单</span>

                            </div>
                            <br>
                            <div class="controls">
                                <label class="control-label">用户名：</label>
                                <div style="float:right;width:75%;">
                                    <input id="ousername"  type="text" style="width:100%;height: 30px;" name="name" data-required="1" readOnly="true" value="<%=username%>"/>
                                </div>
                            </div>
                            <br>
                            <div class="controls">
                                <label class="control-label">需求：</label>
                                <div style="float:right;width:75%;">
                                    <input id="requirename"  type="text" style="width:100%;height: 30px;" name="name" data-required="1" placeholder="需求"/>
                                </div>
                            </div>
                            <br>
                            <div class="controls">
                                <label class="control-label">数量：</label>
                                <div style="float:right;width:75%;">
                                    <input id="num"  type="text" style="width:100%;height: 30px;" name="name" data-required="1" placeholder="数量"/>
                                </div>
                            </div>
                            <br>
                            <div class="controls">
                                <label class="control-label">联系人：</label>
                                <div style="float:right;width:75%;">
                                    <input id="oconusername"  type="text" style="width:100%;height: 30px;" name="name" data-required="1" placeholder="联系人" value="<%=username%>"/>
                                </div>
                            </div>
                            <br>
                            <div class="controls">
                                <label class="control-label">联系方式：</label>
                                <div style="float:right;width:75%;">
                                    <input id="ocontel"  type="text" style="width:100%;height: 30px;" name="name" data-required="1" placeholder="联系方式" value="<%=phone%>"/>
                                </div>
                            </div>
                            <br>
                            <%--<div class="controls">--%>
                                <%--<sapn>用户名</sapn>--%>
                                <%--<input type="text" style="width:100%;" id="ousername" class="input-block-level" readOnly="true" value="<%=username%>">--%>
                            <%--</div>--%>
                            <%--<div class="controls">--%>
                                <%--<input type="text" id="requirename"  style="width:100%;" class="input-block-level" placeholder="需求">--%>
                            <%--</div>--%>
                            <%--<div class="controls">--%>
                                <%--<input type="text" id="num"  style="width:100%;" class="input-block-level" placeholder="数量">--%>
                            <%--</div>--%>
                            <%--<div class="controls">--%>
                                <%--<input type="text" style="width:100%;" id="oconusername" class="input-block-level" placeholder="联系人" value="<%=username%>">--%>
                            <%--</div>--%>
                            <%--<div class="controls">--%>
                                <%--<input type="text" style="width:100%;" id="ocontel" class="input-block-level" placeholder="联系方式" value="<%=phone%>">--%>
                            <%--</div>--%>
                                <div class="controls">
                                    <label class="control-label">联系方式：</label>
                                    <div style="float:right;width:75%;">
                                        <select id="type" name="category" style="width:100%; height: 30px;padding: 4px 6px;margin-bottom: 10px;font-size: 14px;line-height: 20px;">
                                            <option value="">请选择需求类型</option>
                                            <option value="办公用品">办公用品</option>
                                            <option value="学习用品">学习用品</option>
                                            <option value="生活用品">生活用品</option>
                                            <option value="建筑材料">建筑材料</option>
                                        </select>
                                    </div>
                                </div>
                            <div style="margin-left: auto;margin-right: auto;">
                                <button class="btn btn-large btn-primary" style="width: 100%;" type="submit" onclick="addOrder();return false;">提交</button>
                            </div>
                        </div>


                        <div id="edit" class="container" style="display: none;width: 100%">
                            <br>
                            <div>
                                <button class="btn btn-large btn-primary" style="width: 20%;float:left;" type="submit" onclick="eback();return false;">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </button>
                                <span class="form-signin-heading" style="font-size:20px;text-align: center;">订单详情</span>
                                <button id="ebutton" class="btn btn-large btn-primary" style="width: 20%;float:right;" type="submit" onclick="edit();return false;">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </button>
                            </div>
                            <br>
                            <div class="controls" style="display:none;">
                                <input type="text" style="width:100%;" id="eid" class="input-block-level" >
                            </div>
                            <br>
                            <div class="controls">
                                <label class="control-label">用户名：</label>
                                <div style="float:right;width:75%;">
                                    <input id="eusername"  type="text" style="width:100%;height: 30px;background-color: #CCCCCC;" name="name" data-required="1" readOnly="true" value="<%=username%>"/>
                                </div>
                            </div>
                            <br>
                            <div class="controls">
                                <label class="control-label">需求：</label>
                                <div style="float:right;width:75%;">
                                    <input id="erequirename"  type="text" style="width:100%;height: 30px;background-color: #CCCCCC;" name="name" data-required="1" readOnly="true" placeholder="需求"/>
                                </div>
                            </div>
                            <br>
                            <div class="controls">
                                <label class="control-label">数量：</label>
                                <div style="float:right;width:75%;">
                                    <input id="enum"  type="text" style="width:100%;height: 30px;background-color: #CCCCCC;" name="name" data-required="1"  readOnly="true" placeholder="数量"/>
                                </div>
                            </div>
                            <br>
                            <div class="controls">
                                <label class="control-label">联系人：</label>
                                <div style="float:right;width:75%;">
                                    <input id="econname"  type="text" style="width:100%;height: 30px;background-color: #CCCCCC;" name="name" data-required="1"  readOnly="true" placeholder="联系人" value="<%=username%>"/>
                                </div>
                            </div>
                            <br>
                            <div class="controls">
                                <label class="control-label">联系方式：</label>
                                <div style="float:right;width:75%;">
                                    <input id="econtel"  type="text" style="width:100%;height: 30px;background-color: #CCCCCC;" name="name" data-required="1" readOnly="true" placeholder="联系方式" value="<%=phone%>"/>
                                </div>
                            </div>
                            <br>
                            <%--<div class="controls">--%>
                                <%--<input type="text" style="width:100%;background-color: #CCCCCC;" id="eusername" class="input-block-level" readOnly="true" value="<%=username%>">--%>
                            <%--</div>--%>
                            <%--<div class="controls">--%>
                                <%--<input type="text" id="erequirename"  style="width:100%;background-color: #CCCCCC;" class="input-block-level" readOnly="true" placeholder="需求">--%>
                            <%--</div>--%>
                            <%--<div class="controls">--%>
                                <%--<input type="text" id="enum"  style="width:100%;background-color: #CCCCCC;" class="input-block-level" readOnly="true" placeholder="数量">--%>
                            <%--</div>--%>
                            <%--<div class="controls">--%>
                                <%--<input type="text" style="width:100%;background-color: #CCCCCC;" id="econname" class="input-block-level" readOnly="true" placeholder="联系人">--%>
                            <%--</div>--%>
                            <%--<div class="controls">--%>
                                <%--<input type="text" style="width:100%;background-color: #CCCCCC;" id="econtel" class="input-block-level" readOnly="true" placeholder="联系方式">--%>
                            <%--</div>--%>
                            <%--<div class="controls">--%>
                                <%--<input type="text" style="width:100%;background-color: #CCCCCC;" id="edate" class="input-block-level" readOnly="true" placeholder="日期">--%>
                            <%--</div>--%>
                            <%--<div class="controls">--%>
                                <%--<input type="text" style="width:100%;background-color: #CCCCCC;" id="estatus" class="input-block-level" readOnly="true" placeholder="状态">--%>
                            <%--</div>--%>
                            <%--<div class="control-group">--%>
                                <%--<div class="controls">--%>
                                    <%--<select id="etype" disabled="true" name="category" style="background-color: #CCCCCC;width:100%; height: 30px;padding: 4px 6px;margin-bottom: 10px;font-size: 14px;line-height: 20px;">--%>
                                        <%--<option value="">请选择需求类型</option>--%>
                                        <%--<option value="办公用品">办公用品</option>--%>
                                        <%--<option value="学习用品">学习用品</option>--%>
                                        <%--<option value="生活用品">生活用品</option>--%>
                                        <%--<option value="建筑材料">建筑材料</option>--%>
                                    <%--</select>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <div class="controls">
                                <label class="control-label">联系方式：</label>
                                <div style="float:right;width:75%;">
                                    <select id="etype" name="category" disabled="true" style="background-color: #CCCCCC;width:100%; height: 30px;padding: 4px 6px;margin-bottom: 10px;font-size: 14px;line-height: 20px;">
                                        <option value="">请选择需求类型</option>
                                        <option value="办公用品">办公用品</option>
                                        <option value="学习用品">学习用品</option>
                                        <option value="生活用品">生活用品</option>
                                        <option value="建筑材料">建筑材料</option>
                                    </select>
                                </div>
                            </div>
                            <div id="ediv"  style="margin-left: auto;margin-right: auto;display: none;">
                                <button class="btn btn-large btn-primary" style="width: 100%;" type="submit" onclick="editOrder();return false;">提交</button>
                            </div>
                        </div>


                        <div id="detail" style="display: none;">
                            <button class="btn btn-large btn-primary" type="submit" onclick="goback();return false;">返回</button>
                            <div class="control-group">
                                <label class="control-label" style="float: left;">用户名：</label>
                                <div class="controls">
                                    <input id="dusername" type="text" name="name" data-required="1"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" style="float: left;">需求：</label>
                                <div class="controls">
                                    <input id="drequirename" type="text" name="name" data-required="1" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" style="float: left;">需求数量：</label>
                                <div class="controls">
                                    <input id="dnum" type="text" name="name" data-required="1" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" style="float: left;">需求类型：</label>
                                <div class="controls">
                                    <input id="dtype" type="text" name="name" data-required="1" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" style="float: left;">下单时间：</label>
                                <div class="controls">
                                    <input id="ddate" type="text" name="name" data-required="1" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" style="float: left;">需求状态：</label>
                                <div class="controls">
                                    <input id="dstatus" type="text" name="name" data-required="1" />
                                </div>
                            </div>
                        </div>

                        <div  class="container" id="orderlist" style="background-color:#ffffff;">
                            <br>
                            <div style="width: 90%;">
                                <div class="btn-group" style="width:90%;">
                                    <button id="sub" type="button" class="btn btn-primary" style="width: 50%" onclick="sublist();">已提交</button>
                                    <button id="push" type="button" class="btn btn-default" style="width: 50%" onclick="pushlist();">已推送</button>
                                </div>
                                    <button type="button" class="btn btn-primary" style="position: absolute;right: 5%;" onclick="add();return false;">
                                        <span class="glyphicon glyphicon-list-alt"></span>
                                    </button>
                            </div>
                            <br>
                            <div class="input-group" style="margin-left: auto;margin-right: auto;">
                                <input id="search" type="text" class="form-control" style="height: 30px;">
                                     <span class="input-group-btn">
                                         <button class="btn btn-default" type="button" onclick="search();"> <span class="glyphicon glyphicon-search"></span></button>
                                     </span>
                            </div>
                            <div id="list">

                            </div>
                        </div>

<!-- ./wrapper -->
<!-- DataTables -->
<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../bootstrap/js/bootstrap-dialog.js"></script>

<script src="../dist/js/demo.js"></script>
<script type="text/javascript">

    var selectedTr = null;

    var phone = <%=phone%>;

    function showMyList(){
        var postData = {
//            username:document.getElementById("ousername").value
            username:"asd"
        };
         $.ajax({
            type: "POST",
            url: "<%=basePath%>RequireOrderController/ShowMyOrder",
            cache:false ,
            dataType:'json',
            data: postData,
            async: false,
            success: function (data) {
                var length = data.length;
                for(var i = 0;i<length;i++) {
                    var html = "<div style='width:100%;'>";
                    html += "<br><div style='border-style:groove;border-radius:10px;background-color: #ffffff;' onmousedown='del(this);' onclick='detail(this);'>";
                    html += "<div><span  id='lid' style='display:none;'>"+data[i].id+"</span>"
                    html += "<div><span style='font-weight: bold;margin-left: 5%;'>需求内容：</span><span id='lname' style='font-weight: bold;'>"+data[i].requirename+"</span></div><br>";
                    html += "<div><span style='margin-left: 5%;'>数量：</span><span id='lnum'>"+data[i].num+"</span><span style='margin-left: 20%;'>需求类型：</span><span id='ltype'>"+data[i].requiretype+"</span></div>";
                    html += "<div><span style='margin-left: 5%;'>联系人：</span><span id='lconname'>"+data[i].conname+"</span><span style='margin-left: 15%;'>联系方式：</span><span id='lcontel'>"+data[i].conphone+"</span></div>";
                    html += "<div><span style='margin-left: 5%;'>日期：</span><span id='ldate'>"+data[i].requiredate+"</span><span style='margin-left: 15%;' id='lstatus'>"+data[i].requirestatus+"</span></div>";
                    html += "<br></div></div>";
                    $('#list').append(html);
                }
            }
         });
    }

    function detail(obj){
        $('#edit').show();
        var id = $(obj).find('#lid').html();
        var name = $(obj).find('#lname').html();
        var num = $(obj).find('#lnum').html();
        var type = $(obj).find('#ltype').html();
        var conname = $(obj).find('#lconname').html();
        var contel = $(obj).find('#lcontel').html();
        var date = $(obj).find('#ldate').html();
        var status = $(obj).find('#lstatus').html();

        $('#eid').val(id);
        $('#erequirename').val(name);
        $('#enum').val(num);
        $("#etype").val(type);
        $('#econname').val(conname);
        $('#econtel').val(contel);
        $('#edate').val(date);
        $('#estatus').val(status);

        $('#orderlist').hide();
    }

    function eback(){
        document.getElementById("erequirename").readOnly = true;
        document.getElementById("enum").readOnly = true;
        document.getElementById("econname").readOnly = true;
        document.getElementById("econtel").readOnly = true;
        document.getElementById("etype").disabled = true;
        $("#erequirename").css("background-color", "#CCCCCC");
        $("#enum").css("background-color", "#CCCCCC");
        $("#econname").css("background-color", "#CCCCCC");
        $("#econtel").css("background-color", "#CCCCCC");
        $("#etype").css("background-color", "#CCCCCC");
        $("#ediv").hide();
        $("#ebutton").show();
        $('#orderlist').show();
        $('#edit').hide();
    }

    function add(){
        $('#orderlist').hide();
        $('#order').show();
    }

    function back(){
        $('#orderlist').show();
        $('#order').hide();
    }

    function goback(){

        $('#orderlist').show();
        $('#detail').hide();
    }

    function addOrder(){
        var postData = {
//            username:document.getElementById("ousername").value,
            username:"asd",
            conusername:document.getElementById("oconusername").value,
            phone:document.getElementById("ocontel").value,
            require:document.getElementById("requirename").value,
            num: document.getElementById("num").value,
            type:document.getElementById("type").value
        };
        $.ajax({
            type:"POST",
            url:"<%=basePath%>RequireOrderController/AddOrder",
            async:false,
            data:postData,
            success:function(data){
                if (data == "OK") {
                    window.location.href="morderlist.jsp";
                } else {
                    alert(data);
                }
            }
        });
    }

    function edit(){
        document.getElementById("erequirename").readOnly = false;
        document.getElementById("enum").readOnly = false;
        document.getElementById("econname").readOnly = false;
        document.getElementById("econtel").readOnly = false;
        document.getElementById("etype").disabled = false;
        $("#erequirename").css("background-color", "");
        $("#enum").css("background-color", "");
        $("#econname").css("background-color", "");
        $("#econtel").css("background-color", "");
        $("#etype").css("background-color", "");
        $("#ediv").show();
        $("#ebutton").hide();
    }

    function editOrder(){
        var postData = {
            id:document.getElementById("eid").value,
            conname:document.getElementById("econname").value,
            contel:document.getElementById("econtel").value,
            require:document.getElementById("erequirename").value,
            num: document.getElementById("enum").value,
            type:document.getElementById("etype").value
        };
        $.ajax({
            type:"POST",
            url:"<%=basePath%>RequireOrderController/UpdateOrder",
            async:false,
            data:postData,
            success:function(data){
                if (data == "OK") {
                    window.location.href="morderlist.jsp";
                } else {
                    alert(data);
                }
            }
        });
    }
//    function detail(obj){
//
//        selectedTr = obj;
//        alert(selectedTr.cells[1].innerHTML);
//        var dreuirename = selectedTr.cells[1].innerHTML;
//        document.getElementById("dusername" ).value=document.getElementById("ousername").value;
//        document.getElementById("drequirename").value=selectedTr.cells[1].innerHTML;
//        document.getElementById("dnum").value=selectedTr.cells[2].innerHTML;
//        document.getElementById("dtype" ).value=selectedTr.cells[3].innerHTML;
//        document.getElementById("ddate").value=selectedTr.cells[4].innerHTML;
//        document.getElementById("dstatus").value= selectedTr.cells[5].innerHTML;
//        $('#orderlist').hide();
//        $('#detail').show();
//    }

    function search(){
        $('#list>div').remove();
        var postData = {
            search:document.getElementById("search").value,
//            username:document.getElementById("ousername").value
            username:"asd"
        };
        $.ajax({
            type: "POST",
            url: "<%=basePath%>RequireOrderController/Search",
            cache:false ,
            dataType:'json',
            data: postData,
            async: false,
            success: function (data) {
                var length = data.length;
                for(var i = 0;i<length;i++) {
                    var html = "<div style='width:100%;'>";
                    html += "<br><div style='border-style:groove;border-radius:10px;background-color: #ffffff;' onmousedown='del(this);' onclick='detail(this);'>";
                    html += "<div><span  id='lid' style='display:none;'>"+data[i].id+"</span>"
                    html += "<div><span style='font-weight: bold;margin-left: 5%;'>需求内容：</span><span id='lname' style='font-weight: bold;'>"+data[i].requirename+"</span></div><br>";
                    html += "<div><span style='margin-left: 5%;'>数量：</span><span id='lnum'>"+data[i].num+"</span><span style='margin-left: 20%;'>需求类型：</span><span id='ltype'>"+data[i].requiretype+"</span></div>";
                    html += "<div><span style='margin-left: 5%;'>联系人：</span><span id='lconname'>"+data[i].conname+"</span><span style='margin-left: 15%;'>联系方式：</span><span id='lcontel'>"+data[i].conphone+"</span></div>";
                    html += "<div><span style='margin-left: 5%;'>日期：</span><span id='ldate'>"+data[i].requiredate+"</span><span style='margin-left: 15%;' id='lstatus'>"+data[i].requirestatus+"</span></div>";
                    html += "<br></div></div>";
                    $('#list').append(html);
                }
            }
        });
    }

    function pushlist(){
        $('#sub').removeClass("btn-primary").addClass("btn-default");
        $('#push').removeClass("btn-default").addClass("btn-primary");
//        $("#list").remove()
        $('#list>div').remove();
        var postData = {
//            username:document.getElementById("ousername").value
            username:"asd"
        };
        $.ajax({
            type: "POST",
            url: "<%=basePath%>RequireOrderController/ShowMyPushOrder",
            cache:false ,
            dataType:'json',
            data: postData,
            async: false,
            success: function (data) {
                var length = data.length;
                for(var i = 0;i<length;i++) {
                    var html = "<div style='width:100%;'>";
                    html += "<br><div style='border-style:groove;border-radius:10px;background-color: #ffffff;' onmousedown='del(this);' onclick='detail(this);'>";
                    html += "<div><span  id='lid' style='display:none;'>"+data[i].id+"</span>"
                    html += "<div><span style='font-weight: bold;margin-left: 5%;'>需求内容：</span><span id='lname' style='font-weight: bold;'>"+data[i].requirename+"</span></div><br>";
                    html += "<div><span style='margin-left: 5%;'>数量：</span><span id='lnum'>"+data[i].num+"</span><span style='margin-left: 20%;'>需求类型：</span><span id='ltype'>"+data[i].requiretype+"</span></div>";
                    html += "<div><span style='margin-left: 5%;'>联系人：</span><span id='lconname'>"+data[i].conname+"</span><span style='margin-left: 15%;'>联系方式：</span><span id='lcontel'>"+data[i].conphone+"</span></div>";
                    html += "<div><span style='margin-left: 5%;'>日期：</span><span id='ldate'>"+data[i].requiredate+"</span><span style='margin-left: 15%;' id='lstatus'>"+data[i].requirestatus+"</span></div>";
                    html += "<br></div></div>";
                    $('#list').append(html);
                }
            }
        });
    }

    function sublist(){
        $('#push').removeClass("btn-primary").addClass("btn-default");
        $('#sub').removeClass("btn-default").addClass("btn-primary");
        $('#list>div').remove();
        showMyList();
    }
</script>
</body>
</html>