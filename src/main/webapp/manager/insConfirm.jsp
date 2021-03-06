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
	<script type="text/javascript" src = "<%=path %>/util/util.js"></script>
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
					<td>Gender</td>
					<td>Age</td>
					<td>Address</td>
					<td>Phone</td>
					<td>Bank Account</td>
					<td>Product ID</td>
					<td>Date of Input</td>
					<td>Status</td>
					<td>User ID</td>
					<td>Marial Status</td>
					<td>Remark</td>
					<td>Function</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pb.insList }" var="ins">
					<tr>
						<td>${ins.id }</td>
						<td>${ins.customName }</td>
						<td>${ins.customSex }</td>
						<td>${ins.customAge }</td>
						<td>${ins.addr }</td>
						<td>${ins.phone }</td>
						<td>${ins.bankcard }</td>
						<td>${ins.pid }</td>
						<td><fmt:formatDate value="${ins.inputDate }" pattern="yyyy-MM-dd"/></td>
						<td>
						<c:choose>
							<c:when test="${ins.status == 1 }">
								Saved
							</c:when>
							<c:when test="${ins.status == 2 }">
								Submitted
							</c:when>
							<c:when test="${ins.status == 3 }">
								Confirmed
							</c:when>
							<c:when test="${ins.status == 4 }">
								Accounted
							</c:when>
						</c:choose>
						</td>
						<td>${ins.userId }</td>
						<td>${ins.isMarry }</td>
						<td>${ins.remark }</td>
						<td>
							<div id = "deleteButton" class = "toolButton" title = "delete">
								<a href = "<%=path %>/managerController/rejectInsByManager.do?id=${ins.id }">X</a>
							</div>
							<div id = "submitButton" class = "toolButton" title = "submit">
								<a href = "<%=path %>/managerController/submitInsByManager.do?id=${ins.id }">^</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="14">
						<c:if test="${pb.currentPage != 1 }">
							
							<a href = "<%=path %>/managerController/getInsByPageAndStatus.do?currentPage=1">First Page &emsp;</a>
							<a href = "<%=path %>/managerController/getInsByPageAndStatus.do?currentPage=${pb.currentPage-1 }">Previous Page &emsp;</a>
							
						</c:if>
						
						
						${pb.currentPage }/${pb.totalPages } &emsp;
						<c:if test="${pb.currentPage != pb.totalPages }">
							
							<a href = "<%=path %>/managerController/getInsByPageAndStatus.do?currentPage=${pb.currentPage+1 }">Next Page &emsp;</a>
							<a href = "<%=path %>/managerController/getInsByPageAndStatus.do?currentPage=${pb.totalPages }">Last Page &emsp;</a>
						</c:if>
						<div style = "float: right; text-align:right; margin-right: 5px">Total Entries:${fn:length(pb.insList)}</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>
