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
    <link rel="stylesheet" type="text/css" href="../../wangEditor-2.1.20/dist/css/wangEditor.min.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <style type="text/css">
        .hiddenCol
        {
            display:none;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini" onload="showArticleByid();">
<div class="wrapper">

    <jsp:include page="../jsp/header.jsp"></jsp:include>
    <div class="content-wrapper">
        <div id="header" style="height:50px; width:100%;top:0;background-color:#ff6c00;text-align:center;vertical-align:middle;">
            <label style="color:#ffffff;margin-top:15px;font-weight:normal;">湖南商会</label>
        </div>

        <div  style=" text-align:center;vertical-align:middle;">
            <label id="title" style="width:80%;color:#000000;font-size:20px;"></label>
        </div>
        <div  style="margin-left:10%;">
            <label id="date" style="font-size:5px;width:80%;color:#b9b9b9;"></label>
        </div>
        <div  id="content"  style="width:80%;margin-left:auto;margin-right:auto;">

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
<script type="text/javascript" src="../../wangEditor-2.1.20/dist/js/wangEditor.min.js"></script>
<script type="text/javascript">


    function showArticleByid(){
        var reg = new RegExp("(^|&)id=([^&]*)(&|$)","i");
        var r = window.location.search.substr(1).match(reg);
        var postdata={
            id:r[2]
        }
        $.ajax({
            type:"POST",
            url:"<%=basePath%>ArticleController/ShowArticleById",
            async:false,
            data:postdata,
            success:function(data){
                document.getElementById("title").innerText = data.title;
                document.getElementById("date").innerText = data.CreateTime;
                document.getElementById("content").innerHTML = data.content;
//                   $('content').append(da)
            }
        });
    }


</script>

</body>
</html>
