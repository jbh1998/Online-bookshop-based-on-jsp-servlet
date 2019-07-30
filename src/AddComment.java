//-------添加图书评论-------//
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.DBClass;
public class AddComment extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
int i=0;
String id="";
String userId="";
request.setCharacterEncoding("UTF-8");
String bookId=request.getParameter("bookId");
String stars=request.getParameter("stars");
String comment=request.getParameter("comment");
String toJsp="/bookshop/bookComment.jsp?bookId="+bookId;
HttpSession session=request.getSession();
if(session.getAttribute("userId")==null)
{
userId="游客";
}
else
{
userId=(String)session.getAttribute("userId");
}
String query="SELECT id FROM bookcomment";
DBClass db=new DBClass();
db.connect();
ResultSet resultset=db.executeQuery(query);
try
{
while(resultset.next())//为添加的图书评论设置 id 号
{
id=resultset.getString("id");
i=Integer.parseInt(id);
i++;
}
id=Integer.toString(i);
String command="INSERT INTO bookcomment VALUES("
+ "\'"+ id + "\'"+ ","
+ "\'"+ bookId + "\'"+ ","
+ "\'"+ userId + "\'"+ ","
+ "\'"+ comment + "\'"+ ","
+ "\'"+ stars + "\'"+ ")";
db.executeUpdate(command);//添加图书评论
db.closeConnection();
}
catch(SQLException sqle)
{
System.err.println("Erro with connection:"+sqle);
}
response.sendRedirect(toJsp);
}
public void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
doGet(request, response);
}
}