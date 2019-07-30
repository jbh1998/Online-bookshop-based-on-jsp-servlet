<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,bean.CartInf"
errorPage=""%>
<td width="19%" height="731"
bgcolor="#D1D7D7" />
<%
if(session.getAttribute("userId")==null){
%>
<div class="relatedLinks">
<p>&nbsp; </p>
<form name="form" method="post"
action="/bookshop/UserLogin">
<p>帐号:
<input name="id" type="text" id="id"
size="12">
</p>
<p>密码:
<input name="password" type="password"
id="password" size="12">
</p>
<p align="center">
<input type="submit" name="Submit"
value="登陆">
</p>
</form>
</div>
<% } else {
GregorianCalendar date=new
GregorianCalendar();%>
<div class="relatedLinks">
<h3 ><%=
(String)session.getAttribute("userId") %>
,欢迎您光临!</h3>
<p>今天是<%=
date.get(Calendar.MONTH)+1 %>月<%=
date.get(Calendar.DAY_OF_MONTH) %>日</p>
</div>
<%
}%>
<div id="sectionLinks">
<div align="center">
<a href="/bookshop/myCart.jsp">我的
购物车</a>
<a href="/bookshop/userOrder.jsp">
历史订单</a>
<a
href="/bookshop/changePassword.jsp">修改密
码</a>
<a href="/bookshop/userInf.jsp">个
人资料</a>
<a href="/bookshop/UserExit">离开
书店</a>
</div>
</div>
<div id="advert">
<p></p>
</div>
</td>