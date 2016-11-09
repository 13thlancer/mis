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
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="./bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="./assets/styles.css" rel="stylesheet" media="screen">
     <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

      <script type="text/javascript">
          function Login() {
              var postData = {
                  UserPassWord:document.getElementById("UserNumber").value,
                  UserNumber: document.getElementById("UserPassWord").value
              };
              $.ajax({
                  type:'POST' ,
                  url:'<%=basePath%>LoginController/checkUser?random='+ parseInt(Math.random() * 100000),
                  cache:false ,
                  data:postData,
                  success:function(data){
                      if (data == "OK") {
                          window.location.href = "<%=basePath%>Index?random="+ parseInt(Math.random() * 100000);
                      } else {
                          alert(data);
                          /* $.message.show({
                               title:'提示信息',
                               msg:data*/
                         /* });*/
                      }
                  }
              });
          }
      </script>
  </head>
  <body id="login">
    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">登陆</h2>
        <input id="UserNumber" type="text" class="input-block-level" placeholder="用户名">
        <input id="UserPassWord" type="password" class="input-block-level" placeholder="密码">
        <label class="checkbox">
          <input type="checkbox" value="remember-me">记住密码
        </label>
        <button class="btn btn-large btn-primary" type="submit" onclick="Login()">登陆</button>
      </form>

    </div> <!-- /container -->
   <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>