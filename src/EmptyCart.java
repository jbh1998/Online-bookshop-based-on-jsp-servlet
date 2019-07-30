//-------清空购物车-------//
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class EmptyCart extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
if(session.getAttribute("cartList")!=null)
{
session.removeAttribute("cartList");
}
RequestDispatcher dispatcher=request.getRequestDispatcher("/UserExit");
dispatcher.forward(request, response);
}
}