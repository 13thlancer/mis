<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    HttpSession s = request.getSession();
    String username=(String)s.getAttribute("username");
    String phone=(String)s.getAttribute("phone");
    String company=(String)s.getAttribute("company");
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
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="../../index2.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>MIS</b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>后台管理</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->

            <!-- search form -->

            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">主菜单</li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-table"></i> <span>商会系统</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="require_user.jsp"><i class="fa fa-circle-o"></i>认证用户</a></li>
                        <li><a href="require_order.jsp"><i class="fa fa-circle-o"></i>需求订单</a></li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-table"></i> <span>点赞系统</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="flypig_gift.jsp"><i class="fa fa-circle-o"></i>奖品维护</a></li>
                        <li><a href="flypig_user.jsp"><i class="fa fa-circle-o"></i>用户维护</a></li>
                        <li class="active"><a href="flypig_convert.jsp"><i class="fa fa-circle-o"></i>奖品兑换</a></li>
                        <li><a href="flypig.jsp"><i class="fa fa-circle-o"></i>消息维护</a></li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-table"></i> <span>云之家界面</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="mCloudlog.jsp"><i class="fa fa-circle-o"></i>认证用户</a></li>
                        <li><a href="mCloudList.jsp"><i class="fa fa-circle-o"></i>需求清单</a></li>
                        <%--<li><a href="require_order.jsp"><i class="fa fa-circle-o"></i>需求订单</a></li>--%>
                    </ul>
                </li>
                <li class="treeview active">
                    <a href="#">
                        <i class="fa fa-table"></i> <span>微信界面</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="mWXlogin.jsp"><i class="fa fa-circle-o"></i>登录微信</a></li>
                        <li><a href="muserreg.jsp"><i class="fa fa-circle-o"></i>用户绑定</a></li>
                        <li  class="active"><a href="morderlist.jsp"><i class="fa fa-circle-o"></i>需求订单</a></li>
                    </ul>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <!-- /.box -->
        <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
                <div class="block-content collapse in">
                    <div class="span12">
                    </div>
                    <br>


                        <div id="order" class="container" style="display: none;">
                            <h3 class="form-signin-heading">请填选订单</h3>
                            <div class="controls">
                                <input type="text" id="ousername" class="input-block-level" readOnly="true" value="<%=username%>">
                            </div>
                            <div class="controls">
                                <input type="text" id="requirename" class="input-block-level" placeholder="需求">
                            </div>
                            <div class="controls">
                                <input type="text" id="num" class="input-block-level" placeholder="数量">
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <select id="type" name="category" style=" height: 20px;padding: 4px 6px;margin-bottom: 10px;font-size: 14px;line-height: 20px;">
                                        <option value="">请选择需求类型</option>
                                        <option value="1">A</option>
                                        <option value="2">B</option>
                                        <option value="3">C</option>
                                        <option value="4">D</option>
                                    </select>
                                </div>
                            </div>
                            <button class="btn btn-large btn-primary" type="submit" onclick="addOrder();return false;">提交</button>
                            <button class="btn btn-large btn-primary" type="submit" onclick="back();return false;">返回</button>
                        </div>

                        <div id="detail" style="display: none;">
                            <button class="btn btn-large btn-primary" type="submit" onclick="goback();return false;">返回</button>
                            <div class="control-group">
                                <label class="control-label" style="float: left;">用户名：</label>
                                <div class="controls">
                                    <input id="dusername" type="text" name="name" data-required="1" />
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

                        <div id="list" class="container">
                            <button class="btn btn-large btn-primary" type="submit" onclick="add();return false;">添加订单</button>
                            <table id="orderlist" class="table table-striped  table-hover">
                                <caption>我的订单</caption>
                                <thead>
                                    <tr>
                                        <th style="display: none">ID</th>
                                        <th>需求</th>
                                        <th>数量</th>
                                        <th>类型</th>
                                        <th>时间</th>
                                        <th>状态</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>Version</b> 2.3.5
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
</footer>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
        <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
        <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
        <!-- Home tab content -->
        <div class="tab-pane" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">Recent Activity</h3>
            <ul class="control-sidebar-menu">
                <li>
                    <a href="javascript:void(0)">
                        <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                        <div class="menu-info">
                            <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                            <p>Will be 23 on April 24th</p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <i class="menu-icon fa fa-user bg-yellow"></i>

                        <div class="menu-info">
                            <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                            <p>New phone +1(800)555-1234</p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                        <div class="menu-info">
                            <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                            <p>nora@example.com</p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <i class="menu-icon fa fa-file-code-o bg-green"></i>

                        <div class="menu-info">
                            <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                            <p>Execution time 5 seconds</p>
                        </div>
                    </a>
                </li>
            </ul>
            <!-- /.control-sidebar-menu -->

            <h3 class="control-sidebar-heading">Tasks Progress</h3>
            <ul class="control-sidebar-menu">
                <li>
                    <a href="javascript:void(0)">
                        <h4 class="control-sidebar-subheading">
                            Custom Template Design
                            <span class="label label-danger pull-right">70%</span>
                        </h4>

                        <div class="progress progress-xxs">
                            <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <h4 class="control-sidebar-subheading">
                            Update Resume
                            <span class="label label-success pull-right">95%</span>
                        </h4>

                        <div class="progress progress-xxs">
                            <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <h4 class="control-sidebar-subheading">
                            Laravel Integration
                            <span class="label label-warning pull-right">50%</span>
                        </h4>

                        <div class="progress progress-xxs">
                            <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <h4 class="control-sidebar-subheading">
                            Back End Framework
                            <span class="label label-primary pull-right">68%</span>
                        </h4>

                        <div class="progress progress-xxs">
                            <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                        </div>
                    </a>
                </li>
            </ul>
            <!-- /.control-sidebar-menu -->

        </div>
        <!-- /.tab-pane -->
        <!-- Stats tab content -->
        <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
        <!-- /.tab-pane -->
        <!-- Settings tab content -->
        <div class="tab-pane" id="control-sidebar-settings-tab">
            <form method="post">
                <h3 class="control-sidebar-heading">General Settings</h3>

                <div class="form-group">
                    <label class="control-sidebar-subheading">
                        Report panel usage
                        <input type="checkbox" class="pull-right" checked>
                    </label>

                    <p>
                        Some information about this general settings option
                    </p>
                </div>
                <!-- /.form-group -->

                <div class="form-group">
                    <label class="control-sidebar-subheading">
                        Allow mail redirect
                        <input type="checkbox" class="pull-right" checked>
                    </label>

                    <p>
                        Other sets of options are available
                    </p>
                </div>
                <!-- /.form-group -->

                <div class="form-group">
                    <label class="control-sidebar-subheading">
                        Expose author name in posts
                        <input type="checkbox" class="pull-right" checked>
                    </label>

                    <p>
                        Allow the user to show his name in blog posts
                    </p>
                </div>
                <!-- /.form-group -->

                <h3 class="control-sidebar-heading">Chat Settings</h3>

                <div class="form-group">
                    <label class="control-sidebar-subheading">
                        Show me as online
                        <input type="checkbox" class="pull-right" checked>
                    </label>
                </div>
                <!-- /.form-group -->

                <div class="form-group">
                    <label class="control-sidebar-subheading">
                        Turn off notifications
                        <input type="checkbox" class="pull-right">
                    </label>
                </div>
                <!-- /.form-group -->

                <div class="form-group">
                    <label class="control-sidebar-subheading">
                        Delete chat history
                        <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                    </label>
                </div>
                <!-- /.form-group -->
            </form>
        </div>
        <!-- /.tab-pane -->
    </div>
</aside>
<!-- /.control-sidebar -->
<!-- Add the sidebar's background. This div must be placed
     immediately after the control sidebar -->
<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<!-- DataTables -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
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
<script type="text/javascript">

    var selectedTr = null;

    var phone = <%=phone%>;

    function showMyList(){
        var postData = {
            username:document.getElementById("ousername").value
        };
         $.ajax({
            type: "POST",
            url: "<%=basePath%>requireOrderController/showMyOrder",
            cache:false ,
            dataType:'json',
            data: postData,
            async: false,
            success: function (data) {
                var length = data.length;
                for(var i = 0;i<length;i++) {
                    $('#orderlist').append('<tr onclick="detail(this);"><td style="display: none">'+data[i].id+'</td><td>'+data[i].requirename+'</td><td>'+data[i].num+'</td><td>'+data[i].requiretype+'</td><td>'+data[i].requiredate+'</td><td>'+data[i].requirestatus+'</td></tr>');
                }
            }
         });
    }

    function add(){
        $('#list').hide();
        $('#order').show();
    }

    function back(){
        $('#list').show();
        $('#order').hide();
    }

    function goback(){
        $('#list').show();
        $('#detail').hide();
    }

    function addOrder(){
        var postData = {
            username:document.getElementById("ousername").value,
            phone:phone,
            require:document.getElementById("requirename").value,
            num: document.getElementById("num").value,
            type:document.getElementById("type").value
        };
        $.ajax({
            type:"POST",
            url:"<%=basePath%>requireOrderController/addOrder",
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

    function detail(obj){

        selectedTr = obj;
//        alert(selectedTr.cells[1].innerHTML);
        var dreuirename = selectedTr.cells[1].innerHTML;
//        alert(dreuirename);
//        document.getElementById("dusername").innerText="123";
//        $('#dusername').text('dreuirename');
        document.getElementById("dusername" ).value=document.getElementById("ousername").value;
        document.getElementById("drequirename").value=selectedTr.cells[1].innerHTML;
        document.getElementById("dnum").value=selectedTr.cells[2].innerHTML;
        document.getElementById("dtype" ).value=selectedTr.cells[3].innerHTML;
        document.getElementById("ddate").value=selectedTr.cells[4].innerHTML;
        document.getElementById("dstatus").value= selectedTr.cells[5].innerHTML;
        $('#list').hide();
        $('#detail').show();
    }
</script>
</body>
</html>