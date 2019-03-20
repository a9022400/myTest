<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false" %>
<% pageContext.setAttribute("path", request.getContextPath()); %>
<% String appPath = request.getContextPath(); %>
<!DOCTYPE HTML>
<html>
<head>
    <title>首页</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.3.1.js"></script>
    <style type="text/css">
        a {
            text-decoration: none;
            color: black;
            font-size: 18px;
        }

        /*div {
            width: 180px;
            height: 38px;
            margin: 100px auto;
            text-align: center;
            line-height: 38px;
            background: deepskyblue;
            border-radius: 4px;
        }*/
        li{
            width:170px;
            display: inline-block;
            margin:0 10px;
            background-color: #c7254e;
            margin-top: 10px;
        }
    </style>
</head>
<script>
    window.onload=function(){

    }
    function x(action) {
        window.location.href='<%=appPath%>/user/checktemp?action='+action;
    }
</script>
<body>
<ul style="list-style: none">
    <li>
        <a href="${path}/paper/allPaper">点击进入管理页面</a>
    </li>
    <li>
        <a href="${path}/user/allUser">点击进入用户页面</a>
    </li>
    <li>
        <a href="${path}/user/check">点击进入考核页面</a>
    </li>
    <li>
        <a onclick="x('news_output')">点击进入考核页面</a>
    </li>
    <li>
        <a onclick="x('tmp')">点击进入考核页面</a>
    </li>
    <li>
        <a onclick="x('sy')">点击进入首页</a>
    </li>
    <li>
        <bgsound src=images/RichardClayderman.mp3 loop=”-1″></bgsound>
        <embed src="images/RichardClayderman.mp3" hidden="false" autostart="true" loop="true"/>
        <div id="FlAD" style="position:absolute;z-index:10;left:100px;top:100px">
            <p style="color:red;float:right;font-size:12px;cursor:pointer;" onClick="img.style.visibility = 'hidden'">关闭</p>
            <a href="飘窗链接" target="_blank" title="飘窗文字"><image src="images/pic.jpg" alt="" width="160" border="0" /></a>
        </div>
    </li>
</ul>
</body>
</html>

<script type="text/javascript">
    var img = document.getElementById('FlAD');
    var xPos = 200;
    var yPos = 200;
    var step = 1;
    var delay = 40;
    var height = 0;
    var Hoffset = 0;
    var Woffset = 0;
    var yon = 0;
    var xon = 0;
    var pause = true;
    var interval;
    img.style.top = yPos;
    function changePos() {
        width = document.documentElement.clientWidth || document.body.clientWidth;
        height = document.documentElement.clientHeight || document.body.clientHeight;
        scrollLeft = document.documentElement.scrollLeft || document.body.scrollLeft;
        scrollTop = document.documentElement.scrollLeft || document.body.scrollTop;
        Hoffset = img.offsetHeight;
        Woffset = img.offsetWidth;
        img.style.left = xPos + scrollLeft +'px';
        img.style.top = yPos + scrollTop +'px';
        if (yon) {
            yPos = yPos + step;
        } else {
            yPos = yPos - step;
        }
        if (yPos < 0) {
            yon = 1;
            yPos = 0;
        }
        if (yPos >= (height - Hoffset)) {
            yon = 0;
            yPos = (height - Hoffset);
        }
        if (xon) {
            xPos = xPos + step;
        } else {
            xPos = xPos - step;
        }
        if (xPos < 0) {
            xon = 1;
            xPos = 0;
        }
        if (xPos >= (width - Woffset)) {
            xon = 0;
            xPos = (width - Woffset);
        }
    }
    function start() {
        img.visibility = "visible";
        interval = setInterval('changePos()', delay);
    }
    start();
</script>