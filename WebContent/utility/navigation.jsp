<%@ page contentType="text/html; charset=UTF-8"%>
<table width="100%" border="0"
background="source/glbnav_background.gif"
align="center">
<tr>
<td width="1%" align="left"><img
src="source/gblnav_left.gif" alt=""
width="4" height="23" align="baseline" >
</td>
<td width="72%" align="left">
<a href="/bookshop/ShowBook" id="gl1"
class="glink"
onMouseOver="ehandler(event,menuitem1);">
新书推荐</a>
<a href="#" id="gl2" class="glink"
onMouseOver="ehandler(event,menuitem2);">
科 技</a>
<a href="#" id="gl3" class="glink"
onMouseOver="ehandler(event,menuitem3);">
艺 术</a>
<a href="#" id="gl4" class="glink"
onMouseOver="ehandler(event,menuitem4);">
生 活</a>
<a href="#" id="gl5" class="glink"
onMouseOver="ehandler(event,menuitem5);">
社 会</a>
<a href="#" id="gl6" class="glink"
onMouseOver="ehandler(event,menuitem6);">
娱 乐</a>
<a href="#" id="gl7" class="glink"
onMouseOver="ehandler(event,menuitem7);">
教 育</a>
</td>
<td width="26%" ><form
action="/bookshop/ShowBook"
method="post">
<div align="right">
<input name="key" type="text"
id="key" size="20">
<input name="search" type="submit"
value="站内搜索">
</div>
</form> </td>
<td width="1%" align="right"><img
src="source/glbnav_right.gif" alt=""
width="4" height="23"
align="baseline" ></td>
</tr>
</table>
<div id="subglobal1"
class="subglobalNav">
</div>
<div id="subglobal2"
class="subglobalNav">
<a
href="/bookshop/ShowBook?type=computer">计
算机</a> | <a
href="/bookshop/ShowBook?type=electron">电
子</a> | <a
href="/bookshop/ShowBook?type=communicati
on">通 信</a> | <a
href="/bookshop/ShowBook?type=biology">生
物</a> | <a
href="/bookshop/ShowBook?type=iatrology">
医 学</a> | <a
href="/bookshop/ShowBook?type=geography">
地 理</a> | <a
href="/bookshop/ShowBook?type=astronomy">
天 文</a> | <a
href="/bookshop/ShowBook?type=machine">机
械</a> | <a
href="/bookshop/ShowBook?type=chemistry">
化 学</a> | <a
href="/bookshop/ShowBook?type=physics">物
理</a> | <a
href="/bookshop/ShowBook?type=maths">数 学
</a>
</div>
<div id="subglobal3"
class="subglobalNav">
<a
href="/bookshop/ShowBook?type=literature"
>文 学</a> | <a
href="/bookshop/ShowBook?type=art">美 术
</a> | <a
href="/bookshop/ShowBook?type=music">音 乐
</a> | <a
href="/bookshop/ShowBook?type=photography
">摄 影</a> | <a
href="/bookshop/ShowBook?type=sculpture">
雕 塑</a> | <a
href="/bookshop/ShowBook?type=modernart">
现代艺术</a> | <a
href="/bookshop/ShowBook?type=folkart">中
国民间艺术</a>
</div>
<div id="subglobal4"
class="subglobalNav">
<a
href="/bookshop/ShowBook?type=dress">时 装
</a> | <a
href="/bookshop/ShowBook?type=sociality">
社 交</a> | <a
href="/bookshop/ShowBook?type=cook">烹 饪
</a> | <a
href="/bookshop/ShowBook?type=home">家 居
</a> | <a
href="/bookshop/ShowBook?type=car">汽 车
</a> | <a
href="/bookshop/ShowBook?type=health">保
健</a> | <a
href="/bookshop/ShowBook?type=pet">宠 物
</a>
</div>
<div id="subglobal5"
class="subglobalNav">
<a
href="/bookshop/ShowBook?type=economy">经
济</a> | <a
href="/bookshop/ShowBook?type=law">法 律
</a> | <a
href="/bookshop/ShowBook?type=politics">政
治</a> | <a
href="/bookshop/ShowBook?type=philosophy"
>哲 学</a> | <a
href="/bookshop/ShowBook?type=history">历
史</a> | <a
href="/bookshop/ShowBook?type=military">军
事</a> | <a
href="/bookshop/ShowBook?type=religion">宗
教</a>
</div>
<div id="subglobal6"
class="subglobalNav">
<a
href="/bookshop/ShowBook?type=fashion">时
尚</a> | <a
href="/bookshop/ShowBook?type=film">影 视
</a> | <a
href="/bookshop/ShowBook?type=cartoon">动
漫</a> | <a
href="/bookshop/ShowBook?type=travel">旅
游</a> | <a
href="/bookshop/ShowBook?type=sport">运 动
</a> | <a
href="/bookshop/ShowBook?type=science">科
幻</a> | <a
href="/bookshop/ShowBook?type=fight">武 侠
</a> | <a
href="/bookshop/ShowBook?type=chess">棋 牌
</a>
</div>
<div id="subglobal7"
class="subglobalNav">
<a
href="/bookshop/ShowBook?type=baby">幼儿启
蒙</a> | <a
href="/bookshop/ShowBook?type=teaching">中
小学教材</a> | <a
href="/bookshop/ShowBook?type=reference">
教学参考书</a> | <a
href="/bookshop/ShowBook?type=reading">课
外读物</a> | <a
href="/bookshop/ShowBook?type=copybook">字
帖</a> | <a
href="/bookshop/ShowBook?type=picture">画
册</a> | <a
href="/bookshop/ShowBook?type=comity">礼
仪</a>
</div>