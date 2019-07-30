//-------用户退出-------//
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class UserExit extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String toJsp="";
if(session.getAttribute("userId")==null)
{
toJsp="/bookshop/notLogin.jsp";
}
else if(session.getAttribute("cartList")!=null)
{
toJsp="/bookshop/cartFull.jsp";
}
else
{
session.removeAttribute("userId");
toJsp="/bookshop/operationSuccess.jsp";
}
response.sendRedirect(toJsp);
}
}