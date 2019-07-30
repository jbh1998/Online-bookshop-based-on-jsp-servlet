<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.DBClass"
errorPage="" %>
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
<jsp:useBean id="errInf"
class="bean.BookInf" scope="request"/>
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
href=<%= showAddr %>>显示</a> </td>f
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
action="/bookshop/AddBook">
<table width="100%" border="0" >
<tr>
<td
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>
<tr>
<td height="260" bgcolor="#FFFFFF" >
<div align="center">
<table width="411" border="0">
<tr>
<td width="76"><div
align="left">图书ID： </div></td>
<td width="325"><div
align="left">
<input name="id"
type="text" id="id">
<span class="errInf">
<jsp:getProperty
name="errInf" property="id"/>
</span></div></td>
</tr>
<tr>
<td><div align="left">
书名： </div></td>
<td>
<div align="left">
<input name="name"
type="text" >
<span class="errInf">
<jsp:getProperty
name="errInf" property="name"/> 
</span></div></td>
</tr>
<tr>
<td height="28"><div
align="left">作者： </div></td>
<td><div align="left">
<input name="author"
type="text" id="author" >
<span class="errInf">
<jsp:getProperty
name="errInf" property="author"/>
</span></div></td>
</tr>
<tr>
<td><div align="left">
出版社： </div></td>
<td><div align="left">
<input
name="publisher" type="text"
id="publisher" >
<span
class="errInf">
<jsp:getProperty
name="errInf" property="publisher"/>
</span></div></td>
</tr>
<tr>
<td><div align="left">
类别： </div></td>
<td><div align="left">
<select name="type"
id="type">
<option value="计算机">计
算机</option>
<option value="电子">电子
</option>
<option value="通信">通信
</option>
<option value="生物">生物
</option>
<option value="医学">医学
</option>
<option value="地理">地理
</option>
<option value="天文">天文
</option>
<option value="机械">机械
</option>
<option value="化学">化学
</option>
<option value="物理">物理
</option>
<option value="数学">数学
</option>
<option value="文学">文学
</option>
<option value="美术">美术
</option>
<option value="音乐">音乐
</option>
<option value="摄影">摄影
</option>
<option value="雕塑">雕塑
</option>
<option value="现代艺术">现代
艺术</option>
<option value="中国民间艺术">
中国民间艺术</option>
<option value="时装">时装
</option>
<option value="社交">社交
</option>

<option value="烹饪">烹饪
</option>
<option value="家居">家居
</option>
<option value="汽车">汽车
</option>
<option value="保健">保健
</option>
<option value="宠物">宠物
</option>
<option value="经济">经济
</option>
<option value="法律">法律
</option>
<option value="政治">政治
</option>
<option value="哲学">哲学
</option>
<option value="历史">历史
</option>
<option value="军事">军事
</option>
<option value="宗教">宗教
</option>
<option value="时尚">时尚
</option>
<option value="影视">影视
</option>
<option value="动漫">动漫
</option>
<option value="旅游">旅游
</option>
<option value="运动">运动
</option>
<option value="科幻">科幻
</option>
<option value="武侠">武侠
</option>
<option value="棋牌">棋牌
</option>
<option value="幼儿启蒙">幼儿
启蒙</option>
<option value="中小学教材">中
小学教材</option>

<option value="教学参考书">教
学参考书</option>
<option value="课外读物">课外
读物</option>
<option value="字帖">字帖
</option>
<option value="画册">画册
</option>
<option value="礼仪">礼仪
</option>
<option value="0"
selected>---请选择---</option>
</select><span
class="errInf"><jsp:getProperty
name="errInf" property="type"/>
</span></div>
</td>
</tr>
<tr>
<td height="40"><div
align="left">单价： </div></td>
<td><div align="left">
<input name="price"
type="text" id="price" >
<span
class="errInf">
<jsp:getProperty
name="errInf" property="price"/>
</span></div></td>
</tr>
<tr>
<td height="23"><div
align="left">推 荐： </div></td>
<td><p align="left" >
<input name="ifNew"
type="radio" value="yes" checked>是
&nbsp;
<input
type="radio" name="ifNew" value="no" >否
</p>
</td>
</tr>
</table>
<p>
<input type="submit"
name="Submit" value="提交">
</p>
</div></td>
</tr>
<tr>
<td height="5"
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
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