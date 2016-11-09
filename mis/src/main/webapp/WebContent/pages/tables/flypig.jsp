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
<body class="hold-transition skin-blue sidebar-mini" onload="showBlog();">
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

          <li class="treeview active">
          <a href="#">
            <i class="fa fa-table"></i> <span>点赞系统</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="flypig_gift.jsp"><i class="fa fa-circle-o"></i>奖品维护</a></li>
            <li><a href="flypig_user.jsp"><i class="fa fa-circle-o"></i>用户维护</a></li>
            <li><a href="flypig_convert.jsp"><i class="fa fa-circle-o"></i>奖品兑换</a></li>
            <li class="active"><a href="flypig.jsp"><i class="fa fa-circle-o"></i>点赞维护</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        点赞维护
        <small>消息维护</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主菜单</a></li>
        <li><a href="#">点赞系统</a></li>
        <li class="active">消息维护</li>
      </ol>
    </section>

          <!-- /.box -->
          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
                 <div class="block-content collapse in">
                            <div class="span12">
                               <div class="table-toolbar">
                                  <div class="btn-group">
                                       <a href="#add" role="button" data-toggle="modal" class="btn btn-default" >添加<i class="icon-plus"></i></a>
                                  </div>
                                   <div class="btn-group">
                                       <a href="#"><button class="btn btn-default" onclick="update();">修改<i class="icon-pencil"></i></button></a>
                                  </div>
                                  <div class="btn-group">
                                     <a href="#"><button class="btn btn-default" onclick="deleted();">删除<i class="icon-remove"></i></button></a>
                                  </div>
                                   <div class="btn-group">
                                     <a href="#"><button class="btn btn-default" onclick="refresh();">刷新<i class="icon-refresh"></i></button></a>
                                  </div>
                                <!--  <div class="btn-group pull-right">
                                     <button data-toggle="dropdown" class="btn dropdown-toggle">更多 <span class="caret"></span></button>
                                     <ul class="dropdown-menu">
                                        <li><a href="#">打印</a></li>
                                        <li><a href="#">保存为PDF</a></li>
                                        <li><a href="#">导入EXCEL</a></li>
                                     </ul>
                                  </div>-->
                               </div>
                                <br>
                                <table cellpadding="0" cellspacing="0" border="0"  data-click-to-select="true" data-toggle="table" class="table table-striped table-hover table-bordered" id="data_post_list">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" id="checkAll" name="checkAll" /></th>
                                            <th>ID</th>
                                            <th>发布用户</th>
                                            <th>被赞人</th>
                                            <th>发布内容</th>
                                            <th>发布时间</th>
                                            <th>发布类型</th>
                                            <th>图片路径</th>
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
      
    <!--添加增加弹出层-->
    <div class="modal fade" id="add" style="display:none;" data-backdrop="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">添加信息</h4>
                    </div>
                    <div class="modal-body">
                        <form action="#" id="addform" class="form-horizontal">
                            <fieldset>
                                <div class="control-group">
                                    <label class="control-label">发布人<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="username" type="text" name="name" data-required="1" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">被赞人</label>
                                    <div class="controls">
                                        <input id="recievername" type="text" name="name" data-required="1" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">发布内容<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="sendcontent" type="text" name="name" data-required="1" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">图片路径</label>
                                    <div class="controls">
                                        <input id="picpath" type="text" name="name" data-required="1" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">发布类型<span class="required">*</span></label>
                                    <div class="controls">
                                        <select id="sendtype" name="category">
                                            <option value="">请选择...</option>
                                            <option value="1">普通</option>
                                            <option value="2">活动</option>
                                            <option value="3">通知</option>
                                            <option value="4">点赞</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary" onclick="addblog();return false;">添加</button>
                                    <button id="Cancel" type="button" class="btn" onclick="add_cancel();">取消</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <!--添加修改弹出层-->
    <div class="modal fade" id="update" style="display:none;" data-backdrop="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">修改信息</h4>
                </div>
                <div class="modal-body">
                    <form action="#" id="updateform" class="form-horizontal">
                        <fieldset>
                            <div class="alert alert-error hide">
                                <button class="close" data-dismiss="alert"></button>
                                You have some form errors. Please check below.
                            </div>
                            <div class="alert alert-success hide">
                                <button class="close" data-dismiss="alert"></button>
                                Your form validation is successful!
                            </div>

                            <div class="control-group" style="display: none;">
                                <label class="control-label">ID<span class="required">*</span></label>
                                <div class="controls">
                                    <input id="update_blogid" type="text" name="name" data-required="1" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">发布人<span class="required">*</span></label>
                                <div class="controls">
                                    <input id="update_username" type="text" name="name" data-required="1" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">被赞人</label>
                                <div class="controls">
                                    <input id="update_recievername" type="text" name="name" data-required="1" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">发布内容<span class="required">*</span></label>
                                <div class="controls">
                                    <input id="update_sendcontent" type="text" name="name" data-required="1" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">图片路径</label>
                                <div class="controls">
                                    <input id="update_picpath" type="text" name="name" data-required="1" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">发布类型<span class="required">*</span></label>
                                <div class="controls">
                                    <select id="update_sendtype" name="category">
                                        <option value="">请选择...</option>
                                        <option value="1">普通</option>
                                        <option value="2">活动</option>
                                        <option value="3">通知</option>
                                        <option value="4">点赞</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" class="btn btn-primary" onclick="updateblog();return false;">修改</button>
                                <button id="upCancel" type="button" class="btn" onclick="update_cancel();">取消</button>
                            </div>
                        </fieldset>
                    </form>
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
<!-- jQuery 2.2.3 -->
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
<!-- page script -->
<script type="text/javascript">

    var selectedTr = null;
    var oTable = null;
    /*datatable插件赋值及属性设置*/
    function showBlog() {
        $.ajax({
            type: "post",
            url: "<%=basePath%>adminController/showBlog",
            dataType: "json",
            data: {},
            checkbox:true,
            error: function () {
            },
            success:function (data) {
                $('#data_post_list').DataTable({
                    data: data,
                    columns: [
                        {
                            "render": function (data, type, full, meta) {
                                return '<input onclick="check(this);" name="checkbox" type="checkbox"/>';
                            }
                        },
                        {data: 'id',sClass:"hiddenCol"},
                        {data: 'senderid'},
                        {data: 'reciverid'},
                        {data: 'sendcontent'},
                        {data: 'senddate'},
                        {data: 'type'},
                        {data: 'picpath'}
                    ]
                });
            }
        });
    }

        /*function showBlog(){
      $.ajax({
          type: "POST",
          url: "<%=basePath%>adminController/showBlog",
          cache:false ,
          dataType:'json',
          async: false,
          success: function (data) {
              var length = data.length;
              for(var i = 0;i<length;i++)
              {
                  $('#data_post_list').append('<tr onclick="check(this);"><td><input type="checkbox" id="check" name="checkbox" /></td><td>'+data[i].id+'</td><td>'+data[i].senderid+'</td><td>'+data[i].reciverid+'</td><td>'+data[i].sendcontent+'</td><td>'+data[i].senddate+'</td><td>'+data[i].type+'</td><td>'+data[i].picpath+'</td></tr>');
              }
          }
      });
  }*/

    /*勾选框单选设置*/
    function check(obj) {
        var a = obj;
        var table = $("#data_post_list").dataTable();
        var nTrs = table.fnGetNodes();//fnGetNodes获取表格所有行，nTrs[i]表示第i行tr
        if($(a).prop("checked")==true) {
            for (var i = 0; i < nTrs.length; i++) {//  if($(nTrs[i]).hasClass('selected')){//相当于$(tr)
                $(nTrs[i]).find( "input").attr('checked',false);
            }
            $(a).prop("checked", true)
            for (var i = 0; i < nTrs.length; i++) {//  if($(nTrs[i]).hasClass('selected')){//相当于$(tr)
                if ($(nTrs[i]).find( "input").prop("checked") == true) {
                    selectedTr = nTrs[i];
                    $(nTrs[i]).find( "input").attr('checked',false);
                }
            }
            $(a).prop("checked", true)
        }else{
            selectedTr = null;
            for (var i = 0; i < nTrs.length; i++) {//  if($(nTrs[i]).hasClass('selected')){//相当于$(tr)
                $(nTrs[i]).find( "input").attr('checked',false);
            }
        }
    }

     /*获取选中行信息*/
    function update(){
        if (selectedTr != null) {
            $("#update").modal("show");
            document.getElementById("update_blogid" ).value=selectedTr.cells[1].innerHTML;
            document.getElementById("update_username").value=selectedTr.cells[2].innerHTML;
            document.getElementById("update_recievername").value=selectedTr.cells[3].innerHTML;
            document.getElementById("update_sendcontent").value=selectedTr.cells[4].innerHTML;
            document.getElementById("update_picpath").value=selectedTr.cells[5].innerHTML;
            document.getElementById("update_sendtype").value= selectedTr.cells[6]. innerHTML;
        }else{
            alert("请选择一行");
        }
          selectedTr = null;
    }

    /*删除选中行*/
    function deleted(){
        if (selectedTr != null) {
          var delid = selectedTr.cells[1].innerHTML;
          $.ajax({
              type: "POST",
              url:"<%= basePath %>adminController/deleteBlog",
              cache:false ,
              async:true,
              data:{delid: delid},
              success:function(data){
                  if (data == "OK") {
                      alert("删除成功！")
                      location.reload("flypig.jsp");
                  } else {
                      alert(data);
                  }
              }
          });
      }else {
          alert("请选择一行");
      }
                selectedTr = null;
    }

    /*刷新页面*/
    function refresh(){
      location.reload("flypig.jsp");
    }

    /*修改选中行*/
    function updateblog(){
      var postData = {
          id:document.getElementById("update_blogid").value,
          username:document.getElementById("update_username").value,
          recievername: document.getElementById("update_recievername").value,
          sendcontent: document.getElementById("update_sendcontent").value,
          picpath:document.getElementById("update_picpath").value, sendtype:document.getElementById("update_sendtype").value
      };
      $.ajax({
          type:"POST",
          url:"<%=basePath%>adminController/updateBlog",
          async:false,
          data: postData,
          success:function(data){
              if (data == "OK") {
                  location.reload("flypig.jsp");
              }
              else {
                  alert(data);
              }
          }
      });
    }

       /*新增内容*/
      function addblog(){
          var postData = {
              username:document.getElementById("username").value,
              recievername: document.getElementById("recievername").value,
              sendcontent:document.
                      getElementById
              ("sendcontent").value,
              picpath: document.
                      getElementById("picpath").value, sendtype:document.
                      getElementById("sendtype").value
          };
          $.ajax({
              type:"POST",
              url:"<%=basePath%>adminController/addBlog",
              async:false,
              data:postData,
              success:function(data){
                  if (data == "OK") {
                      location.reload("flypig.jsp");
                  } else {
                      alert(data);
                  }
              }
          });
      }

    function update_cancel(){
      $("#update").modal("hide");
      var b = document.getElementsByName("checkbox");
      for( var i=0;i<b.length;i++){
          if(b[i].checked){
              b[i].checked = false;
          }
      }
    }

  function add_cancel(){
      $("#add").modal("hide");
  }


</script>
</body>
</html>
