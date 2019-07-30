//-------用于修改用户密码-------//
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.DBClass;
import bean.StrClass;
public class ChangeUserPwd extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String id=(String)session.getAttribute("userId");
String toJsp="";
StrClass errInf=new StrClass();
DBClass db=new DBClass();
String oldPwd=request.getParameter("oldPwd");
String newPwd=request.getParameter("newPwd");
String checkPwd=request.getParameter("checkPwd");
if(oldPwd.equals("")||newPwd.equals("")||checkPwd.equals(""))// 判 断 新旧密码是否合法
{
errInf.setStr("*表单各项均必填！ ");
toJsp="/changePassword.jsp";
}
else if(newPwd.length()>12||newPwd.length()<6)
{
errInf.setStr("*新密码必须为 6~12 位！ ");
toJsp="/changePassword.jsp";
}
else if(!newPwd.equals(checkPwd))
{
errInf.setStr("*新密码与确认密码不一致！ ");
toJsp="/changePassword.jsp";
}
else if(!ChangeUserInf.isMatch(db, id, oldPwd))
{
errInf.setStr("*旧密码不正确！ ");
toJsp="/changePassword.jsp";
}
else //修改密码
{
toJsp="/operationSuccess.jsp";
String command="UPDATE customer SET "
+"password=" + "'"+ newPwd + "'"
+" WHERE id=" +"'"+ id + "'";
db.connect();
db.executeUpdate(command);
db.closeConnection();
}
request.setAttribute("errInf",errInf);
RequestDispatcher dispatcher=request.getRequestDispatcher(toJsp);
dispatcher.forward(request, response);
}
public void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
doGet(request, response);
}
}