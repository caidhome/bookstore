<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<title>信息修改</title>
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
	font-size: 13px
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
<form  action="${pageContext.request.contextPath }/updateUser"  name="f1" method="post"  onsubmit="return checkform()" >
<input type="hidden" name="id" value="${user.id }" />
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="2">
		</td>
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
                									<span class="STYLE3">你当前的位置</span>：信息修改
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
        					<table style="margin-top:3px" width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C3E5FB" >
          						<tr style="display:none">
            						<td height="28" colspan="2" background="${pageContext.request.contextPath }/admin/tab/images/bg.gif" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">信息标题</span>
            							</div>
            						</td>
            					</tr>
          						<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">用户名</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<input type='text'  disabled="false" value="${user.username }" size='30' />
            						</td>
          						</tr>
								<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">昵称</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<input type='text'  disabled="false" value="${user.nickname }" size='30' />
            						</td>
          						</tr>
								<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">email</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<input type='text'  disabled="false" value="${user.email }" size='30' />
            						</td>
          						</tr>
								<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">角色</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<input type='text'  disabled="false" value="${user.role }" size='30' />
            						</td>
          						</tr>
								<tr>
            						<td width="17%" height="30" bgcolor="#FFFFFF">
            							<div align="center">
            								<span class="STYLE1">修改时间</span>
            							</div>
            						</td>
            						<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            							<input type='text'  disabled="false" value="${user.updatetime }" size='30' />
            						</td>
          						</tr>
        					</table>
        				</td>
        				<td width="8" background="${pageContext.request.contextPath }/admin/tab/images/tab_15.gif"></td>
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
        				<td align="center" valign="middle"></td>
        				<td width="16">
        					<img src="${pageContext.request.contextPath }/admin/tab/images/tab_20.gif" width="16" height="35" />
        				</td>
      				</tr>
    			</table>
    		</td>
  		</tr>
	</table>
</form>
 
</body>
</html>
