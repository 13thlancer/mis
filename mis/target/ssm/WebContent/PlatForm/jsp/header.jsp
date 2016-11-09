
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession s = request.getSession();
    String picpath = s.getAttribute("picpath").toString();
    String name = s.getAttribute("name").toString();
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
    java.util.Date currentTime = new java.util.Date();//得到当前系统时间
    String str_date1 = formatter.format(currentTime); //将日期时间格式化
    String str_date2 = currentTime.toString(); //将Date型日期时间转换成字符串形式

%>
<html>
<head>
    <title></title>
</head>
<body onload="userinfo()">
<header class="main-header">
    <!-- Logo -->
    <a class="logo">
        <span class="logo-mini"><b>MIS</b></span>
        <span class="logo-lg"><b>商会管理系统</b></span>
    </a>
    <nav class="navbar navbar-static-top">
        <a class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img id="img1" src="<%=picpath %>" class="user-image" alt="User Image">
                        <span id="name" class="hidden-xs">欢迎,<%=name %></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img id="img2" src="<%=picpath %>" class="img-circle" alt="User Image">
                            <p>
                                <%=name %>
                                <h5> <%=str_date1 %></h5>
                            </p>
                        </li>

                        <li class="user-footer">
                            <div class="pull-right">
                                <a class="btn btn-default btn-flat" onclick="SignOut()">登出</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- Control Sidebar Toggle Button -->
                <li>
                    <a data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>
            </ul>
        </div>
    </nav>

</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <section class="sidebar">
        <ul class="sidebar-menu">
            <li class="header">主菜单</li>

            <li class="treeview">
                <a>
                    <i class="fa fa-table"></i><span>平台管理</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="../manager/pfmanager.jsp"><i class="fa fa-circle-o"></i>平台用户管理</a></li>
                    <li><a href="../role/pfrole.jsp"><i class="fa fa-circle-o"></i>平台角色管理</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-table"></i><span>组织架构</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="../org/pforg.jsp"><i class="fa fa-circle-o"></i>组织维护</a></li>
                    <li><a href="../people/pfpeople.jsp"><i class="fa fa-circle-o"></i>会员维护</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-table"></i><span>用户管理</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="admin_user.jsp"><i class="fa fa-circle-o"></i>会员</a></li>
                    <li><a href="require_user.jsp"><i class="fa fa-circle-o"></i>微信用户</a></li>
                    <li><a href="Yzj_user.jsp"><i class="fa fa-circle-o"></i>云之家用户</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-table"></i><span>信息管理</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="../article/pfarticle.jsp?mtype=10"><i class="fa fa-circle-o"></i>人文信息</a></li>
                    <li><a href="../article/pfarticle.jsp?mtype=80"><i class="fa fa-circle-o"></i>商会活动</a></li>
                    <li><a href="../article/pfarticle.jsp?mtype=40"><i class="fa fa-circle-o"></i>商会信息</a></li>
                    <li><a href="../lawyer/pflawyer.jsp"><i class="fa fa-circle-o"></i>律师信息</a></li>
                    <li><a href="../article/pfarticle.jsp?mtype=30"><i class="fa fa-circle-o"></i>产品信息</a></li>
                    <li><a href="../article/pfarticle.jsp?mtype=90"><i class="fa fa-circle-o"></i>政企互联信息</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-table"></i><span>意向管理</span>
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="require_order.jsp"><i class="fa fa-circle-o"></i>需求意向</a></li>
                </ul>
            </li>

            <%--<li class="treeview">--%>
                <%--<a href="#">--%>
                    <%--<i class="fa fa-table"></i> <span>点赞系统</span>--%>
                <%--<span class="pull-right-container">--%>
                  <%--<i class="fa fa-angle-left pull-right"></i>--%>
                <%--</span>--%>
                <%--</a>--%>
                <%--<ul class="treeview-menu">--%>
                    <%--<li><a href="flypig_gift.jsp"><i class="fa fa-circle-o"></i>奖品维护</a></li>--%>
                    <%--<li><a href="flypig_user.jsp"><i class="fa fa-circle-o"></i>用户维护</a></li>--%>
                    <%--<li><a href="flypig_convert.jsp"><i class="fa fa-circle-o"></i>奖品兑换</a></li>--%>
                    <%--<li><a href="flypig.jsp"><i class="fa fa-circle-o"></i>点赞维护</a></li>--%>
                <%--</ul>--%>
            <%--</li>--%>


        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

<script type="text/javascript">
    function active(){

        var count = document.getElementsByTagName('a').length;
        for(var i = 0;i<count;i++){
            var href=document.getElementsByTagName('a')[i].href.toString();
//            alert(href);
            var loc = window.location.toString();
            if(href == loc){
                var li = document.getElementsByTagName('a')[i].parentNode;
                var a =  document.getElementsByTagName('a')[i].innerHTML;
                document.getElementsByTagName('a')[i].parentNode.className='active';
                li.parentNode.parentNode.className='active';
            }
        }
    }

    function SignOut(){
        window.location.href='../login.jsp'
    }

    function userinfo(){

//        var href = document.getElementsByTagName('li')[6].getElementsByTagName('a')[0];
//        alert(count.length);

        var pp= '<%=picpath %>';
        document.getElementById("img1").src = pp;
        document.getElementById("img2").src = pp;
    }
</script>

</body>
</html>
