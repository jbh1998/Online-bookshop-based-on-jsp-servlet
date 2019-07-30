//-------删除图书-------//
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.DBClass;
public class DeleteBook extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String toJsp="/bookshop/bookManage.jsp";
if(session.getAttribute("adminId")!=null)
{
if(request.getParameterValues("bookId")!=null)
{
String[] id=request.getParameterValues("bookId");
DBClass db=new DBClass();
db.connect();
for(int i=0;i<id.length;i++)
{
String command="DELETE FROM book WHERE id="+"'"+ id[i] +
"'";
db.executeUpdate(command);
command="DELETE FROM bookcomment WHERE bookId="+"'"+
id[i] + "'";
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