//-------隐藏用户菜单-------//
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class MenuHidden extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
//---如果 session 中没有 hidden 变量，则设置一个；否则保持原状---//
if(session.getAttribute("hidden")==null)
{
session.setAttribute("hidden","hidden");
}
String
toJsp=request.getParameter("jspURL")+"?"+request.getParameter("param");
response.sendRedirect(toJsp);
}
}