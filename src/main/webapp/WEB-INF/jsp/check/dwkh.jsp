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
    <title>考核网首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="pageName" content="khlr" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/easyui.css">
    <script type="text/javascript" src="<%=basePath %>/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jquery.easyui.min.js"></script>

    <script type="text/javascript" src="<%=basePath %>js/jquery.edatagrid.js"></script>

    <!-- 再引入 easyUI -->

    <!-- 页面JS -->
    <script type="text/javascript">
        var baseScore=10;
        var maxAddScore=10;
        var maxsubScore=10;

        $(function(){
            $.extend($.fn.datagrid.defaults.editors, {
                textarea: {//textarea就是你要自定义editor的名称
                    init: function(container, options){
                        textareaWin = undefined;
                        var me = this;
                        var cur = $('<input id="inputID" onclick="function" style="width: 100%; height: 31px;"/>');

                        $('<div id="win"><textarea rows="9" cols="43" id="textareaID" class="datagrid-editable-input"></textarea></div>').appendTo($("body"));
                        var editor = cur.appendTo(container);
                        $(cur).focus(function (){
                            if(!textareaWin){
                                $("#textareaID").val($("#inputID").val());
                                textareaWin = $('#win').dialog({
                                    title:'理由输入',
                                    width:355,
                                    height:273,
                                    closable:false,
                                    resizable:false,
                                    closed: false,
                                    collapsible:false,
                                    maximizable:false,
                                    minimizable:false,
                                    modal:true,
                                    buttons:[{
                                        text:'保存',
                                        iconCls:'icon-add',
                                        handler:function(){
                                            var textVal = $("#textareaID").val();

                                            $("#inputID").val(textVal);

                                            textareaWin.window('close');
                                            textareaWin = undefined;
                                        }
                                    },{
                                        iconCls:'icon-reject',
                                        text:'取消',
                                        handler:function(){
                                            $.messager.confirm('【提示信息】', '是否确认退出编辑？',function(r){
                                                if (r){
                                                    textareaWin.window('close');
                                                    textareaWin = undefined;
                                                }
                                            });

                                        }
                                    }]
                                });
                            }
                        });
                        console.log("init method invoke!");
                        editor.enableEdit = false;
                        return editor;
                    },
                    getValue: function(target){
                        return $(target).val();
                    },
                    setValue: function(target, value){
                        $(target).val(value);
                    },
                    resize: function(target, width){
                        console.log("resize method invoke!");
                    },
                    destroy: function(target){
                        console.log("destroy method invoke!");
                        textareaWin = undefined;
                    }
                }
            });
            $('#dg').edatagrid({
                url:'<%=basePath %>js/datagrid_dwkh.json',
                width:1100,
                title:"单位考核输入",
                columns:[[
                    {field:'department',title:'部门',width:100,align:"center"},
                    {field:'reason',title:'理由',width:638,align:"left",halign:"center",editor:{type:'textarea'}},
                    {field:'addScore',title:'加分(上限10分)',width:100,align:"center",editor:{type:'numberbox',options:{precision:2,max:maxAddScore}},
                        styler: function(value,row,index){
                            return 'color:black;';
                        },
                        formatter: function(value, row, index) {
                            var content='';
                            if(value==null || value==''){
                                content =  0.00;
                            }else{
                                //easyui-tooltip
                                content = '<span title="提示：加分上限是：'+maxAddScore+'" class="">'+value+'</span>';
                            }
                            return content;
                            /*var content='';
                            if (value>maxAddScore) {
                                value=parseFloat(maxAddScore);
                                row.addScore=parseFloat(maxAddScore);
                                content = '<span title="提示：加分上限是：'+maxAddScore+'" class="easyui-tooltip">'+value+'</span>';
                            }else {
                                content = value;
                            }
                            return content;*/
                        }
                    },
                    {field:'subScore',title:'减分(上限10分)',width:100,align:"center",editor:{type:'numberbox',options:{precision:2,max:maxsubScore}},
                        styler: function(value,row,index){
                            return 'color:red;';
                        },
                        formatter: function(value, row, index) {
                            var content='';
                            if(value==null || value==''){
                                content = 0.00;
                            }else{
                                content = '<span title="提示：加分上限是：'+maxsubScore+'" class="">'+value+'</span>';
                            }
                            return content;
                            /*if (value>maxsubScore) {
                                value=parseFloat(maxsubScore);
                                row.subScore=parseFloat(maxsubScore);
                            }else {
                                content = value;
                            }*/
                        }
                    },
                    {field:'baseScore',title:'基本分',width:60,align:"center"},
                    {field:'totalScore',title:'总分',width:100,align:"center",
                        formatter: function(value,row,index){
                            if(row.addScore!=null && row.addScore!='' && row.subScore!=null && row.subScore!='' ){
                                return (parseFloat(row.addScore)-parseFloat(row.subScore)+parseFloat(row.baseScore)).toFixed(2);
                            }else if(row.addScore!=null && row.addScore!='' && (row.subScore==null || row.subScore=='') ){
                                return (parseFloat(row.addScore)+parseFloat(row.baseScore)).toFixed(2);
                            }else if((row.addScore==null || row.addScore=='') && (row.subScore!=null && row.subScore!='') ){
                                return (0-parseFloat(row.subScore)+parseFloat(row.baseScore)).toFixed(2);
                            }else{
                                return (parseFloat(row.baseScore)).toFixed(2);
                            }
                        }
                    }
                ]],
                onBeforeSave:function () {
                    $(".easyui-tooltip").tooltip({
                        onShow: function () {
                            $(this).tooltip('tip').css({
                                borderColor: '#000'
                            });
                        }
                    });
                },
                onLoadSuccess:function(){
                }
            });

        });
        function fn_gridBindBlur(grig, index, field){
            var ed = grig.datagrid("getEditor", {index: index, field: field});// 获取编辑器
            if(ed){
                // 编辑器存在，绑定blur事件，结束编辑模式
                $(ed.target).bind("blur", function(e){
                    grig.datagrid("endEdit", index);
                });
            }
            return ed;
        }
        window.onload=function(){
            $('#zkdw').combobox({
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
            $('#khlx').combobox({
                valueField:'id',
                textField:'text',
                editable:false,
                panelHeight:'auto',
                panelMaxHeight:'200',
                data: [{
                    id: '月考',
                    text: '月考'
                },{
                    id: '季考',
                    text: '季考'
                },{
                    id: '半年考',
                    text: '半年考'
                },{
                    id: '年考',
                    text: '年考'
                }],
                onSelect: function(rec){
                    var type = rec.id;
                    var date = [];//创建月份数组
                    var thisMonth=new Date().getUTCMonth()+1;//当前月
                    if(type=="月考"){
                        var startMonth=1;//起始月份
                        for(;startMonth<=12;startMonth++){
                            date.push({"date":startMonth+"月"});
                        }
                        $("#khyf").combobox("setValue",thisMonth+"月");//设置默认值为今年
                    }else if(type=="季考"){
                        var startSeason=1;//起始月份
                        var season=parseInt(thisMonth/4+1);
                        //数组添加值（2012-2016）//根据情况自己修改
                        for(;startSeason<=4;startSeason++){
                            date.push({"date":"第"+startSeason+"季度"});
                        }
                        $("#khyf").combobox("setValue","第"+season+"季度");//设置默认值为今年
                    }else if(type=="半年考"){
                        var halfYear=parseInt(thisMonth/6+1);
                        date.push({"date":"上半年"});
                        date.push({"date":"下半年"});
                        $("#khyf").combobox("setValue",(halfYear<7)?"上半年":"下半年");//设置默认值为今年
                    }else if(type=="年考"){
                        date.push({"date":"全年"});
                        $("#khyf").combobox("setValue","全年");//设置默认值为今年
                    }
                    $("#khyf").combobox("loadData",date);//下拉框加载数据
                }
            });
            $('#khnf').combobox({
                width:80,
                valueField:'year',
                textField:'year',
                editable:false,
                panelHeight:'auto',
                panelMaxHeight:'200'
            });
            var year = [];//创建年度数组
            var startYear;//起始年份
            var thisYear=new Date().getUTCFullYear();//今年
            var endYear=thisYear+1;//结束年份
            for(startYear=endYear;startYear+10>endYear;startYear--){
                year.push({"year":startYear+"年"});
            }
            $("#khnf").combobox("loadData",year);//下拉框加载数据
            $("#khnf").combobox("setValue",thisYear+"年");//设置默认值为今年

            $('#khyf').combobox({
                width:90,
                valueField:'date',
                textField:'date',
                editable:false,
                panelHeight:'auto',
                panelMaxHeight:'200'
            });

            $('#khtm').combobox({
                valueField:'id',
                textField:'text',
                editable:false,
                panelHeight:'auto',
                panelMaxHeight:'200',
                data: [{
                    id: '001',
                    text: '001阿斯蒂芬的'
                },{
                    id: '002',
                    text: '002电动蝶阀v'
                },{
                    id: '003',
                    text: '003闪电风暴表'
                }]
            });
        };
        $(document).ready(function () {
            /*var tmp=$('#dg').datagrid('options');
            //$('#dg').datagrid('options').columns[0][2].editor.options.max=10;
            console.log(tmp);*/
        });
        function saveCheck() {
            javascript:$('#dg').edatagrid('saveRow')
        }
    </script>
    <!-- 页面样式 -->
    <style>
        .check_page{
            width: 100%;
            height: 1000px;
            padding: 20px 0px;
        }
        .check_page_top_condition{
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
            margin-top: 5px;
        }
    </style>
</head>
<body onclick="">
<c:import url="../common/common.jsp"></c:import>
    <div class="container check_page">
        <div class="check_page_top">
            <div class="row check_page_top_condition">
                <div class="col-lg-3">
                    <span class="pull-right">
                        主考单位：<input id="zkdw">
                    </span>
                </div>
                <div class="col-lg-3">
                    <span class="pull-right">
                        考核类型：<input id="khlx">
                    </span>
                </div>
                <div class="col-lg-3">
                    <span class="pull-right">
                        考核时间：<input id="khnf"><input id="khyf">
                    </span>
                </div>
                <div class="col-lg-3">
                    <span class="pull-right">
                        附件：<input class="easyui-filebox">
                    </span>
                </div>
            </div>
            <div class="row check_page_top_condition">
                <div class="col-lg-3">
                    <span class="pull-right">
                        考核条目：<input id="khtm">
                    </span>
                </div>
                <div class="col-lg-3">
                    <span class="pull-right">
                        考核人：<input id="khr" class="easyui-textbox">
                    </span>
                </div>
                <div class="col-lg-3">
                    <span class="pull-right">
                        审核人：<input id="shr" class="easyui-textbox">
                    </span>
                </div>
            </div>
        </div>
        <div class="check_page_middle">
            <table id="dg" style="height: 100%;margin: 0px auto" singleSelect="true">
            </table>
        </div>
        <div class="check_page_bottom text-center">
            <a href="#" class="btn btn-warning" onclick="javascript:$('#dg').edatagrid('saveRow')">提交</a>
        </div>
    </div>
</body>
<style>
    .panel-body{
        padding: 0;
    }
</style>