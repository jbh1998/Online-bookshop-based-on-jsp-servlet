<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户注册</title>
<link href="source/bookshop.css"
rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="userInf"
class="bean.UserInf" scope="request"/>
<jsp:useBean id="errInf"
class="bean.UserInf" scope="request"/>
<div align="center">
<p><br>
<span class="siteName">用 户 注 册
</span></p>
<form name="userRegister" method="post"
action="/bookshop/UserRegister">
<table width="713" border="0" >
<tr>
<td
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>
<tr>
<td height="11" bgcolor="#FFFFFF" >
<div align="left">帐 号 信 息 
</div>
<p align="left">帐 号：
<input name="id" type="text"
value="<jsp:getProperty name="userInf"
property="id"/>">
（不含空格，长度为4~10位）
&nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf" property="id"/></span></p>
<p align="left">密 码： 
<input type="password"
name="password">
（不含空格，长度为6~12位）
&nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf"
property="password"/></span> </p>
<p align="left">确 认：
<input type="password"
name="checkPwd">
（再次输入密码） </p>
</td>
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
value="<jsp:getProperty name="userInf"
property="name"/>">
&nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf"
property="name"/></span></p>
<p align="left">性 别：
<% if(userInf.getSex().equals("女"))
{%>
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
type="text" id="address"
value="<jsp:getProperty name="userInf"
property="address"/>">
（请填入详细地址）
&nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf"
property="address"/></span></p>
<p align="left">邮 编：
<input name="code" type="text"
value="<jsp:getProperty name="userInf"
property="code"/>">
（ 6位数字） &nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf"
property="code"/></span></p>
<p align="left">电 话：
<input name="tel" type="text"
value="<jsp:getProperty name="userInf"
property="tel"/>">
（区号与电话之间不要有分隔符）
&nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf" property="tel"/></span></p>
<p align="left">E-mail：
<input name="email" type="text"
value="<jsp:getProperty name="userInf"
property="email"/>">
（请正确填写）
&nbsp;&nbsp;&nbsp;&nbsp;<span
class="errInf"><jsp:getProperty
name="errInf" property="email"/></span>
</p>
<p align="center" >
<input type="submit"
name="Submit" value="提交" >
<input type="reset"
name="Submit" value="重置">
</p></td>
</tr>
<tr>
<td height="2"
background="source/glbnav_background.gif"
bgcolor="#FFFFFF" >&nbsp;</td>
</tr>
</table>
<p><div style="font-size:16px"><a
href="/bookshop/index.jsp">返回
</a></div></p>
</form>
</div>
</body>
</html>