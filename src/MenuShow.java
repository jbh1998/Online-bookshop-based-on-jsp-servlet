//-------显示用户菜单-------//
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class MenuShow extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
//---如果 session 中有 hidden 变量，则移除；否则保持原状---//
if(session.getAttribute("hidden")!=null)
{
session.removeAttribute("hidden");
}
String
toJsp=request.getParameter("jspURL")+"?"+request.getParameter("param");
response.sendRedirect(toJsp);
}
}