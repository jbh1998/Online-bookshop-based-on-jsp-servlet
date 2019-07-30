<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.DBClass"
errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户资料</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
<jsp:include
page="/utility/scriptFunction.jsp" />
</head>
<%
if(session.getAttribute("userId")==null)
{ %>
<jsp:forward page="/notLogin.jsp" />
<% } else {
%>
<body onmousemove="closesubnav(event);">
<div id="masthead">
<jsp:include page="/utility/siteName.jsp"
/>
<jsp:include
page="/utility/navigation.jsp" />
</div>
<div id="pagecell1">
<div id="breadCrumb">
<table width="100%" border="0">
<tr>
<% String requestURL=
request.getRequestURI();
String
param=request.getQueryString();
String
hidAddr="/bookshop/MenuHidden?jspURL=" +
requestURL +"&param="+ param ;
String
showAddr="/bookshop/MenuShow?jspURL=" +
requestURL +"&param="+ param ; %>
<td width="211"><a href=<%=
hidAddr %> align="left">隐藏</a> / <a
href=<%= showAddr %>>显示</a> </td>
<td width="516"><div
align="right"><a
href="/bookshop/userLogin.jsp"align="righ
t">登陆</a> | <a
href="/bookshop/userRegister.jsp">新用户注
册</a> | <a href="#">管理员入口
</a></div></td>
</tr>
</table>
</div>
<table width="100%" border="0">
<tr valign="top">
<%
if(session.getAttribute("hidden")==null){
%>
<jsp:include page="/utility/menu.jsp"
/>
<% } %>
<td width="81%" >
<div class="book">
<table width="100%" border="0" >
<tr>
<td height="5"
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>
<tr>
<td height="1" bgcolor="#FFFFFF" >
<% String
id=(String)session.getAttribute("userId")
;
String message="";
String query="SELECT * FROM customer WHERE id="+"\'"+ id + "\'";
DBClass db=new DBClass();
db.connect();
ResultSet
resultset=db.executeQuery(query);
resultset.next(); %>
<div align="center">
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
</div></td>
</tr>
<tr>
<td height="2"
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>
</table>
<% db.closeConnection(); %>

<p align="center"><a
href="/bookshop/changeInf.jsp">修改资料
</a></p>
</div>
</td>
</tr>
</table>
<jsp:include
page="/utility/copyRight.jsp" />
</div>
<br>
<jsp:include
page="/utility/scriptMenuitem.jsp" />
</body>
<% } %>
</html>