<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>订单管理</title>
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
	<br />
	<br />
	<c:if test="${empty pb.list }">
		<h1 align="center">没有查询到符合条件的订单</h1>
	</c:if>
	<c:if test="${not empty pb.list }">
		<form
			action="${pageContext.request.contextPath }/showOrderSys"
			name="f1" method="post" id="showOrderform">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td height="30"
						background="${pageContext.request.contextPath }/admin/tab/images/tab_05.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12" height="30"><img
									src="${pageContext.request.contextPath }/admin/tab/images/tab_03.gif"
									width="12" height="30" /></td>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="46%" valign="middle">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="5%">
															<div align="center">
																<img
																	src="${pageContext.request.contextPath }/admin/tab/images/tb.gif"
																	width="16" height="16" />
															</div>
														</td>
														<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：订单管理
														</td>
													</tr>
												</table>
											</td>
											<td width="54%">
												<table border="0" align="right" cellpadding="0"
													cellspacing="0">
													<tr></tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td width="16"><img
									src="${pageContext.request.contextPath }/admin/tab/images/tab_07.gif"
									width="16" height="30" /></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="8"
									background="${pageContext.request.contextPath }/admin/tab/images/tab_12.gif"></td>
								<td>

									<table width="100%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="#C3E5FB">
										<tr>
											<td colspan='13' height="40" bgcolor="#FFFFFF" align="center"
												class="STYLE1">订单人：<input type='text' value="${pb.condition.username }" class=''
												id='wpname' size='32' name='condition' />&nbsp;&nbsp; <input
												type='submit' class='' value='查询' />&nbsp;&nbsp;
											</td>
										</tr>


										<tr>
											<td height="28"
												background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">订单编号</td>
											<td height="28"
												background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">订单金额</td>
											<td width="40%" height="28"
												background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">订单信息</td>
											<td height="28"
												background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">送货地址</td>
											<td height="28"
												background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">所属用户</td>
											<td height="28"
												background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">支付状态</td>
											<td height="28"
												background="${pageContext.request.contextPath }/admin/tab/images/bg.png"
												bgcolor="#FFFFFF" align="center" class="STYLE1">操作</td>
										</tr>



										<h1 style="text-align: center; font-size: 30px">订 &nbsp;
											单 &nbsp;信 &nbsp;息</h1>
										<c:forEach items="${pb.list }" var="o" varStatus="vs">

											<tr>
												<td height="30" valign="middle" bgcolor="#FFFFFF"
													class="STYLE1" align="center">${o.id }</td>
												<td height="30" valign="middle" bgcolor="#FFFFFF"
													class="STYLE1" align="center"><fmt:formatNumber
														value="${o.money }" pattern="#0.00" /></td>

												<td height="30" valign="middle" bgcolor="#FFFFFF"
													class="STYLE1" align="center"><input type="button"
													value="查看图书" onclick="findbook('${o.id}')"
													id="btn_${o.id }" />
													<div id="div_${o.id }"></div></td>
												<td height="30" valign="middle" bgcolor="#FFFFFF"
													class="STYLE1" align="center">${o.receiverinfo }</td>
												<td height="30" valign="middle" bgcolor="#FFFFFF"
													class="STYLE1" align="center">${o.username }【${o.nickname }】</td>
												<td height="30" valign="middle" bgcolor="#FFFFFF"
													class="STYLE1" align="center"><c:if
														test="${o.paystate == 0 }">
														<a
															href="${pageContext.request.contextPath}/pay.jsp?orderid=${o.id}&money=${o.money}">未支付</a>
													</c:if> <c:if test="${o.paystate != 0 }">
				  					已支付
				  				</c:if></td>
												<td height="30" valign="middle" bgcolor="#FFFFFF"
													class="STYLE1" align="center"><c:if
														test="${o.paystate == 0 }">
														<a onclick="return confirm('确定要删除这条记录吗?')"
															href="${pageContext.request.contextPath }/delOrder?orderid=${o.id}">删除</a>
													</c:if> <c:if test="${o.paystate != 0 }">
					  					删除
					  				</c:if></td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td width="8"
									background="${pageContext.request.contextPath }/admin/tab/images/tab_15.gif"
									class="STYLE1"></td>
							</tr>
						</table>

					</td>
				</tr>
				<tr>
					<td height="35"
						background="${pageContext.request.contextPath }/admin/tab/images/tab_19.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12" height="35"><img
									src="${pageContext.request.contextPath }/admin/tab/images/tab_18.gif"
									width="12" height="35" /></td>
								<td colspan=13 align="center" valign="middle" class="STYLE1">
									<font color='#1157B7'> 共 ${pb.totalRecord }
										条&nbsp;&nbsp; 第${pb.currentPage }/${pb.totalPage }页&nbsp;&nbsp;&nbsp;&nbsp;
										<c:if test="${pb.currentPage <= 1}"> 首页&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
										<c:if test="${pb.currentPage > 1}">
											<a href='javascript:void(0);' onclick="submitForm(1);"
												class='ls'>首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if> <c:if test="${pb.currentPage > 1}">
											<a href='javascript:void(0);'
												onclick="submitForm(${pb.currentPage-1 });" class='ls'>上页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if> <c:if test="${pb.currentPage <= 1}">上页&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
										<c:if test="${pb.currentPage < pb.totalPage}">
											<a href='javascript:void(0);'
												onclick="submitForm(${pb.currentPage+1 });" class='ls'>下页</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if> <c:if test="${pb.currentPage >= pb.totalPage}">下页&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
										<c:if test="${pb.currentPage < pb.totalPage}">
											<a href='javascript:void(0);'
												onclick="submitForm(${pb.totalPage });" class='ls'>末页</a>&nbsp;&nbsp;
								</c:if> <c:if test="${pb.currentPage >= pb.totalPage}">末页&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
										<select
										onchange="submitForm(this.options[this.selectedIndex].value);">
											<c:forEach begin="1" end="${pb.totalPage }" var="i">
												<option value="${i }"
													<c:if test="${pb.currentPage == i}" > selected="selected"</c:if>>${i }</option>
											</c:forEach>
									</select>
								</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	<script type="text/javascript" src="/my.js"></script>

	<script type="text/javascript">
		function submitForm(cp){
			var f = document.getElementById('showOrderform');
			f.action="/showOrderSys?currentPage="+cp;
			f.submit();
		}
		function findbook(oid) {
			var btn = document.getElementById("btn_" + oid);
			var div = document.getElementById("div_" + oid);
			if (btn.value != "关闭") {
				div.style.display = "block";
				var xmlhttp = getXmlHttpRequest();
				xmlhttp.onreadystatechange = function() {
					var json = eval("(" + xmlhttp.responseText + ")");
					var table = "<table border='0' cellpadding='0' cellspacing='1' bgcolor='#C3E5FB' width='98%'><tr align='center'><td  height='28' background='${pageContext.request.contextPath }/admin/tab/images/bg.png' bgcolor='#FFFFFF' align='center' class='STYLE1' width='15%'>图书名称</td><td width='15%' background='${pageContext.request.contextPath }/admin/tab/images/bg.png' bgcolor='#FFFFFF' align='center' class='STYLE1' width='15%'>图书价格</td><td  width='70%' background='${pageContext.request.contextPath }/admin/tab/images/bg.png' bgcolor='#FFFFFF' align='center' class='STYLE1' width='15%'>图书描述</td></tr>"
					for (var i = 0; i < json.length; i++) {
						table += "<tr><td  height='30' valign='middle' bgcolor='#FFFFFF' class='STYLE1' align='center'>"
								+ json[i].name
								+ "</td><td height='30' valign='middle' bgcolor='#FFFFFF'>"
								+ json[i].price
								+ "</td><td height='30' valign='middle' bgcolor='#FFFFFF'>"
								+ json[i].description + "</td></tr>";
					}
					table += "</table>";
					div.innerHTML = table;
				}

				xmlhttp.open("GET",
						"${pageContext.request.contextPath}/findBookByOrder?id="
								+ oid);
				xmlhttp.send(null);
				btn.value = "关闭";
			} else {
				btn.value = "查看图书";
				div.style.display = "none";
			}
		}
	</script>
</body>
</html>

