<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.DBClass"
errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<%
if(session.getAttribute("userId")==null)
{ %>
<jsp:forward page="/notLogin.jsp" />
<% } else {
%>
<jsp:useBean id="errInf"
class="bean.StrClass" scope="request"/>
<body>
<div align="center">
<p><br>
<span class="siteName">修 改 密 码
</span></p>
<form name="form" method="post"
action="/bookshop/ChangeUserPwd">
<table width="713" border="0" >
<tr>
<td
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>
<tr>
<td height="11"
bgcolor="#FFFFFF" ><div
align="left"></div>
<p align="center">&nbsp;</p>
<p align="center"><span
class="errInf">
<jsp:getProperty name="errInf"
property="str"/>
</span></p>
<p align="center">旧密码：
&nbsp;&nbsp;&nbsp;&nbsp;
<input name="oldPwd"
type="password" id="oldPwd">
</p>
<p align="center">新密码：
&nbsp;&nbsp;&nbsp;&nbsp;
<input name="newPwd"
type="password" id="newPwd">
</p>
<p align="center">确认密码：
<input name="checkPwd"
type="password" id="checkPwd">
</p>
<p align="center">
<input type="submit"
name="Submit" value="提交">
</p>
<p align="left">&nbsp;
</p></td>
</tr>
<tr>
<td height="5"
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>

</table>
</form>
<p><a href="/bookshop/index.jsp">返回
</a></p>
</div>
</body>
<%
} %>
</html>