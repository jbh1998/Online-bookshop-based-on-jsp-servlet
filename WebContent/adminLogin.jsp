<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
<p>&nbsp;</p>
<p class="siteName">管 理 员 登 陆
</p>
</div>
<div id="pagecell1">
<div align="center">
<br>
<form name="form1" method="post"
action="/bookshop/AdminLogin">
<%
if(request.getAttribute("errInf")!=null){
%>
<p class="errInf"> <%=
(String)request.getAttribute("errInf") %>
</p>
<% } %>
<p>帐号： <input name="id" type="text"
id="id">
</p>
<p>密码： <input name="password"
type="password" id="password">
</p>
<p>
<input type="submit" name="Submit"
value="提交">
</p>
</form>
<p><a href="/bookshop/index.jsp">返回
</a></p>
</div>
</div>
</body>
</html>