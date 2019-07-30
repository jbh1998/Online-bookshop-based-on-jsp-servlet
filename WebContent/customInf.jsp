<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.DBClass"
errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客户资料</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<%
if(session.getAttribute("adminId")==null)
{ %>
<jsp:forward page="/notLogin.jsp" />
<% } else {
String
id=request.getParameter("userId");
String message="";
String query="SELECT * FROM customer WHERE id="+"\'"+ id + "\'";
DBClass db=new DBClass();
db.connect();
ResultSet
resultset=db.executeQuery(query);
resultset.next(); %>
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
<td height="11" bgcolor="#FFFFFF"
align="center" >
<table width="253" border="0" >
<tr>
<td width="68">姓 名： </td>
<td width="175"><div
align="left"><%=
resultset.getString("name")%></div></td>
</tr>
<tr>
<td>性 别： </td>
<td><div align="left"><%=
resultset.getString("sex")%></div></td>
</tr>
<tr>
<td>地 址： </td>
<td><div align="left"><%=
resultset.getString("address")%></div></t
d>
</tr>
<tr>
<td>邮 编： </td>
<td><div align="left"><%=
resultset.getString("code")%>
</div></td>
</tr>
<tr>
<td>电 话： </td>
<td><div align="left"><%=
resultset.getString("tel")%>
</div></td>
</tr>
<tr>
<td>E-mail： </td>
<td><div align="left"><%=
resultset.getString("email")%>
</div></td>
</tr>
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