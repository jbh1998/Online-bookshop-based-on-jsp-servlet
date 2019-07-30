//-------用于修改图书信息-------//
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.BookInf;
import bean.DBClass;
public class ChangeBookInf extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String toJsp="/bookManage.jsp";
BookInf errInf=new BookInf();
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String name=request.getParameter("name").trim();
String author=request.getParameter("author").trim();
String publisher=request.getParameter("publisher").trim();
String type=request.getParameter("type");
String price=request.getParameter("price").trim();
String ifNew=request.getParameter("ifNew").trim();
DBClass db=new DBClass();
//-------检查表单信息的合法性-------//
if(name.equals(""))
{
errInf.setName("*本项必须填写!");
toJsp="/changeBookInf.jsp?bookId="+id;
}
if(author.equals(""))
{
errInf.setAuthor("*本项必须填写!");
toJsp="/changeBookInf.jsp?bookId="+id;
}
if(publisher.equals(""))
{
errInf.setPublisher("*本项必须填写!");
toJsp="/changeBookInf.jsp?bookId="+id;
}
if(type.equals("0"))
{
errInf.setType("*本项必须填写!");
toJsp="/changeBookInf.jsp?bookId="+id;
}
if(price.equals(""))
{
errInf.setPrice("*本项必须填写!");
toJsp="/changeBookInf.jsp?bookId="+id;
}
if(toJsp.equals("/bookManage.jsp"))//更新数据库
{
String command="UPDATE book SET "
+"name="+ "\'"+ name + "\'"+ ","
+"author="+ "\'"+ author + "\'"+ ","
+"publisher="+ "\'"+ publisher + "\'"+ ","
+"type="+ "\'"+ type + "\'"+ ","
+"price="+ "\'"+ price + "\'"+ ","
+"ifNew="+ "\'"+ ifNew + "\'"
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
//-----用于判断帐号与密码是否匹配-----//
static public boolean isMatch(DBClass db,String id,String pwd)
{
boolean bool=false;
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