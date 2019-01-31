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
    <title>修改用户</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    修改用户
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改论文</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="" id="userForm">
        <input type="hidden" name="id" value="${user.id}"/>
        用户名字：<input type="text" name="name" value="${user.name}"/><br>
        用户小名：<input type="text" name="oldname" value="${user.oldname}"/><br>
        用户性别：<input type="text" name="sex" value="${user.sex}"/><br>
        用户生日：<input type="date" name="birth" value="${user.birth}"/><br>
        用户父亲：<input type="text" name="fatherid" value="${user.fatherid}"/><br>
        用户母亲：<input type="text" name="motherid" value="${user.motherid}"/><br>
        用户信息：<input type="text" name="text" value="${user.text}"/><br>
        <input type="button" value="提交" onclick="updateUser()"/>
    </form>

    <script type="text/javascript">
        function updateUser() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "<%=basePath %>user/updateUser" ,//url
                data: $('#userForm').serialize(),
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result.flag == "SUCCESS") {
                        alert("更新成功！");
                    }else{
                        alert("更新失败！； ");
                    }
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
    </script>
</div>