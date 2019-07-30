<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.DBClass"
errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理</title>
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
<form name="form" method="post"
action="/bookshop/DeleteBook">
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
<td width="5%"><div
align="center">删除</div></td>
<td width="8%"><div
align="center">ID</div></td>
<td width="21%"><div
align="center">书名</div></td>
<td width="20%"><div
align="center">作者</div></td>
<td width="20%"><div
align="center">出版社</div></td>
<td width="8%"><div
align="center">类别</div></td>
<td width="10%"><div
align="center">单价</div></td>
<td width="8%"><div
align="center">推荐</div></td>
</tr>
<tr>
<td colspan="8"><hr></td>
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
String query="SELECT * FROM book";
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
bookId=resultset.getString("id");
String
commentURL="/bookshop/commentManage.jsp?bookId="+bookId;
String
changeURL="/bookshop/changeBookInf.jsp?bookId="+bookId;
%>
<tr>
<td ><div align="center">
<input name="bookId"
type="checkbox" id="bookId" value="<%=
bookId %>">
</div></td>
<td ><%= bookId %></td>
<td ><a href=<%= changeURL %>
onClick="window.open('<%=
commentURL %>','s','width=850,height=600,
scrollbars=yes,resizeable=yes,ststus=yes'
);"><%=
resultset.getString("name") %></a></td>
<td><%=
resultset.getString("author") %></td>
<td><%=
resultset.getString("publisher") %></td>
<td><%=
resultset.getString("type") %></td>
<td>&yen; <%=
resultset.getString("price") %></td>
<td><%=
resultset.getString("ifNew") %></td>
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
<table width="100%" border="0">
<tr>
<td width="25%"><input
type="submit" name="Submit" value="删除">
&nbsp;&nbsp;&nbsp; <a
href="/bookshop/addBook.jsp">添加图书
</a></td>
<td width="75%">
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
</form>
</div>
</td>
</tr>
</table>
<jsp:include
page="/utility/copyRight.jsp" />
</div>
<br>
</body>
<% } %>
</html>