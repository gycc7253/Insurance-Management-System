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
		
		#editTable{
			border-collapse: collapse;
			width:300px;
			height: 200px;
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
			<form action="/roleController/editRole.do" method = "post">
			<table id = "editTable">
				<tr>
					<td>
						ID
					</td>
					<td>
						<input type = "text" name = "id" value = "${role.id }" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>
						Name
					</td>
					<td>
						<input type = "text" name = "rname" value = "${role.rname }"/>
					</td>
				</tr>
				<tr>
					<td>
						Level
					</td>
					<td>
						<select name = "level">
							<c:if test="${role.level==1 }">
								<option value = "1" selected="selected"> 1 </option>
							</c:if>
							<c:if test="${role.level!=1 }">
								<option value = "1"> 1 </option>
							</c:if>
							<c:if test="${role.level==2 }">
								<option value = "2" selected="selected"> 2 </option>
							</c:if>
							<c:if test="${role.level!=2 }">
								<option value = "2"> 2 </option>
							</c:if>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						Remark
					</td>
					<td>
						<input type = "text" name = "remark" value = "${role.remark }"/>
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
