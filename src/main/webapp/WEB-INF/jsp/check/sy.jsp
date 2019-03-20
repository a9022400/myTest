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
    <title>考核网首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="pageName" content="sy" />
    <!-- 先引入 jquery -->
    <script src="<%=basePath %>js/jquery-3.3.1.js"></script>
    <!-- 页面JS -->
    <script type="text/javascript">
        window.onload=function(){
            $(".model_top_title").mouseover(function(){
                if($(this).hasClass("model_top_title_sel")){
                    return;
                }
                $(this).siblings(".model_top_title_sel").removeClass("model_top_title_sel");
                $(this).addClass("model_top_title_sel");
                if($(this).attr("title")==null || $(this).attr("title")==""){
                    var moreDom=$(this).siblings(".model_top_title_more").children(".model_top_title_more_hide");
                    $(this).siblings(".model_top_title_more").children().addClass("model_top_title_more_hide");
                    moreDom.removeClass("model_top_title_more_hide");
                    var blcokDom=$(this).parent().siblings(".main_model_middle_block");
                    var noneDom=$(this).parent().siblings(".main_model_middle_none");
                    blcokDom.removeClass("main_model_middle_block");
                    blcokDom.addClass("main_model_middle_none");
                    noneDom.removeClass("main_model_middle_none");
                    noneDom.addClass("main_model_middle_block");
                }else{
                    var titlenum=$(this).attr("title");
                    $(this).siblings(".model_top_title_more").children("a").addClass("model_top_title_more_hide");
                    $(this).siblings(".model_top_title_more").children("a[title="+titlenum+"]").removeClass("model_top_title_more_hide");
                    var blcokDom=$(this).parent().siblings(".main_model_middle_block");
                    var noneDom=$(this).parent().siblings(".main_model_middle_none[title="+titlenum+"]");
                    blcokDom.removeClass("main_model_middle_block");
                    blcokDom.addClass("main_model_middle_none");
                    noneDom.removeClass("main_model_middle_none");
                    noneDom.addClass("main_model_middle_block");
                }
            });
            $(".font_model_more").click(function(){
                var dom=$(".top_nav_title[name='新闻管理']",window.parent.document);
                dom.parent().siblings().children(".top_nav_title_sel").removeClass("top_nav_title_sel");
                dom.addClass("top_nav_title_sel");
            });
        };
    </script>
    <!-- 页面样式 -->
    <style>
        a{
            text-decoration: none;
        }
        a:hover{
            text-decoration: none;
            cursor:pointer;
            color: #8a6d3b;
        }
        .main_model{
            width: 50%;
            height: 300px;
        }
        .main_bottom{
            width: 100%;
            height: 300px;
        }
        .main_model_top{
            width: 100%;
            height: 50px;
            border-bottom:1px solid #D3E0F0;
        }
        .model_top_title{
            height: 50px;
        }
        .model_top_title_sel{
            color: #0E8EE9;
            height: 50px;
            border-bottom:3px solid #0E8EE9;
        }
        .model_top_title_more{
            height: 50px;
        }
        .model_top_title_more_hide{
            display: none;
        }
        .main_model_middle{
        }
        .main_model_middle_block{
        }
        .main_model_middle_none{
            display: none;
        }
        .font_common{
            font-family: "微软雅黑",serif;
            font-size: 18px;
            font-weight: normal;
        }
        .font_model_more{
            font-family: "微软雅黑",serif;
            font-size: 10px;
            color: #afb1b3;
            font-weight: lighter;
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
        .align_center{
            text-align: center;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
            display: block;
            margin-right: auto;
            margin-left: auto;
        }
        .model_top_title_more_hide{
            display: none;
        }
    </style>
</head>
<body class="">
<c:import url="../common/common.jsp"></c:import>
    <div id="page" class="container">
        <div id="main" class="row">
            <div class="row">
                <div class="col-md-6 main_model">
                    <div class="main_model_top">
                        <div class="col-md-4 model_top_title model_top_title_sel">
                            <label class="font_common align_center">
                                工作通报
                            </label>
                        </div>
                        <div class="col-md-4 model_top_title ">
                            <label class="font_common align_center">
                                考核公示
                            </label>
                        </div>
                        <div class="col-md-4 model_top_title_more">
                            <a class="font_model_more align_center pull-right" href="">
                                更多>>
                            </a>
                            <a class="font_model_more align_center pull-right model_top_title_more_hide" href="">
                                更多>>
                            </a>
                        </div>
                    </div>
                    <div class="main_model_middle main_model_middle_block">
                        <ul>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                    <div class="main_model_middle main_model_middle_none">
                        <ul>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 main_model">
                    <div class="main_model_top">
                        <div class="col-md-4 model_top_title model_top_title_sel">
                            <label class="font_common align_center">
                                会议通知
                            </label>
                        </div>
                        <div class="col-md-4 model_top_title ">
                            <label class="font_common align_center">
                                考核通知
                            </label>
                        </div>
                        <div class="col-md-4 model_top_title_more">
                            <a class="font_model_more align_center pull-right" href="#">
                                更多>>
                            </a>
                            <a class="font_model_more align_center pull-right model_top_title_more_hide" href="#">
                                更多>>
                            </a>
                        </div>
                    </div>
                    <div class="main_model_middle main_model_middle_block">
                        <ul>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                    <div class="main_model_middle main_model_middle_none">
                        <ul>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 main_model">
                    <div class="main_model_top">
                        <div class="col-md-4 model_top_title model_top_title_sel">
                            <label class="font_common align_center">
                                表彰授奖
                            </label>
                        </div>
                        <div class="col-md-4 model_top_title ">
                            <label class="font_common align_center">
                                领导批示
                            </label>
                        </div>
                        <div class="col-md-4 model_top_title_more">
                            <a class="font_model_more align_center pull-right" href="#">
                                更多>>
                            </a>
                            <a class="font_model_more align_center pull-right model_top_title_more_hide" href="#">
                                更多>>
                            </a>
                        </div>
                    </div>
                    <div class="main_model_middle main_model_middle_block">
                        <ul>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                    <div class="main_model_middle main_model_middle_none">
                        <ul>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 main_model">
                    <div class="main_model_top">
                        <div class="col-md-4 model_top_title model_top_title_sel">
                            <label class="font_common align_center">
                                光荣榜
                            </label>
                        </div>
                        <div class="col-md-8 model_top_title_more">
                            <a class="font_model_more align_center pull-right">
                                更多>>
                            </a>
                        </div>
                    </div>
                    <div class="main_model_middle main_model_middle_block">
                        <ul>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                    <div class="main_model_middle main_model_middle_none">
                        <ul>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">啊哈哈哈哈哈哈哈</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 main_bottom">
                    <div class="main_model_top">
                        <div class="col-md-2 model_top_title model_top_title_sel" title="1">
                            <label class="font_common align_center">
                                考核资料
                            </label>
                        </div>
                        <div class="col-md-2 model_top_title" title="2">
                            <label class="font_common align_center">
                                上级考核
                            </label>
                        </div>
                        <div class="col-md-2 model_top_title" title="3">
                            <label class="font_common align_center">
                                本局考核
                            </label>
                        </div>
                        <div class="col-md-2 model_top_title" title="4">
                            <label class="font_common align_center">
                                目标考核
                            </label>
                        </div>
                        <div class="col-md-2 model_top_title" title="5">
                            <label class="font_common align_center">
                                平安创建
                            </label>
                        </div>
                        <div class="col-md-2 model_top_title_more">
                            <a class="font_model_more align_center pull-right " title="1">
                                更多>>
                            </a>
                            <a class="font_model_more align_center pull-right model_top_title_more_hide" title="2">
                                更多>>
                            </a>
                            <a class="font_model_more align_center pull-right model_top_title_more_hide" title="3">
                                更多>>
                            </a>
                            <a class="font_model_more align_center pull-right model_top_title_more_hide" title="4">
                                更多>>
                            </a>
                            <a class="font_model_more align_center pull-right model_top_title_more_hide" title="5">
                                更多>>
                            </a>
                        </div>
                    </div>

                    <div class="main_model_middle main_model_middle_block" title="1">
                        <ul>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                            <li>
                                <a href="#">2018年管理员修改对机关年考核成绩（第022条）</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                    <div class="main_model_middle main_model_middle_none" title="2">
                        <ul>
                            <li>
                                <a href="#">22222</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                    <div class="main_model_middle main_model_middle_none" title="3">
                        <ul>
                            <li>
                                <a href="#">33333</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                    <div class="main_model_middle main_model_middle_none" title="4">
                        <ul>
                            <li>
                                <a href="#">44444</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                    <div class="main_model_middle main_model_middle_none" title="5">
                        <ul>
                            <li>
                                <a href="#">55555</a>
                                <label>2019-01-28</label>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>