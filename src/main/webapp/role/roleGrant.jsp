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
			
			
			var inputList = document.getElementsByTagName("input");
			var rid = ${rid};
			var roleMenuListArray = ${roleMenuList};
			for(var i = 0; i < inputList.length; i++){
				for(var j = 0; j < roleMenuListArray.length; j++){
					if(inputList[i].value == roleMenuListArray[j].menuNum){
						inputList[i].setAttribute("checked", "checked");
					}
				}
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
		
		#grantTable{
			border-collapse: collapse;
			width: 500px;
			height: 300px;
			text-align: left;
			margin: 75px auto;
		}
		#grantTable tfoot{
			text-align: center;
		}
		#grantTable td{
			border: 1px solid black;
			padding: 5px;
		}
		
		input{
			padding: 3px;
		}
		#grantBtn{
			background: #282;
		}
		#cancelBtn{
			background: #282;
		}
	</style>

</head>
<body>
	<div id = "content">
		<div id = "grantBox">
			<form action="/roleController/grantRole.do" method = "post">
			<table id = "grantTable">
				<tbody>
				<c:forEach items = "${pMenuList }" var = "pMenu">
					<tr>
						<td>
							<input name="parent" type="checkbox" value="${pMenu.pid }"/>
							<label>
								<c:forEach items = "${menuUtilList }" var = "menuUtil">
									<c:if test="${pMenu.pid==menuUtil.menuNum }">
										${menuUtil.menuText }
									</c:if>
								</c:forEach>
							</label>
						</td>
						<td>
							<c:forEach items="${sMenuList }" var = "sMenu">
								<c:if test="${sMenu.pid==pMenu.pid }">
									<input name="child" type="checkbox" value = "${sMenu.sid }"/>
									<label>
										<c:forEach items = "${menuUtilList }" var = "menuUtil">
											<c:if test="${sMenu.sid==menuUtil.menuNum }">
												${menuUtil.menuText }
											</c:if>
										</c:forEach>
									</label>
								</c:if>
							</c:forEach>
						</td>
					</tr>
				</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan = "2">
							<input type = "hidden" name = "rid" value = "${rid }"/>
							<input type = "submit" value = "Grant" id = "grantBtn"/>
							&emsp;
							<input type = "button" value = "Cancel" id = "cancelBtn"/>
						</td>
					</tr>
				</tfoot>

			</table>
			</form>
		</div>
	</div>
</body>
</html>
