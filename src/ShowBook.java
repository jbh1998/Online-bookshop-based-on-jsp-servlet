//-------判断需显示图书并从数据库中读出对应图书信息-------//
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import bean.BookInf;
import bean.DBClass;
import bean.StrClass;
public class ShowBook extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html,character=utf-8");
response.setCharacterEncoding("UTF-8");
String key=request.getParameter("key");//储存用户搜索信息
String message="";
Vector booklist=new Vector();//显示待显示图书的信息
HttpSession session=request.getSession();
String query="SELECT * FROM book WHERE ";//储存 SQL 语句
if(session.getAttribute("boolist")!=null)
{
session.removeAttribute("boolist");
}
if(key==null)//用户没有进行站内搜索
{
if(request.getParameter("type")==null)
{
query+="ifNew='yes'";
}
else
{
String type="";
if(request.getParameter("type").equals("computer"))
{
type="计算机";
}
if(request.getParameter("type").equals("electron"))
{
type="电子";
}
if(request.getParameter("type").equals("communication"))
{
type="通信";
}
if(request.getParameter("type").equals("biology"))
{
type="生物";
}
if(request.getParameter("type").equals("iatrology"))
{
type="医学";
}
if(request.getParameter("type").equals("geography"))
{
type="地理";
}
if(request.getParameter("type").equals("astronomy"))
{
type="天文";
}
if(request.getParameter("type").equals("machine"))
{
type="机械";
}
if(request.getParameter("type").equals("chemistry"))
{
type="化学";
}
if(request.getParameter("type").equals("physics"))
{
type="物理";
}
if(request.getParameter("type").equals("maths"))
{
type="数学";
}
if(request.getParameter("type").equals("literature"))
{
type="文学";
}
if(request.getParameter("type").equals("art"))
{
type="美术";
}
if(request.getParameter("type").equals("music"))
{
type="音乐";
}
if(request.getParameter("type").equals("photography"))
{
type="摄影";
}
if(request.getParameter("type").equals("sculpture"))
{
type="雕塑";
}
if(request.getParameter("type").equals("modernart"))
{
type="现代艺术";
}
if(request.getParameter("type").equals("folkart"))
{
type="中国民间艺术";
}
if(request.getParameter("type").equals("dress"))
{
type="时装";
}
if(request.getParameter("type").equals("sociality"))
{
type="社交";
}
if(request.getParameter("type").equals("cook"))
{
type="烹饪";
}
if(request.getParameter("type").equals("home"))
{
type="家居";
}
if(request.getParameter("type").equals("car"))
{
type="汽车";
}
if(request.getParameter("type").equals("health"))
{
type="保健";
}
if(request.getParameter("type").equals("health"))
{
type="宠物";
}
if(request.getParameter("type").equals("economy"))
{
type="经济";
}
if(request.getParameter("type").equals("law"))
{
type="法律";
}
if(request.getParameter("type").equals("politics"))
{
type="政治";
}
if(request.getParameter("type").equals("philosophy"))
{
type="哲学";
}
if(request.getParameter("type").equals("history"))
{
type="历史";
}
if(request.getParameter("type").equals("military"))
{
type="军事";
}
if(request.getParameter("type").equals("religion"))
{
type="宗教";
}
if(request.getParameter("type").equals("fashion"))
{
type="时尚";
}
if(request.getParameter("type").equals("film"))
{
type="影视";
}
if(request.getParameter("type").equals("cartoon"))
{
type="动漫";
}
if(request.getParameter("type").equals("travel"))
{
type="旅游";
}
if(request.getParameter("type").equals("sport"))
{
type="运动";
}
if(request.getParameter("type").equals("science"))
{
type="科幻";
}
if(request.getParameter("type").equals("fight"))
{
type="武侠";
}
if(request.getParameter("type").equals("chess"))
{
type="棋牌";
}
if(request.getParameter("type").equals("baby"))
{
type="幼儿启蒙";
}
if(request.getParameter("type").equals("teaching"))
{
type="中小学教材";
}
if(request.getParameter("type").equals("reference"))
{
type="教学参考书";
}
if(request.getParameter("type").equals("reading"))
{
type="课外读物";
}
if(request.getParameter("type").equals("copybook"))
{
type="字帖";
}
if(request.getParameter("type").equals("picture"))
{
type="画册";
}
if(request.getParameter("type").equals("comity"))
{
type="礼仪";
}
query+="type="+"\'"+ type + "\'";
}
}
else//请求来自用户搜索
{
query+="name LIKE " + "\'%"+ key+ "%\'"
+ " OR author LIKE " + "\'%"+ key + "%\'"
+ " OR publisher LIKE " + "\'%"+ key+ "%\'";
}
DBClass db=new DBClass();
db.connect();
ResultSet resultset=null;
resultset=db.executeQuery(query);
try
{
while(resultset.next())
{
BookInf book=new BookInf(resultset.getString("id"),
resultset.getString("name"),
resultset.getString("author"),
resultset.getString("publisher"),
resultset.getString("price"),
resultset.getString("type"));
booklist.addElement(book);
}
}
catch(SQLException sqle)
{
message="executeUpdate:"+sqle;
}
db.closeConnection();
session.setAttribute("booklist",booklist);
response.sendRedirect("/bookshop/index.jsp");
}
public void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException
{
doGet(request, response);
}
}
