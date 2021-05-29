<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE HTML>
<!--
	Editorial by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>기본 프레임</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />	
		<style>
			.main_box {
				width: 200px;
				height : auto;
				background-color: #1290FF;
				color : white !important;
				border : 1px #1290FF solid;
				border-radius: 10%;
			}
			
			.main_top_icon {
				color : white;
				font-size : 2em;
				display : flex;
				justify-content: center;
				padding-top: 10px;
				margin-bottom: 10px;
			}
			
			.main_menus {
				margin : 5px;
				padding: 10px;
				border : 0.5px white solid;
				border-radius: 10%;
				height: auto;
			}
			
			.main_menu_a {
				color: white;
				cursor: pointer;
			}
			
			.main_menu {
				display: flex;
				justify-content: space-between;
				margin: 5px;
			} 
			
			
			.main_menu_a:hover {
				color: black !important;
			}
			
			.bottom_menu {
				display: flex;
				justify-content: center;
			}
			
				
		</style>			
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
		<div class="main_box">
			<div>
				<div class="main_top_icon">
					<i class="fas fa-id-card-alt"></i>
				</div>
				<div class = "main_menus">
					<a href="${pageContext.request.contextPath}/member/weekMenu.me" class = "main_menu_a">
						<div class = "main_menu">
							<div>
								식단 관리
							</div>
							<div class = "menu_icons">
								<i class="fas fa-utensils"></i>
							</div>
						</div>
					</a>
					<a href="${pageContext.request.contextPath}/member/reportView.me" class = "main_menu_a">
						<div class = "main_menu">
							<div>
								보고서
							</div>
							<div class = "menu_icons">
								<i class="fas fa-calendar-week"></i>
							</div>
						</div>
					</a>
					<a href="${pageContext.request.contextPath}/member/memberPayListCheckOk.me" class = "main_menu_a">
						<div class = "main_menu">
							<div>
								마이페이지
							</div>
							<div class = "menu_icons">
								<i class="fas fa-user"></i>
							</div>
						</div>
					</a>
					
					<a href="${pageContext.request.contextPath}/member/logoutOk.me" class = "main_menu_a">
						<div class = "main_menu">
							<div>
								로그아웃 
							</div>
							<div class = "menu_icons">
								<i class="fas fa-sign-out-alt"></i>
							</div>
						</div>
					</a>
				</div>
				
				<div class="bottom_menus">
					<div class="bottom_menu">
						<a class= "main_menu_a" onclick = "javascript:window.scrollTo(0,0)">
							<div class="main_menu">
								<div style="margin:0 5px;">
									맨위로
								</div>
								
								<div>
									<i class="fas fa-arrow-circle-up"></i>
								</div>
							</div>
						</a>
					</div>
				
				</div>
				
			</div>
		
		</div>
		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	</body>
	
	
</html>