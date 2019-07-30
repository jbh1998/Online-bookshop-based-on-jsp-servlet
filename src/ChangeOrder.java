//-------用于修改用户订单-------//
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.StrClass;
import bean.CartInf;
public class ChangeOrder extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
Vector list=(Vector)session.getAttribute("cartList");
String errInf=" ";
String address="";
int n=list.size();
for(int i=0;i<n;i++)
{
//---判断购物车中哪种图书的数量要修改---//
CartInf cart=(CartInf)list.elementAt(i);
String id=cart.getBookId();
if(request.getParameter(id)!=null)
{
StrClass str = new StrClass(request.getParameter(id));
if(str.isNum())
{
int num=Integer.parseInt(request.getParameter(id));
if(num==0)
{
list.removeElementAt(i);//如果图书的数量为 0,则从购物车中删去该种图书
}
else
{
cart.setBookNum(num);//更新购物车中该种图书的数量
list.setElementAt(cart,i);
}
}
else
{
errInf="请在修改预定的数量时输入自然数!";
}
break;
}
}
session.removeAttribute("cartList");
if(list.size()!=0)
{
session.setAttribute("cartList",list);
}
request.setAttribute("errInf",errInf);
RequestDispatcher dispatcher=request.getRequestDispatcher("/myCart.jsp");
dispatcher.forward(request, response);
}
public void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
doGet(request,response);
}
}