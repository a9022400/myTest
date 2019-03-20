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
    <title>考核网通报信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 先引入 jquery -->
    <script src="<%=basePath %>js/jquery-3.3.1.js"></script>
    <!-- 再引入 Bootstrap -->
    <script src="<%=basePath %>js/bootstrap.js"></script>
    <link href="<%=basePath %>css/bootstrap.css" rel="stylesheet">
    <!-- 页面JS -->
    <script type="text/javascript">
        function x(action) {
            //window.location.href="<%=basePath%>/user/checktemp?action="+action+"'iframe'";
            window.open('${path}/user/checktemp?action='+action,'iframe');
        }
        window.onload=function(){
            $(".check").hover(function(){
                $(".check_input").show();
            },function(){
                $(".check_input").hide();
            });
            $(".model_top_title").mouseover(function(){
                if($(this).hasClass("model_top_title_sel")){
                    return;
                }
                $(this).siblings(".model_top_title_sel").removeClass("model_top_title_sel");
                $(this).addClass("model_top_title_sel");
                var blcokDom=$(this).parent().siblings(".main_model_middle_block");
                var noneDom=$(this).parent().siblings(".main_model_middle_none");
                blcokDom.removeClass("main_model_middle_block");
                blcokDom.addClass("main_model_middle_none");
                noneDom.removeClass("main_model_middle_none");
                noneDom.addClass("main_model_middle_block");
            });
            $(".top_nav_title").click(function () {
                if($(this).hasClass("check")){
                    return;
                }
                $(this).parent().siblings(".col-md-2").children(".top_nav_title_sel").removeClass("top_nav_title_sel");
                $(this).addClass("top_nav_title_sel");
                $(this).children("a").addClass("top_nav_title_sel");
            })
            $(".check_input_detail").click(function () {
                $(this).parent().parent().parent().siblings(".col-md-2").children(".top_nav_title_sel").removeClass("top_nav_title_sel");
                $(this).parent().parent().addClass("top_nav_title_sel");
                $(this).siblings().removeClass("top_nav_title_sel");
                $(this).addClass("top_nav_title_sel");
                window.open('${path}/user/checktemp'+'?title='+$(this).attr("title"),'iframe');
            })

        };
    </script>
    <!-- 页面样式 -->
    <style>
        a{
            color: white;
            text-decoration: none;
        }
        a:hover{
            text-decoration: none;
            cursor:pointer;
            color: white;
        }
        a:visited {text-decoration:none;}
        a:link{color:white ;text-decoration:none ; }
        a:active {text-decoration:none ; color:white ;}
        #page{
            padding: 0;
        }
        #top{
            margin: 0;
        }
        .top_top{
            background-color:#3A87D3 ;
            height: 40px;
        }
        .top_top_link{
            color: white;
        }
        .top_top_link:hover{
            color: white;
            text-decoration: none;
        }
        .top_top_login{
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }
        .account{

        }
        .top_top_label{
            color: white;
        }
        .top_pic1{
            background-image:url(<%=basePath %>images/top_background_1.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
            -moz-background-size:100% 100%;
            height: 155px;
            width: 100%;
        }
        .model_top_title_sel{
            color: #0E8EE9;
            height: 50px;
            border-bottom:3px solid #0E8EE9;
        }
        .main_model_middle li{
            font-family: "微软雅黑",serif;
            font-size: 15px;
            font-weight: lighter;
            cursor:pointer;
            margin-top: 4px;
        }
        .main_model_middle label{
            float: right !important;
            margin-bottom: 0px;
            font-weight:lighter;
        }
        .top_nav{
            height: 40px;
            background-color:#3A87D3 ;
        }
        .top_nav .col-md-2{
            height: 40px;
            position:relative;
        }
        .top_nav_title:hover{

        }
        .top_nav .top_nav_title{
            width: 100%;
            height:40px;
            line-height:40px;
            text-align: center;
            font-family: "微软雅黑",serif;
            font-weight: normal;
            font-size: 22px;
            color: #FFF;
            cursor: pointer;
        }
        .top_nav .top_nav_title a{
            text-decoration: none;
            cursor: default;
        }
        .top_nav_title ul{
            width: 100%;
            text-align: center;
            font-family: "微软雅黑",serif;
            font-weight: normal;
            font-size: 18px;
            color: white;
            list-style-type: none;
            border: 1px solid #3A87D3;
            border-top: 0;
            background-color: #3A87D3;
            padding: 0;
        }
        .top_nav_title ul li{
            list-style-type:none;
            cursor: pointer;
        }
        .top_nav .top_nav_title_sel{
            color: #3A87D3;
            background-color: #fff;
        }
        .check_input{
            display: none;
        }
        iframe{
            width: 100%;
            height: 900px;
            border: 0 solid black;
        }
    </style>
</head>
<body>
    <div id="page" class="container">
        <div id="top" class="row">
            <div class="row top_top">
                <div class="col-md-3 column top_top_login">
                    <a class="btn btn-link top_top_link">温岭市公安局</a>
                    <a class="btn btn-link top_top_link">加入收藏</a>
                    <a onclick="x('news_output')">插入新闻</a>
                </div>
                <div class="col-md-6 col-md-offset-3 column top_top_login">
                    <div class="pull-right">
                        <label class="top_top_label">账号</label>
                        <input class="account" type="text">
                        <label class="top_top_label">密码</label>
                        <input class="password" type="password">
                    </div>
                </div>
            </div>
            <div class="row top_pic">
                <div class="col-md-12 top_pic1">
                </div>
            </div>
            <div class="row top_nav">
                <div class="col-md-2">
                    <div class="top_nav_title top_nav_title_sel" onClick="window.open('${path}/user/checkmain','iframe')" >首页</div>
                </div>
                <div class="col-md-2">
                    <div class="top_nav_title" name="新闻管理" onClick="" >新闻管理</div>
                </div>
                <div class="col-md-2">
                    <div class="top_nav_title" onClick="window.open('${path}/user/checktemp','iframe')">考核条文</div>
                </div>
                <div class="col-md-2">
                    <div class="top_nav_title check">
                        考核录入
                        <ul class="check_input">
                            <li class="check_input_detail" title="jg">机关考核输入</li>
                            <li class="check_input_detail" title="pcs">派出所考核输入</li>
                            <li class="check_input_detail" title="mj">民警考核输入</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="top_nav_title" onClick="window.open('${path}/user/checktemp','iframe')">考核统计</div>
                </div>
                <div class="col-md-2">
                    <div class="top_nav_title" onClick="window.open('${path}/user/checkmain','iframe')">部门人事</div>
                </div>
            </div>
        </div>
        <div class="row">
            <iframe id="main" name="iframe" class="iframe" scrolling="no" src="${path}/user/checkmain"></iframe>
        </div>
        <div id="bottom" class="row"></div>
    </div>
</body>