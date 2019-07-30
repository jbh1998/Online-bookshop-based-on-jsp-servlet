//-------将用户订单写入数据库-------//
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.DBClass;
import bean.CartInf;
public class SubmitOrder extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String toJsp="/bookshop/myCart.jsp";
//---检查用户是否登陆---//
if(session.getAttribute("userId")==null)
{
toJsp="/bookshop/notLogin.jsp";
}
else
{
String user=(String)session.getAttribute("userId");
Vector list=(Vector)session.getAttribute("cartList");
int key=0;
String id="";
String date="";
String totalMoney=request.getParameter("money");//获取订单总金额
GregorianCalendar d=new GregorianCalendar();//获取订单提交日期
date=Integer.toString(d.get(Calendar.YEAR))+"-"
+Integer.toString(d.get(Calendar.MONTH)+1)+"-"
+Integer.toString(d.get(Calendar.DAY_OF_MONTH));
int n=list.size();
//---更新数据库---//
String query="SELECT id FROM userorder";
DBClass db=new DBClass();
db.connect();
ResultSet resultset=db.executeQuery(query);
try
{
while(resultset.next())
{
key=Integer.parseInt(resultset.getString("id"));
key++;
}
id=Integer.toString(key);
String command="INSERT INTO userorder VALUES("
+ "'" + id+ "'"+ ","
+ "'" + user + "'"+ ","
+ "'" + date + "'"+ ","
+ "'" + totalMoney + "'"+ ")";
db.executeUpdate(command);
for(int i=0;i<n;i++)
{
CartInf cart=(CartInf)list.elementAt(i);
query="SELECT price FROM book WHERE id ="+"'"
+cart.getBookId()+"\'";
resultset=db.executeQuery(query);
resultset.next();
float
money=cart.getBookNum()*Float.parseFloat(resultset.getString("price"));
command="INSERT INTO orderlist VALUES("
+ "'" + id + "'"+ ","
+ "'" + user + "'"+ ","
+ "'" + cart.getBookId() + "'"+ ","
+ "'" + Integer.toString(cart.getBookNum())+ "'"+ ","
+ "'" + Float.toString(money) + "')";
db.executeUpdate(command);
}
db.closeConnection();
}
catch(SQLException sqle)
{
System.err.println(sqle);
}
session.removeAttribute("cartList");
}
response.sendRedirect(toJsp);
}
public void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
doGet(request,response);
}
}