<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<script type = "text/javascript" src = "<%=path %>/lib/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		window.onload = function(){
			var navContent = document.getElementById("navContent");
			var subNavList = navContent.getElementsByTagName("div");
			var leftSpace = 0;
			var outerAList = document.getElementsByName("outerA");
			var liList = document.getElementsByTagName("li");
			
			for(var i = 0; i < subNavList.length; i++){
				subNavList[i].style.left = (240 + leftSpace) + "px";
				subNavList[i].style.width = outerAList[i].offsetWidth + "px";
				leftSpace += (outerAList[i].offsetWidth);
			}
			
			for(var i = 0; i < liList.length; i++){
				liList[i].index = i;
				liList[i].onmouseover = function(){
					for(var j = 0; j < subNavList.length; j++){
						subNavList[j].style.display = "none";
						outerAList[j].style.background = "#333";
						outerAList[j].style.color = "#ddd";
					}
					subNavList[this.index].style.display = "block";
					outerAList[this.index].style.background = "#2a2";
					outerAList[this.index].style.color = "white";
				}
				liList[i].onmouseout = function(){
					var m = this.index;
					myTimer = setTimeout(function(){
						outerAList[m].style.background = "#333";
						outerAList[m].style.color = "#ddd"
						subNavList[m].style.display="none";
					},	100);
				}
			}
			
			
			for(var i = 0; i < subNavList.length; i++){
				subNavList[i].index = i;
				subNavList[i].onmouseover = function(){
					clearTimeout(myTimer);
					
				}
				subNavList[i].onmouseout = function(){
					subNavList[this.index].style.display="none";
				}
			}
			
			
		}
	</script>
	<style type="text/css">
		body{
			margin: 0px;
			padding: 0px;
			background-image: url(/image/greenBackground_2.jpg);
			height: 100%;
			width: 100%;
			overflow: hidden;
		}
		#navBar{
			overflow: hidden;
			width: 100%;
			height: 53px;
			background: #333;
			margin: 0px;
			padding: 0px;
			overflow: visible;
		}
		#navLogo{
			float: left;
			font-size: 160%;
			color: white;
			font-family: centaur;
			font-weight: 900;
			letter-spacing: 6px;
			padding: 12px 40px 12px 80px;
			cursor: default;
		}
		#navContent{
			float: left;
			width: auto;
			list-style-type: none;
			font-family: times;
		}
		#navContent li{
			display:inline;
			float: left;
		}
		#navContent li .outerA{
			color: #ddd;
			border-right: 1px solid white;
			text-decoration: none;
			padding:0.8em 2em;
			cursor: pointer;
			
		}
		#navContent li .outerA:hover{
		}
		
		#navSearch{
			float: left;
			
		}
		#navAccount{
			float: right;
			padding: 14px;
			color: white;
			font-family: arial;
			font-size: 120%;
			cursor: default;
		}
		
		#navAccount a{
			text-decoration: none;
			color: white;
			font-size: 80%;
		}
		
		#navAccount a:hover{
			opacity: 0.8;
		}
		
		#navContent .subnav{
			position: absolute;
			top: 60px;
			left: 0px;
			width: auto;
			background: #333;
			width: 130px;
			text-align: center;
			border-radius: 3px;
		}
		
		#navContent .subnav p{
			margin: 0px;
			padding: 0px;
		}
		
		
		#navContent .subnav p span{
			margin: 0px;
			padding: 0px;
		}
		
		#navContent .subnav p a{
			color: #ccc;
			display: block;
			background: #333;
			padding: 15px 5px;
			cursor: pointer;
			border-bottom: 1px solid black;
			text-decoration: none;
		}
		
		#navContent .subnav p a:hover{
			color: white;
		}
		
	</style>

</head>
<body>
	<div id = "navBar">
		<div id = "navLogo">
			SIMS
		</div>
		<ul id = "navContent">
			<c:forEach items="${pMenuList }" var="pMenu">
				<li>
					<a class = "outerA" name = "outerA">${pMenu.text }</a>
					<div class="subnav" style="display: none;">
						<em class="arrow" style="left: 50px;"></em>
						<p>        	
							<span>
								<c:forEach items = "${sMenuList }" var = "sMenu">
									<c:if test="${sMenu.pid==pMenu.pid }">
										<a href = "<%=path %>/${sMenu.url}" target="content">${sMenu.text }</a>
									</c:if>
								</c:forEach>
							</span>
						</p>
					</div>
				</li>
				
			</c:forEach>
		</ul>
		<div id = "navSearch">

		</div>
		<div id = "navAccount">
			${user.userName}, Welcome! &emsp;
			<a href = "<%=path %>/userController/logout.do">Logout</a>
		</div>
	</div>
	<iframe id = "content" name = "content" frameborder="1" height="100%" width = "100%"/>
	
</body>
</html>
