<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,bean.CartInf"
errorPage="" %>
<td width="19%" height="731"
bgcolor="#D1D7D7" />
<% GregorianCalendar date=new
GregorianCalendar();%>
<div class="relatedLinks">
<h3 >管理员,您好!</h3>
<p>今天是<%=
date.get(Calendar.MONTH)+1 %>月<%=
date.get(Calendar.DAY_OF_MONTH) %>日</p>
</div>
<div id="sectionLinks">
<div align="center">
<a href="/bookshop/admin.jsp">订单管
理</a>
<a
href="/bookshop/customerManage.jsp">用户管
理</a>
<a
href="/bookshop/bookManage.jsp">书籍管理
</a>
<a href="/bookshop/AdminExit">离开
书店</a>
</div>
</div>
<div id="advert">
<p></p>
</div>
</td>