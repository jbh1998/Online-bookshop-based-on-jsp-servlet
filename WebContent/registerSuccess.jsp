<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册成功</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<body>
<div id="pagecell1">
<div align="center">
<p>&nbsp;</p>
<p class="successInf">恭喜！注册成
功！ </p>
<p><img src="source/time.gif"
width="22" height="16">秒钟后将转回首页</p>
<p>如果浏览器没有反应请单击<a
href="/bookshop/index.jsp">此处</a></p>
<p>&nbsp;</p>
</div>
</div>
<jsp:useBean id="userInf"
class="bean.UserInf" scope="request"/>
<%
session.setAttribute("userId",userInf.getId());
response.setHeader("Refresh","3;URL=/bookshop/index.jsp") ; %>
</body>
</html>