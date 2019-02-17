<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>订单页面</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<style type="text/css">
table{
}
</style>
</head>

<body>
	<br>
	<br>
	<br>
	<div align="center">
		<form action="${pageContext.request.contextPath}/addOrder" method="post">
			送货地址:<input type="text" name="receiverinfo"><br><br>
			<c:set value="0" var="money"></c:set>

			<table border='1' cellpadding="10px" width="60%">
				<tr align="center">
					<td>商品名称</td>
					<td>商品价格</td>
					<td>数量</td>
				</tr>
				<c:forEach items="${cart}" var="c">
					<tr>
						<td>${c.key.name}</td>
						<td align="center">￥${c.key.price}</td>
						<td align="center">${c.value}</td>
					</tr>
					<c:set value="${money+c.key.price*c.value}" var="money"></c:set>
				</c:forEach>
			</table>

		<br><br>

			订单总价: ￥<input style="text-align:center;" type="text" readonly="readonly" value="<fmt:formatNumber value="${money}" type="currency" pattern="#0.00"/>"
				name="money">
				
				 <br><br> <input type="submit" value="生成订单">
		</form>
	</div>
</body>
</html>
