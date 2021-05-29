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
	</head>
			<style>
			.headresize{
				width: 9%;
				display:flex;
				justify-content:center;
				align-items:center;			
			}			
			.resize{
				width: 15%;
				display:flex;
				justify-content:center;
					
			}
			
			.resize a{
				display:flex;
				flex-direction:column;
				justify-content:center;
				align-items:center;
				padding-top:2%;
			}
			
			.resize a span {
				color:#7f888f;
			}
			
			.imgsize{
			width: 100%;
			object-fit: contain;
			}
						
			.content p{
				margin-bottom:1em !important;
			}
			
			.gtr-200{
				margin-bottom:3%;
			}
		</style>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<c:import url="/app/header/header.jsp" />
					

							<!-- Content -->
							<c:set var="menus" value="${menus}"></c:set>
								<hr style="background-color: rgba(0, 59, 251, 0.3); height: 3px; width:70%; margin:3% auto;">
								<h2 style="text-align:center;">식단 선정 관리자 페이지</h2>
								<hr style="background-color: rgba(0, 59, 251, 0.3); height: 3px; width:70%; margin:0 auto;">
								<section>
								<c:if test="${empty menus}">
									<form action="${pageContext.request.contextPath}/member/CreateWeekOkAction.me">
										<div style="text-align:center;">
											<button type="submit">랜덤 메뉴 확인하기</button>
										</div>
									</form>
								</c:if>
								<c:if test="${not empty menus}">
										<section>
									
									<h2 align="center" style="margin-bottom:5%; font-size:2.5rem;">이주의 식단</h2>
										<div style="width: 80%;margin: auto;">
											<div class="row gtr-200" style="margin-bottom:1%;" >												
												<div class="headresize">																						
												</div>
												<div class="resize">
													<h5>월요일</h5>
												</div>
												<div class="resize">
													<h5>화요일</h5>
												</div>
												<div class="resize">
													<h5>수요일</h5>
												</div>
												<div class="resize" >
													<h5>목요일</h5>
												</div>
												<div class="resize">
													<h5>금요일</h5>
												</div>
												<div class="resize">	
													<h5>토요일</h5>	
												</div>							
											</div>
											<div class="row gtr-200" >
												<div class="headresize">
													<span >아<br>침</span>													
												</div>	
												<c:forEach var="i" begin="0" end="5" >
													<div class="resize">
														<a href="${pageContext.request.contextPath}/app/recipe/${menus.get(i).get('RECIPEFILENAME')}">
															<span><img src="${pageContext.request.contextPath}/app/recipe/img/${menus.get(i).get('RECIPEIMAGENAME')}" class="imgsize"></span>	
															<span>${menus.get(i).get('RECIPENAME')}</span>												
														</a>
													</div>
												</c:forEach>
											
											</div>
											<div class="row gtr-200" >
												<div class="headresize">
													<span >점<br>심</span>													
												</div>	
												<c:forEach var="i" begin="6" end="11" >
													<div class="resize">
														<a href="${pageContext.request.contextPath}/app/recipe/${menus.get(i).get('RECIPEFILENAME')}">
															<span><img src="${pageContext.request.contextPath}/app/recipe/img/${menus.get(i).get('RECIPEIMAGENAME')}" class="imgsize"></span>	
															<span>${menus.get(i).get('RECIPENAME')}</span>												
														</a>
													</div>	
												</c:forEach>					
											</div>
											<div class="row gtr-200" >
												<div class="headresize">
													<span>저<br>녁</span>													
												</div>	
												<c:forEach var="i" begin="12" end="17" >
													<div class="resize">
														<a href="${pageContext.request.contextPath}/app/recipe/${menus.get(i).get('RECIPEFILENAME')}">
															<span><img src="${pageContext.request.contextPath}/app/recipe/img/${menus.get(i).get('RECIPEIMAGENAME')}" class="imgsize"></span>	
															<span>${menus.get(i).get('RECIPENAME')}</span>												
														</a>
													</div>	
												</c:forEach>						
											</div>
										</div>
									</section>
								</c:if>
								</section>
								

							
						</div>
					</div>

				<!-- Sidebar -->
					<c:import url="/app/footer/sidebar.jsp" />

			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	</body>
	
	
</html>