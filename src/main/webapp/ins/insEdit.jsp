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
				window.location.href= "/insController/getInsByPageAndUserId.do?currentPage=1";
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
			<form action="/insController/edit.do" method = "post">
			<table id = "editTable">
				<tr>
					<td>
						ID
					</td>
					<td>
						<input type = "text" name = "id" placeholder="Please enter the value" value = "${ins.id }" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>
						Name
					</td>
					<td>
						<input type = "text" name = "customName" placeholder="Please enter the value" value = "${ins.customName }"/>
					</td>
				</tr>
				<tr>
					<td>
						Gender
					</td>
					<td>
						<input type = "text" name = "customSex" placeholder="Please enter the value" value = "${ins.customSex }"/>
					</td>
				</tr>
				<tr>
					<td>
						Age
					</td>
					<td>
						
						<input type = "text" name = "customAge" placeholder="Please enter the value" value = "${ins.customAge }"/>
					</td>
				</tr>
				<tr>
					<td>
						Address
					</td>
					<td>
						<input type = "text" name = "addr" placeholder="Please enter the value" value = "${ins.addr }"/>
					</td>
				</tr>
				<tr>
					<td>
						Phone
					</td>
					<td>
						<input type = "text" name = "phone" placeholder="Please enter the value" value = "${ins.phone }"/>
					</td>
				</tr>
				<tr>
					<td>
						ID Card
					</td>
					<td>
						<input type = "text" name = "idcard" placeholder="Please enter the value" value = "${ins.idcard }"/>
					</td>
				</tr>
				<tr>
					<td>
						Bank Account
					</td>
					<td>
						<input type = "text" name = "bankcard" placeholder="Please enter the value" value = "${ins.bankcard }"/>
					</td>
				</tr>
				<tr>
					<td>
						Product
					</td>
					<td>
						<input type = "text" name = "pid" placeholder="Please enter the value" value = "${ins.pid }"/>
					</td>
				</tr>
				<tr>
					<td>
						Date of Input
					</td>
					<td>
						<input type = "text" name = "inputDate" placeholder="Please enter the value" value = "<fmt:formatDate value='${ins.inputDate }' pattern='yyyy-MM-dd'/>"/>
					</td>
				</tr>
				
				<tr>
					<td>
						Status
					</td>
					<td>
						<input type = "text" name = "status" placeholder="Please enter the value" value = "${ins.status }"/>
					</td>
				</tr>
				<tr>
					<td>
						User ID
					</td>
					<td>
						<input type = "text" name = "userId" placeholder="Please enter the value" value = "${ins.userId }"/>
					</td>
				</tr>
				<tr>
					<td>
						Marital Status
					</td>
					<td>
						<input type = "text" name = "isMarry" placeholder="Please enter the value" value = "${ins.isMarry }"/>
					</td>
				</tr>
				<tr>
					<td>
						Remark
					</td>
					<td>
						<input type = "text" name = "remark" placeholder="Please enter the value" value = "${ins.remark }"/>
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
