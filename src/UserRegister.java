import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.UserInf;
import bean.DBClass;
import bean.StrClass;
public class UserRegister extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
String toJsp="/registerSuccess.jsp";//toJsp 用于储存本 Servlet 将要转到的JSP 地址
UserInf errInf=new UserInf();//errInf 用于储存错误提示信息
StrClass str=new StrClass();
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id").trim();
String pwd=request.getParameter("password");
String checkPwd=request.getParameter("checkPwd");
String name=request.getParameter("name").trim();
String sex=request.getParameter("sex").trim();
String address=request.getParameter("address").trim();
String code=request.getParameter("code").trim();
String tel=request.getParameter("tel").trim();
String email=request.getParameter("email").trim();
UserInf user=new UserInf(id,pwd,name,sex,address,code,tel,email);
if(id.equals(""))
{
errInf.setId("*本项必须填写!");
toJsp="/userRegister.jsp";
}
else if(id.length()>10||id.length()<4)
{
errInf.setId("*长度不符合要求!");
user.setId("");
toJsp="/userRegister.jsp";
}
else if(isExist(id))
{
errInf.setId("*帐号已经存在!");
user.setId("");
toJsp="/userRegister.jsp";
}
//---检验申请密码是否合法---//
if(pwd.equals(""))
{
errInf.setPassword("*本项必须填写!");
toJsp="/userRegister.jsp";
}
else if(pwd.length()>12||pwd.length()<6)
{
errInf.setPassword("*长度不符合要求!");
user.setPassword("");
toJsp="/userRegister.jsp";
}
else if(!pwd.equals(checkPwd))
{
errInf.setPassword("*与确认密码不符!");
user.setPassword("");
toJsp="/userRegister.jsp";
}
if(name.equals(""))//检验用户姓名是否合法
{
errInf.setName("*本项必须填写!");
toJsp="/userRegister.jsp";
}
if(address.equals(""))//检验用户地址是否合法
{
errInf.setAddress("*本项必须填写!");
toJsp="/userRegister.jsp";
}
else if(address.length()<10)
{
errInf.setAddress("*请填写详细地址!");
user.setAddress("");
toJsp="/userRegister.jsp";
}
if(code.equals(""))//检验邮编是否合法
{
errInf.setCode("*本项必须填写!");
toJsp="/userRegister.jsp";
}
else if(code.length()!=6)
{
errInf.setCode("*邮编应该为 6 位数字!");
user.setCode("");
toJsp="/userRegister.jsp";
}
else
{
str.setStr(code);
if(!str.isNum())
{
errInf.setCode("*邮编应该为 6 位数字!");
user.setCode("");
toJsp="/userRegister.jsp";
}
}
if(tel.equals(""))//检验电话是否合法
{
errInf.setTel("*本项必须填写!");
toJsp="/userRegister.jsp";
}
else
{
str.setStr(tel);
if(!str.isNum())
{
errInf.setTel("*电话号码应该为数字!");
user.setTel("");
toJsp="/userRegister.jsp";
}
}
if(email.equals(""))//检验 E-mail 是否合法
{
errInf.setEmail("*本项必须填写!");
toJsp="/userRegister.jsp";
}
else
{
str.setStr(email);
if(!str.isEmail())
{
errInf.setEmail("*E-mial 地址有误!");
user.setEmail("");
toJsp="/userRegister.jsp";
}
}
if(!toJsp.equals("/userRegister.jsp"))//将注册信息写入数据库
{
String command="INSERT INTO customer VALUES("
+ "'"+ id + "'"+ ","
+ "'"+ pwd + "'"+ ","
+ "'"+ name + "'"+ ","
+ "'"+ sex + "'"+ ","
+ "'"+ address + "'"+ ","
+ "'"+ code + "'"+ ","
+ "'"+ tel + "'"+ ","
+ "'"+ email + "'"+ ")";
DBClass db=new DBClass();
db.connect();
db.executeUpdate(command);
db.closeConnection();
}
request.setAttribute("errInf",errInf);
request.setAttribute("userInf",user);
RequestDispatcher dispatcher=request.getRequestDispatcher(toJsp);
dispatcher.forward(request, response);
}
public void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
doGet(request, response);
}
public boolean isExist(String id)
{
boolean bool=false;
String query="SELECT * FROM customer WHERE id="+"'"+ id + "'";
DBClass db=new DBClass();
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