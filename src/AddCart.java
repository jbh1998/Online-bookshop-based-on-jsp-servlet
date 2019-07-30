//-------向购物车中添加图书-------//
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.CartInf;
import bean.StrClass;
public class AddCart extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String toJsp="/addCartSuccess.jsp";
String bookId=request.getParameter("bookId");
StrClass bookNum=new StrClass(request.getParameter("bookNum"));
//-------检测用户输入所需数量是否为整数-------//
if(!bookNum.isNum())
{
request.setAttribute("errInf","*请输入自然数");
toJsp="/addCart.jsp";
}
else
{
Vector list=new Vector();
if(session.getAttribute("cartList")!=null)
{
list=(Vector)session.getAttribute("cartList");
session.removeAttribute("cartList");
for(int i=0;i<list.size();i++)
{
CartInf cart =(CartInf)list.elementAt(i);
if(bookId.equals(cart.getBookId()))
{
list.removeElementAt(i); break;
}
}
}
CartInf cart=new CartInf(bookId,bookNum.toInt());//添加图书至购物车
list.addElement(cart);
session.setAttribute("cartList",list);
}
RequestDispatcher dispatcher=request.getRequestDispatcher(toJsp);
dispatcher.forward(request, response);
}
public void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
doGet(request,response);
}
}