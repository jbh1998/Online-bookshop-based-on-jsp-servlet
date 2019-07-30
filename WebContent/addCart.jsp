<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购书</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<body>
<div id="pagecell1">
<div align="center">
<form name="form" method="post"
action="/bookshop/AddCart">
<p>
<%
if(request.getAttribute("errInf")!=null)
{ %>
<span class="errInf"><%=
(String)request.getAttribute("errInf") %>
</span>
<% } %>
&nbsp;</p>
<p>我 要
<input name="bookNum"
type="text" id="bookNum" value="1"
size="3">本 
<input name="bookId" type="hidden"
id="bookId" value="<%=request.getParameter("bookId") %>">
</p>
<p>
<input type="submit"
name="Submit" value="提交">
</p>
</form>
</div>
</div>
</body>
</html>