<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.DBClass"
errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>历史订单</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
<jsp:include
page="/utility/scriptFunction.jsp" />
</head>
<%
if(session.getAttribute("userId")==null)
{ %>
<jsp:forward page="/notLogin.jsp" />
<% } else { %>
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
<td
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>
<tr>
<td height="11" bgcolor="#FFFFFF" >
<table width="100%" border="0" >
<tr>
<td width="25%"><div
align="center">订单号</div></td>
<td width="25%"><div
align="center">时间</div></td>
<td width="25%"><div
align="center">总金额</div></td>
<td width="25%"><div
align="center">查看订单</div></td>
</tr>
<tr>
<td colspan="4"><hr></td>
</tr>
<%
String query="SELECT * FROM userorder WHERE user="+"\'"+(String)session.getAttribute("userId")+ "\'";
DBClass db=new DBClass();
db.connect();
ResultSet resultset=db.executeQuery(query);
while(resultset.next()){
String id=resultset.getString("id");
String listURL="/bookshop/orderList.jsp?id="+id;
%>
<tr>
<td ><div align="center"><%=
id %></div></td>
<td><div align="center"><%=
resultset.getString("day") %></div></td>
<td><div
align="center">&yen;<%=
resultset.getString("money") %></div></td
>
<td>
<div align="center"><a href="#"onClick="window.open('<%=listURL %>','s','width=750,height=250,scrollbars=yes,resizeable=yes,ststus=yes');"
>
<input type="submit"
name="Submit" value="查看">
</a>
</div></td>
</tr>
<%
}
db.closeConnection();%>
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