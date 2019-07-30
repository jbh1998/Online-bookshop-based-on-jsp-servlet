<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.sql.*,bean.DBClass,bean.CartInf" errorPage=""%>
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
<%
if(session.getAttribute("cartList")==null
) { %>
目前您的购物车是空的
<% } else {
Vector
list=(Vector)session.getAttribute("cartList");
int n=list.size(); %>
<div align="center">
<table width="100%"
border="0">
<tr>
<td width="17%"><div
align="center">书名</div></td>
<td width="18%"><div
align="center">作者</div> <div
align="center"></div></td>
<td width="10%"><div
align="center">单价</div></td>
<td width="10%"><div
align="center">数量</div></td>
<td width="25%"><div
align="center">修改预定的数量</div></td>
<td width="20%" ><div
align="center">删除</div></td>
</tr>
<tr>
<td colspan="6"><hr></td>
</tr>
<% float money=0;
for(int i=0;i<n;i++) {
CartInf
cart=(CartInf)list.elementAt(i);
String query="SELECT name,author,publisher,price FROM book WHERE id="+ "\'"+(String)cart.getBookId() + "\'";
DBClass db=new DBClass();
db.connect();
ResultSet resultset=db.executeQuery(query);
resultset.next();
String price=resultset.getString("price");
money+=Float.parseFloat(price)*cart.getBookNum();
%>
<tr>
<td ><div
align="center"><%=resultset.getString("name") %></div></td>
<td ><div
align="center"><%=resultset.getString("author") %></div> <div
align="center"></div></td>
<td ><div align="center">&yen;<%=price %></div></td>
<td ><div align="center"><%=cart.getBookNum() %></div></td>
<td ><form name="form1"
method="post"
action="/bookshop/ChangeOrder">
<div align="center">我要
<input
name=<%=(String)cart.getBookId()%>
type="text" value=<%=cart.getBookNum()%>
size="3">
本
<input type="submit"
name="Submit" value="确定">
</div>
</form>
</td>
<td><form name="form2"
method="post"
action="/bookshop/ChangeOrder">
<div align="center">
<input type="hidden"
name=<%=(String)cart.getBookId()%>
value="0">
<input type="submit"
name="Submit" value="我不要了">
</div>
</form></td>
</tr>
<% db.closeConnection();
}
%>
<tr>
<td colspan="6"><hr></td>
</tr>
<tr>
<td colspan="4">
<div align="left">共计人民币<%=
money %>元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<% String
submitURL="/bookshop/SubmitOrder?money="+
Float.toString(money); %>
<a href=<%= submitURL %>>提交订
单</a></div></td>
<td colspan="2"
class="errInf"><div align="right">
<%
if(request.getAttribute("errInf")!=null){
%>
<%=
(String)request.getAttribute("errInf") %>
<% } %>
</div></td>
</tr>
</table>
</div>
<% } %>
</td>
</tr>
<tr>
<td height="2"
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
</html>