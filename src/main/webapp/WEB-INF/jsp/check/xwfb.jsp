<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/4/7
  Time: 16:45
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
    <title>考核网首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="pageName" content="xwfb" />
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
        window.onload=function(){
            $('#cc').combobox({
                valueField:'id',
                textField:'text',
                data:[{
                    "id":1,
                    "text":"text1"
                },{
                    "id":2,
                    "text":"text2"
                },{
                    "id":3,
                    "text":"text3",
                    "selected":true
                },{
                    "id":4,
                    "text":"text4"
                },{
                    "id":5,
                    "text":"text5"
                }]
            });
        };
    </script>
    <!-- 页面样式 -->
    <style>
        .news_output{
            width: 1200px;
            height: 900px;
        }
        .title_input{
            width: 100%;
        }
        .row_news{
            width: 100%;
            height: 60px;
        }
        .row_news_content{
            padding-top: 10px;
            width: 100%;
            height: 700px;
        }
        .news_content_main{
            width: 100%;
        }
        label{
            font-family: "微软雅黑", serif;
            font-size: 24px;
            font-weight: normal;
            float: right !important;
        }
        .align_center{
            position:relative;
        }
        .align_center>.col-md-2,.align_center>.col-md-9,.align_center>label{
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }
        .news_output_btn{
            margin-top: 20px;
            width: 140px;
            height: 40px;
            padding: 0;
            line-height: 40px;
            background-color: #0E8EE9;
        }
    </style>
</head>
<body>
<c:import url="../common/common.jsp"></c:import>
    <div class="container-fluid news_output">
        <div class="row row_news align_center">
            <div class="col-md-2"><label>标题：</label></div>
            <div class="col-md-9">
                <input class="easyui-textbox title_input" data-options="iconCls:'icon-search'">
            </div>
        </div>
        <div class="row row_news align_center">
            <div class="col-md-2"><label>类型：</label></div>
            <div class="col-md-9">
                <input id="cc" class="easyui-combobox" data-options="valueField: 'id',textField: 'text'"/>
            </div>
        </div>
        <div class="row row_news align_center">
            <div class="col-md-2"><label>附件：</label></div>
            <div class="col-md-9"><input class="easyui-filebox" data-options="buttonText:'请选择文件',buttonIcon:'icon-add'"></div>
        </div>
        <div class="row row_news_content">
            <div class="col-md-2"><label>内容：</label></div>
            <div class="col-md-9">
                <div class="row_news_content">
                    <input class="easyui-textbox news_content_main" data-options="multiline:true" style="height: 500px">
                    <div class="news_content_main text-center">
                        <div class="btn btn-primary btn-lg news_output_btn text-center align_center">提交</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>