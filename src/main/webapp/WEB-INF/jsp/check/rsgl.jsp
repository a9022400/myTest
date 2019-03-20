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
        $(document).ready(function () {
            $(".news_title_btn").click(function(){
                $(this).parent().siblings().children().removeClass("news_title_btn_sel");
                $(this).addClass("news_title_btn_sel");
            });
            $('#dg').datagrid({
                title: "全部新闻",
                url: '',//json数据
                singleSelect: true,
                pagination: true,
                striped: true,
                columns: [[
                    {field: 'ID', title: '序号', width: 80, align: 'center'},
                    {field: 'sort', title: '类型', width: 100, align: 'center'},
                    {field: 'title', title: '标题', width: 800, align: 'center'},
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
                ]

            });
        });
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
        .news{
            width: 100%;
            margin-top: 10px;
            height: 75%;
            padding: 0px;
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
        .news_title_btn{
            width: 150px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            border: 1px solid black;
            border-radius: 4px;
            font-size: 14px;
        }
        .news_title_btn_sel{
            color: white;
            background-color: #f0ad4e;
            border: 0px;
        }
        .news_title{
            margin-top: 15px;
        }
        .my_data_grid{
            width: 95%;
            height: 90%;
            padding-top: 30px;
            padding-left: 15px;
            padding-right: 15px;
        }
        .news_row{
            border: 1px solid #cccccc;
            width: 100%;
        }
        .col-md-3 div{
            margin:0 auto;
        }
    </style>
</head>
<body>
<c:import url="../common/common.jsp"></c:import>
    <div class="container news">
        <div class="row news_row">
            <div class="row news_title">
                <div class="col-md-3">
                    <div class="news_title_btn news_title_btn_sel">全部</div>
                </div>
                <div class="col-md-3">
                    <div class="news_title_btn">机关</div>
                </div>
                <div class="col-md-3">
                    <div class="news_title_btn">派出所</div>
                </div>
                <div class="col-md-3">
                    <div class="news_title_btn">民警</div>
                </div>
            </div>
            <div class="my_data_grid">
                <table id="dg" class="easyui-datagrid" style="width:50%;height:95%"
                       data-options="method:'get'">
                </table>
                <div class="news_add btn btn-info pull-right">新增单位</div>
            </div>
        </div>
    </div>
</body>