<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/4/7
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<% pageContext.setAttribute("path", request.getContextPath()); %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>人事管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="pageName" content="rsgl" />
    <!-- 先引入 jquery -->
    <script src="<%=basePath %>js/jquery-3.3.1.js"></script>
    <!-- 再引入 Bootstrap -->
    <link href="<%=basePath %>css/bootstrap.css" rel="stylesheet">
    <!-- 再引入 easyUI -->
    <script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
    <!-- 页面JS -->
    <script type="text/javascript">
        var gobal="";
        $(document).ready(function () {
            $(".personnel_title_btn").click(function(){
                $(this).parent().siblings().children().removeClass("personnel_title_btn_sel");
                $(this).addClass("personnel_title_btn_sel");
                if($(this).attr("name")=="jg"||$(this).attr("name")=="pcs"||$(this).attr("name")=="mj"){
                    $("#personnel_add").show();
                    $("#personnel_add").html("新增"+$(this).html());
                    insertHtml($(this).attr("name"));
                    $('.window').hide();
                    init();
                }else {
                    $("#personnel_add").hide();
                }
            });
            $('#dg').datagrid({
                title: "人事管理",
                url: '',//json数据
                singleSelect: true,
                pagination: true,
                striped: true,
                columns: [[
                    {field: 'ID', title: '所在单位', width: 80, align: 'center'},
                    {field: 'title', title: '名称', width: 760, align: 'center'},
                    {field: 'operation', title: '操作', width: 190, align: 'center'}
                ]],
                data: [
                    {
                        ID: '机关',
                        sort: '1',
                        title: '纪委',
                        operation: '<button class="btn btn-primary" onclick="edit()">编辑</button><button class="btn btn-danger">删除</button>'
                    },
                    {
                        ID: '机关',
                        sort: '2',
                        title: '督察',
                        operation: '<button class="btn btn-primary">编辑</button><button class="btn btn-danger">删除</button>'
                    },
                    {
                        ID: '机关',
                        sort: '3',
                        title: '纪委督察',
                        operation: '<button  class="btn btn-primary">编辑</button><button class="btn btn-danger">删除</button>'
                    },
                    {
                        ID: '机关',
                        sort: '4',
                        title: '纪委督察',
                        operation: '<button class="btn btn-primary">编辑</button><button class="btn btn-danger">删除</button>'
                    },
                    {
                        ID: '民警',
                        sort: '5',
                        title: '薇薇安',
                        operation: '<button class="btn btn-info">调出</button><button class="btn btn-danger">删除</button>'
                    },
                    {
                        ID: '未安排民警',
                        sort: '6',
                        title: '莉莉安',
                        operation: '<button class="btn btn-success">调入</button>'
                    }
                ]

            });
        });
        function toAdd(action) {
            window.open('${path}/user/checktemp?action=xzbm');
        }
        function titleInit(type) {
            if(type=="dw"){
                var content="[ {field: 'ID', title: '类型', width: 80, align: 'center'},\n" +
                    "                    {field: 'sort', title: '序号', width: 100, align: 'center'},\n" +
                    "                    {field: 'title', title: '名称', width: 760, align: 'center'},\n" +
                    "                    {field: 'operation', title: '操作', width: 190, align: 'center'}]"
            }else{
                var content="[ {field: 'ID', title: '所在单位', width: 80, align: 'center'},\n" +
                    "                    {field: 'title', title: '名称', width: 760, align: 'center'},\n" +
                    "                    {field: 'operation', title: '操作', width: 190, align: 'center'}]"
            }
            return content;
        }
        function insertHtml(type) {
            if(type=="jg"||type=="pcs"){
                var content="<div class=\"fitem\">\n" +
                    "                <label>部门类型：</label>\n" +
                    "                <input id=\"txt_itemno\" style=\"\" class=\"easyui-textbox\" editable=\"false\" />\n" +
                    "            </div>\n" +
                    "            <div class=\"fitem\">\n" +
                    "                <label>部门名称：</label>\n" +
                    "                <input id=\"txt_categoryname\" class=\"easyui-textbox\" editable=\"false\" />\n" +
                    "            </div>\n" +
                    "            <div class=\"fitem\">\n" +
                    "                <label>排序：</label>\n" +
                    "                <input id=\"txt_itemname\" class=\"easyui-textbox\" editable=\"false\" />\n" +
                    "            </div>\n" +
                    "            <div class=\"fitem fitem_flex\">\n" +
                    "                <label>考察类型：</label>\n" +
                    "                <div class=\"switch_total\">\n" +
                    "                    <div class=\"Add_personnel_switch Add_personnel_switch_left Add_personnel_switch_sel\">主考</div>\n" +
                    "                    <div class=\"Add_personnel_switch Add_personnel_switch_right\">被考</div>\n" +
                    "                </div>\n" +
                    "            </div>\n" +
                    "            <div class=\"fitem\">\n" +
                    "                <label>密码：</label>\n" +
                    "                <input id=\"txt_positionid\" class=\"easyui-textbox\" editable=\"false\" />\n" +
                    "            </div>\n" +
                    "            <div class=\"fitem\">\n" +
                    "                <label>确认密码：</label>\n" +
                    "                <input id=\"txt_number\" class=\"easyui-textbox\"  />\n" +
                    "            </div>\n" +
                    "            <div id=\"dlg-buttons\" class=\"row\" style=\"display: block\">\n" +
                    "                <div class=\"col-md-6 text-right\"><div class=\"btn btn-default\">重置</div></div>\n" +
                    "                <div class=\"col-md-6 text-left\"><div class=\"btn btn-warning\">确认</div></div>\n" +
                    "            </div>";
                $("#win").css("height","400px")
            }else if(type=="mj"){
                var content="<div class=\"fitem\">\n" +
                    "                <label>民警姓名：</label>\n" +
                    "                <input id=\"txt_item_mc\" style=\"\" class=\"easyui-textbox\" editable=\"false\" />\n" +
                    "            </div>\n" +
                    "            <div class=\"fitem\">\n" +
                    "                <label>部门名称：</label>\n" +
                    "                <input id=\"txt_item_depart\" class=\"easyui-textbox\" editable=\"false\" />\n" +
                    "            </div>\n" +
                    "            <div id=\"dlg-buttons-1\" class=\"row\" style=\"display: block\">\n" +
                    "                <div class=\"col-md-6 text-right\"><div class=\"btn btn-default\">重置</div></div>\n" +
                    "                <div class=\"col-md-6 text-left\"><div class=\"btn btn-warning\">确认</div></div>\n" +
                    "            </div>";
                $("#win").css("height","200px")
            }
            $("#fm").html(content);
        }
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
    <!-- 页面样式 -->
    <style>
        .personnel_title_btn{
            width: 150px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            border: 1px solid black;
            border-radius: 4px;
            font-size: 14px;
        }
        .personnel_title_btn_sel{
            color: white;
            background-color: #f0ad4e;
            border: 0px;
        }
        .personnel_title{
            margin-top: 15px;
        }
        .my_data_grid{
            width: 100%;
            height: 90%;
            padding-top: 30px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .personnel_row{
            width: 100%;
        }
        .col-md-3 div{
            margin:0 auto;
        }
        .my_data_grid .btn{
            margin-right: 3px;
        }
        #personnel_add{
            margin-right: 0px;
            border-top-right-radius: 0;
            border-top-left-radius: 0;
        }
    </style>
</head>
<body>
<c:import url="../common/common.jsp"></c:import>
    <div class="container personnel">
        <div class="row personnel_row">
            <div class="row personnel_title">
                <div class="col-md-2">
                    <div class="personnel_title_btn personnel_title_btn_sel" name="jg">机关</div>
                </div>
                <div class="col-md-2">
                    <div class="personnel_title_btn" name="pcs">派出所</div>
                </div>
                <div class="col-md-2">
                    <div class="personnel_title_btn" name="mj">民警</div>
                </div>
                <div class="col-md-2">
                    <div class="personnel_title_btn" name="wapmj">未安排民警</div>
                </div>
            </div>
            <div class="my_data_grid">
                <table id="dg" class="easyui-datagrid" style="width:100%;height:100%"
                       data-options="method:'get'">
                </table>
                <div id="personnel_add" class="btn btn-info pull-right" onclick="$('.window').show()">新增部门</div>
            </div>
        </div>
    </div>
    <div id="win" class="easyui-dialog" title="新增"  style="width: 400px; padding: 10px 20px; height: 410px;"
         closed="true" buttons="#dlg-buttons">
        <form id="fm" method="post" style="margin-top: 20px; margin-left: 20px;">
        </form>
    </div>
</body>
<style>
    .panel-body{
        padding: 0;
    }
    .panel{
        margin-bottom: 0;
        border-radius: 0;
    }
    .personnel{
        border: 1px solid #cccccc;
        height: 75%;
        padding: 0px;
        padding-top: 15px;
    }

    #fm {}
    .fitem_flex{
        display: flex;
    }
    .ftitle {
        font-size: 14px;
        font-weight: bold;
        padding: 5px 0;
        margin-bottom: 10px;
        border-bottom: 1px solid #ccc;
    }
    .fitem {
        margin-bottom: 10px;
    }
    .fitem label {
        display: inline-block;
        text-align: right;
        width: 80px;
        font-size: 13px;
        padding-right: 10px;
        line-height: 30px;
    }
    .fitem input {
        width: 160px;
    }
    .switch_total{
        margin-left: 5px;
        width: 160px;
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