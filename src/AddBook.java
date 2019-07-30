//------添加图书------//
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.BookInf;
import bean.DBClass;
import bean.StrClass;
public class AddBook extends HttpServlet
{
public void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException,IOException
{
HttpSession session=request.getSession();
String toJsp="/bookManage.jsp";//toJsp 用于储存本 Servlet 将要转到的 JSP地址
BookInf errInf=new BookInf();//errInf 用于储存错误提示信息
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id").trim();
String name=request.getParameter("name").trim();
String author=request.getParameter("author").trim();
String publisher=request.getParameter("publisher").trim();
String type=request.getParameter("type");
String ifNew=request.getParameter("ifNew").trim();//此处修改
String price=request.getParameter("price").trim();
//id = code(id);
DBClass db=new DBClass();
//------检查表单信息的合法性------//
if(id.equals(""))
{
errInf.setId("*本项必须填写!");
toJsp="/addBook.jsp";
}
else if(isExist(id))
{
errInf.setId("*与其它图书的 ID 冲突!");
toJsp="/addBook.jsp";
}
if(name.equals(""))
{
errInf.setName("*本项必须填写!");
toJsp="/addBook.jsp";
}
if(author.equals(""))
{
errInf.setAuthor("*本项必须填写!");
toJsp="/addBook.jsp";
}
if(publisher.equals(""))
{
errInf.setPublisher("*本项必须填写!");
toJsp="/addBook.jsp";
}
if(type.equals("0"))
{
errInf.setType("*本项必须填写!");
toJsp="/addBook.jsp";
}
if(price.equals(""))
{
errInf.setPrice("*本项必须填写!");
toJsp="/addBook.jsp";
}
if(toJsp.equals("/bookManage.jsp"))//添加图书
{
String command="INSERT INTO book VALUES("
+ "\'"+ id + "\'"+ ","
+ "\'"+ name + "\'"+ ","
+ "\'"+ author + "\'"+ ","
+ "\'"+ publisher + "\'"+ ","
+ "\'"+ type + "\'"+ ","
+ "\'"+ ifNew + "\'"+ ","
+ "\'"+ price + "\'"+ ")";
db.connect();
db.executeUpdate(command);
db.closeConnection();
}
request.setAttribute("errInf",errInf);
RequestDispatcher dispatcher=request.getRequestDispatcher(toJsp); 
dispatcher.forward(request, response);
}
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException,IOException
{
doGet(request, response);
}
public boolean isExist(String id)
{
boolean bool =false;
String query="SELECT * FROM book WHERE id="+"\'"+ id +"\'";
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