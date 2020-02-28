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
				window.location.href= "/userController/getAllUsers.do";
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
			height: 200px;
			text-align: center;
			margin: 75px auto;
		}
		#deleteTable td{
			border: 1px solid black;
			padding: 5px;
		}
		
		input{
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
			<form action="/userController/deleteUser.do" method = "post">
			<table id = "deleteTable">
				<tr>
					<td>
						ID
					</td>
					<td>
						<input type = "text" name = "id" value = "${tUser.id }" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>
						Name
					</td>
					<td>
						<input type = "text" name = "userName" value = "${tUser.userName }" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>
						Password
					</td>
					<td>
						<input type = "text" name = "pwd" value = "${tUser.pwd }" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>
						Role
					</td>
					<td>
						<select name="rid" disabled="disabled">
							<c:choose>
								<c:when test="${tUser.rid==1 }">
									<option value = "1" selected="selected">Free Insurance</option>
								</c:when>
								<c:when test="${tUser.rid==2 }">
									<option value = "2" selected="selected">Insurance</option>
								</c:when>
								<c:when test="${tUser.rid==3 }">
									<option value = "3" selected="selected">Manager</option>
								</c:when>
								<c:when test="${tUser.rid==4 }">
									<option value = "4" selected="selected">Finance</option>
								</c:when>
								<c:when test="${tUser.rid==5 }">
									<option value = "5" selected="selected">Admin</option>
								</c:when>
								<c:when test="${tUser.rid==6 }">
									<option value = "6" selected="selected">Human Resource</option>
								</c:when>
							</c:choose>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						Level
					</td>
					<td>
						<input type = "text" name = "level" value = "${tUser.level }" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>
						Status
					</td>
					<td>
						<input type = "text" name = "isdel" value = "${tUser.isdel }" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>
						Remark
					</td>
					<td>
						<input type = "text" name = "remark" value = "${tUser.remark }" readonly="readonly"/>
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
