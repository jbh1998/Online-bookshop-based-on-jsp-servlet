/**该类为网上书店操作数据库的公用类，用于数据
库连接、查询和更新等操作**/
package bean;
import java.io.*;
import java.util.*;
import java.sql.*;
public class DBClass
{
private String driver;
private String url;
private String username;
private String password;
private Connection connection;
private Statement statement;
private String message="";
public DBClass()
{
driver="com.mysql.jdbc.Driver";
url="jdbc:mysql://127.0.0.1:3306/bookshop?useUnicode=true&characterEncoding=utf8&useSSL=false";
username="root";
password="justdoit,.jbh";
connection=null;
statement=null;
message="";
}
public DBClass(String driver,String
url,String username,String password)
{
this.driver=driver;
this.url=url;
this.username=username;
this.password=password;
this.connection=null;
this.statement=null;
this.message="";
}
public String getDriver()
{
return driver;
}
public void setDriver(String driver)
{
this.driver=driver;
}
public String getUrl()
{
return url;
}
public void setUrl(String url)
{
this.url=url;
}
public String getUsername()
{
return username;
}
public void setUsername(String
username)
{
this.username=username;
}
public String getPassword()
{
return password;
}
public void setPassword(String
password)
{
this.password=password;
}
public Connection getConnection()
{
return connection;
}
public void setConnection(Connection
connection)
{
this.connection=connection;
}
public Statement getStatement()
{
return statement;
}
public void setStatement(Statement
statement)
{
this.statement=statement;
}
public String getMessage()
{
return message;
}
public void setMessage(String message)
{
this.message=message;
}
public void connect()//连接数据库
{
try
{
Class.forName(driver);
connection=DriverManager.getConnection(
url,username,password);
statement=connection.createStatement();
}
catch(ClassNotFoundException cnfe)
{
message="connection:"+cnfe;
}
catch(SQLException sqle)
{
message="executeQuery:"+sqle;
}
}
public ResultSet executeQuery(String
query)//执行SQL查询并返回结果
{
ResultSet resultset=null;
try
{
resultset=statement.executeQuery(query)
;
}
catch(SQLException sqle)
{
message="executeQuery:"+sqle;
}
return resultset;
}
public void executeUpdate(String
command)//执行数据库更新操作
{
try
{
statement.executeUpdate(command);
}
catch(SQLException sqle)
{
message="executeUpdate:"+sqle;
}
}
public void closeConnection()//关闭数据库连接
{
try
{
connection.close();
}
catch(SQLException sqle)
{
message="closeConnection:"+sqle;
}
}
}
