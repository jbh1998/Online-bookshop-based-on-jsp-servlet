//-------删除书评信息-------//
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.DBClass;
public class DeleteComment extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String bookId=request.getParameter("bookId");
String toJsp="/bookshop/commentManage.jsp?bookId="+bookId;
if(session.getAttribute("adminId")!=null)
{
if(request.getParameterValues("id")!=null)
{
String[] id=request.getParameterValues("id");
DBClass db=new DBClass();
db.connect();
for(int i=0;i<id.length;i++)
{
String command="DELETE FROM bookcomment WHERE id="+"'"+ id[i] + "'";
db.executeUpdate(command);
}
db.closeConnection();
}
}
response.sendRedirect(toJsp);
}
public void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
doGet(request,response);
}
}