<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false" %>
<% pageContext.setAttribute("path", request.getContextPath()); %>
<% String appPath = request.getContextPath(); %>
<html>
<head>
    <title>User列表</title>
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
                    各用户列表
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>用户列表 —— 显示所有用户</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${path}/user/toAddUser">新增</a>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>用户编号</th>
                    <th>用户名字</th>
                    <th>用户小名</th>
                    <th>用户性别</th>
                    <th>用户生日</th>
                    <th>用户父亲</th>
                    <th>用户母亲</th>
                    <th>用户信息</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${requestScope.list}" varStatus="status">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.oldname}</td>
                        <td>${user.sex}</td>
                        <td>${user.birth}</td>
                        <td>${user.fathername}</td>
                        <td>${user.mothername}</td>
                        <td>${user.text}</td>
                        <td>
                            <a href="${path}/user/toUpdateUser?id=${user.id}">更改</a> |
                            <label onclick="del(${user.id})">删除</label>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    function del(id) {
        let r=confirm("确认删除吗？");
        if(r==true){
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "<%=appPath%>/user/del/"+id,//url
                data:{},
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result.flag == "SUCCESS") {
                        alert("新用户创建成功！");
                        window.location.href="${path}/user/allUser";
                    }else{
                        alert("新用户创建失败！； ");
                    }
                },
                error : function() {
                    alert("异常！");
                }
            });
        }else if(r==false){

        }
    }
</script>