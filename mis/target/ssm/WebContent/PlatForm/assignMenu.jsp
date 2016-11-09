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
    <title>MIS</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap-dialog.css">
    <link rel="stylesheet" href="../plugins/Ztree/CSS/metro.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
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
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../jsp/header.jsp"></jsp:include>

    <div class="content-wrapper">
        <div>
            <ul id="myTab" class="nav nav-tabs">
                <li class="active"> <a href="#home" data-toggle="tab"> 角色菜单管理 </a> </li>
            </ul>
            <div>
                <div>
                    <div style="margin-left: 3%;margin-top: 2%;">
                        <ul id="tree" class="ztree" style="width:560px; overflow:auto;"></ul>
                    </div>
                    <hr style="height:1px;border:none;border-top:1px solid #555555;" />
                    <div style="width:100%;">
                        <div style="width:60%;margin-left: auto;margin-right: auto;">
                            <div id="submit" style="height:30px;width:50px;float:left;margin-left: 30%;">
                                <button style="height:30px;width:50px;border:none;background: steelblue;color:white;"onclick="subAction()" >提交</button>
                            </div>

                            <div id="return" style="height:30px;width:50px;float:left;margin-left: 10%;">
                                <button style="height:30px;width:50px;border:none;background: steelblue;color:white;" onclick="location.href='pfrole.jsp'">返回</button>
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
<script src="../plugins/Ztree/JS/jquery.ztree.all-3.5.min.js"></script>
<script src="../dist/js/demo.js"></script>
<script type="text/javascript">
    var zTree;
    var demoIframe;

//    function addHoverDom(treeId, treeNode) {
//        var sObj = $("#" + treeNode.tId + "_span");
//        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
////        var addStr = "<span class='button remove' id='removeBtn_" + treeNode.tId
////                + "' title='add node' onfocus='this.blur();'></span>";
////
////        addStr += "<span class='button add' id='addBtn_" + treeNode.tId + "'></span>";
////        addStr += "<span class='button edit' id='editBtn_" + treeNode.tId + "'></span>";
////        sObj.after(addStr);
//        var btn = $("#addBtn_"+treeNode.tId);
//        if (btn) btn.bind("click", function(){
//            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
//            zTree.addNodes(treeNode, {id:(1000 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
//            return false;
//        });
//    };

//    function removeHoverDom(treeId, treeNode) {
//        $("#addBtn_"+treeNode.tId).unbind().remove();
//        $("#removeBtn_"+treeNode.tId).unbind().remove();
//        $("#editBtn_"+treeNode.tId).unbind().remove();
//    };

    var setting = {
        check: {
            enable: true
        },
        view: {
//            addHoverDom: addHoverDom,
//            removeHoverDom: removeHoverDom,
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function(treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode);
                    return false;
                } else {
                    demoIframe.attr("src",treeNode.file + ".html");
                    return true;
                }
            }
//            onCheck:onCheck
        }
    };

    var zNodes =[
        {id:1, pId:0, name:"平台管理", open:true},
        {id:101, pId:1, name:"平台用户管理", url:"pfmanager"},
        {id:10101, pId:101, name:"新增", url:"ManagerController/AddManager"},
        {id:10102, pId:101, name:"修改密码", url:"core/standardData"},
        {id:102, pId:1, name:"平台角色管理", url:"pfrole"},
        {id:10201, pId:102, name:"新增", url:"RoleControllrt/AddRole"},
        {id:10202, pId:102, name:"修改", url:"core/standardData"},
        {id:10203, pId:102, name:"删除", url:"core/standardData"},
        {id:10204, pId:102, name:"禁用", url:"core/standardData"},
        {id:10205, pId:102, name:"分配菜单", url:"core/standardData"},

        {id:2, pId:0, name:"用户管理", open:true},
        {id:201, pId:2, name:"管理员", url:"excheck/checkbox"},
        {id:20101, pId:201, name:"新增", url:"exedit/drag"},
        {id:20102, pId:201, name:"修改", url:"exedit/drag"},
        {id:20103, pId:201, name:"删除", url:"exedit/drag"},
        {id:202, pId:2, name:"微信注册用户", url:"excheck/checkbox_nocheck"},
        {id:20201, pId:202, name:"新增", url:"exedit/drag"},
        {id:20202, pId:202, name:"修改", url:"exedit/drag"},
        {id:20203, pId:202, name:"删除", url:"exedit/drag"},
        {id:203, pId:2, name:"云之家用户", url:"excheck/checkbox_chkDisabled"},
        {id:20301, pId:203, name:"新增", url:"exedit/drag"},
        {id:20302, pId:203, name:"修改", url:"exedit/drag"},
        {id:20303, pId:203, name:"删除", url:"exedit/drag"},

        {id:3, pId:0, name:"意向管理", open:true},
        {id:301, pId:3, name:"需求意向", url:"exedit/drag"},
        {id:30101, pId:301, name:"新增", url:"exedit/drag"},
        {id:30102, pId:301, name:"修改", url:"exedit/drag"},
        {id:30103, pId:301, name:"删除", url:"exedit/drag"},
        {id:30104, pId:301, name:"发布", url:"exedit/drag"},


        {id:4, pId:0, name:"点赞系统", open:true},
        {id:401, pId:4, name:"奖品维护", url:"bigdata/common"},
        {id:40101, pId:401, name:"新增", url:"exedit/drag"},
        {id:40102, pId:401, name:"修改", url:"exedit/drag"},
        {id:40103, pId:401, name:"删除", url:"exedit/drag"},
        {id:402, pId:4, name:"用户维护", url:"bigdata/diy_async"},
        {id:40201, pId:402, name:"新增", url:"exedit/drag"},
        {id:40202, pId:402, name:"修改", url:"exedit/drag"},
        {id:40203, pId:402, name:"删除", url:"exedit/drag"},
        {id:403, pId:4, name:"奖品兑换", url:"bigdata/page"},
        {id:40301, pId:403, name:"新增", url:"exedit/drag"},
        {id:40302, pId:403, name:"修改", url:"exedit/drag"},
        {id:40303, pId:403, name:"删除", url:"exedit/drag"},
        {id:404, pId:4, name:"点赞维护", url:"bigdata/page"},
        {id:40401, pId:404, name:"新增", url:"exedit/drag"},
        {id:40402, pId:404, name:"修改", url:"exedit/drag"},
        {id:40403, pId:404, name:"删除", url:"exedit/drag"}
    ];

    $(document).ready(function(){
        var t = $("#tree");
        t = $.fn.zTree.init(t, setting, zNodes);
        demoIframe = $("#testIframe");
        demoIframe.bind("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
//        zTree.selectNode(zTree.getNodeByParam("id", 101));

    });

    function loadReady() {
        var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
                htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
                maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
                h = demoIframe.height() >= maxH ? minH:maxH ;
        if (h < 530) h = 530;
        demoIframe.height(h);
    }

//    function onCheck(e,treeId,treeNode) {
//        var treeObj = $.fn.zTree.getZTreeObj("tree"),
//                nodes = treeObj.getCheckedNodes(true),
//                v = "";
//        for (var i = 0; i < nodes.length; i++) {
//            v += nodes[i].name + ",";
//            alert(nodes[i].id); //获取选中节点的值
//            alert(nodes[i].url);
//        }
//    }


    function subAction(){
        var reg = new RegExp("(^|&)num=([^&]*)(&|$)","i");
        var r = window.location.search.substr(1).match(reg);
        var treeObj = $.fn.zTree.getZTreeObj("tree"),
                nodes = treeObj.getCheckedNodes(true),
                ids = "";
        for (var i = 0; i < nodes.length; i++) {
            ids += nodes[i].id + ",";

        }
       var postdata={
            rolenum:r[2],
            actionnum:ids
        }
        $.ajax({
            type:"POST",
            url:"<%=basePath%>RoleController/EditAction",
            async:false,
            data:postdata,
            success:function(data){
                window.location.href="pfrole.jsp";
            }
        });

    }

//    function getQueryString(name) {
//        var reg = new RegExp("(^|&)=([^&]*)(&|$)", "i");
//        var r = window.location.search.substr(1).match(reg);
//        if (r != null) return unescape(r[2]);
//        return null;
//    }



</script>

</body>
</html>
