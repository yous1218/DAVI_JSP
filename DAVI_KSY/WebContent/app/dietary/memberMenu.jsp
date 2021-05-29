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
			.headresize{
				width: 9%;
				display:flex;
				justify-content:center;
				align-items:center;			
			}			
			.resize{
				width: 30%;
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
				width: 250px;
				height:250px;
				object-fit: cover;
				border-radius:50%;
			}
						
			.content p{
				margin-bottom:1em !important;
			}
			
			.gtr-200{
				margin-bottom:3%;
			}
			
			.times{
				display:flex;
				width:100%;
			}
			
			.row{
				padding:2% 3em 2% 0;
			}
			
			.border {
				border: 2px solid orange;
			}
		</style>				
	</head>
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
								<c:set var="today" value="${today}"/>
								<section style="padding-top:4em;">
								
								<h2 align="center" style="margin-bottom:5%; font-size:2.5rem;">이주의 식단</h2>
									<div style="width: 90%;margin: auto;">
										<div class="times" >												
											<div class="headresize">																						
											</div>
											<div class="resize">
												<h5>아침</h5>
											</div>
											<div class="resize">
												<h5>점심</h5>
											</div>
											<div class="resize">
												<h5>저녁</h5>
											</div>
										</div>
										<div class="row gtr-200" id="monday">
											<div class="headresize">
												<span >월<br>요<br>일</span>													
											</div>	
											<c:forEach var="i" begin="0" end="12" step="6" >
												<div class="resize">
													<a href="${pageContext.request.contextPath}/member/recipe.me?fileName=${menus.get(i).get('RECIPEFILENAME')}">
														<span><img src="${pageContext.request.contextPath}/app/recipe/img/${menus.get(i).get('RECIPEIMAGENAME')}" class="imgsize"></span>	
														<span>${menus.get(i).get('RECIPENAME')}</span>												
													</a>
												</div>
											</c:forEach>
										
										</div>
										<div class="row gtr-200" id="tuesday">
											<div class="headresize">
												<span >화<br>요<br>일</span>														
											</div>	
											<c:forEach var="i" begin="1" end="13" step="6">
												<div class="resize">
													<a href="${pageContext.request.contextPath}/member/recipe.me?fileName=${menus.get(i).get('RECIPEFILENAME')}">
														<span><img src="${pageContext.request.contextPath}/app/recipe/img/${menus.get(i).get('RECIPEIMAGENAME')}" class="imgsize"></span>	
														<span>${menus.get(i).get('RECIPENAME')}</span>												
													</a>
												</div>	
											</c:forEach>					
										</div>
										<div class="row gtr-200" id="wednesday">
											<div class="headresize">
												<span >수<br>요<br>일</span>															
											</div>	
											<c:forEach var="i" begin="2" end="14" step="6">
												<div class="resize">
													<a href="${pageContext.request.contextPath}/member/recipe.me?fileName=${menus.get(i).get('RECIPEFILENAME')}">
														<span><img src="${pageContext.request.contextPath}/app/recipe/img/${menus.get(i).get('RECIPEIMAGENAME')}" class="imgsize"></span>	
														<span>${menus.get(i).get('RECIPENAME')}</span>												
													</a>
												</div>	
											</c:forEach>						
										</div>
										<div class="row gtr-200" id="thursday">
											<div class="headresize">
												<span >목<br>요<br>일</span>															
											</div>	
											<c:forEach var="i" begin="3" end="15" step="6">
												<div class="resize">
													<a href="${pageContext.request.contextPath}/member/recipe.me?fileName=${menus.get(i).get('RECIPEFILENAME')}">
														<span><img src="${pageContext.request.contextPath}/app/recipe/img/${menus.get(i).get('RECIPEIMAGENAME')}" class="imgsize"></span>	
														<span>${menus.get(i).get('RECIPENAME')}</span>												
													</a>
												</div>	
											</c:forEach>						
										</div>
										<div class="row gtr-200" id="friday">
											<div class="headresize">
												<span >금<br>요<br>일</span>															
											</div>	
											<c:forEach var="i" begin="4" end="16" step="6">
												<div class="resize">
													<a href="${pageContext.request.contextPath}/member/recipe.me?fileName=${menus.get(i).get('RECIPEFILENAME')}">
														<span><img src="${pageContext.request.contextPath}/app/recipe/img/${menus.get(i).get('RECIPEIMAGENAME')}" class="imgsize"></span>	
														<span>${menus.get(i).get('RECIPENAME')}</span>												
													</a>
												</div>	
											</c:forEach>						
										</div>
										<div class="row gtr-200" id="saturday"> 
											<div class="headresize">
												<span >토<br>요<br>일</span>															
											</div>	
											<c:forEach var="i" begin="5" end="17" step="6">
												<div class="resize">
													<a href="${pageContext.request.contextPath}/member/recipe.me?fileName=${menus.get(i).get('RECIPEFILENAME')}">
														<span><img src="${pageContext.request.contextPath}/app/recipe/img/${menus.get(i).get('RECIPEIMAGENAME')}" class="imgsize"></span>	
														<span>${menus.get(i).get('RECIPENAME')}</span>												
													</a>
												</div>	
											</c:forEach>						
										</div>
										<div style="width:100%; margin-top:8%;">
											<a href="${pageContext.request.contextPath}/member/payment.me">
												<img alt="" style="width:100%; height:auto;" src="https://cdn.discordapp.com/attachments/821644547493986328/834229180241018940/ee7ca46d9e84feb8.png" >
											</a>
										</div>
									</div>

								</section>
								
							<div>
							<!-- Footer -->
								<c:import url="/app/footer/footer.jsp"/>
							</div>
							
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
			<script>
			$(document).ready(function(){
				var today = "${today}";
				var id = "#" + today;
				var location = $(id).offset();
				$('html').animate({scrollTop : location.top - 100}, 1000);
				$(id).addClass('border');
			})
				
			</script>

	</body>
</html>