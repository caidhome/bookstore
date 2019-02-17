<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户登录</title>
<style type="text/css">
.button {
	font-size: 12px;
	text-align: center;
	padding: 0px;
	vertical-align: middle;
	line-height: 22px;
	margin: 0px;
	Height: 26px;
	Width: 60px;
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: rgb(222,225,230);
	overflow: hidden;
}

.STYLE1 {
	color: #000000;
	font-size: 12px;
}
.loginbtn{
	height: 19px;
	border: 1px solid gray; 
	font-size: 12px;
}
.unametext{
	width: 105px; 
	height: 17px; 
	border: solid 1px #7dbad7; 
	font-size: 12px; 
	color: black
}
.upasstext{
	width: 105px; 
	height: 17px; 
	border: solid 1px #7dbad7; 
	font-size: 12px; 
	color: black;
}
</style>
</head>
<body onload="f1.uname.focus();">
	<script type="text/javascript">
		function check() {
			if (f1.uname.value == "") {
				alert("请输入用户名");
				return false;
			}
			if (f1.upass.value == "") {
				alert("请输入密码");
				return false;
			}
			f1.submit();
		}
	</script>
	<form action="${pageContext.request.contextPath }/login" name="f1" method="post">
	<input type="hidden" name="role" value="admin"/>
		<table width="100%" height="100%" border='0' cellpadding="0" cellspacing="0" >
			<tr>
				<td>
					<table width="962" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="235"></td>
						</tr>
						<tr>
							<td height="53">
								<table  width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="394" height="53">&nbsp;</td>
										<td width="206">
											<table width="120%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="16%" height="25"><div align="right">
															<span class="STYLE1">管理员:</span>
														</div></td>
													<td width="57%" height="25">
														<div align="center">
															<input type="text" name="username" id="uname" class="unametext"/>
														</div>
													</td>
													<td width="27%" height="25">&nbsp;</td>
												</tr>
												<tr>
													<td height="25"><div align="right">
															<span class="STYLE1">密 &nbsp;码 : </span>
														</div></td>
													<td height="25">
														<div align="center">
															<input type="password" name="password" id="upass" class="upasstext"/>
														</div>
													</td>
												</tr>
											</table>
										</td>
										<td width="362"
											>&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr style="height: 213px">
							<td height="25" align="center"valign="top" >
								<input type="button" onclick="check(); " class="loginbtn" value="登录" /> 
								<input type="reset" style="height: 19px; border: 1px solid gray; font-size: 12px;" value="重置" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
<%
	if (request.getAttribute("login.message") != null) {
%>
<script type="text/javascript">
	alert("用户名、密码错误或选择登录权限！");
</script>
<%} %>
</body>
</html>

