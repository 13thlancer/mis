<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Admin Login</title>
    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <%--<link href="WebContent/assets/styles.css" rel="stylesheet" media="screen">--%>

      <style type="text/css">
          .a1 {
              border-bottom-style: solid;
              border-bottom-width: 1px;
              border-bottom-color: #c7e1f3;
          }
          .bg_nav {
              width: 80%;
              position: absolute;
              bottom: 36%;
              cursor: pointer;
              cursor: hand;
              z-index: 99;
              margin: auto;
              left: 10%;
          }
          .bg_title {
              width: 900px;
              position: absolute;
              z-index: 2;
              margin-right: auto;
              margin-left: auto;
              left: 26%;
              margin-top: 60px;
          }
          .bg_nav ul {
              list-style: none;
              width: 410px;
              margin-top: 0px;
              margin-bottom: 0px;
              margin-left: 55%;
              background-image: url(../icon/kingdee_icon_07.png);
              background-repeat: no-repeat;
              background-size: 425px;
              padding-top: 6px;
              padding-right: 10px;
              padding-bottom: 0px;
              padding-left: 10px;
          }
          .password-icon {
              background-image: url(../icon/kingdee_icon_03.png);
              background-repeat: no-repeat;
              display: inline-block;
              vertical-align: middle;
              height: 32px;
              width: 20px;
              margin: 0 15px 0 10px;
          }
          .user-icon {
              background-image: url(../icon/kingdee_icon_01.png);
              background-repeat: no-repeat;
              display: inline-block;
              vertical-align: middle;
              height: 32px;
              width: 22px;
              margin: 0 15px 0 10px;
          }

          .login input {
              background-color: #29bdf7;
              border-radius: 10px;
              height: 56px;
              width: 407px;
              font-size: 20px;
              color: #FFF;
              font-family: "Microsoft YaHei";
              border: 0;
              /* margin-top: 20px; */
              word-spacing: 2em;
              cursor: pointer;
          }

          .forget {
              margin-top: 20px;
              position: relative;
          }

          .forget ul {
              background-image: none;
              margin: 0px;
              padding: 0px;
              text-align: center;
          }

          .forget ul li {
              width: 188px;
              /* display: inline; */
              /* float: left; */
              border: 1px solid #def1fc;
              height: auto;
              padding: 0px;
              font-family: "Microsoft YaHei";
              font-size: 16px;
              text-align: center;
              line-height: 50px;
              /* margin-left: 10px; */
              border-radius: 10px;
              display: inline-block;
          }
          .bg_nav ul li {
              height: 71px;
              color: #fff;
              line-height: 60px;
              margin: 0px;
              /* float: left; */
              /* width: 300px; */
              font-family: '微软雅黑', '宋体';
              font-size: 18px;
              padding-top: 0px;
              padding-right: 0px;
              padding-bottom: 0px;
              /* padding-left: 80px; */
              padding-left: 1em;
              text-align: left;
              width: 362px;
              margin-left: 4px;
          }
          .bg_nav ul a {
              text-decoration: none;
          }
          .bg_nav ul li input {
              font-family: "Microsoft YaHei";
              background-color: transparent;
              background: transparent !important;
              border: none !important;
              color: #FFF;
              font-size: 14px;
              padding: 0;
              border: 0;
              line-height: 50px;
              /* margin-top: 10px; */
              /* float: left; */
              vertical-align: top;
              outline: none;
          }
          .forget-btn {
              position: absolute;
              width: 30px;
              left: 0px;
          }
          .register-btn {
              position: absolute;
              width: 30px;
              right: 0px;
          }
      </style>

  </head>
  <body id="login">

    <div class="bg_title">
        <img src="../icon/kingdee.png"/>
    </div>

  <div class="bg_nav" id="bg_nav" style="top:150px;position:absolute;z-index:999999;">
      <!-- <div id="loginHelp" class="loginHelp"></div> -->
      <ul>
          <!-- <li class="a1"><input name="loginID" id="loginID" type="text" value="请输入用户名" style="height: 40px"></li> -->
          <div class="loginHelp">
              <font id="loginHelp" color="#df6066">&nbsp;</font>
          </div>
          <li class="a1">
              <i class="user-icon"></i>
              <input class="user-input" name="loginID" id="username" type="text" placeholder="请输入用户名" style="height: 40px">
          </li>
          <li class="a5">
              <i class="password-icon"></i>
              <input class="password-input" name="password" id="password" type="password" placeholder="请输入密码" style="height: 40px">
          </li>
          <div class="login"><input id="loginBtn" name="loginBtn" type="button" value="登 录" onclick="Login()"></div>
          <div class="forget">
              <ul>
                  <li class="forget-btn" style="width: 180px;"><a id="resetpwdBtn" href="#">忘记密码</a></li>
                  <li class="register-btn" style="width: 180px;"><a id="registerBtn" href="#">注册</a></li>
              </ul>
          </div>
      </ul>
  </div>

  <div id="myCarousel" class="carousel slide">

          <!-- 轮播（Carousel）指标 -->
          <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
          </ol>

      <div class="carousel-inner">
          <div class="item" style="width: 100%">
              <img src="../img/Login_1.jpg" style="height:795px;width: 100%">
          </div>
          <div class="item active">
              <img src="../img/Login_2.jpg" style="height:795px;width:100%">
          </div>
      </div>
      <!-- 轮播（Carousel）导航 -->
      <a class="carousel-control left" href="#myCarousel"
         data-slide="prev">&lsaquo;
      </a>
      <a class="carousel-control right" href="#myCarousel"
         data-slide="next">&rsaquo;
      </a>
  </div>

    <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function Login() {
            var postData = {
                username:document.getElementById("username").value,
                password: document.getElementById("password").value
            };

            $.ajax({
                type:"POST",
                url:"<%=basePath%>LoginController/Login",
                /*cache:false ,*/
                async:false,
                data:postData,
                success:function(data){
                    if(data == 'OK') {
                        window.location.href = "login/index.jsp";
                    }else{
                        alert("登录失败！")
                    }
                }

            });
        };
    </script>
  </body>
</html>