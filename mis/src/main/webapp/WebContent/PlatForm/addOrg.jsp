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
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-dialog.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../bootstrap/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <script src="../bootstrap/js/html5shiv.min.js" type="text/javascript"></script>
    <script src="../bootstrap/js/respond.min.js"　type="text/javascript"></script>
    <style type="text/css">
        .hiddenCol
        {
            display:none;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="../jsp/header.jsp"></jsp:include>
    <div class="content-wrapper">
        <div>
            <ul id="myTab" class="nav nav-tabs">
                <li class="active"> <a href="#home" data-toggle="tab"> 新增组织 </a> </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <form id="addOrg" class="form-horizontal" novalidate="novalidate" style="margin-left: 10%;margin-top:1%;">
                        <fieldset>
                            <input id="ID" type="hidden" name="ID">
                            <div>
                                <div style="float:left;">
                                    <span style="color:red;font-size: 18px;">*&nbsp;</span>
                                    组织编号
                                </div>
                                <div style="margin-left:10px;float:left;">
                                    <p>
                                        <input class="vinwi" id="orgnum" type="text" name="orgnum">
                                    </p>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div>
                                <div style="float:left;">
                                    <span style="color:red;font-size: 18px;">*&nbsp;</span>
                                    组织名称
                                </div>
                                <div style="margin-left:10px;float:left;">
                                    <p>
                                        <input class="vinwi" id="orgname" type="text" name="orgname">
                                    </p>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div>
                                <div style="float:left;">
                                    <span style="color:red;font-size: 18px;">*&nbsp;</span>
                                    组织级别
                                </div>
                                <div style="margin-left:10px;float:left;">
                                    <p>
                                        <input class="vinwi" id="level" type="text" name="level">
                                    </p>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div>
                                <div style="float:left;">
                                    <span style="color:red;font-size: 18px;">*&nbsp;</span>
                                    组织介绍
                                </div>
                                <div style="margin-left:10px;float:left;">
                                    <p>
                                        <input class="vinwi" id="introduce" type="text" name="introduce">
                                    </p>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div>
                                <div style="float:left;">
                                    <span style="color:red;font-size: 18px;">*&nbsp;</span>
                                    上级组织
                                </div>
                                <div style="margin-left:10px;float:left;">
                                    <p>
                                        <input class="vinwi" id="parent" type="text" name="parent">
                                    </p>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div>
                                <div style="float:left;">
                                    <span style="color:red;font-size: 18px;">*&nbsp;</span>
                                    组织人员
                                </div>
                                <div style="margin-left:10px;float:left;">
                                    <p>
                                        <input class="vinwi" id="people" type="text" name="people">
                                    </p>
                                </div>
                            </div>
                            <br>
                            <br>
                        </fieldset>
                    </form>
                    <hr style="height:1px;border:none;border-top:1px solid #555555;" />
                    <div style="width:100%;">
                        <div style="width:60%;margin-left: auto;margin-right: auto;">
                            <div id="submit" style="height:30px;width:50px;float:left;margin-left: 30%;">
                                <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="addOrg()">提交</button>
                            </div>

                            <div id="return" style="height:30px;width:50px;float:left;margin-left: 10%;">
                                <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="location.href='pforg.jsp'">返回</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../jsp/footer.jsp"></jsp:include>
</div>

<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../bootstrap/js/bootstrap-treeview.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../dist/js/app.min.js"></script>
<script src="../bootstrap/js/bootstrap-dialog.js"></script>
<script src="../dist/js/demo.js"></script>
<script type="text/javascript">

    function addOrg() {
        var formdata = $('#addOrg').serializeArray();
        $.ajax({
            type:"POST",
            url:"<%=basePath%>OrgController/AddOrg",
            async:false,
            data:formdata,
            success:function(data){
                window.location.href="pforg.jsp";
            }
        });
    }

</script>

</body>
</html>
