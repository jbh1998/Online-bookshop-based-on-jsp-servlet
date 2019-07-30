<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.DBClass"
errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改用户资料</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<%
if(session.getAttribute("userId")==null)
{ %>
<jsp:forward page="/notLogin.jsp" />
<% } else {
String
id=(String)session.getAttribute("userId")
;
String message="";
String query="SELECT * FROM customer WHERE id="+"\'"+ id + "\'";
DBClass db=new DBClass();
db.connect();
ResultSet
resultset=db.executeQuery(query);
try{
resultset.next(); %>
<jsp:useBean id="errInf"
class="bean.UserInf" scope="request"/>
<body>
<div align="center">
<p><br>
<span class="siteName">修改用户资料
</span></p>
<form name="form" method="post"
action="/bookshop/ChangeUserInf">
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
<p align="center"><span
class="errInf"><jsp:getProperty
name="errInf"
property="password"/></span></p>
<p align="center">请再次输入密码： 
<input type="password"
name="password">
</p>
<p align="left">&nbsp;
</p></td>
</tr>
<tr>
<td height="5"
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>
<tr>
<td height="1"
bgcolor="#FFFFFF" ><div align="left">用户
信息
(请务必填入真实信息) </div>
<p align="left">姓 名：
<input name="name" type="text"
value=<%= resultset.getString("name") %>>
&nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf"
property="name"/></span></p>
<p align="left">性 别：
<%
if(resultset.getString("sex").equals("女")) {%>
<input name="sex"
type="radio" value="男" >
男
&nbsp;
<input type="radio"
name="sex" value="女" checked>
女 </p>
<div align="left">
<% } else { %>
<input name="sex"
type="radio" value="男" checked>
男&nbsp;
<input type="radio"
name="sex" value="女" >
女
<% } %>
</div>
<p align="left">地 址：
<input name="address"
type="text" id="address" value=<%=
resultset.getString("address") %>>
（请填入详细地址）
&nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf"
property="address"/></span></p>
<p align="left">邮 编：
<input type="text" name="code"
value=<%= resultset.getString("code") %>>
（ 6位数字） &nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf"
property="code"/></span></p>
<p align="left">电 话：
<input type="text" name="tel"
value=<%= resultset.getString("tel") %>>
（区号与电话之间不要有分隔符）
&nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf" property="tel"/></span></p>
<p align="left">E-mail：
<input type="text" name="email"
value=<%=
resultset.getString("email") %>>
（用于找回密码）
&nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf"
property="email"/></span></p>
<p align="center" >
<input type="submit"
name="Submit" value="提交" >
</p></td>
</tr>
<tr>
<td height="2"
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>
</table>
</form>
<p><a href="/bookshop/userInf.jsp">返回
</a></p>
</div>
</body>
<% }catch(SQLException sqle){
message+=sqle;
}
db.closeConnection();
} %>
</html>