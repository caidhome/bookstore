<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>商品详细信息</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<script type="text/javascript">
	function addBookToCart(id){
		
		location.href="${pageContext.request.contextPath}/addBookToCart?id="+id;
	}
</script>
</head>

<body>
<br><h1 style="text-align:center; font-size:30px">图 &nbsp; 书  &nbsp;信 &nbsp;息 </h1>
	<table border="1" align="center">
		<tr>
			<td rowspan="5"><img
				src="${pageContext.request.contextPath }${p.imgurl}_s.jpg">
			</td>
			<td>商品名称:${p.name }</td>
		</tr>
		<tr>
			<td>商品数量:${p.pnum }</td>
		</tr>
		<tr>
			<td>商品类别:${p.category }</td>
		</tr>
		<tr>
			<td>商品价格:${p.price }</td>
		</tr>
		<tr>
			<td>商品描述:${p.description }</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<img src="/images/buy.bmp" onclick="addBookToCart('${p.id}')" >
			</td>
		</tr>
	</table>
</body>
</html>
