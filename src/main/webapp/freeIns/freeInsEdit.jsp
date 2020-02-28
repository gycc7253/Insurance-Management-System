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
		
		#editTable{
			border-collapse: collapse;
			width:300px;
			height: 500px;
			text-align: center;
			margin: 75px auto;
		}
		#editTable td{
			border: 1px solid black;
			padding: 5px;
		}
		
		input{
			padding: 3px;
		}
		#editBtn{
			background: #282;
		}
		#cancelBtn{
			background: #282;
		}
	</style>

</head>
<body>
	<div id = "content">
		<div id = "editBox">
			<form action="/freeInsController/edit.do" method = "post">
			<table id = "editTable">
				<tr>
					<td>
						ID
					</td>
					<td>
						<input type = "text" name = "id" value = "${freeIns.id }"/>
					</td>
				</tr>
				<tr>
					<td>
						Name
					</td>
					<td>
						<input type = "text" name = "customName" value = "${freeIns.customName }"/>
					</td>
				</tr>
				<tr>
					<td>
						Gender
					</td>
					<td>
						<input type = "text" name = "customSex" value = "${freeIns.customSex }"/>
					</td>
				</tr>
				<tr>
					<td>
						Age
					</td>
					<td>
						
						<input type = "text" name = "customAge" value = "${freeIns.customAge }"/>
					</td>
				</tr>
				<tr>
					<td>
						Address
					</td>
					<td>
						<input type = "text" name = "addr" value = "${freeIns.addr }"/>
					</td>
				</tr>
				<tr>
					<td>
						Phone
					</td>
					<td>
						<input type = "text" name = "phone" value = "${freeIns.phone }"/>
					</td>
				</tr>
				<tr>
					<td>
						status
					</td>
					<td>
						<input type = "text" name = "status" readonly="readonly" style = "background: #ccc" value = "${freeIns.status }"/>
					</td>
				</tr>
				<tr>
					<td>
						Agent Id
					</td>
					<td>
						<input type = "text" name = "userId" readonly="readonly" style = "background: #ccc" value = "${freeIns.userId }"/>
					</td>
				</tr>
				<tr>
					<td>
						Input Date
					</td>
					<td>
						<input type = "date" name = "inputDate" readonly="readonly" value = "<fmt:formatDate value='${freeIns.inputDate }' pattern='yyyy-MM-dd'/>"/>
					</td>
				</tr>
				<tr>
					<td>
						Remark
					</td>
					<td>
						<input type = "text" name = "remark" value = "${freeIns.remark }"/>
					</td>
				</tr>
				<tr>
					<td colspan = "2">
						<input type = "submit" value = "Edit" id = "editBtn"/>
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
