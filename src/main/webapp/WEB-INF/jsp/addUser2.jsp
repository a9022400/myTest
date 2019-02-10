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
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    基于SSM框架的管理系统：简单实现增、删、改、查。
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增论文</small>
                </h1>
            </div>
        </div>
    </div>
    <form id="userForm">
        用户名字：<input type="text" name="name"/><br>
        小名：<input type="text" name="oldname"/><br>
        性别：<span onclick="radio(this)">男<input type="radio" class="sex" id="man" value="男"/></span>
        &nbsp;<span onclick="radio(this)">女<input type="radio" class="sex" id="woman" value="女"/></span><br>
        生日：<input type="date" name="birth"/><br>
        父亲姓名：<input id="fatherName" name="fatherName">
                 <input type="hidden" name="fatherId" id="fatherId"/><br>
        母亲姓名：<input type="text" name="motherid"/><br>
        备注：<input type="text" name="text"/><br>
        <input type="button" value="添加" onclick="addUser()">
    </form>

    <script type="text/javascript">
        function radio(dom) {
            $("#man").prop('checked',false);
            $("#woman").prop('checked',false);
            $(dom).children(".sex").prop('checked',true);
        }
        function addUser() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "<%=basePath %>user/addUser" ,//url
                data: $('#userForm').serialize(),
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result.flag == "SUCCESS") {
                        alert("更新成功！");
                        window.location.href="<%=basePath %>user/allUser";
                    }else{
                        alert("更新失败！； ");
                    }
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
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
                    let searchResult;
                    searchResult = $('#searchResult');
                    if (data.list.length > 0) {
                        //将返回结果到ul标签下的html下面数据清空
                        searchResult.html("");
                        searchResult.append("<li style='list-style:none'>"+"编号"+"&nbsp;&nbsp;&nbsp;"+"姓名"+"</li>");
                        //循环遍历返回回来的数据
                        $.each(data.list, function(index, user) {
                            //将遍历回来的数据追加到ul标签下
                            //console.log(user);
                            let str="";
                            let func="";
                            $.each(user, function(id, name) {
                                //console.log(id);
                                //console.log(name);
                                //将遍历回来的数据追加到ul标签下
                                if(id=='id')
                                    //func="\"function(this){$(this).removeClass('unselect');$(this).addClass('select')},function(this){$(this).removeClass('select');$(this).addClass('unselect')}\"";
                                    str="<li style='list-style:none' class='beixuan' >" +name;
                                if(id=='name')
                                    str=str+"&nbsp;&nbsp;&nbsp;"+name+"</li>";
                            });
                            console.log(str);
                            searchResult.append(str);
                        });
                        //遍历完成后，将数据显示出来
                        searchResult.show();
                        nameByMouseHover();
                    } else {
                        //如果数据为空，也将ul标签隐藏
                        searchResult.hide();
                        alert("暂无此用户");

                    }
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
    </script>
</div>