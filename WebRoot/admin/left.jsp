<%@page import="lzit.rj.bookstore.utils.TableUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 12px;
	color: #033d61;
}

.menu_title span {
	font-weight: bold; 
	left: 3px;
	color: #ffffff; 
	position: relative;
	top: 2px; 
}
.menu_title2 span {
	font-weight: bold;
	left: 3px; 
	color: #FFCC00; 
	position: relative; 
	top: 2px;
}

a { 
	text-decoration: none 
}
</style> 
 
<table width="165" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" background="images/main_40.gif">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      		<tr>
        		<td width="19%"></td>
        		<td width="81%" height="20"><span class="STYLE1">管理菜单</span></td>
      		</tr>
    	</table>
    </td>
  </tr>
  <tr>
    <td valign="top">
          <%=TableUtil.getCol("A","2","图书管理",null,null) %>
          <%=TableUtil.getCol("C","2",null,null,"") %>
          <%=TableUtil.getCol("B","2","查看图书","/findAllBookSys",null) %>
          <%=TableUtil.getCol("B","2","添加图书","addbook.jsp",null) %>
          <%-- <%=TableUtil.getCol("B","2","修改图书","rkwpcrTableUtilcx.jsp",null) %>
          <%=TableUtil.getCol("B","2","删除图书","rkwpcrTableUtilcx.jsp",null) %> --%>
          <%=TableUtil.getCol("D",null,null,null,null) %>
          
          <%=TableUtil.getCol("A","4","订单管理",null,null) %>
          <%=TableUtil.getCol("C","4",null,null,"none") %>
          <%=TableUtil.getCol("B","4","查看订单","/showOrderSys?currentPage=1",null) %>
          <%-- <%=TableUtil.getCol("B","4","修改订单","ckwpcrTableUtiltj.jsp",null) %>
          <%=TableUtil.getCol("B","4","取消订单","ckwpcrTableUtilcx.jsp",null) %> --%>
          <%=TableUtil.getCol("D",null,null,null,null) %>
          
          
          <%=TableUtil.getCol("A","3","信息维护",null,null) %>
          <%=TableUtil.getCol("C","3",null,null,"none") %>
          <%=TableUtil.getCol("B","3","查看个人信息","showsysuser.jsp",null) %>
          <%=TableUtil.getCol("B","3","修改个人信息","updatesysuser.jsp?id=1",null) %>
          <%=TableUtil.getCol("D",null,null,null,null) %>
    
  </tr>
  
  <tr>
    <td height="18" background="images/main_58.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
    </table></td>
  </tr>
</table>
<script type="text/javascript">
	function showsubmenu(sid) {
		whichEl = eval("submenu" + sid);
		imgmenu = eval("imgmenu" + sid);
		if (whichEl.style.display == "none") {
			eval("submenu" + sid + ".style.display=\"\";");
			imgmenu.background = "images/main_47.gif";
		} else {
			eval("submenu" + sid + ".style.display=\"none\";");
			imgmenu.background = "images/main_48.gif";
		}
	}

	function go(purl) {
		parent.document.getElementsByTagName("iframe")[1].src = (purl);
	}
</script>
