<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.DBClass"
errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单列表</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<%
if((session.getAttribute("userId")==null)
&&(session.getAttribute("adminId")==null)
) { %>
<jsp:forward page="/notLogin.jsp" />
<% } else { %>
<body>
<div align="center">
<p>&nbsp;</p>
<table width="713" border="0" >
<tr>
<td
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>
<tr>
<td height="11" bgcolor="#FFFFFF" >
<table width="100%" border="0">
<tr>
<td width="150"><div align="center">
书名</div></td>
<td width="150"><div align="center">
作者</div></td>
<td width="150"><div align="center">
出版社</div></td>
<td width="82"><div align="center">
单价</div></td>
<td width="63"><div align="center">
数量</div></td>
<td width="86"><div align="center">
共计</div></td>
</tr>
<tr>
<td colspan="6"><hr></td>
</tr>
<%
String id=request.getParameter("id");
String query="SELECT * FROM orderlist,book WHERE orderlist.id = "+"\'"+ id+ "\' AND orderlist.book=book.id";
DBClass db=new DBClass();
db.connect();
ResultSet resultset=db.executeQuery(query);
while (resultset.next()){
String name=resultset.getString("name");
String author=resultset.getString("author");
String publisher=resultset.getString("publisher");
String price=resultset.getString("price");
String sum=resultset.getString("sum");
float money=Integer.parseInt(sum)*Float.parseFloat(price);
%>
<tr>
<td height="22"><div align="center"><%= name %></div></td>
<td><div align="center"><%=
author %></div></td>
<td><div align="center"><%=
publisher %></div></td>
<td><div align="center">&yen;<%=
price %></div></td>
<td><div align="center"><%=
sum %></div></td>
<td><div align="center">&yen;<%=
money %></div></td></tr>
<%
}
db.closeConnection();
%>
</table>
</td>
</tr>
<tr>
<td height="5"
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>
</table>
</div>
</body>
<% } %>
</html>