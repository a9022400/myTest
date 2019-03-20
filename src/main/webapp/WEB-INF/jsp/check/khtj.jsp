<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/4/7
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
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
    <title>考核统计</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="pageName" content="khtj" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/easyui.css">
    <script type="text/javascript" src="<%=basePath %>/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery.easyui.min.js"></script>

    <script type="text/javascript" src="<%=basePath %>js/jquery.edatagrid.js"></script>

    <!-- 再引入 easyUI -->

    <!-- 页面JS -->
    <script type="text/javascript">
        $(function(){
            init();
            $('#dg').edatagrid({
                url:'<%=basePath %>js/datagrid_dwkh.json',
                width:1135,
                title:"考核统计",
                frozenColumns: [[
                    {field:'name',title:'主考单位/被考单位',width: 80,align:'center'}
                ]],
                columns:[
                    [
                        {field:'name1',title:'纪委',"colspan":2,align:"center"},
                        {field:'name2',title:'督察',"colspan":2,align:"center"},
                        {field:'name3',title:'督察1',"colspan":2,align:"center"},
                        {field:'name4',title:'督察2',"colspan":2,align:"center"},
                        {field:'name4',title:'督察3',"colspan":2,align:"center"},
                        {field:'name4',title:'督察4',"colspan":2,align:"center"},
                        {field:'name4',title:'督察5',"colspan":2,align:"center"},
                        {field:'name4',title:'督察6',"colspan":2,align:"center"},
                        {field:'name4',title:'督察7',"colspan":2,align:"center"},
                        {field:'name4',title:'督察8',"colspan":2,align:"center"},
                        {field:'name4',title:'督察9',"colspan":2,align:"center"},
                        {field:'name4',title:'督察10',"colspan":2,align:"center"},
                        {field:'name4',title:'督察11',"colspan":2,align:"center"},
                        {field:'name4',title:'督察12',"colspan":2,align:"center"},
                        {field:'name4',title:'督察13',"colspan":2,align:"center"},
                        {field:'name4',title:'督察14',"colspan":2,align:"center"},
                        {field:'name4',title:'督察15',"colspan":2,align:"center"},
                        {field:'name4',title:'督察16',"colspan":2,align:"center"},
                        {field:'name4',title:'督察17',"colspan":2,align:"center"},
                        {field:'name4',title:'总计',"colspan":2,align:"center"},
                    ],
                    [
                        {field:'score11',title:'加分',"rowspan":1,align:"center"},
                        {field:'score12',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score21',title:'加分',"rowspan":1,align:"center"},
                        {field:'score22',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score31',title:'加分',"rowspan":1,align:"center"},
                        {field:'score32',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score41',title:'加分',"rowspan":1,align:"center"},
                        {field:'score42',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score51',title:'加分',"rowspan":1,align:"center"},
                        {field:'score52',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score61',title:'加分',"rowspan":1,align:"center"},
                        {field:'score62',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score71',title:'加分',"rowspan":1,align:"center"},
                        {field:'score72',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score81',title:'加分',"rowspan":1,align:"center"},
                        {field:'score82',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score91',title:'加分',"rowspan":1,align:"center"},
                        {field:'score92',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score101',title:'加分',"rowspan":1,align:"center"},
                        {field:'score102',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score111',title:'加分',"rowspan":1,align:"center"},
                        {field:'score112',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score121',title:'加分',"rowspan":1,align:"center"},
                        {field:'score122',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score131',title:'加分',"rowspan":1,align:"center"},
                        {field:'score132',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score141',title:'加分',"rowspan":1,align:"center"},
                        {field:'score142',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score151',title:'加分',"rowspan":1,align:"center"},
                        {field:'score152',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score161',title:'加分',"rowspan":1,align:"center"},
                        {field:'score162',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score171',title:'加分',"rowspan":1,align:"center"},
                        {field:'score172',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score181',title:'加分',"rowspan":1,align:"center"},
                        {field:'score182',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score191',title:'加分',"rowspan":1,align:"center"},
                        {field:'score192',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                        {field:'score201',title:'加分',"rowspan":1,align:"center"},
                        {field:'score202',title:'减分',styler:function () {return 'color:red'},"rowspan":1,align:"center"},
                     ]
                ],
                onBeforeSave:function () {
                },
                onLoadSuccess:function(){
                }
            });

        });
        window.onload=function(){
        };
        $(document).ready(function () {
        });
        function init() {
            $("#xw_datebox_s").datebox({
                width:140
            });
            $("#xw_datebox_e").datebox({
                width:140,
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
            $('#xw_combobox_zhukao').combobox({
                width:180,
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
            $('#xw_combobox_depart_type').combobox({
                width:140,
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
            $('#xw_combobox_beikao').combobox({
                width:180,
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
            $('#xw_combobox_kaohe_type').combobox({
                width:140,
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
    </script>
    <!-- 页面样式 -->
    <style>
        .checkCount_page{
            width: 100%;
            height: 1000px;
            padding: 20px 0px;
            border: 1px solid #cccccc;
        }
        .checkCount_condition{
            margin-bottom: 5px;
        }
        .check_page_middle{
            width: 100%;
            height: 85%;
            margin: 0px auto ;
            margin-top: 30px;
        }
        .check_page_middle .panel-body{
            padding: 0;
            margin: 0;
        }
        .check_page_middle .panel{
            width: 100%;
            height: 100%;
            margin: 0px auto;
            border-radius: 0;
        }
        .check_page_bottom{
            margin-top: 15px;
        }
        .checkCount_row{
            padding-bottom: 5px;
        }
    </style>
</head>
<body>
<c:import url="../common/common.jsp"></c:import>
    <div class="container checkCount_page">
        <div class="row checkCount_condition">
            <div class="row col-md-11">
                <div class="row checkCount_row">
                    <div class="col-md-4">
                        <span>主考单位:</span>
                        <input id="xw_combobox_zhukao">
                    </div>
                    <div class="col-md-3">
                        <span>部门类型:</span>
                        <input id="xw_combobox_depart_type">
                    </div>
                    <div class="col-md-5">
                        <span>考核日期:</span>
                        <input id="xw_datebox_s"><span>至</span><input id="xw_datebox_e">
                    </div>
                </div>
                <div class="row checkCount_row">
                    <div class="col-md-4">
                        <span>被考单位:</span>
                        <input id="xw_combobox_beikao">
                    </div>
                    <div class="col-md-3">
                        <span>考核类型:</span>
                        <input id="xw_combobox_kaohe_type">
                    </div>
                </div>
            </div>
            <div class="col-md-1">
                <div class="btn btn-lg btn-info pull-right">查询</div>
            </div>
        </div>
        <div class="check_page_middle">
            <table id="dg" style="width:100%;height: 100%;margin: 0px auto" singleSelect="true">
            </table>
        </div>
        <!--<div class="news_add btn btn-info pull-right" onclick="javascript:window.print()">打印</div>-->
    </div>
</body>
<style>
    .panel-body{
        padding: 0;
    }
    .news_add{
        margin-right: 16.5px;
        margin-top: -1px;
        border-top-right-radius: 0;
        border-top-left-radius: 0;
    }
    .btn-lg{
        font-size: 36px;
    }

</style>