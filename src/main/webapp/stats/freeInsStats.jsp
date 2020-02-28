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
		
		#statsTable{
			border-collapse: collapse;
			width: 500px;
			height: 200px;
			text-align: center;
			margin: 75px auto;
		}
		#statsTable td{
			border: 1px solid black;
			padding: 5px;
		}
		
		input{
			padding: 3px;
		}
		#cancelBtn{
			background: #282;
		}
	</style>

</head>
<body>
	<div id = "content">
		<div id = "statsBox">
			<table id = "statsTable">
				<tr>
					<td>Saved</td>
					<td>Submitted</td>
					<td>Confirmed</td>
					<td>Sum</td>
				</tr>
				<tr>
					<td>${saved }</td>
					<td>${submitted }</td>
					<td>${confirmed }</td>
					<td>${sum }</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
