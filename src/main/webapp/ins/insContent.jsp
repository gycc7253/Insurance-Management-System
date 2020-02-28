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
		var insIdToFollow = 0;
		window.onload = function(){
			var followBtn = document.getElementById("followButton");
			var model = document.getElementById("model");
			
			var cancelBtn = document.getElementById("cancelBtn");
			cancelBtn.onclick=function(){
				window.location.href= "/insController/getInsByPageAndUserId.do?currentPage=1";
			}
		}
		

		function load(insId){
			model.style.display = "block";
			insIdToFollow = parseInt(insId);
			$("#addFollowInsId").attr("value", insId);
			$.ajax({
				type: "post",
				url: "/insFollowController/getInsFollowByInsId.do?insId=" + insId,
				dataType: "json",
				success: function(data){

					$("#followContent tr").remove();

					$(data).each(function(index){
						var val = data[index];
						var recordDateStr = formatDate(val.recordDate);
						var nextDateStr = formatDate(val.nextDate);
						var trtd = 
							"<td>" 
							+ val.id + "</td><td>"
							+ recordDateStr + "</td><td>"
							+ val.recordText + "</td><td>"
							+ nextDateStr + "</td><td>"
							+ val.insId + 
							"</td>";
						$("#followContent").append("<tr>" + trtd + "</tr>");
					})
				}
			});
			
			
		}
		
		function formatDate(date){
			var d = new Date(date);
			month = '' + (d.getMonth()+1);
			day = '' + d.getDate(),
			year = '' + d.getFullYear();
			if (month.length < 2) month = '0' + month;
			if (day.length < 2) day = '0' + day;
			return [year, month, day].join('-');
				
		}
	</script>
	<style type="text/css">
		body{
			margin: 0px;
		}
		#contentTB{
			margin: 50px auto;
			width: 1400px;
			border-collapse: collapse;
			text-align: center;
			float:left;
			position: relative;
			left: 70px;
			overflow: scroll;
			font-size: 15px;
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
		#followButton{
			font-size: 12px;
		}
		#model{	
			margin: 0px;
			position: absolute;
			width: 100%;
			height: 100%;
			z-index: 1;
			background: rgba(0, 0, 0, 0.8);
		}
		#followBox{
			width: 800px;
			height: 500px;
			margin: 100px auto;
			background: rgba(200, 200, 200, 1);
			padding: 40px;
		}
		
		#followTable{
			margin: 20px auto;
			padding: 20px;
			border-collapse: collapse;
		}
		#followTable td{
			padding: 3px;
			border: 1px solid black;
		}
		#followLogo{
			width: 300px;
			font-family: arial;
			font-size: 150%;
			color: #282;
			margin: 10px auto;
		}
		
		#followAddTB{
			margin: 40px auto;
			border-collapse: collapse;
			text-align: center;
		}
		#followAddTB td{
			padding: 10px;
			border: 1px solid black;
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
					<td>Marial Status</td>
					<td>Remark</td>
					<td style="width: 150px">Function</td>
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
						<td>${ins.isMarry }</td>
						<td>${ins.remark }</td>
						<td>
							<div id = "editButton" class = "toolButton" title = "edit">
								<a href = "<%=path %>/insController/checkEdit.do?id=${ins.id}">Y</a>
							</div>
							<div id = "deleteButton" class = "toolButton" title = "delete">
								<a href = "<%=path %>/insController/checkDelete.do?id=${ins.id }">X</a>
							</div>
							<div id = "submitButton" class = "toolButton" title = "submit">
								<a href = "<%=path %>/insController/submitInsByMember.do?id=${ins.id }">^</a>
							</div>
							<div id = "followButton" class = "toolButton" title = "follow">
								<a onclick = "load(${ins.id})">...</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="13">
						<div id = "addButton" class = "toolButton" title = "Add">
							<a href = "<%=path %>/ins/insAdd.jsp">+</a>
						</div>
						<c:if test="${pb.currentPage != 1 }">
							
							<a href = "<%=path %>/insController/getInsByPageAndUserId.do?currentPage=1">First Page &emsp;</a>
							<a href = "<%=path %>/insController/getInsByPageAndUserId.do?currentPage=${pb.currentPage-1 }">Previous Page &emsp;</a>
							
						</c:if>
						
						
						${pb.currentPage }/${pb.totalPages } &emsp;
						<c:if test="${pb.currentPage != pb.totalPages }">
							
							<a href = "<%=path %>/insController/getInsByPageAndUserId.do?currentPage=${pb.currentPage+1 }">Next Page &emsp;</a>
							<a href = "<%=path %>/insController/getInsByPageAndUserId.do?currentPage=${pb.totalPages }">Last Page &emsp;</a>
						</c:if>
						<div style = "float: right; text-align:right; margin-right: 5px">Total Entries:${fn:length(pb.insList)}</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<input id = "insIdToFollow" type = "hidden"/>
	<div id = "model" style = "display: none">
		<div id = "followBox">
			<div id = "followLogo">
				Insurance Follow Record
			</div>
			<table id = "followTable">
				<tr>
					<td>Entry Index</td>
					<td>Record Date</td>
					<td>Record Text</td>
					<td>Next Date</td>
					<td>Insurance ID</td>
				</tr>
				<tbody id = "followContent">
				</tbody>
			</table>
			<form action = "<%=path %>/insFollowController/addInsFollow.do" method = "post" id = "addFollowForm">
				<input type = "hidden" name = "insId" id = "addFollowInsId"/>
				<table id = "followAddTB">
					<tr>
						<td>
							Follow Content
						</td>
						<td>
							Next Follow
						</td>
					</tr>
					<tr>
						<td>
							<textarea rows="8" cols="20" name="recordText"></textarea>
						</td>
						<td>
							<input type = "date" name = "nextDate"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type = "submit" value = "Submit"/>
							<input type = "button" value = "Cancel" id = "cancelBtn">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
