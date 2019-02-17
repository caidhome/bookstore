<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	  font-size: 14px;
	  text-align: left;
	}
</style>
</head>
<script type="text/javascript">
	function changeCount(id, count, pnum) {
		count = parseInt(count);
		if (count <= 0) {
			var flag = window.confirm("您确认要删除该商品吗？");
			if (flag) {
				count = 0;
			} else {
				count = 1;
			}
		} else if (count > pnum) {
			alert("最大购买数量为：" + pnum);
			count = pnum;
		}
		location.href = "${pageContext.request.contextPath}/changeCount?id="
				+ id + "&count=" + count;
	};
	function numberText(e) {
		var keyCode;
		if (e && e.preventDefault) {
			//判断是firefox浏览器
			keyCode = e.which;
		} else {
			//ie浏览器
			keyCode = window.event.keyCode;
		}
		alert(keyCode);
		//0-9之间的键码值是48-57
		if (!(keyCode >= 48 && keyCode <= 57 || keyCode == 8)) {
			//阻止事件的默认行为
			if (e && e.preventDefault) {
				// e对象存在，preventDefault方法存在 ---- 火狐浏览器
				e.preventDefault();
			} else {
				// 不支持e对象，或者没有preventDefault方法 ---- IE
				window.event.returnValue = false;
			}

		}
	};
	function deleteBook(e){
		var flag = window.confirm("您确认要删除吗？");
		if(!flag){
			if(e && e.preventDefault){
			e.preventDefault();
			}else{
			window.event.returnValue = false;
			}
		}
	}
	function removeBook(id)
	{
		var flag = window.confirm("您确认要删除该商品吗？");
		if(flag){
			window.location.href="${pageContext.request.contextPath }/removeBookFromCart?id="+id;
		}
	}
	function delSelectP()
	{
		var param = "";
		var delCks = document.getElementsByName("delCk");
		for(var i = 0;i < delCks.length;i++)
		{
			if(delCks[i].checked == true){
				param += "id="+delCks[i].value+"&"; 
			}
		}
		if(param != "")
		{
			param = param.substring(0, param.length-1);
			location.href="${pageContext.request.contextPath}/removeSelectBookFromCart?"+param;
		}
	}
	function selectCK(p)
	{
		var flag = p.checked;
		var delCks = document.getElementsByName("delCk");
		for(var i = 0;i < delCks.length;i++)
		{
			delCks[i].checked = flag;
		}
	}
	function createOrder()
	{
		location.href="${pageContext.request.contextPath}/order.jsp";
	}
</script>
<body>
<br/><br/><br/>
	<c:if test="${empty cart }">
		<h1 align="center">购物车中没有图书</h1>
	</c:if>
	<c:if test="${not empty cart }">
		<table border="1" align="center" width="80%" cellpadding="7px"/>
			<h1 style="text-align:center; font-size:30px">购 &nbsp; 物  &nbsp;车 &nbsp; </h1>
			<tr align="center">
				<td  width="5%"></td>
				<td width="30%">图书名称</td>
				<td width="15%">图书价格</td>
				<td width="40%">图书数量</td>
				<td width="10%">操作</td>
			</tr>
			<c:set var="totalMoney" value='0' />
			<c:forEach items="${cart}" var="c">
				<tr style="text-align:center">
					<td><input type='checkbox' name='delCk' value='${c.key.id }'>
					</td>
					<td>${c.key.name }</td>
					<td>￥${c.key.price }</td>
					<td><input type="button" value="-"
						onclick="changeCount('${c.key.id}','${c.value-1 }','${c.key.pnum }')">
						<input type='text' size='3' style="text-align:center"
						value="${c.value}" onkeydown="numberText(event)"
						onblur="changeCount('${c.key.id}',this.value,'${c.key.pnum })" />
						<input type="button" value="+"
						onclick="changeCount('${c.key.id}','${c.value+1 }','${c.key.pnum }')">
						&nbsp;&nbsp; 可购买数量：${c.key.pnum}</td>
					<td>&nbsp;&nbsp;<a
						href="${pageContext.request.contextPath }/removeBookFromCart?id=${c.key.id}"
						onclick="deleteBook(event)">删 除</a> <%--  <a
						href="javascript:void(0);" onclick="removeBook('${c.key.id}');">删除</a>
					</td> --%>
				</tr>
				<c:set var="totalMoney" value="${totalMoney+c.key.price * c.value }" />
			</c:forEach>
			<tr>
				<td><input type="checkbox" id="main2" onclick="selectCK(this)" />
				</td>
				<td colspan="2" style="text-align:left"><a
					href="javascript:void(0);" onclick="delSelectP();">删 除 选 中</a></td>
				<td colspan="2" style="text-align:right">总价：￥ <fmt:formatNumber value="${totalMoney}" pattern="#0.00"/>
					元&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="images/gotoorder.bmp" onclick="createOrder();" />
					</td>
			</tr>

		</table>
	</c:if>

	<div class="toShop"><br/><br/>
	<h4>回到首页&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/findAllBook">继续购物</a>。</h4>
	
	</div>
</body>
</html>
