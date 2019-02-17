<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>百佳购书商城</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<link rel="icon" href="images/bookstore.ico" type="image/x-icon" />
<link rel="shortcut icon" href="images/bookstore.ico" type="image/x-icon" />
<link rel="bookmark" href="images/bookstore.ico" type="image/x-icon" />
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	var focus_width = 920;
	var focus_height = 480;
	var picPath;
	var linkUrl = "";
	var swfPath = "adImage.swf";
	var sp = "|";
	var banners = new Array("images/6.jpg", "images/2.jpg",
			"images/3.jpg", "images/4.jpg", "images/5.jpg",
			"images/1.jpg");
	var links = new Array("#", "#", "#", "#", "#", "#");

	for ( var i = 0; i < banners.length; i++) {
		if (i == banners.length - 1) {
			sp = "";
		}
		picPath += banners[i] + sp;
		var index = picPath.indexOf("undefined");
		if (index != -1) {
			picPath = picPath.substr(index + 9, picPath.length);
		}
		linkUrl += links[i] + sp;
	}
	function reg() {
		window.location.href = "${pageContext.request.contextPath}/regist.jsp";
	}
	window.onload = function() {
		var un = document.getElementById("username");
		un.value = window.decodeURIComponent("${cookie.remember.value}",
				"utf-8");
	}
	function findBookById(pid){
	window.location.href="${pageContext.request.contextPath}/findBookById?pid="+pid;
	}
</script>
</head>
<body>

	<div id="art-main">
		<div class="art-sheet">
			<div class="art-sheet-tl"></div>
			<div class="art-sheet-tr"></div>
			<div class="art-sheet-bl"></div>
			<div class="art-sheet-br"></div>
			<div class="art-sheet-tc"></div>
			<div class="art-sheet-bc"></div>
			<div class="art-sheet-cl"></div>
			<div class="art-sheet-cr"></div>
			<div class="art-sheet-cc"></div>
			<div class="art-sheet-body">
				<div class="art-header">
					<div class="art-header-png"></div>
					<div class="art-header-jpeg"></div>
					<div class="art-logo">
						<h1 id="name-text" class="art-logo-name">
							<a style="font-size:42px;font-weight: bold;" href="#">百佳书城</a>
						</h1>
						<div id="slogan-text" class="art-logo-text">快乐的购书天堂...</div>
					</div>
				</div>
				<form action="">
				<div class="art-nav">
					<div class="l"></div>
					<div class="r"></div>
					<ul class="art-menu">
						<li><a href="http://www.bookstore.com" class="active"><span class="l"></span><span
								class="r"></span><span class="t">主页</span>
						</a></li>
						<li><a href="#"><span class="l"></span><span class="r"></span><span
								class="t">图书分类</span>
						</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/findAllBook?category=1">文学综合馆</a>
								</li>
								<li><a href="${pageContext.request.contextPath }/findAllBook?category=2">童年馆</a>
								</li>
								<li><a href="${pageContext.request.contextPath }/findAllBook?category=3">教育馆</a>
								</li>
							</ul></li>
						<li><a href=""><span class="l"></span><span class="r"></span><span
								class="t">关于我们</span>
						</a></li>
						<c:if test="${not empty user }">
							<li>当前用户：${user.username }</li>
							<li><a href="${pageContext.request.contextPath }/logout">注销</a>
							</li>
						</c:if>

						<c:if test="${empty user }">
							<li>未登录</li>
						</c:if>
					</ul>
				</div>
				</form>
				<div class="art-content-layout">
					<div class="art-content-layout-row">
						<div class="art-layout-cell art-content">
							<div class="art-post">
								<div class="art-post-tl"></div>
								<div class="art-post-tr"></div>
								<div class="art-post-bl"></div>
								<div class="art-post-br"></div>
								<div class="art-post-tc"></div>
								<div class="art-post-bc"></div>
								<div class="art-post-cl"></div>
								<div class="art-post-cr"></div>
								<div class="art-post-cc"></div>
								<div class="art-post-body">
									<div class="art-post-inner art-article">
										<div class="art-postmetadataheader">
											<h2 class="art-postheader">图书促销信息</h2>
										</div>
										<div class="art-postcontent">
											<!-- article-content -->
											<script type="text/javascript" src="mutilpleFlash.js"></script>
											<!-- /article-content -->
										</div>
										<div class="cleared"></div>
									</div>

									<div class="cleared"></div>
								</div>
							</div>

							
						</div>
						<div class="art-layout-cell art-sidebar1">
							<div class="art-vmenublock">
								<div class="art-vmenublock-body">
									<div class="art-vmenublockheader">
										<div class="l"></div>
										<div class="r"></div>
										<div class="t">导航菜单</div>
									</div>
									<div class="art-vmenublockcontent">
										<div class="art-vmenublockcontent-tl"></div>
										<div class="art-vmenublockcontent-tr"></div>
										<div class="art-vmenublockcontent-bl"></div>
										<div class="art-vmenublockcontent-br"></div>
										<div class="art-vmenublockcontent-tc"></div>
										<div class="art-vmenublockcontent-bc"></div>
										<div class="art-vmenublockcontent-cl"></div>
										<div class="art-vmenublockcontent-cr"></div>
										<div class="art-vmenublockcontent-cc"></div>
										<div class="art-vmenublockcontent-body">
											<!-- block-content -->
											<ul class="art-vmenu">
												<li><a href="http://www.bookstore.com/home.jsp"><span class="l"></span><span
														class="r"></span><span class="t">主页</span>
												</a></li>
												<li><a href="${pageContext.request.contextPath}/findAllBook"><span
														class="l"></span><span class="r"></span><span class="t">查看图书</span>
												</a></li>
												<li><a href="http://www.bookstore.com/showCart.jsp"><span class="l"></span><span
														class="r"></span><span class="t">查看购物车</span>
												</a></li>
												<li><a href="${pageContext.request.contextPath}/showOrder"><span class="l"></span><span
														class="r"></span><span class="t">查看订单</span>
												</a></li>
												<li><a href="page.html?i7"><span class="l"></span><span
														class="r"></span><span class="t">关于我们</span>
												</a></li>
												<li><a href="page.html?i8"><span class="l"></span><span
														class="r"></span><span class="t">联系方式</span>
												</a></li>
											</ul>
											<!-- /block-content -->

											<div class="cleared"></div>
										</div>
									</div>
									<div class="cleared"></div>
								</div>
							</div>
							<div class="art-block">
								<div class="art-block-body">
									<div class="art-blockheader">
										<div class="l"></div>
										<div class="r"></div>
										<div class="t">用户登录</div>
									</div>
									<div class="art-blockcontent">
										<div class="art-blockcontent-tl"></div>
										<div class="art-blockcontent-tr"></div>
										<div class="art-blockcontent-bl"></div>
										<div class="art-blockcontent-br"></div>
										<div class="art-blockcontent-tc"></div>
										<div class="art-blockcontent-bc"></div>
										<div class="art-blockcontent-cl"></div>
										<div class="art-blockcontent-cr"></div>
										<div class="art-blockcontent-cc"></div>
										<div class="art-blockcontent-body">
											<!-- block-content -->
											<div>
												<form method="post" id="loginForm"
													action="${pageContext.request.contextPath }/login" >
													<input type="hidden" name="role" value="user"/>
													<table>
														<tr>
															<td colspan="2"><font color='red'>${requestScope["login.message"]
																	}</font>
															</td>
														</tr>
														<tr>
															<td>用户名</td>
															<td><input type="text" value="" name="username"
																id="username" /><br />
															</td>
														</tr>
														<tr>
															<td>密 码</td>
															<td><input type="password" value="" name="password"
																id="password" />
															</td>
														</tr>
														<tr>
															<td colspan="2"><br><input type="checkbox"
																name="remember" value="on" />记住用户 <input type="checkbox"
																name="autologin" value="on" />自动登录<br><br></td>
														</tr>
														<tr align="center">
															<td><span class="art-button-wrapper"> <span
																	class="l"> </span> <span class="r"> </span> <input
																	class="art-button" type="submit" name="loginbtn"
																	value="登录" /> </span></td>
															<td><span class="art-button-wrapper"
																onclick="reg();"> <span class="l"> </span> <span
																	class="r"> </span> <input class="art-button"
																	type="button" name="regbtn" value="注册" /> </span></td>
													</table>
												</form>
											</div>
											<!-- /block-content -->

											<div class="cleared"></div>
										</div>
									</div>
									<div class="cleared"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="cleared">
				<div class="art-post">
								<div class="art-post-tl"></div>
								<div class="art-post-tr"></div>
								<div class="art-post-bl"></div>
								<div class="art-post-br"></div>
								<div class="art-post-tc"></div>
								<div class="art-post-bc"></div>
								<div class="art-post-cl"></div>
								<div class="art-post-cr"></div>
								<div class="art-post-cc"></div>
								<div class="art-post-body">
									<div class="art-post-inner art-article">
										<div class="art-postcontent">
											<!-- article-content -->
											<div class="art-content-layout overview-table">
												<div class="art-content-layout-row">
													<c:forEach items="${ps }" var="p" varStatus="vs">
														<div class="art-layout-cell">
															<div class="overview-table-inner">
																<h4 style=" text-align:center;">${p.name }</h4>
																<img
																	src="${pageContext.request.contextPath }${p.imgurl}.jpg"
																	width="55px" height="55px" alt="an image" class="image" onclick="findBookById('${p.id}')" />
																<p style=" text-align:center;">价格: ￥${p.price }</p>
																<p style=" text-align:center;"><a style="text-decoration: none;" href="${pageContext.request.contextPath }/findBookById?pid=${p.id}">立即购买</a></p>
															</div>
														</div>
														<c:if test="${vs.count%5==0}">
															</div>
															<div class="art-content-layout-row">
													</c:if>
													</c:forEach>
													<!-- end cell -->
												</div>
												<!-- end row -->

											</div>
											<!-- end table -->

											<!-- /article-content -->
										</div>
										<div class="cleared"></div>
									</div>

									<div class="cleared"></div>
								</div>
							</div>
				</div>
				<div class="art-footer">
					<div class="art-footer-t"></div>
					<div class="art-footer-l"></div>
					<div class="art-footer-b"></div>
					<div class="art-footer-r"></div>
					<div class="art-footer-body">
						<a href="#" class="art-rss-tag-icon" title="RSS"></a>
						<div class="art-footer-text">
							<p>
								<a href="#">关于我们</a> | <a href="#">联系我们</a>
							</p>
						</div>
						<div class="cleared"></div>
					</div>
				</div>
				<div class="cleared"></div>
			</div>
		</div>
		<div class="cleared"></div>
	</div>

</body>