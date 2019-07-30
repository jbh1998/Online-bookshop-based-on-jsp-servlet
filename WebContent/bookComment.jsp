 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.DBClass"
errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书评</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<%
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
%>
<body>
<div align="center">
<p>&nbsp;</p>
<p class="siteName">网 友 书 评
</p>
</div>
<div id="pagecell1">
<div align="center">
<table width="376" border="0"
bordercolor="#FFFFFF">
<tr>
<td height="103" colspan="2"><img
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
%>
<tr>
<td width="149" height="17"><div
align="left"><%= userId %>说： </div></td>
<td width="217" height="17"><div
align="right">总体评价<img src=<%=
stars %> width="64"
height="12"></div></td>
</tr>
<tr>
<td colspan="2"><p align="left"><%=
comment %></p>
<hr></td>
</tr>
<%
}
db.closeConnection();
%>
<tr>
<td height="17" colspan="2"><form
name="form" method="post"
action="/bookshop/AddComment">
<div align="center">
<table width="363" border="0"
bordercolor="#FFFFFF">
<tr>
<td width="237"
height="133"><div align="left">
<span class="style8">我有
话说： (不超过50字)</span>
<textarea name="comment"
cols="30" rows="9"
id="comment"></textarea>
</div></td>
<td width="116"><div
align="left">
<p>
<label> &nbsp; 
</label>
</p>
<p>
<label>
<input type="radio"
name="stars" value="5">
</label>
<img
src="source/stars5.gif" width="64"
height="12"><br>
<label>
<input type="radio"
name="stars" value="4">
</label>
<img
src="source/stars4.gif" width="64"
height="12"><br>
<label>
<input type="radio"
name="stars" value="3">
<img
src="source/stars3.gif" width="64"
height="12"></label>
<br>
<label>
<input type="radio"
name="stars" value="2">
<img
src="source/stars2.gif" width="64"
height="12"></label>
<br>
<label>
<input type="radio"
name="stars" value="1">
<img
src="source/stars1.gif" width="64"
height="12"></label>
<br>
<label>
<input name="stars"
type="radio" value="0" checked>
</label>
&nbsp;<span
class="style3">不打分</span><br>
</p>
</div></td>
</tr>
</table>
<p align="center">
<input name="bookId"
type="hidden" value=<%= bookId %>>
<input type="submit"
name="Submit" value="提交">
<input type="reset"
name="Submit" value="重置">
</p>
<p align="left">
<label> </label>
</p>
</div>
</form> </td>
</tr>
</table>
</div>
</div>
</body>
</html>