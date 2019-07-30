//---------负责储存用户信息---------//
package bean;
import java.util.*;
public class UserInf
{
private String id;//帐号
private String password;//密码
private String name;//姓名
private String sex;//性别
private String address;//地址
private String code;//邮编
private String tel;//电话
private String email;//E-mail
public UserInf()
{
id=""; password="";
name=""; sex="";
address=""; code="";
tel=""; email="";
}
public UserInf(String id,String
password,String name,String sex,String
address,String code,String tel,String
email)
{
this.id=id; this.password=password;
this.name=name; this.sex=sex;
this.address=address; this.code=code;
this.tel=tel; this.email=email;
}
public String getId()
{
return(id);
}
public void setId(String id)
{
this.id=id;
}
public String getPassword()
{
return(password);
}
public void setPassword(String
password)
{
this.password=password;
}
public String getName()
{
return(name);
}
public void setName(String name)
{
this.name=name;
}
public String getSex()
{
return(sex);
}
public void setSex(String sex)
{
this.sex=sex;
}
public String getAddress()
{
return(address);
}
public void setAddress(String address)
{
this.address=address;
}
public String getCode()
{
return(code);
}
public void setCode(String code)
{
this.code=code;
}
public String getTel()
{
return(tel);
}
public void setTel(String tel)
{
this.tel=tel;
}
public String getEmail()
{
return(email);
}
public void setEmail(String email)
{
this.email=email;
}
}