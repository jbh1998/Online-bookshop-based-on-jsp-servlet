//-------删除注册用户-------//
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.DBClass;
public class DeleteUser extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String toJsp="/bookshop/customerManage.jsp";
if(session.getAttribute("adminId")!=null)
{
if(request.getParameterValues("userId")!=null)
{
String[] id=request.getParameterValues("userId");
DBClass db=new DBClass();
db.connect();
for(int i=0;i<id.length;i++)
{
String command="DELETE FROM customer WHERE id="+"'"+ id[i]
+ "'";
db.executeUpdate(command);
command="DELETE FROM userorder WHERE user="+"'"+ id[i] +
"'";
db.executeUpdate(command);
command="DELETE FROM orderlist WHERE user="+"'"+ id[i] +
"'";
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