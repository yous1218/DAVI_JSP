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
		<title>나만의 다이어트 비서 DAVI</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slippry.css" />
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/index.css" />
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
		integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
		<style>
			body{
				font-family: 'Sunflower', sans-serif;
			}
			
			h1, h2, h3, h4 {
				font-family: 'Sunflower', sans-serif;
			}
			
			.second_section {
				background-color: rgba(0, 59, 251, 0.1);
			}
			
			.hideme_left {
				opacity: 0;
			}
			.hideme_right {
				opacity: 0;
			}
			
			.showme_left {
				-webkit-animation: fade-in-left 0.7s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
				animation: fade-in-left 0.7s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
			
			}
			.showme_right {
				-webkit-animation: fade-in-right 0.7s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
				animation: fade-in-right 0.7s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
			
			}
			
			@keyframes fade-in-left {
			  0% {
			    -webkit-transform: translateX(-80px);
			            transform: translateX(-80px);
			    opacity: 0;
			  }
			  100% {
			    -webkit-transform: translateX(0);
			            transform: translateX(0);
			    opacity: 1;
			  }
			}
			@keyframes fade-in-right {
			  0% {
			    -webkit-transform: translateX(80px);
			            transform: translateX(80px);
			    opacity: 0;
			  }
			  100% {
			    -webkit-transform: translateX(0);
			            transform: translateX(0);
			    opacity: 1;
			  }
			}
			
			.scrollSidemenu {
				position:absolute;
				top: 0;
				right:0;
				margin-top: 300px;
				margin-right: 20px;
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

							<!-- Banner -->
								<section style="padding:9% 0; margin:5% 0;">
									<div style="display:flex; justify-content:space-between; align-items:center; padding:0 5%;">
									<div class="content" style="width:50%;">
										<div style="padding:2%; width:100%; margin:auto;">
											<img alt="" 
											src="https://cdn.discordapp.com/attachments/821644547493986328/827345147972550666/intro_1.png"
											style="width:110%;">
										</div>
										<div style="display:flex; justify-content:space-between; width:80%; margin:auto; padding:3% 3%;">
											<div class="icon-box">
											
												<a class="loginCheck" href="${pageContext.request.contextPath}/member/weekMenu.me" style="height:auto;">
													<img alt="" src="${pageContext.request.contextPath}/images/개인식단.png">
													식단관리
												</a>
											</div>
											<div class="icon-box">
												<a class="loginCheck" href="${pageContext.request.contextPath}/board/ceritificatedBoard.bo" style="height:auto;">
													<img alt="" src="${pageContext.request.contextPath}/images/smartphone.png">
													인증게시판
												</a>
											</div>
											<div class="icon-box">
												<a href="${pageContext.request.contextPath}/board/freeList.bo" style="height:auto;">
													<img alt="" src="${pageContext.request.contextPath}/images/freeboard.png">
													자유게시판
												</a>
											</div>
											<div class="icon-box">
												<a  href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=서울/경기" style="height:auto;">
													<img alt="" src="${pageContext.request.contextPath}/images/exercise.png">
													치팅모임
												</a>
											</div>
										</div>
									</div>
									<div style="width:40%;">
										<ul id="demo1">
											<li><a href="#slide1"><img src="https://cdn.discordapp.com/attachments/821644547493986328/829230793329999983/50e626cf7f3a8384.png" class="slide-img"></a></li>
											<li><a href="#slide2"><img src="https://cdn.discordapp.com/attachments/821644547493986328/829224876702564392/972d6091bd3e4092.png" class="slide-img"></a></li>
											<li><a href="#slide3"><img src="https://cdn.discordapp.com/attachments/821644547493986328/829219959041163274/9797e8db5e9ea243.png" class="slide-img"></a></li>
											<li><a href="#slide3"><img src="https://cdn.discordapp.com/attachments/821644547493986328/829224874047176714/df21a70f1f69b1be.png" class="slide-img"></a></li>
										</ul>
									</div>
									</div>
								</section>
							</div>
							<div class="second_section">
								<div class="inner">
								<!-- 차트 섹션 -->
								<section style="padding:9% 0; margin:5% 0;">
									<div class = "chartsContent"style="display:flex; justify-content:center; align-items:center;">
									<div style="width:40%;">
										<div class = "hideme_left">
											<p style="font-size:1.1rem; color:#7f888f; font-weight:bold; margin-bottom:1%;">일일 영양소 권장 섭취량</p>
											<div id="chart_div3"></div>
										</div>
										<div class = "hideme_left">
											<p style="font-size:1.1rem; color:#7f888f; font-weight:bold; margin-bottom:0;">BMI 지수</p>
											<div id="chart_div2"></div>
										</div>
										<div class = "hideme_left">
											<p style="font-size:1.1rem; color:#7f888f; font-weight:bold; margin-bottom:0; margin-top:5%;">내 몸무게 비교</p>
											<div id="chart_div4"></div>
										</div>
									</div>
									<div class="content" style="width:50%;">
										<div class = "hideme_right" style="padding:2%; width:80%; margin:auto;">
											<img alt="" 
											src="https://cdn.discordapp.com/attachments/821644547493986328/829590045923999775/123.png"
											style="width:140%;">
											
											<div class = "hideme_right" style="margin-top:8%; width:140%;">
												<p style="font-size:1.1rem; color:#7f888f; font-weight:bold; text-align:right;">
													혼자하는 다이어트는 이제 그만!<br>
													다비의 관리를 받으면서 같이 한번 해보세요.<br>
													매일 간단한 정보만 입력한다면<br>
													다비가 매일 보고서를 작성해줄 겁니다.<br>
													다비의 보고서를 보며 동기부여를 얻어보세요! 
												</p>
											</div>
											
											<div class="hideme_right" style="margin-top:10%; width:140%;">
												<ul class="actions" style="display:flex; justify-content:flex-end;">
													<li><a class = "loginCheck button" href="${pageContext.request.contextPath}/member/reportView.me" style="font-size:1rem">다비의 보고 받기</a></li>
												</ul>
											</div>
										</div>
										<div style="display:flex; justify-content:space-between; width:80%; margin:auto; padding:3% 3%;">
										</div>
									</div>
									</div>
								</section>
								</div>
							</div>
								
							<div class="inner">
								<!-- 레시피 섹션 -->
								<section style="padding:9% 0; margin:0;">
									<div style="display:flex; justify-content:space-between; align-items:center;">
									<div class="content" style="width:50%;">
										<div class = "hideme_left" style="padding:2%; width:100%; margin:auto;">
											<img alt="" 
											src="https://cdn.discordapp.com/attachments/821644547493986328/829212235372953610/1245.png"
											style="width:105%;">
											<div class="hideme_left" style="margin-top:8%;">
												<p style="font-size:1.1rem; color:#7f888f; font-weight:bold;">
													매일 식단짜기 귀찮지 않으셨나요?<br>
													다비는 일주일치 식단을 <br>
													매주 다양하게 제공하고 있습니다. <br>
													거기다 식단에 대한 레시피를 제공하고 있어 <br>
													혼자서 직접 해먹을 수 있을 수 있어요!
												</p>
											</div>
											
											<div class="hideme_left" style="margin-top:10%;">
												<ul class="actions" style="margin-bottom:0;">
													<li><a class = "loginCheck button" href="${pageContext.request.contextPath}/member/weekMenu.me" style="font-size:1rem">다비의 식단 받기</a></li>
												</ul>
											</div>												
										</div>
										<div style="display:flex; justify-content:space-between; width:80%; margin:auto; padding:3% 3%;">
										</div>
									</div>
									<div class="hideme_right" style="width:40%; padding:2%; border:1px solid #1290ff;">
										<img alt="" 
										src="https://cdn.discordapp.com/attachments/821644547493986328/829734798318239794/unknown.png"
										style="width:100%; margin-bottom:5%; height:600px;">
									</div>
									</div>
								</section>
							</div>
							
							<c:choose>
								<c:when test="${empty session_id }">
									<div class="scrollSidemenu" style="position:absolute;right:0;top:0;"> 
										<c:import url="/app/sidemenu/logoutSidemenu.jsp"/>							
									</div>
								</c:when>
								
								<c:otherwise>
									<div class="scrollSidemenu" style="position:absolute;right:0;top:0;"> 
										<c:import url="/app/sidemenu/loginSidemenu.jsp"/>							
									</div>
								</c:otherwise>
							</c:choose>

							<!-- Section -->
							<div class="second_section">
								<div class="inner">
								
							<div>
								<c:import url="/app/footer/footer_index.jsp"/>
							</div>
						</div>
						</div>
							
						</div>
					</div>
						<c:import url="/app/footer/sidebar.jsp" />
					
					
			</div>
			

		<!-- Scripts -->
		<script>
		
		</script>
		
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/slippry.js"></script>
			<script src="${pageContext.request.contextPath}/index.js"></script>
			
			<!-- 차트 로딩부분 -->
			<script src="https://www.gstatic.com/charts/loader.js"></script>
			<script src="${pageContext.request.contextPath}/app/dietary/chart_index.js"></script>
			
			<script>
			//오른쪽 스크롤 메뉴
			
			function scroll_follow(id)
			{
			  $(window).scroll(function( )  
			  { 
			      var position = $(window).scrollTop(); 
			      $('.scrollSidemenu').stop().animate({top:position+"px"}, 1); 
			   });
			}
			 scroll_follow(".scrollSidemenu");
			</script> 
			
			
			
			<script>
				//왼쪽에서 나타나기 
				$(document).ready(function() {
					$('.hideme_left').each( function(i){
						var bottom_of_object = $(this).offset().top ;
						var bottom_of_window = $(window).scrollTop() + $(window).height();
						if( bottom_of_window > bottom_of_object ){
							$(this).addClass('showme_left');
						}
					});
					$(window).scroll( function(){
						$('.hideme_left').each( function(i){
				            var bottom_of_object = $(this).offset().top + 110;
 							var bottom_of_window = $(window).scrollTop() + $(window).height();
							if( bottom_of_window > bottom_of_object ){
								$(this).addClass('showme_left');
							}
							 if( bottom_of_window < bottom_of_object ){
								$(this).removeClass('showme_left');
							}
						});
					});
				});
				
				//오른쪽에서 나타나기
				$(document).ready(function() {
					$('.hideme_right').each( function(i){
						var bottom_of_object = $(this).offset().top ;
						var bottom_of_window = $(window).scrollTop() + $(window).height();
						if( bottom_of_window > bottom_of_object ){
							$(this).addClass('showme_right');
						}
					});
					$(window).scroll( function(){
						$('.hideme_right').each( function(i){
				            var bottom_of_object = $(this).offset().top + 110;
 							var bottom_of_window = $(window).scrollTop() + $(window).height();
							if( bottom_of_window > bottom_of_object ){
								$(this).addClass('showme_right');
							}
							 if( bottom_of_window < bottom_of_object ){
								$(this).removeClass('showme_right');
							}
						});
					});
				});
			
			</script>
			
			<script>			
			session_id = "${sessionScope.session_id}";
			
			if(session_id == ""){			
				//document.getElementByClassName("loginCheck").setAttribute("pointer-events", "none");
				$(".loginCheck").css("pointer-events", "none");
			}
			
			
			console.log(window.outerWidth);
			$(function() {
				var demo1 = $("#demo1").slippry({
					// transition: 'fade',
					// useCSS: true,
					 speed: 1500,
					// pause: 3000,
					// auto: true,
					// preload: 'visible',
					// autoHover: false
				});

				$('.stop').click(function () {
					demo1.stopAuto();
				});

				$('.start').click(function () {
					demo1.startAuto();
				});

				$('.prev').click(function () {
					demo1.goToPrevSlide();
					return false;
				});
				$('.next').click(function () {
					demo1.goToNextSlide();
					return false;
				});
				$('.reset').click(function () {
					demo1.destroySlider();
					return false;
				});
				$('.reload').click(function () {
					demo1.reloadSlider();
					return false;
				});
				$('.init').click(function () {
					demo1 = $("#demo1").slippry();
					return false;
				});
			});
		</script>
	</body>
</html>