<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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

.STYLE2 {
	font-size: 9px
}

.STYLE3 {
	color: #033d61;
	font-size: 12px;
}

:a {
	text-decoration: none
}

</style>
</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="70px" background="images/main_05.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="24">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="270" height="24">&nbsp;</td>
									<td width="505" background="images/main_04.gif">&nbsp;</td>
									<td></td>
									<td width="21">
										<img src="images/main_07.gif" width="21" height="24">
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="38">
							<table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="350" height="38">
										<font color="#ffffff" style="font-size: 26px">
											<strong>
												&nbsp;&nbsp;&nbsp;&nbsp;Bookstore&nbsp;后台管理系统
											</strong>
										</font>
										<table>
											<tr>
												<td height="5"></td>
											</tr>
										</table> 

									</td>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="77%" height="25" valign="bottom">
													<table
														width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td>&nbsp;</td>
														</tr>
													</table>
												</td>
												<td valign="bottom" nowrap="nowrap"><div align="left">
														<span class="STYLE1"> 
															当前用户 :&nbsp;&nbsp;${user.username }
															&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/logout" target="_top"><font
																color="#ffffff" style="text-decoration: none">退出系统</font></a>
														</span>
													</div></td>
											</tr>
										</table></td>
									<td width="21px"><img src="images/main_11.gif" width="21px"
										height="38px"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="8" style="line-height: 8px;"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="270" background="images/main_29.gif"
										style="line-height: 8px;">&nbsp;</td>
									<td width="505" background="images/main_30.gif"
										style="line-height: 8px;">&nbsp;</td>
									<td style="line-height: 8px;">&nbsp;</td>
									<td width="21" style="line-height: 8px;"><img src="images/main_31.gif" width="21" height="8" /></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="28" background="images/main_36.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="177" height="28" background="images/main_32.gif">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="59%" valign="bottom">
										<div align="center" class="STYLE1">
											当前用户： ${user.username }
										</div>
									</td>

								</tr>
							</table>
						</td>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td style="display: inline; font-size: 11px">
										&nbsp;&nbsp;当前时间 :
										<span id="ptime" style="display: inline; font-size: 11px"></span>
									</td>
								</tr>
							</table>
						</td>
						<td width="21"><img src="images/main_37.gif" width="21"
							height="28"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
         function getPTime(){
              var weekArray = new Array("星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
              var week = weekArray[new Date().getDay()]; 
              document.getElementById("ptime").innerHTML=new Date().toLocaleString()+" &nbsp;"+week;
              setTimeout(getPTime,1000);
          }
          getPTime(); 
    </script>

</body>
</html>

