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
    <title>新增论文</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- JS -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/jquery-ui.min.css">
    <style>
        .select{
            background-color: cornflowerblue;
            opacity: 70%;
        }
        .unselect{
        }
    </style>
</head>
<body>

<div class="ui-widget">
    <form id="userForm">
        <label>父亲姓名：</label>
        <input type="text" name="fatherName" id="fatherName" >
        <input type="hidden" name="fatherId" id="fatherId"/><br>
    </form>
</div>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增论文</small>
                </h1>
            </div>
        </div>
    </div>

    <!--
    -->
    <script type="text/javascript">
        window.onload=function(){
        };
        $(function() {
            var data  = [
                { label: "孙大大,编号：1", value: "1" },
                { label: "孙爸爸,编号：2", value: "2" },
                { label: "孙妈妈,编号：3", value: "3" },
                { label: "孙爷爷,编号：4", value: "4" },
                { label: "孙奶奶,编号：5", value: "5" }
            ];
            $( "#fatherName" ).autocomplete({
                source: data,
                select: function( event, ui ) {
                    $("#fatherId").val(ui.item.value);
                    $("#fatherName").val(ui.item.label);
                    console.log(ui);
                }
            });
        });
        function Fcheck() {
            var name=$('#fatherName').val();
            if(name==null || name==""){
                $('#searchResult').hide();
                return;
            }
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "<%=basePath %>user/selectByName" ,//url
                data: {"name":name},
                success: function (data) {
                    console.log(data);//打印服务端返回的数据(调试用)
                    $( "#fatherName" ).autocomplete({
                        source: availableTags
                    });
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
    </script>
</div>