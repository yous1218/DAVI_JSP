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
<title>곤드레 나물밥</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>

.material{
	line-height: 300%;
	font-size:1.0rem;
	color:#3d4449;
}

.recipe{
	line-height: 250%;
	font-size:1.3rem;
	border-bottom: 1px solid #e3e4e6;
	color:#3d4449;
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
				
				<!--레시피-->
				<div style="width:70%; margin:10% auto;">
				<div style="display:flex; justify-content:space-between; align-items:center;margin:3% auto; padding:0 10%;">
					<div style="width:40%; margin-right:6%;">
						<h3 style="color: #ffb642;">
						RECIPE:
						</h3>
						<h2 style="color:#ff5a00;">
						곤드레 나물밥
						</h2>
						<h3 style="color: #ffb642;">
						칼로리 : 270kcal
						</h3>
						<h3 style="margin-bottom:10%;">
						곤드레는 식이섬유가 풍부해 변비의 예방과 완화에도 좋다. 특히 베타카로틴 성분이 함유되어, 
						체내 활성산소를 제거해 주어 암을 예방해 준다. 곤드레는 콜레스테롤을 낮춰주고 혈액순환을 도와, 혈관 질환을 예방해 준다.
						</h3>
					</div>
					<div style="width:40%;">
						<!-- 식단 이미지  -->
						<img alt="" src="${pageContext.request.contextPath}/app/recipe/img/gondre_spicy_seafood.png" style="max-width:100%; height:auto;">
					</div>
				</div>
				
				<div style="margin:10%; auto; text-align:center; display:flex; justify-content:space-between;">
					<div style="width:25%;">
							<i class="far fa-hand-point-down" style="font-size:2em;"></i>
							<!-- 준비시간 작성 -->
							<p style="margin-top:3%;">PREP : 5 MINS</p> 
					</div>
					<div style="width:25%;">
							<i class="far fa-clock" style="font-size:2em;"></i>
							<!-- 요리시간 작성  -->
							<p style="margin-top:3%;">COOK : 10 MINS</p> 
					</div>
					<div style="width:25%;">
							<i class="fas fa-user-friends" style="font-size:2em;"></i>
							<!-- 몇 인분인지 작성 -->
							<p style="margin-top:3%;">SERVES : 2</p> 
					</div>
					<div style="width:25%;">
							<i class="fas fa-bread-slice" style="font-size:2em;"></i>
							<!-- 난이도 EASY/NORMAL/HARD -->
							<p style="margin-top:3%;">DIFFICULTY : EASY</p> 
					</div>
							
				</div>
				
				<div style="display:flex; justify-content:space-between; margin:0 auto; padding:0 10%;">
					<div style="margin-right:6%;">
						<h3 style="color: #ffb642;">재료</h3>
						<ul class="material" style="list-style-type:square;">
							<!-- 재료 하나씩 li에 작성 -->
							<li>건곤드레나물 20g</li>
							<li>쌀 2인분</li>
							<li>간장 1숟갈</li>
							<li>참기름 1숟갈</li>
							<li>양념:진간장 3숟갈,고춧가루 1/2숟갈,<br>참기름 1숟갈
								다진파 약간,고추 약간,<br>마늘 약간,통깨 약간
							</li>
						
						</ul>
					</div>
					<div style="width:50%">
						<h3 style="color: #ffb642;">조리법</h3>
						<ol>
							<!-- 재료 하나씩 li에 작성 -->
							<li  class="recipe">곤드레 나물을 준비해서 반나절 이상 충분히 불려줍니다. 
							충분히 불리지 않으면 질길 수가 있으니 꼭 충분히 불려줘야 합니다.
							</li>
							<li  class="recipe">줄기 부분이 부들부들 해질 때까지 삶아줍니다. 보통 30분 정도 삶으면 됩니다.
							</li>
							<li  class="recipe"> 삶은 곤드레 나물을 찬물에 깨끗이 헹궈주고 물기를 제거합니다.</li>
							<li  class="recipe">적당한 사이즈로 썰어준 뒤 간장 1숟갈, 참기름(혹은 들기름) 1숟갈 넣어 조물조물 버무려줍니다.</li>
							<li  class="recipe">쌀 2인분을 준비해서 씻어주고 전기밥솥에 쌀과 곤드레 나물을 올려준 뒤 취사 30분을 해줍니다.</li>
							<li  class="recipe">양념장과 함께 비벼드시면 완성입니다.</li>
						</ol>
					</div>
				</div>
				
				</div>
				<!-- footer -->
				<div>
					<c:import url="/app/footer/footer.jsp"/>
				</div>
			</div>
				
		</div>
				<c:import url="/app/footer/sidebar.jsp" />
	</div>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>