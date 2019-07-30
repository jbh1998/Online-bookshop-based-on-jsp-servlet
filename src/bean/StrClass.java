/**
* 该类为网上书店字符串检测操作公用类，负责对
表单字符串进行检测和操作
* 判断字符串是否为数字或E-mail地址，并负责将
字符串转化为整数或浮点数
*/
package bean;
import java.util.*;
public class StrClass
{
private String str;
public StrClass()
{
str="";
}
public StrClass(String str)
{
this.str=str;
}
public String getStr()
{
return this.str;
}
public void setStr(String str)
{
this.str=str;
}
//------测试字符串是否为数字：是返回true；否则返回false------//
public boolean isNum()
{
boolean bool=true;
for(int i=0;i<str.length();i++)
{
char ch=str.charAt(i);
if(!Character.isDigit(ch))
{
bool=false; break;
}
}
return bool;
}
//------测试字符串是否为E-mail地址：是返回true；否则返回false------//
public boolean isEmail()
{
if(str.indexOf("@")==-1)
{
return false;
}
else
if(str.indexOf(".",str.indexOf("@"))==-1)
{
return false;
}
else { return true; }
}
public int toInt()//将字符串转化为整数
{
return Integer.parseInt(str);
}
public float toFloat()//将字符串转化为浮点数
{
return Float.parseFloat(str);
}
}