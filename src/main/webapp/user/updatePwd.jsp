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
			var rid = ${user.rid};
			cancelBtn.onclick=function(){
				window.location.href= "/freeInsController/getFreeInsByPageAndUserId.do?currentPage=1";
			}
			
		}
		
		function check(){
			var oldPwd = document.getElementById("oldPwd");
			var newPwd = document.getElementById("newPwd");
			var newPwd2 = document.getElementById("newPwd2");
			if(oldPwd.value == ${user.pwd}){
				if(newPwd.value==newPwd2.value){
					return true;
				}else{
					alert("The passwords you entered do not match");
					return false;
				}
				
			}
			else{
				alert("The original password is invalid.");
				return false;
			}
		}
	</script>
	<style type="text/css">
		body{
			margin: 0px;
			padding: 0px;
		}
		#content{
			margin: 170px auto;
			width: 600px;
			height: 400px;
			text-align: center;
			background: #afa;
			border-radius: 10px;
			opacity: 0.8;
		}
		#updatePwdForm{
			padding: 30px;
		}
		input{
			margin: 10px;
			padding: 5px;
			width: 250px;
			border-radius: 5px;
		}
		.btn{
			color: white;
			background: #282;
			cursor: pointer;
			width: 150px;
		}
		#updateTitle{
			padding-top: 50px;
			color: #232;
			font-weight: 400;
			font-size: 170%;
			font-family: georgia;
		}
	</style>

</head>
<body>
	<div id = "content">
		<div id = "updateTitle">
			Update Password
		</div>
		<form id = "updatePwdForm" action="<%=path %>/userController/updatePwd.do" method="post" onsubmit="return check()">
			Original Password<input type = "password" id = "oldPwd" name = "oldPwd" placeholder= "Please enter your previous password"/><br/>
			New Password &emsp;<input type = "password" id = "newPwd" name ="newPwd" placeholder="Please enter your new password"/><br/>
			Confirm Password<input type = "password" id = "newPwd2" name ="newPwd2" placeholder="Please confirm your password"/><br/>
			<input type = "submit" class="btn" value = "Submit"/> &nbsp; <input type = "button" id = "cancelBtn" class="btn" value = "Cancel"/>
		</form>	
	</div>	
</body>
</html>
