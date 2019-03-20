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
    <meta name="pageName" content="xwgl" />
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
        };
    </script>
    <!-- 页面样式 -->
    <style>
        .news_detail{
            width: 100%;
            height: 80%;
            padding: 20px 0px;
        }
        .news_detail_top_title{
            font-weight: bold;
            font-size: 24px;
            color: #333;
            text-align: center;
            padding: 40px 0 20px 0px;
        }
        .news_detail_top_info{
            width: 100%;
            float: left;
            color: #888;
            font-size: 14px;
            text-align: center;
            line-height: 20px;
            padding: 0 0 32px 0px;
            border-bottom: 1px #d8d2d1 dashed;
            margin-bottom: 34px;
        }
        .news_detail_middle p{
            text-indent: 2em;
            display: block;
            color:#555;
            line-height:2em;
            font-size:16px;
        }
        .news_detail_top_info span{
            margin-right: 20px;
        }
    </style>
</head>
<body>
<c:import url="../common/common.jsp"></c:import>
    <div class="container news_detail">
        <div class="news_detail_top">
            <div class="news_detail_top_title text-center">
                <!--此处填入大标题-->
                智慧警务显神威 命案逃犯落法网
            </div>
            <div class="news_detail_top_info text-center">
                发布日期：<span><!--此处填入日期--></span>
                来源：<span><!--此处填入发布源--></span>
            </div>
        </div>
        <div class="news_detail_middle">
            <div class="indentation">
                <p><!--此处填入文章内容--></p>
            </div>
        </div>
        <div class="news_detail_bottom">
            <a href="#" class="news_detail_bottom_attachment"><!--此处填入附件名称--></a>
            <div class="pull-right">
                <span><a href="javascript:window.print()">【打印本稿】</a></span>
                <span><a href="javascript:window.opener=null;window.open('','_self');window.close();">【关闭窗口】</a></span>
            </div>
        </div>
    </div>
</body>
<style>
    a{
        color: #4a4b55;
        text-decoration: none;
        cursor: pointer;
    }
    a:hover {
        color:#ec9313;
        text-decoration:none;
    }
</style>