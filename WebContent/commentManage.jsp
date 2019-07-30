<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.DBClass"
errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书评管理</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<%
if(session.getAttribute("adminId")==null)
{ %>
<jsp:forward page="/notLogin.jsp" />
<% } else {
String
bookId=request.getParameter("bookId");
String query="SELECT * FROM book WHERE id= "+ "\'"+ bookId + "\'";
DBClass db=new DBClass();
db.connect();
ResultSet
resultset=db.executeQuery(query);
resultset.next();
String name=resultset.getString("name");
String type=resultset.getString("type");
String
author=resultset.getString("author");
String
publisher=resultset.getString("publisher"
);
String
price=resultset.getString("price");
String pic="source/"+bookId+".JPG";
String
DeleteURL="/bookshop/DeleteComment?bookId="+bookId;
%>
<body>
<div align="center">
<p>&nbsp;</p>
<p class="siteName">网 友 书 评</p>
</div>
<div id="pagecell1">
<div align="center">
<form name="form1" method="post"
action=<%= DeleteURL %>>
<table width="376" border="0"
bordercolor="#FFFFFF">
<tr>
<td height="103" colspan="3"><img
src=<%= pic %> width="270" height="350"
align="baseline"> <P class=style10>
书名： <%= name%></P> <P
class=style10>类别： <%= type%></P>
<P class=style10>作者： <%= author%></P>
<P class=style10>出版社： <%=
publisher%></P> <P class=style10>价
格： <%= price%></P>
<hr></td>
</tr>
<%
query="SELECT * FROM bookcomment WHERE bookId = "+ "\'"+ bookId + "\'";
resultset=db.executeQuery(query);
while(resultset.next()) {
String
userId=resultset.getString("userId");
String
stars="source/stars"+resultset.getString(
"stars")+".gif";
String
comment=resultset.getString("comment");
String id=resultset.getString("id");
%>
<tr>
<td width="63" height="17"><div
align="left"><%= userId %>说：
</div></td>
<td width="235"><div align="center">
总体评价<img src=<%= stars %> width="64"
height="12"></div></td>
<td width="64" height="17"><div
align="right">
删除
<input name="id" type="checkbox" id="id"
value=<%= id %>>
</div></td>
</tr>
<tr>
<td colspan="3"><p align="left"><%=
comment %></p>
<hr></td>
</tr>
<%
}
db.closeConnection();
%>
<tr>
<td height="17" colspan="3"><input
type="submit" name="Submit" value="删除
"></td>
</tr>
</table>
</form>
</div>
</div>
</body>
<% } %>
</html>