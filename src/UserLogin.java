//-------用户帐号与密码(登录是否成功)-------//
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.UserInf;
import bean.DBClass;
import bean.StrClass;
public class UserLogin extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String toJsp="/hasLogin.jsp";
if(session.getAttribute("userId")==null)
{
String id=request.getParameter("id");
String pwd=request.getParameter("password");
String query="SELECT * FROM customer WHERE id="+"'"+ id + "'"
+"AND password="+"'"+ pwd + "'";
DBClass db=new DBClass();
db.connect();
ResultSet resultset=db.executeQuery(query);
try
{
if(resultset.next())
{
session.setAttribute("userId", id);
toJsp="/loginSuccess.jsp";
}
else
{
toJsp="/userLogin.jsp";
request.setAttribute("errInf","*密码与帐号不匹配");
}
}
catch(SQLException sqle)
{
System.err.println("Erro with connection:"+sqle);
}
db.closeConnection();
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