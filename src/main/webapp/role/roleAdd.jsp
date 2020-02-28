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
				window.location.href= "/roleController/getAllRoles.do";
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
		
		#addTable{
			border-collapse: collapse;
			width:300px;
			height: 200px;
			text-align: center;
			margin: 75px auto;
		}
		#addTable td{
			border: 1px solid black;
			padding: 5px;
		}
		
		input{
			padding: 3px;
		}
		#addBtn{
			background: #282;
		}
		#cancelBtn{
			background: #282;
		}
	</style>

</head>
<body>
	<div id = "content">
		<div id = "addBox">
			<form action="/roleController/addRole.do" method = "post">
			<table id = "addTable">
				<tr>
					<td>
						RoleName
					</td>
					<td>
						<input type = "text" name = "rname" placeholder="Please enter the value"/>
					</td>
				</tr>
				<tr>
					<td>
						Level
					</td>
					<td>
						<select name="level">
							<option value="1">Basic</option>
							<option value="2">High</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						Remark
					</td>
					<td>
						<input type = "text" name = "remark" placeholder="Please enter the value"/>
					</td>
				</tr>
				<tr>
					<td colspan = "2">
						<input type = "submit" value = "Add" id = "addBtn"/>
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
