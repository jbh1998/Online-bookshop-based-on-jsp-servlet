//-------管理员退出------//
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class AdminExit extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String toJsp="/bookshop/index.jsp";
if(session.getAttribute("adminId")!=null)
{
session.removeAttribute("adminId");
toJsp="/bookshop/operationSuccess.jsp";
}
response.sendRedirect(toJsp);
}
}