//------组成购物车------//
package bean;
import java.util.*;
public class CartInf
{
private String bookId;//书号
private int bookNum;//用户订购的数量
public CartInf()
{
bookId="";
bookNum=0;
}
public CartInf(String bookId,int
bookNum)
{
this.bookId=bookId;
this.bookNum=bookNum;
}
public String getBookId()
{
return(bookId);
}
public void setBookId(String bookId)
{
this.bookId=bookId;
}
public int getBookNum()
{
return(bookNum);
}
public void setBookNum(int bookNum)
{
this.bookNum=bookNum;
}
}