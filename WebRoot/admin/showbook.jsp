<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<title>图书管理</title>
<style type="text/css">
a { 
	text-decoration: none 
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 13px;
}

.STYLE3 {
	font-size: 12px; 
	font-weight: bold; 
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
</style>
</head>
<body>
<c:if test="${empty pb.list }">
<br/><br/>
		<h1 align="center">没有查询到符合条件图书</h1>
</c:if>
<c:if test="${not empty pb.list }">
<form  action="${pageContext.request.contextPath }/findAllBookSys"  name="f1" method="post" id="showBookform">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="2"></td>
		</tr>
		<tr>
			<td height="30" background="${pageContext.request.contextPath }/admin/tab/images/tab_05.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="12" height="30">
							<img src="${pageContext.request.contextPath }/admin/tab/images/tab_03.gif" width="12" height="30" />
						</td>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="46%" valign="middle">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="5%">
													<div align="center">
														<img src="${pageContext.request.contextPath }/admin/tab/images/tb.gif" width="16" height="16" />
													</div>
												</td>
												<td width="95%" class="STYLE1">
													<span class="STYLE3">你当前的位置</span>：显示所有图书
												</td>
											</tr>
										</table>
									</td>
									<td width="54%">
										<table border="0" align="right" cellpadding="0" cellspacing="0">
											<tr></tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td width="16">
							<img src="${pageContext.request.contextPath }/admin/tab/images/tab_07.gif" width="16" height="30" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="8" background="${pageContext.request.contextPath }/admin/tab/images/tab_12.gif"></td>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C3E5FB">
								<tr>
									<td colspan='13' height="60" bgcolor="#FFFFFF" align="center" class="STYLE1"> 
									图书名称：<input type='text' class='' id='wpname' value="${pb.condition.name }" size='25' name='name'/>
 										&nbsp;&nbsp;
 										图书分类：<select name="category">
														<option value="">- -请 &nbsp; 选&nbsp; 择&nbsp; 类 &nbsp;别 - - </option>
														<option value="教育馆" <c:if test="${pb.condition.category=='教育馆' }"> selected="selected" </c:if>> &nbsp;教&nbsp; 育 &nbsp;馆</option>
														<option value="童年馆" <c:if test="${pb.condition.category=='童年馆' }"> selected="selected" </c:if>>&nbsp;童&nbsp; 年&nbsp; 馆&nbsp;</option>
														<option value="文学综合馆" <c:if test="${pb.condition.category=='文学综合馆' }"> selected="selected" </c:if>> 文&nbsp; 学&nbsp; 综&nbsp; 合&nbsp; 馆 &nbsp;</option>
												</select>&nbsp;&nbsp;
										<input type='submit' class='' value='查询' />&nbsp;&nbsp; 
										<input type='reset' class='' value='重置' />&nbsp;&nbsp; 
										<!-- <input type='button' class='' value='填写入库单' onclick="window.location.replace('rkwpcrinfotj.jsp')" /> -->
										
									</td>
								</tr>
								<tr>
									<td height="28" 
										background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1" width="14%">图书名称</td>
									<td height="28"
										background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1" width="8%">图书价格</td>
									<td height="28"
										background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1" width="10%">图书分类</td>
									<td height="28"
										background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1" width="5%">图书数量</td>
									<td height="28"
										background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1" width="15%">图书照片</td>
									 <td height="28"
										background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1" width="40%">图书描述</td>
									<td height="28"
										background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
										bgcolor="#FFFFFF" align="center" class="STYLE1" width="8%">操作</td> 
								</tr>
								<c:forEach items="${pb.list }" var="p" varStatus="vs">
								 	<tr>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center">${p.name }</td>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center">￥ ${p.price }</td>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center">${p.category }</td>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center">${p.pnum }</td>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center">
											<img src="${pageContext.request.contextPath }${p.imgurl}.jpg"
												width="55px" height="55px" alt="an image" class="image" />
											</td>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center">${p.description }</td>
										<td height="30" valign="middle" bgcolor="#FFFFFF"
											class="STYLE1" align="center">
											<a href="${pageContext.request.contextPath }/updatepage?id=${p.id }">修改</a>
											&nbsp;|&nbsp;
											<a onclick="return confirm('确定要删除这本书吗?')"
												href="${pageContext.request.contextPath }/deletebook?id=${p.id }">删除</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</td>
							<td width="8"
								background="${pageContext.request.contextPath }/admin/tab/images/tab_15.gif"
								class="STYLE1">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td height="35" background="${pageContext.request.contextPath }/admin/tab/images/tab_19.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35">
								<img src="${pageContext.request.contextPath }/admin/tab/images/tab_18.gif" width="12" height="35" />
							</td>
							<td colspan=13 align="center" valign="middle" class="STYLE1">
								<font color='#1157B7'>
								共 ${pb.totalRecord } 条&nbsp;&nbsp;
								第${pb.currentPage }/${pb.totalPage }页&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${pb.currentPage <= 1}" > 首页&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
								<c:if test="${pb.currentPage > 1}" > 
								<a href='javascript:void(0);' onclick="submitForm(1);"  class='ls'>首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
								<c:if test="${pb.currentPage > 1}" > 
								<a href='javascript:void(0);' onclick="submitForm(${pb.currentPage-1 });"  class='ls'>上页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
								<c:if test="${pb.currentPage <= 1}" >上页&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
								<c:if test="${pb.currentPage < pb.totalPage}" >
								<a href='javascript:void(0);' onclick="submitForm(${pb.currentPage+1 });" class='ls'>下页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
								<c:if test="${pb.currentPage >= pb.totalPage}" >下页&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
								<c:if test="${pb.currentPage < pb.totalPage}" >
								<a href='javascript:void(0);' onclick="submitForm(${pb.totalPage });"  class='ls'>末页</a>&nbsp;&nbsp;
								</c:if>
								<c:if test="${pb.currentPage >= pb.totalPage}" >末页&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
								<select onchange="submitForm(this.options[this.selectedIndex].value);">
								<c:forEach begin="1" end="${pb.totalPage }" var="i">
								<option value="${i }" <c:if test="${pb.currentPage == i}" > selected="selected"</c:if>>${i }</option>
								</c:forEach>
								</select>
								</font>
							</td>
							<td width="16">
								<img src="${pageContext.request.contextPath }/admin/tab/images/tab_20.gif" width="16" height="35" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
	</table>
</form>
</c:if>
<script type="text/javascript">
	function submitForm(cp){
		var f = document.getElementById('showBookform');
		f.action="/findAllBookSys?currentPage="+cp;
		f.submit();
	}
</script>
</body>
</html>

