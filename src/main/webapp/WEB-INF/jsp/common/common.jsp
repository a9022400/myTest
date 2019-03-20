<%--
  Created by IntelliJ IDEA.
  User: smz
  Date: 2019/3/11
  Time: 08:45
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
    <!-- 再引入 bootstrap -->
    <link href="<%=basePath %>css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript">
        function x(action) {
            window.open('${path}/user/checktemp?action='+action);
        }
        function setManuStyle(manuName) {
            //$("#"+manuName).parent().siblings(".col-md-2").children(".top_nav_title_sel").removeClass("top_nav_title_sel");
            $(".top_nav_title_sel").removeClass("top_nav_title_sel");
            $("#"+manuName).addClass("top_nav_title_sel");
        }
        $(function(){
            $(".top_check").hover(function(){
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

            setManuStyle($('meta[name="pageName"]')[0].getAttribute("content"));

            $(".top_nav_title").click(function () {
                if($(this).attr('id')!="khlr")
                    x($(this).attr('id'));
            });
            $(".check_input_detail").click(function () {
                x($(this).attr('id'));
            });
            /*$(".check_input_detail").click(function () {
                //$(this).parent().parent().parent().siblings(".col-md-2").children(".top_nav_title_sel").removeClass("top_nav_title_sel");
                $(".top_nav_title_sel").removeClass("top_nav_title_sel");
                $(this).parent().parent().addClass("top_nav_title_sel");
                $(this).siblings().removeClass("top_nav_title_sel");
                $(this).addClass("top_nav_title_sel");
                window.open('${path}/user/checktemp'+'?title='+$(this).attr("title"));
            })*/
        });
    </script>
    <!-- 页面样式 -->
    <style>
        #top a{
            color: white;
            text-decoration: none;
        }
        #top a:hover{
            text-decoration: none;
            cursor:pointer;
            color: white;
        }
        #top a:visited {text-decoration:none;}
        #top a:link{color:white ;text-decoration:none ; }
        #top a:active {text-decoration:none ; color:white ;}
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
            display: inherit;
        }
        .password{
            display: inherit;
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
        .top_nav .col-xs-5ths{
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
            position:relative;
            z-index:999;
            opacity: 0.95;
        }
        .col-xs-5ths{
            width:20%;
            float:left;
            min-height: 1px;
            padding-left: 15px;
            padding-right: 15px;
            position: relative;
        }
        .userinput{
            display: inline;
            width: 30%;
        }
        .accountName{
            margin-right: 10px;
        }
        #top .rsgl{
            color: #eea236;
            margin-right: 20px;
            line-height: 100%;
        }
        .row{
            margin: 0;
        }
        .container{
            padding-left: 0;
            padding-right: 0;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div id="page" class="container">
        <div id="top">
            <div class="row top_top">
                <div class="col-md-3 column top_top_login">
                    <a class="btn btn-link top_top_link">温岭市公安局</a>
                    <a class="btn btn-link top_top_link">加入收藏</a>
                </div>
                <div class="col-md-6 col-md-offset-3 column top_top_login">
                    <div class="pull-right">
                        <span class="rsgl glyphicon glyphicon-user">人事管理</span>
                        <label class="top_top_label accountLable">用户名：</label>
                        <label class="top_top_label accountName">user</label>
                        <input class="form-control userinput" type="text" style="display: none">

                        <label class="top_top_label passwordLable" style="display: none">密码：</label>
                        <input class="form-control userinput" type="password" style="display: none">

                        <input type="button" class="btn btn-sm btn-success" value="登录" style="display: none">
                        <input type="button" class="btn btn-sm btn-danger" value="注销">
                    </div>
                </div>
            </div>
            <div class="row top_pic">
                <div class="col-md-12 top_pic1">
                </div>
            </div>
            <div class="row top_nav">
                <div class="col-xs-5ths">
                    <div class="top_nav_title " id="sy">首页</div>
                </div>
                <div class="col-xs-5ths">
                    <div class="top_nav_title" id="xwgl">新闻管理</div>
                </div>
                <div class="col-xs-5ths">
                    <div class="top_nav_title" id="khtw">考核条文</div>
                </div>
                <div class="col-xs-5ths">
                    <div class="top_nav_title top_check" id="khlr">
                        考核录入
                        <ul class="check_input">
                            <li class="check_input_detail" id="dwkh">单位考核输入</li>
                            <li class="check_input_detail" id="mjkh">民警考核输入</li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-5ths">
                    <div class="top_nav_title" id="khtj">考核统计</div>
                </div>
            </div>
        </div>
    </div>
</body>