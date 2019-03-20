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
<% String appPath = request.getContextPath(); %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>考核网首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="pageName" content="xwgl"/>
    <!-- 先引入 jquery -->
    <script src="<%=basePath %>js/jquery-3.3.1.js"></script>
    <!-- 再引入 easyUI -->
    <script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
    <!-- 页面JS -->
    <script type="text/javascript">
        $(document).ready(function () {
            init();
            $('#dg').datagrid({
                title: "全部新闻",
                url: '',//json数据
                singleSelect: true,
                pagination: true,
                striped: true,
                columns: [[
                    {field: 'ID', title: '序号', width: 80, align: 'center'},
                    {field: 'sort', title: '类型', width: 100, align: 'center'},
                    {field: 'title', title: '标题', width: 770, align: 'center'},
                    {field: 'operation', title: '操作', width: 150, align: 'center'}
                ]],
                data: [
                    {
                        ID: '001',
                        sort: '表彰区',
                        title: '2019年首季公司进度统计表（一月份）',
                        operation: '<button class="btn btn-primary">编辑</button><button class="btn btn-danger">删除</button>'
                    },
                    {
                        ID: '002',
                        sort: '表彰区',
                        title: '2019年首季公司进度统计表（一月份）',
                        operation: '<button class="btn btn-primary">编辑</button><button class="btn btn-danger">删除</button>'
                    },
                    {
                        ID: '003',
                        sort: '表彰区',
                        title: '2019年首季公司进度统计表（一月份）',
                        operation: '<button  class="btn btn-primary">编辑</button><button class="btn btn-danger">删除</button>'
                    },
                    {
                        ID: '004',
                        sort: '表彰区',
                        title: '2019年首季公司进度统计表（一月份）',
                        operation: '<button class="btn btn-primary">编辑</button><button class="btn btn-danger">删除</button>'
                    },
                    {
                        ID: '005',
                        sort: '表彰区',
                        title: '2019年首季公司进度统计表（一月份）',
                        operation: '<button class="btn btn-primary">编辑</button><button class="btn btn-danger">删除</button>'
                    }
                ],
                onDblClickRow: function (index, row) {
                    window.open('${path}/user/checktemp?action=xwxq');
                }
            });

            $(".news_title_btn").click(function () {
                $(this).parent().siblings().children().removeClass("news_title_btn_sel");
                $(this).addClass("news_title_btn_sel");
            });
            //
        });

        function init() {
            $("#xw_datebox_s").datebox({
                width:120
            });
            $("#xw_datebox_e").datebox({
                width:120,
                onChange:function (newDate, oldDate) {
                    if($("#xw_datebox_s").datebox('getValue')!=""){
                        edate=dateFormatter(newDate);
                        sdate=dateFormatter($("#xw_datebox_s").datebox('getValue'));
                        if(edate<sdate){
                            $('#xw_datebox_e').datebox('setValue',oldDate);
                            $.messager.alert('提示','截止年月不得早于开始年月');
                        }else{
                        }
                    }
                }
            });
            $('#xw_combobox_title').textbox({
                width:200,
                valueField:'id',
                textField:'text'
            });
            $('#xw_combobox_type').combobox({
                width:120,
                valueField:'id',
                textField:'text',
                editable:false,
                panelHeight:'auto',
                panelMaxHeight:'200',
                data: [{
                    id: '001',
                    text: '纪委'
                },{
                    id: '002',
                    text: '督察'
                },{
                    id: '003',
                    text: '考核办'
                }]
            });
            $('#xw_combobox_department').combobox({
                width:160,
                valueField:'id',
                textField:'text',
                editable:false,
                panelHeight:'auto',
                panelMaxHeight:'200',
                data: [{
                    id: '001',
                    text: '纪委'
                },{
                    id: '002',
                    text: '督察'
                },{
                    id: '003',
                    text: '考核办'
                }]
            });
        }

        function dateFormatter(date) {
            /*var year = date.getFullYear();
            var month = (Array(2).join('0') + (date.getMonth()+1)).slice(-2);
            var day = date.getDate();
            return  year + month + day;*/
            date=date.replace(new RegExp(/\//g),"-");
            var year=date.substring(6,10);
            var month=date.substring(0,2);
            var day=date.substring(3,5);
            return year+month+day;
        }
    </script>
    <!-- 页面样式 -->
    <style>
        .main_model_middle li {
            font-family: "微软雅黑", serif;
            font-size: 15px;
            font-weight: lighter;
            cursor: pointer;
            margin-top: 4px;
        }

        .main_model_middle label {
            float: right !important;
            margin-bottom: 0px;
            font-weight: lighter;
        }

        .news_title_btn {
            width: 150px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            border: 1px solid black;
            border-radius: 4px;
            font-size: 14px;
        }

        .news_title_btn_sel {
            color: white;
            background-color: #f0ad4e;
            border: 0px;
        }

        .news_title {
            padding-left: 15px;
            margin-top: 15px;
        }

        .my_data_grid {
            width: 100%;
            height: 80%;
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 20px;
        }

        .my_data_grid .panel-body {
            padding: 0;
            margin: 0;
        }

        .my_data_grid .panel {
            margin-bottom: 0;
            border-radius: 0;
        }

        .my_data_grid .news_add {
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
        .news_title span{
            font-size: 15px;
        }
        .news_title .btn{
            margin-right: 3px;
            margin-left: 10px;
            width: 110px;
        }
        .my_data_grid .btn{
            margin-right: 3px;
        }
    </style>
</head>
<body>
<c:import url="../common/common.jsp"></c:import>
<div class="container news_total">
    <div class="row news_title">
        <div class="col-md-4">
            <span>发布日期:</span>
            <input id="xw_datebox_s"><span>至</span><input id="xw_datebox_e">
        </div>
        <div class="col-md-3">
            <span>标题:</span>
            <input id="xw_combobox_title">
        </div>
        <div class="col-md-2">
            <span>类型:</span>
            <input id="xw_combobox_type">
        </div>
        <div class="col-md-3">
            <span>发布单位:</span>
            <input id="xw_combobox_department">
        </div>
    </div>
    <div class="row news_title">
        <div class="col-md-3 col-md-offset-9">
            <div class="btn btn-default pull-left">重置</div>
            <div class="btn btn-warning">查询</div>
        </div>
    </div>
    <div class="my_data_grid">
        <table id="dg" class="easyui-datagrid" style="width:100%;height:100%;"
               data-options="method:'get'">
        </table>
    </div>
    <div class="news_add btn btn-info pull-right">新闻发布</div>
</div>
</body>

<style>
    .panel-body {
        padding: 0;
    }
    .news_total {
        margin-top: 10px;
        border: 1px solid #cccccc;
        height: 76%;
        padding: 0px;
    }
    .news_add{
        margin-right: 15px;
        margin-top: -1px;
        border-top-right-radius: 0;
        border-top-left-radius: 0;
    }
</style>