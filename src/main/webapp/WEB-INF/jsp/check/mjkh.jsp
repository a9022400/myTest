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
    <title>民警录入</title>
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
        $(function(){
            $('#dg').edatagrid({
                url:'<%=basePath %>js/datagrid_dwkh.json',
                width:1100,
                title:"（石塘所）"+"民警考核输入",
                columns:[[
                    {field:'name',title:'姓名',width: 500,align:"center"},
                    {field:'score',title:'分数',width: 595,align:"center",editor:{type:'numberbox',options:{precision:2}}}
                ]],
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
            margin-top: 15px;
        }
    </style>
</head>
<body class="" onclick="saveCheck()">
<c:import url="../common/common.jsp"></c:import>
    <div class="container check_page">
        <div class="check_page_top">
        </div>
        <div class="check_page_middle">
            <table id="dg" style="height: 100%;margin: 0px auto" singleSelect="true">
            </table>
        </div>
        <div class="check_page_bottom text-center">
            <a href="#" class="btn btn-lg btn-warning" onclick="javascript:$('#dg').edatagrid('saveRow')">提交</a>
        </div>
    </div>
</body>
<style>
    .panel-body{
        padding: 0;
    }
</style>