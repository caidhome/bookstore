<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>购物车</title>
<style type="text/css">
	body{
	background-color: rgb(232,232,232);
	}
	.toShop{
		text-align:center;
	}
	a{
		text-decoration: none;
	  font-family: "Times New Roman", Georgia, Times, Serif;
	  font-style: normal;
	  font-weight: bold;
	  font-size: 18px;
	  text-align: left;
	}
	button{
		padding:3px 18px;
		line-height:25px;
		cursor: pointer;
	}
</style>
</head>
<script type="text/javascript">

	function showCart() {
		window.location.href = "${pageContext.request.contextPath }/showCart.jsp";
	}
	function findallbook() {
		window.location.href = "${pageContext.request.contextPath }/findAllBook";
	}
</script>
<body>
<br/><br/><br/>
		<h1 align="center">购物车添加成功</h1>
	<div class="toShop"><br/><br/>
		<button onclick="showCart()">查 看 购 物 车 </button><br><br>
		<button onclick="findallbook()">继&nbsp; 续&nbsp; 购&nbsp; 书&nbsp;</button>
	</div>
</body>
</html>
