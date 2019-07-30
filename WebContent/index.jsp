<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,bean.BookInf" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>湖大书店</title>
<link rel="stylesheet" href="source/bookshop.css" type="text/css">
<jsp:include page="/utility/scriptFunction.jsp" />
</head>
<% request.setCharacterEncoding("gb2312");
response.setContentType("text/html; charset=gb2312");
if(session.getAttribute("booklist")==null){
response.sendRedirect("/bookshop/ShowBook");
} else {
Vector booklist=(Vector)session.getAttribute("booklist");
String pg;
if(request.getParameter("pg")==null){
pg="1";
}else{
pg=request.getParameter("pg");
}
int pgSum=(int)(booklist.size()+5)/6;
int index=(Integer.parseInt(pg)-1)*6;
%>
<body onmousemove="closesubnav(event);">
<div id="masthead">
<jsp:include page="/utility/siteName.jsp" />
<jsp:include page="/utility/navigation.jsp" />
</div>
<div id="pagecell1">
<div id="breadCrumb">
<table width="100%" border="0">
<tr>
<% String requestURL= request.getRequestURI();
String param=request.getQueryString();
String hidAddr="/bookshop/MenuHidden?jspURL=" + requestURL
+"&param="+ param ;
String showAddr="/bookshop/MenuShow?jspURL=" + requestURL
+"&param="+ param ; %>
<td width="211"><a href=<%= hidAddr %> align="left">隐藏</a> / <a href=<%=
showAddr %>>显示</a> </td>
<td width="516"><div align="right"><a
href="/bookshop/userLogin.jsp"align="right">登陆</a> | <a href="/bookshop/userRegister.jsp">
新用户注册</a> | <a href="/bookshop/adminLogin.jsp">管理员入口</a></div></td>
</tr>
</table>
</div>
<table width="100%" border="0">
<tr valign="top">
<% if(session.getAttribute("hidden")==null){ %>
<jsp:include page="/utility/menu.jsp" />
<% } %>
<td width="81%" >
<div class="book">
<table width="100%" cellpadding="0" cellspacing="0" summary="">
<tr valign="top">
<td width="5%" > <p>&nbsp;
</p></td>
<% if(index+1<=booklist.size()){
BookInf book= (BookInf)booklist.elementAt(index);
String imgURL="source/"+book.getId()+".JPG";
String commentURL="/bookshop/bookComment.jsp?bookId="+book.getId();
String cartURL="/bookshop/addCart.jsp?bookId="+book.getId();
%>
<td width="23%" ><a href="/source/java.jpg" onClick="window.open('<%=
commentURL %>','s','width=850,height=600,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src=<%= imgURL %> width="135" height="200" border="0" ></a></td>
<td width="22%" ><p class="bookInfo">书名： <%= book.getName() %></p>
<p class="bookInfo">作者： <%= book.getAuthor() %></p>
<p class="bookInfo">出版社： <%= book.getPublisher() %></p>
<p class="bookInfo">类别： <%= book.getType() %></p>
<p class="bookInfo">单价： &yen;<%= book.getPrice() %></p>
<p class="bookInfo"><a href="#" onClick="window.open('<%=
cartURL %>','s','width=300,height=300,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src="source/shoppingCart.jpg" width="50" height="21" border="0"></a></p></td>
<% } else { %>
<td width="23%" height="200">&nbsp;</td>
<td width="22%" height="200">&nbsp;</td>
<% } %>
<td width="5%" >&nbsp;</td>
<% if(index+2<=booklist.size()){
BookInf book= (BookInf)booklist.elementAt(index+1);
String imgURL="source/"+book.getId()+".JPG";
String commentURL="/bookshop/bookComment.jsp?bookId="+book.getId();
String cartURL="/bookshop/addCart.jsp?bookId="+book.getId();
%>
<td width="23%" ><a href="#" onClick="window.open('<%=
commentURL %>','s','width=850,height=600,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src=<%= imgURL %> width="135" height="200" border="0" ></a></td>
<td width="22%" ><p class="bookInfo">书名： <%= book.getName() %></p>
<p class="bookInfo">作者： <%= book.getAuthor() %></p>
<p class="bookInfo">出版社： <%= book.getPublisher() %></p>
<p class="bookInfo">类别： <%= book.getType() %></p>
<p class="bookInfo">单价： &yen;<%= book.getPrice() %></p>
<p class="bookInfo"><a href="#" onClick="window.open('<%=
cartURL %>','s','width=300,height=300,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src="source/shoppingCart.jpg" width="50" height="21" border="0"></a></p></td>
<% } else { %>
<td width="23%" height="200">&nbsp;</td>
<td width="22%" height="200">&nbsp;</td>
<% } %>
</tr>
<tr valign="top">
<td colspan="6" > <p>&nbsp;
</p> <p>&nbsp;
</p></td>
</tr>
<tr valign="top">
<td >&nbsp;</td>
<% if(index+3<=booklist.size()){
BookInf book= (BookInf)booklist.elementAt(index+2);
String imgURL="source/"+book.getId()+".JPG";
String commentURL="/bookshop/bookComment.jsp?bookId="+book.getId();
String cartURL="/bookshop/addCart.jsp?bookId="+book.getId();
%>
<td width="23%" ><a href="#" onClick="window.open('<%=
commentURL %>','s','width=850,height=600,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src=<%= imgURL %> width="135" height="200" border="0" ></a></td>
<td width="22%" ><p class="bookInfo">书名： <%= book.getName() %></p>
<p class="bookInfo">作者： <%= book.getAuthor() %></p>
<p class="bookInfo">出版社： <%= book.getPublisher() %></p>
<p class="bookInfo">类别： <%= book.getType() %></p>
<p class="bookInfo">单价： &yen;<%= book.getPrice() %></p>
<p class="bookInfo"><a href="#" onClick="window.open('<%=
cartURL %>','s','width=300,height=300,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src="source/shoppingCart.jpg" width="50" height="21" border="0"></a></p></td>
<% } else { %>
<td width="23%" height="200">&nbsp;</td>
<td width="22%" height="200">&nbsp;</td>
<% } %>
<td >&nbsp;</td>
<% if(index+4<=booklist.size()){
BookInf book= (BookInf)booklist.elementAt(index+3);
String imgURL="source/"+book.getId()+".JPG";
String commentURL="/bookshop/bookComment.jsp?bookId="+book.getId();
String cartURL="/bookshop/addCart.jsp?bookId="+book.getId();
%>
<td width="23%" ><a href="#" onClick="window.open('<%=
commentURL %>','s','width=850,height=600,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src=<%= imgURL %> width="135" height="200" border="0" ></a></td>
<td width="22%" ><p class="bookInfo">书名： <%= book.getName() %></p>
<p class="bookInfo">作者： <%= book.getAuthor() %></p>
<p class="bookInfo">出版社： <%= book.getPublisher() %></p>
<p class="bookInfo">类别： <%= book.getType() %></p>
<p class="bookInfo">单价： &yen;<%= book.getPrice() %></p>
<p class="bookInfo"><a href="#" onClick="window.open('<%=
cartURL %>','s','width=300,height=300,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src="source/shoppingCart.jpg" width="50" height="21" border="0"></a></p></td>
<% } else { %>
<td width="23%" height="200">&nbsp;</td>
<td width="22%" height="200">&nbsp;</td>
<% } %>
</tr>
<tr valign="top">
<td colspan="6" > <p>&nbsp;
</p> <p>&nbsp;
</p></td>
</tr>
<tr valign="top">
<td height="200" >&nbsp;</td>
<% if(index+5<=booklist.size()){
BookInf book= (BookInf)booklist.elementAt(index+4);
String imgURL="source/"+book.getId()+".JPG";
String commentURL="/bookshop/bookComment.jsp?bookId="+book.getId();
String cartURL="/bookshop/addCart.jsp?bookId="+book.getId();
%>
<td width="23%" ><a href="#" onClick="window.open('<%=
commentURL %>','s','width=850,height=600,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src=<%= imgURL %> width="135" height="200" border="0" ></a></td>
<td width="22%" ><p class="bookInfo">书名： <%= book.getName() %></p>
<p class="bookInfo">作者： <%= book.getAuthor() %></p>
<p class="bookInfo">出版社： <%= book.getPublisher() %></p>
<p class="bookInfo">类别： <%= book.getType() %></p>
<p class="bookInfo">单价： &yen;<%= book.getPrice() %></p>
<p class="bookInfo"><a href="#" onClick="window.open('<%=
cartURL %>','s','width=300,height=300,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src="source/shoppingCart.jpg" width="50" height="21" border="0"></a></p></td>
<% } else { %>
<td width="23%" height="200">&nbsp;</td>
<td width="22%" height="200">&nbsp;</td>
<% } %>
<td height="200" >&nbsp;</td>
<% if(index+6<=booklist.size()){
BookInf book= (BookInf)booklist.elementAt(index+5);
String imgURL="source/"+book.getId()+".JPG";
String commentURL="/bookshop/bookComment.jsp?bookId="+book.getId();
String cartURL="/bookshop/addCart.jsp?bookId="+book.getId();
%>
<td width="23%" ><a href="#" onClick="window.open('<%=
commentURL %>','s','width=850,height=600,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src=<%= imgURL %> width="135" height="200" border="0" ></a></td>
<td width="22%" ><p class="bookInfo">书名： <%= book.getName() %></p>
<p class="bookInfo">作者： <%= book.getAuthor() %></p>
<p class="bookInfo">出版社： <%= book.getPublisher() %></p>
<p class="bookInfo">类别： <%= book.getType() %></p>
<p class="bookInfo">单价： &yen;<%= book.getPrice() %></p>
<p class="bookInfo"><a href="#" onClick="window.open('<%=
cartURL %>','s','width=300,height=300,scrollbars=yes,resizeable=yes,ststus=yes');"><img
src="source/shoppingCart.jpg" width="50" height="21" border="0"></a></p></td>
<% } else { %>
<td width="23%" height="200">&nbsp;</td>
<td width="22%" height="200">&nbsp;</td>
<% } %>
</tr>
<tr valign="top">
<td height="23" colspan="6" ><div align="center">
<p>&nbsp;</p>
<%
String aft="/bookshop/index.jsp?pg="+Integer.toString(index/6+2);
String pre="/bookshop/index.jsp?pg="+Integer.toString(index/6);
if(pg.equals("1")){
if(Integer.parseInt(pg)<pgSum){
%>
<p> 上 一 页 &nbsp;&nbsp;&nbsp; 共 <%= pg %>/<%= pgSum %> 页
&nbsp;&nbsp;&nbsp;<a href=<%= aft %>>下一页 </a></p>
<% }else{ %>
<tr valign="top">
<td height="23" colspan="6" ><div align="right">
<p> 上 一 页 &nbsp;&nbsp;&nbsp; 共 <%= pg %>/<%= pgSum %> 页
&nbsp;&nbsp;&nbsp;下一页 </p>
<% }
} else {
if(Integer.parseInt(pg)<pgSum){
%>
<p><a href=<%= pre %>>上一页</a>&nbsp;&nbsp;&nbsp;共<%= pg %>/<%=
pgSum %>页&nbsp;&nbsp;&nbsp;<a href=<%= aft %>>下一页 </a></p>
<% } else {
%>
<p><a href=<%= pre %>>上一页</a>&nbsp;&nbsp;&nbsp;共<%= pg %>/<%=
pgSum %>页&nbsp;&nbsp;&nbsp;下一页</p>
<% }
} %>
</div></td>
</tr>
</table>
</div>
</td>
</tr>
</table>
<jsp:include page="/utility/copyRight.jsp" />
</div>
<br>
<jsp:include page="/utility/scriptMenuitem.jsp" />
</body>
<% } %>
</html>