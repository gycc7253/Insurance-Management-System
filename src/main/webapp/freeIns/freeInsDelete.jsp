<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<script type = "text/javascript" src = "<%=path %>/lib/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		window.onload=function(){
			var cancelBtn = document.getElementById("cancelBtn");
			cancelBtn.onclick=function(){
				window.location.href= "/freeInsController/getFreeInsByPageAndUserId.do?currentPage=1";
			}
			
		}
	</script>
	<style type="text/css">
		body{
			margin: 0px;
			padding: 0px;
			background-image: url(/img/greenBackground_2.jpg);
		}
		#content{
			padding: 50px;
		}
		
		#deleteTable{
			border-collapse: collapse;
			width:300px;
			height: 500px;
			text-align: center;
			margin: 75px auto;
		}
		#deleteTable td{
			border: 1px solid black;
			padding: 5px;
		}
		
		input{
			background: #ccc;
			padding: 3px;
		}
		#deleteBtn{
			background: #282;
		}
		#cancelBtn{
			background: #282;
		}
	</style>

</head>
<body>
	<div id = "content">
		<div id = "deleteBox">
			<form action="/freeInsController/delete.do" method = "post">
			<table id = "deleteTable">
				<tr>
					<td>
						ID
					</td>
					<td>
						<input type = "text" name = "id" readonly = "readonly" value = "${freeIns.id }"/>
					</td>
				</tr>
				<tr>
					<td>
						Name
					</td>
					<td>
						<input type = "text" name = "customName" readonly = "readonly" value = "${freeIns.customName }"/>
					</td>
				</tr>
				<tr>
					<td>
						Gender
					</td>
					<td>
						<input type = "text" name = "customSex" readonly = "readonly" value = "${freeIns.customSex }"/>
					</td>
				</tr>
				<tr>
					<td>
						Age
					</td>
					<td>
						
						<input type = "text" name = "customAge" readonly = "readonly" value = "${freeIns.customAge }"/>
					</td>
				</tr>
				<tr>
					<td>
						Address
					</td>
					<td>
						<input type = "text" name = "addr" readonly = "readonly" value = "${stuInfo.addr }"/>
					</td>
				</tr>
				<tr>
					<td>
						Phone
					</td>
					<td>
						<input type = "text" name = "phone" readonly = "readonly" value = "${freeIns.phone }"/>
					</td>
				</tr>
				<tr>
					<td>
						status
					</td>
					<td>
						<input type = "text" name = "status" readonly = "readonly" value = "${freeIns.status }"/>
					</td>
				</tr>
				<tr>
					<td>
						Agent Id
					</td>
					<td>
						
						<input type = "text" name = "userId" readonly = "readonly" value = "${freeIns.userId }"/>
					</td>
				</tr>
				<tr>
					<td>
						Input Date
					</td>
					<td>
						<input type = "date" name = "inputDate" readonly = "readonly" value = "<fmt:formatDate value='${freeIns.inputDate }' pattern='yyyy-MM-dd'/>"/>
					</td>
				</tr>
				<tr>
					<td>
						Remark
					</td>
					<td>
						<input type = "text" name = "remark" readonly = "readonly" value = "${freeIns.remark }"/>
					</td>
				</tr>
				<tr>
					<td colspan = "2">
						<input type = "submit" value = "Delete" id = "deleteBtn"/>
						&emsp;
						<input type = "button" value = "Cancel" id = "cancelBtn"/>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>
