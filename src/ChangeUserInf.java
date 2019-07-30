//------用于修改注册用户的个人信息------//
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.UserInf;
import bean.DBClass;
import bean.StrClass;
public class ChangeUserInf extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String toJsp="/operationSuccess.jsp";//toJsp 用于储存本 Servlet 将要转到的 JSP 地址
UserInf errInf=new UserInf();//errInf 用于储存错误提示信息
StrClass str=new StrClass();
request.setCharacterEncoding("UTF-8");
String id=(String)session.getAttribute("userId");
String pwd=request.getParameter("password");
String name=request.getParameter("name").trim();
String sex=request.getParameter("sex");
String address=request.getParameter("address").trim();
String code=request.getParameter("code").trim();
String tel=request.getParameter("tel").trim();
String email=request.getParameter("email").trim();
DBClass db=new DBClass();
if(pwd.equals(""))
{
errInf.setPassword("密码必须填写!");
toJsp="/changeInf.jsp";
}
else if(pwd.length()>12||pwd.length()<6)
{
errInf.setPassword("密码不正确!");
toJsp="/changeInf.jsp";
}
else if(!isMatch(db,id,pwd))
{
errInf.setPassword("密码不正确!");
toJsp="/changeInf.jsp";
}
if(name.equals(""))//检验用户姓名是否合法
{
errInf.setName("*本项必须填写!");
toJsp="/changeInf.jsp";
}
if(address.equals(""))//检验用户地址是否合法
{
errInf.setAddress("*本项必须填写!");
toJsp="/changeInf.jsp";
}
else if(address.length()<10)
{
errInf.setAddress("*请填写详细地址!");
toJsp="/changeInf.jsp";
}
if(code.equals(""))//检验邮编是否合法
{
errInf.setCode("*本项必须填写!");
toJsp="/changeInf.jsp";
}
else if(code.length()!=6)
{
errInf.setCode("*邮编应该为 6 位数字!");
toJsp="/changeInf.jsp";
}
else
{
str.setStr(code);
if(!str.isNum())
{
errInf.setCode("*邮编应该为 6 位数字!");
toJsp="/changeInf.jsp";
}
}
if(tel.equals(""))//检验电话是否合法
{
errInf.setTel("*本项必须填写!");
toJsp="/changeInf.jsp";
}
else
{
str.setStr(tel);
if(!str.isNum())
{
errInf.setTel("*电话号码应该为数字!");
toJsp="/changeInf.jsp";
}
}
if(email.equals(""))//检验 E-mail 是否合法
{
errInf.setEmail("*本项必须填写!");
toJsp="/changeInf.jsp";
}
else
{
str.setStr(email);
if(!str.isEmail())
{
errInf.setEmail("*E-mial 地址有误!");
toJsp="/changeInf.jsp";
}
}
if(!toJsp.equals("/changeInf.jsp"))
{
String command="UPDATE customer SET "
+"name=" + "\'"+ name + "\'"+ ","
+"sex="+ "\'"+ sex + "\'"+ ","
+"address="+ "\'"+ address + "\'"+ ","
+"code="+ "\'"+ code + "\'"+ ","
+"tel="+ "\'"+ tel + "\'"+ ","
+"email="+ "\'"+ email + "\'"
+"WHERE id=" +"\'"+ id + "\'";
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
static public boolean isMatch(DBClass db,String id,String pwd)
{
boolean bool =false;
String query="SELECT * FROM customer WHERE id="+"\'"+ id + "\'"
+" AND password="+"\'"+ pwd + "\'";
db.connect();
ResultSet resultset=db.executeQuery(query);
try
{
if(resultset.next())
{
bool=true;
}
}
catch(SQLException sqle)
{
System.err.println("Erro with connection:"+sqle);
}
db.closeConnection();
return bool;
}
}