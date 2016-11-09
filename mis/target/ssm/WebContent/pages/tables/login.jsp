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
    <link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../../bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <%--<link href="WebContent/assets/styles.css" rel="stylesheet" media="screen">--%>

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
  <body id="login">
    <div class="container">
      <form class="form-signin">
        <h2 class="form-signin-heading">登陆</h2>
        <input id="username" type="text" class="input-block-level" placeholder="用户名">
        <input id="UserPassWord" type="password" class="input-block-level" placeholder="密码">

          <button class="btn btn-large btn-primary" type="submit" onclick="Login();return false;">登陆</button>
          <button class="btn btn-large btn-primary" type="submit" onclick="window.open('<%=request.getContextPath()%>/WebContent/views/Reg.jsp')">注册</button>
      </form>

    </div> <!-- /container -->
<%--
    <script src="<%=request.getContextPath()%>/WebContent/vendors/jquery-3.1.0.min.js"></script>
--%>
    <script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<%--
    <script src="<%=request.getContextPath()%>/WebContent/vendors/jquery-1.9.1.min.js"></script>
--%>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function Login() {
            var postData = {
                username:document.getElementById("username").value,
                UserPassWord: document.getElementById("UserPassWord").value
            };

            $.ajax({
                type:"POST",
                url:"<%=basePath%>LoginController/checkUser",
                /*cache:false ,*/
                async:false,
                data:postData,
                success:function(data){
                    if (data == "OK") {
                        /* alert(data);*/
                        window.location.href = "morderlist.jsp";
                        /* window.open("tables.jsp")*/
                    } else {
                        jAlert('');
                        /*alert(data);*/
                        /* $.message.show({
                         title:'提示信息',
                         msg:data
                         });*/

                    }
                }
            });
        };
    </script>
  </body>
</html>