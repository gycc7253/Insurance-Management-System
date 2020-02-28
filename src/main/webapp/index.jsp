<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<style type="text/css">
		body{
			background-image: url(image/greenBackground_1.jpg);
		}
		#loginMain{
			margin: 170px auto;
			width: 600px;
			height: 400px;
			text-align: center;
			background: #afa;
			border-radius: 10px;
			opacity: 0.8;
		}
		input{
			margin: 10px;
			padding: 5px;
			width: 230px;
			border-radius: 5px;
		}
		#submitBtn{
			color: white;
			background: #282;
			cursor: pointer;
			width: 150px;
		}
		#loginForm{
			padding: 50px;
			font-family: arial;
		}
		#loginTitle{
			padding-top: 50px;
			color: #232;
			font-weight: 400;
			font-size: 170%;
			font-family: georgia;
		}
	</style>
	<script type="text/javascript">
		if(window!=top){
			top.location.href = location.href;
		}
	</script>
</head>
<body>
	<div id = "loginMain">
		<div id = "loginTitle">Insurance Management System Login</div>
		<form id = "loginForm" action="userController/login.do" method = "post">
			
			Account &nbsp;<input type = "text" name = "userName" placeholder = "Please enter your username"/><br/>
			password<input type = "text" name = "pwd" placeholder = "Please enter your password"/><br/>
			<input id = "submitBtn" type = "submit"/>
		
		</form>
	</div>
</body>
</html>
