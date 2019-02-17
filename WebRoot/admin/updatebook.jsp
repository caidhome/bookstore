<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<title>图书修改</title>

<style type="text/css">

a { 
	text-decoration: none;
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

<form action="${pageContext.request.contextPath}/updateBook"  name="f1" method="post"  onsubmit="return checkform();" enctype="multipart/form-data">
<input type="hidden" name="id" value="${p.id }"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="2"></td>
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
                								<span class="STYLE3">你当前的位置</span>：修改图书
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
          					<tr>
            					<td height="28" colspan="2" background="${pageContext.request.contextPath }/admin/tab/images/bg.gif" bgcolor="#FFFFFF">
            						<div align="center">
            							<span class="STYLE1">图 书 修 改</span>
            						</div>
            					</td>
            				</tr>
          					<tr>
            					<td width="17%" height="30" bgcolor="#FFFFFF">
            						<div align="center">
            							<span class="STYLE1">图书名称</span>
            						</div>
            					</td>
            					<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            						<input type="text"  size='32' class='' name='name' id='tsname' value="${p.name }"/>
            						<label id='tsnamelab' />
            					</td>
          					</tr>
          					<tr>
            					<td width="17%" height="30" bgcolor="#FFFFFF">
            						<div align="center">
            							<span class="STYLE1">图书价格</span>
            						</div>
            					</td>
            					<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            						<input type="text"  size='32' class='' name='price' id='tsprice'  value="${p.price }"/>
            						<label id='tspricelab' />
            					</td>
          					</tr>
							<tr>
            					<td width="17%" height="30" bgcolor="#FFFFFF">
            						<div align="center">
            							<span class="STYLE1">图书类别</span>
            						</div>
            					</td>
            					<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            						<select name="category" id='tscate'>
										<option value="">- -请 &nbsp; 选&nbsp; 择&nbsp; 类 &nbsp;别 - - </option>
										<option value="教育馆 "  > &nbsp;教&nbsp; 育 &nbsp;馆</option>
										<option value="童年馆" > &nbsp;童 年 馆</option>
										<option value="文学综合馆" >  &nbsp;文&nbsp; 学&nbsp; 综&nbsp; 合&nbsp; 馆 &nbsp;</option>
									</select>
									<label id='tscatelab' />
								</td>
          					</tr>
							<tr>
            					<td width="17%" height="30" bgcolor="#FFFFFF">
            						<div align="center">
            							<span class="STYLE1">图书数量</span>
            						</div>
            					</td>
            					<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            						<input type="text" name="pnum" size="32" id='tsnum' value="${p.pnum }"/>
            						<label id='tsnumlab' />
            					</td>
          					</tr>
							<tr>
            					<td width="17%" height="30" bgcolor="#FFFFFF">
            						<div align="center">
            							<span class="STYLE1">图书图片</span>
            						</div>
            					</td>
            					<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            						<input type="file" name="f" id="tsimage"/>
            						<label id='tsimagelab' />
            					</td>
          					</tr>
							<tr>
            					<td width="17%" height="30" bgcolor="#FFFFFF">
            						<div align="center">
            							<span class="STYLE1">图书描述</span>
            						</div>
            					</td>
            					<td width="83%" bgcolor="#FFFFFF" class="STYLE1">
            						<textarea rows="10" cols="35" name="description"  id="tsdesc">${p.description }</textarea>
									<label id='tsdesclab' />
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
      			<tr>
  					<td height="32" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF">
  						<input type="submit" name="Submit"  value="提交信息" />&nbsp;&nbsp;
  						<!-- <input type='button' value='返回上页' onclick='window.location.replace("rkwpcrinfocx.jsp")' /> -->            
  					</td>
  				</tr>
    		</table>
    	</td>
  	</tr>
  	
</table>
</form>

<script type="text/javascript">
 
 	function checkform(){  
 		var tsname = document.getElementById("tsname");  
		if(tsname.value==""){  
			document.getElementById("tsnamelab").innerHTML="&nbsp;&nbsp;<font color=red>请输入图书名称</font>";  
			return false;  
		}else{
			document.getElementById("tsnamelab").innerHTML="  ";  
		}  
  
		var tsprice = document.getElementById("tsprice");  
		if(tsprice.value==""){  
			document.getElementById("tspricelab").innerHTML="&nbsp;&nbsp;<font color=red>请输入图书价格</font>";  
			return false;  
		}else{
			document.getElementById("tspricelab").innerHTML="  ";  
		}  
		
		 var tscate = document.getElementById("tscate");  
			if(tscate.value==""){  
				document.getElementById("tscatelab").innerHTML="&nbsp;&nbsp;<font color=red>请选择图书类别</font>";  
				return false;  
			}else{
				document.getElementById("tscatelab").innerHTML="  ";  
			}  
	  
		var tsnum = document.getElementById("tsnum");  
		if(tsnum.value==""){  
			document.getElementById("tsnumlab").innerHTML="&nbsp;&nbsp;<font color=red>请输入图书数量</font>";  
			return false;  
		}else{
			document.getElementById("tsnumlab").innerHTML="  ";  
		}  
  
		 var tsdesc = document.getElementById("tsdesc");  
		if(tsdesc.value==""){  
			document.getElementById("tsdesclab").innerHTML="&nbsp;&nbsp;<font color=red>请输入图书描述</font>";  
			return false;  
		}else{
			document.getElementById("tsdesclab").innerHTML="  ";  
		}  
  
		return true;   
	}   
</script>  
</body>
</html>