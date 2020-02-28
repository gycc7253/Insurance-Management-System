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
					<td>Status</td>
					<td>userId</td>
					<td>Date of Input</td>
					<td>Remark</td>
					<td>Function</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pb.freeInsList }" var="freeIns">
					<tr>
						<td>${freeIns.id }</td>
						<td>${freeIns.customName }</td>
						<td>${freeIns.customSex }</td>
						<td>${freeIns.customAge }</td>
						<td>${freeIns.addr }</td>
						<td>${freeIns.phone }</td>
						<td>
						<c:choose>
							<c:when test="${freeIns.status == 1 }">
								Saved
							</c:when>
							<c:when test="${freeIns.status == 2 }">
								Submitted
							</c:when>
							<c:when test="${freeIns.status == 3 }">
								Confirmed
							</c:when>
						</c:choose>
						
						</td>
						<td>${freeIns.userId }</td>
						<td><fmt:formatDate value="${freeIns.inputDate }" pattern="yyyy-MM-dd"/></td>
						<td>${freeIns.remark }</td>
						<td>
							<div id = "editButton" class = "toolButton" title = "edit">
								<a href = "<%=path %>/freeInsController/checkEdit.do?id=${freeIns.id}">Y</a>
							</div>
							<div id = "deleteButton" class = "toolButton" title = "delete">
								<a href = "<%=path %>/freeInsController/checkDelete.do?id=${freeIns.id }">X</a>
							</div>
							<div id = "submitButton" class = "toolButton" title = "submit">
								<a href = "<%=path %>/freeInsController/submitFreeInsByMember.do?id=${freeIns.id }">^</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="11">
						<div id = "addButton" class = "toolButton" title = "Add">
							<a href = "<%=path %>/freeIns/freeInsAdd.jsp">+</a>
						</div>
						<c:if test="${pb.currentPage != 1 }">
							
							<a href = "<%=path %>/freeInsController/getFreeInsByPageAndUserId.do?currentPage=1">First Page &emsp;</a>
							<a href = "<%=path %>/freeInsController/getFreeInsByPageAndUserId.do?currentPage=${pb.currentPage-1 }">Previous Page &emsp;</a>
							
						</c:if>
						
						
						${pb.currentPage }/${pb.totalPages } &emsp;
						<c:if test="${pb.currentPage != pb.totalPages }">
							
							<a href = "<%=path %>/freeInsController/getFreeInsByPageAndUserId.do?currentPage=${pb.currentPage+1 }">Next Page &emsp;</a>
							<a href = "<%=path %>/freeInsController/getFreeInsByPageAndUserId.do?currentPage=${pb.totalPages }">Last Page &emsp;</a>
						</c:if>
						<div style = "float: right; text-align:right; margin-right: 5px">Total Entries:${fn:length(pb.freeInsList)}</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>
