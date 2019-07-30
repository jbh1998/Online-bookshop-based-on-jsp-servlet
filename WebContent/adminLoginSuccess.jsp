<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆成功</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<%
if(session.getAttribute("adminId")==null)
{ %>
<jsp:forward page="/notLogin.jsp" />
<% } else { %>
<body>
<div id="pagecell1">
<div align="center">
<p>&nbsp;</p>
<p class="successInf">登陆成功！ </p>
<p><img src="source/time.gif"
width="22" height="16">秒钟后将转入管理员界
面</p>
<p>如果浏览器没有反应请单击<a
href="/bookshop/admin.jsp">此处</a></p>
<p>&nbsp;</p>
</div>
</div>
<% response.setHeader("Refresh","3;URL=/bookshop/admin.jsp") ;
}%>
</body>
</html>