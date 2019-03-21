<%--
  Created by IntelliJ IDEA.
  User: smz
  Date: 2019/3/21
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>新增部门</title>
    <meta name="pageName" content="1111" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/easyui.css">
    <script type="text/javascript" src="<%=basePath %>/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery.easyui.min.js"></script>
    <script>
        $(function(){
            init();
        });
        function init(){
            $('#xw_combobox_bmlx').combobox({
                width:80,
                valueField:'id',
                textField:'text',
                editable:false,
                panelHeight:'auto',
                panelMaxHeight:'200',
                data: [{
                    id: '1',
                    text: '机关'
                },{
                    id: '2',
                    text: '派出所'
                }]
            });
            $('#xw_combobox_bmmc').textbox({
                width:200,
                valueField:'id',
                textField:'text'
            });
            $('#xw_combobox_px').textbox({
                width:80,
                valueField:'id',
                textField:'text'
            });
            $('.Add_personnel_switch').click(function () {
                $('.Add_personnel_switch').removeClass("Add_personnel_switch_sel");
                $(this).addClass("Add_personnel_switch_sel");
            })
            $('#xw_combobox_mm1').textbox({
                width:200,
                valueField:'id',
                textField:'text'
            });
            $('#xw_combobox_mm2').textbox({
                width:200,
                valueField:'id',
                textField:'text'
            });
        }
    </script>
</head>
<style>
    .Add_personnel .row{
        margin-bottom: 25px;
    }
    .switch_total{
        width: 200px;
        background-color: white;
        border-radius: 5px;
        text-align: center;
        display: flex;
        justify-content: flex-start;
    }
    .switch_total div{
        width: 50%;
        height: 30px;
        background-color: #fff;
        align-items: center;
        line-height: 30px;
        cursor:pointer;
    }
    .Add_personnel_switch_left{
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        border: 1px solid #ccc;
    }
    .Add_personnel_switch_right{
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        border: 1px solid #ccc;
    }
    .Add_personnel_switch_sel{
        background-color: #46B8DA!important;
        color: white;
        border: 0;
    }
</style>
<body>
<c:import url="../common/common.jsp"></c:import>
    <div class="container Add_personnel">
        <div class="row">
            <div class="col-md-6 text-right">部门类型：</div>
            <div class="col-md-6"><div id="xw_combobox_bmlx"></div></div>
        </div>
        <div class="row">
            <div class="col-md-6 text-right">部门名称：</div>
            <div class="col-md-6"><div id="xw_combobox_bmmc"></div></div>
        </div>
        <div class="row">
            <div class="col-md-6 text-right">排序：</div>
            <div class="col-md-6"><div id="xw_combobox_px"></div></div>
        </div>
        <div class="row">
            <div class="col-md-6 text-right">考察类型：</div>
            <div class="col-md-6">
                <div class="switch_total">
                    <div class="Add_personnel_switch Add_personnel_switch_left Add_personnel_switch_sel">主考</div>
                    <div class="Add_personnel_switch Add_personnel_switch_right">被考</div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 text-right">密码：</div>
            <div class="col-md-6"><div id="xw_combobox_mm1"></div></div>
        </div>
        <div class="row">
            <div class="col-md-6 text-right">密码：</div>
            <div class="col-md-6"><div id="xw_combobox_mm2"></div></div>
        </div>
        <div class="row">
            <div class="col-md-6 text-right"><div class="btn btn-default">重置</div></div>
            <div class="col-md-6"><div class="btn btn-warning">确认</div></div>
        </div>
    </div>
</body>
</html>
<style>
    .Add_personnel{
        height: 1000px;
        border: 1px solid #cccccc;
        padding-top: 200px;
        font-size: 26px;
    }
    .panel-body{
        padding: 0;
    }
    .Add_personnel .btn{
        font-size: 26px;
    }
</style>
