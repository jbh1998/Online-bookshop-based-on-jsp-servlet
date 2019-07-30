//------储存图书信息------//
package bean;
import java.util.*;
public class BookInf
{
private String id;//书号
private String name;//书名
private String author;//作者
private String publisher;//出版社
private String type;//类型
private String price;//单价
public BookInf()
{
id="";
name="";
author="";
publisher="";
price="";
type="";
}
public BookInf(String id,String name,String
author,String publisher,String price,String type)
{
this.id=id;
this.name=name;
this.author=author;
this.publisher=publisher;
this.price=price;
this.type=type;
}
public String getId()
{
return id;
}
public void setId(String id)
{
this.id=id;
}
public String getName()
{
return name;
}
public void setName(String name)
{
this.name=name;
}
public String getAuthor()
{
return author;
}
public void setAuthor(String author)
{
this.author=author;
}
public String getPublisher()
{
return publisher;
}
public void setPublisher(String publisher)
{
this.publisher=publisher;
}
public String getPrice()
{
return price;
}
public void setPrice(String price)
{
this.price=price;
}
public String getType()
{
return type;
}
public void setType(String type)
{
this.type=type;
}
}
