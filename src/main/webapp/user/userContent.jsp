<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<script type="text/javascript" src = "<%=path %>/lib/jquery-3.3.1.js"></script>
	<script type="text/javascript">
	
	</script>
	<style type="text/css">
		#contentTB{
			margin: 50px auto;
			width: 1400px;
			border-collapse: collapse;
			text-align: center;
			float:left;
			position: relative;
			left: 70px;
		}
		#contentTB thead{
			border: 1px solid #666;
			background-color: rgba(80, 180, 80, 0.3);
			font-weight:900;
		}
		#contentTB td{
			border: 1px solid #666;
			padding: 10px 3px;
		}
		#contentTB tBody tr:nth-child(even){
			background: rgba(30, 30, 30, 0.1);
		}
		#contentTB tBody tr:nth-child(odd){
			background: rgba(80, 80, 80, 0.3);
		}
		#contentTB tfoot a{
			text-decoration: none;
		}

		#toolButtons{
			display: inline-block;
			width: 93px;
			align: center;
		}
		.toolButton{
			width:20px;
			height:20px;
			background: -webkit-linear-gradient(top, #2c2, #4f4);
			border:2px solid white;
			color:white;
			font-size:100%;
			font-weight: 900;
			border-radius: 12px;
			cursor: pointer;
			text-align:center;
			float:left;
			margin-left: 15px;
		}
		.toolButton a{
			text-decoration: none;
			color:white;
		}
		#editButton{
			font-size: 90%;
		}
		#addButton{
			font-size: 110%;
			line-height: 18px;
		}
		#deleteButton{
			font-size: 90%;
		}
		#submitButton{
			line-height: 23px;
			font-size: 110%;
		}
	</style>
</head>
<body>
	<div>
		<table id = "contentTB">
			<thead>
				<tr>
					<td>ID</td>
					<td>Name</td>
					<td>Password</td>
					<td>Role</td>
					<td>Level</td>
					<td>Status</td>
					<td>Remark</td>
					<td>Function</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userList}" var="tUser">
					<tr>
						<td>${tUser.id }</td>
						<td>${tUser.userName}</td>
						<td>${tUser.pwd}</td>
						<td>
							<c:choose>
								<c:when test="${tUser.rid==1 }">Free Insurance</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${tUser.rid==2 }">Insurance</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${tUser.rid==3 }">Manager</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${tUser.rid==4 }">Finance</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${tUser.rid==5 }">Admin</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${tUser.rid==6 }">Human Resource</c:when>
							</c:choose>
						
						</td>
						<td>${tUser.level }</td>
						<td>
							<c:choose>
								<c:when test="${tUser.isdel==1 }">Active</c:when>
								<c:when test="${tUser.isdel==2 }">On Leave</c:when>
							</c:choose>
						</td>
						<td>${tUser.remark}</td>
						<td>
							<div id="toolButtons">
								<div id = "editButton" class = "toolButton" title = "edit">
									<a href = "<%=path %>/userController/checkEdit.do?id=${tUser.id}">Y</a>
								</div>
								<div id = "deleteButton" class = "toolButton" title = "delete">
									<a href = "<%=path %>/userController/checkDelete.do?id=${tUser.id}">X</a>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8">
						<div id = "addButton" class = "toolButton" title = "Add">
							<a href = "<%=path %>/user/userAdd.jsp">+</a>
						</div>
						<div style = "float: right; text-align:right; margin-right: 5px">Total Entries: ${fn:length(userList) }</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>
