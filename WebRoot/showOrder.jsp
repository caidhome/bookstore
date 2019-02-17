<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单信息</title>
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
	  font-size: 14px;
	  text-align: left;
	}
</style>
<script type="text/javascript" src="my.js"></script>
</head>
<script type="text/javascript">
	function findbook(oid) {
		var btn = document.getElementById("btn_" + oid);
		var div = document.getElementById("div_" + oid);
		if (btn.value != "关闭") {
			div.style.display = "block";
			var xmlhttp = getXmlHttpRequest();
			xmlhttp.onreadystatechange = function() {
				var json = eval("(" + xmlhttp.responseText + ")");
				var table = "<table border='1' align='center' width='98%'><tr align='center'><td width='15%'>图书名称</td><td width='15%'>图书价格</td><td  width='70%'>图书描述</td></tr>"
				for ( var i = 0; i < json.length; i++) {
					table += "<tr><td>" + json[i].name + "</td><td>"
							+ json[i].price + "</td><td>" + json[i].description
							+ "</td></tr>";
				}
				table+="</table>";
				div.innerHTML=table;
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
	function delOrder(orderid)
	{
		var flag = confirm("你确认删除该订单吗？");
		if(flag){
			location.href="${pageContext.request.contextPath }/delOrder?orderid="+orderid;		
		}
	}
	function findallbook()
	{
		window.location.href="${pageContext.request.contextPath }/home.jsp";
	}
</script>
<body style="background-color:rgb(232,232,232)">
		<br>
		<br>
	<c:if test="${empty orders }">
		<h1 align="center">暂时没有订单</h1>
	</c:if>
	<c:if test="${not empty orders }">
	<h1 style="text-align:center; font-size:30px">订 &nbsp; 单  &nbsp;信 &nbsp;息 </h1>
	<c:forEach items="${orders }" var="o" varStatus="vs">
	<br>
		<table border="1" align="center" width="95%" style="text-align: center;padding:0px;">
			<tr align="center">
				<td width="20%">订单编号</td>
				<td width="8%">订单金额</td>
				<td width="39%">订单信息</td>
				<td width="12%">送货地址</td>
				<td width="10%">所属用户</td>
				<td width="6%">支付状态</td>
				<td width="5%">操作</td>
			</tr>
			<tr>
				<td>${o.id }</td>
				<td><fmt:formatNumber value="${o.money }" pattern="#0.00"/></td>
				<td align="center"><input type="button" value="查看图书"
					onclick="findbook('${o.id}')" id="btn_${o.id }">
					<div id="div_${o.id }"></div>
				</td>
				<td>${o.receiverinfo }</td>
				<td>${o.username }【${o.nickname }】</td>
				<td><c:if test="${o.paystate == 0 }">
						<a href="${pageContext.request.contextPath}/pay.jsp?orderid=${o.id}&money=${o.money}">未支付</a>
					</c:if> <c:if test="${o.paystate != 0 }">
	  					已支付
	  				</c:if>
				</td>
				<td><c:if test="${o.paystate == 0 }">
						<a href="javascript:void(0);" onclick="delOrder('${o.id}');">删除</a>
					</c:if> <c:if test="${o.paystate != 0 }">
	  					删除
	  				</c:if>
				</td>
			</tr>
		</table>
	</c:forEach>
	</c:if>
	<div style="text-align:center"><br/><br/>
		<button onclick="findallbook()">继&nbsp; 续&nbsp; 购&nbsp; 物&nbsp;</button>
	</div>
	<br><br><br>
</body>
</html>
