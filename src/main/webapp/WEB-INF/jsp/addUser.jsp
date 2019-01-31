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
    <form action="" name="userForm">
        用户名字：<input type="text" name="name"/><br>
        小名：<input type="text" name="oldname"/><br>
        性别：男<input type="radio" name="sex" id="男"/>&nbsp;女<input type="radio" name="sex" id="女"/><br>
        生日：<input type="date" name="birth"/><br>
        父亲姓名：<input type="text" name="fatherName" id="fatherName"  onblur="Fcheck()"/>
                 <input type="hidden" name="fatherId" id="fatherId"/>
                 <ul  id="searchResult" ></ul>
                 <input type="button" value="校验是否存在重名"><br>
        母亲姓名：<input type="text" name="motherid"/><br>
        备注：<input type="text" name="text"/><br>
        <input type="button" value="添加" onclick="addUser()">
    </form>

    <script type="text/javascript">
        window.onload=function () {

        };
        function addUser() {
            var form = document.forms[0];
            form.action = "<%=basePath %>user/addUser";
            form.method = "post";
            form.submit();
        }
        function Fcheck() {
            var name=$('#fatherName').val();
            if(name==null || name==""){
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
        function nameByMouseHover() {
            $(".beixuan").hover(
                function(){
                    $(this).removeClass('unselect');
                    $(this).addClass('select')
                },function(){
                    $(this).removeClass('select');
                    $(this).addClass('unselect')
                }
            );
            $(".beixuan").onclick(function () {

            })
        }
    </script>
</div>