<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.DBClass"
errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单管理</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<%
if(session.getAttribute("adminId")==null)
{ %>
<jsp:forward page="/notLogin.jsp" />
<% } else { %>
<body>
<div id="masthead">
<jsp:include page="/utility/siteName.jsp"
/>
<jsp:include page="/utility/bar.jsp" />
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
<td width="516"></td>
</tr>
</table>
</div>
<table width="100%" border="0">
<tr valign="top">
<%
if(session.getAttribute("hidden")==null){
%>
<jsp:include
page="/utility/adminMenu.jsp" />
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
<td width="20%"><div
align="center">订单号</div></td>
<td width="20%"><div
align="center">顾客ID</div></td>
<td width="20%"><div
align="center">时间</div></td>
<td width="20%"><div
align="center">总金额</div></td>
<td width="20%"><div
align="center">查看订单</div></td>
</tr>
<tr>
<td colspan="5"><hr></td>
</tr>
<%
String pg="";
if(request.getParameter("pg")==null){
pg="1";
}else{
pg=request.getParameter("pg");
}
int index=(Integer.parseInt(pg)-
1)*30;
String query="SELECT * FROM userorder";
DBClass db=new DBClass();
db.connect();
ResultSet
resultset=db.executeQuery(query);
for(int i=0;i<index;i++){
resultset.next();
}
int n=0;
while(resultset.next()&&n<30){
n++;
String
id=resultset.getString("id");
String
user=resultset.getString("user");
String
listURL="/bookshop/orderList.jsp?id="+id;
String
userURL="/bookshop/customerInf.jsp?userId="+user;
%>
<tr>
<td ><div align="center"><%=
id %></div></td>
<td ><div align="center"><a
href="#" onClick="window.open('<%=
userURL %>','s','width=750,height=250,scr
ollbars=yes,resizeable=yes,ststus=yes');"
><%= user %></a></div></td>
<td><div align="center"><%=
resultset.getString("day") %></div></td>
<td><div
align="center">&yen;<%=
resultset.getString("money") %></div></td
>
<td>
<div align="center"><a href="#" onClick="window.open('<%=listURL %>','s','width=750,height=250,scrollbars=yes,resizeable=yes,ststus=yes');">
<input type="submit"
name="Submit" value="查看">
</a>
</div></td>
</tr>
<%
}
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
<table width="100%" border="0">
<tr>
<td>
<%
String
pre="/bookshop/bookManage.jsp?pg="+Integer.toString(index/30);
String
aft="/bookshop/bookManage.jsp?pg="+Integer.toString(index/30+2);
if(pg.equals("1")){
if(resultset.next()){ %>
<div align="right">上一页/<a
href=<%= aft %>>下一页</a></div>
<%}else{ %>
<div align="right">上一页/下一
页</div>
<%}
} else {
if(resultset.next()){ %>
<div align="right"><a
href=<%= pre %>>上一页</a>/<a href=<%=
aft %>>下一页</a></div>
<% } else { %>
<div align="right"><a
href=<%= pre %>>上一页</a>/下一页</div>
<%}
}
db.closeConnection();
%>
</td>
</tr>
</table>
<p>&nbsp;</p>
</td>
</tr>
</table>
<jsp:include
page="/utility/copyRight.jsp" />
</div>
<!--end pagecell1-->
<br>
</body>
<% } %>
</html>