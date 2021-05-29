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
<title>참치 오믈렛</title>
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
						참치 오믈렛
						</h2>
						<h3 style="color: #ffb642;">
						칼로리 : 335kcal
						</h3>
						<h3 style="margin-bottom:10%;">
						참치는 피로를 회복시켜주는 물질과 단백질이 풍부합니다. 근육을 회복시켜주는 데 도움이 되어 있고, 비타민B도 함유되어 있어 체력을 보충시켜주는데 적절합니다. 또한 간에 이로운 성분 중 하나인 타우린과 지방간에 도움이 되는 필수 아미노산이 함유되어 있어 간 건강에 도움을 줍니다.
						</h3>
					</div>
					<div style="width:40%;">
						<img alt="" src="${pageContext.request.contextPath}/app/recipe/img/tuna_omelet.jpg" style="max-width:100%; height:auto;">
					</div>
				</div>
				
				<div style="margin:10%; auto; text-align:center; display:flex; justify-content:space-between;">
					<div style="width:25%;">
							<i class="far fa-hand-point-down" style="font-size:2em;"></i>
							<p style="margin-top:3%;">PREP : 3 MINS</p> 
					</div>
					<div style="width:25%;">
							<i class="far fa-clock" style="font-size:2em;"></i>
							<p style="margin-top:3%;">COOK : 15 MINS</p> 
					</div>
					<div style="width:25%;">
							<i class="fas fa-user-friends" style="font-size:2em;"></i>
							<p style="margin-top:3%;">SERVES : 1</p> 
					</div>
					<div style="width:25%;">
							<i class="fas fa-bread-slice" style="font-size:2em;"></i>
							<p style="margin-top:3%;">DIFFICULTY : EASY</p> 
					</div>
							
				</div>
				
				<div style="display:flex; justify-content:space-between; margin:0 auto; padding:0 10%;">
					<div style="margin-right:6%;">
						<h3  style="color: #ffb642;">재료</h3>
						<ul class="material" style="list-style-type:square;">
							<li>계란 (2개)</li>
							<li>참치 캔 (1/2개)</li>
							<li>시금치 (60g)</li>
							<li>슬라이스 치즈 (1장)</li>
							<li>포도씨유</li>
							<li>소금</li>
							<li>참기름</li>
							<li>케첩</li>
						</ul>
					</div>
					<div style="width:50%">
						<h3  style="color: #ffb642;">조리법</h3>
						<ol>
							<li  class="recipe"> 계란은 참기름, 소금과 함께 미니 다지기에 넣어 알끈 없이 믹싱해주고, 다지기 대신 체에 걸러도 되고 베보자기에 넣고 꾹 짜서 알끈을 제거해도 됩니다.</li>
							<li  class="recipe"> 달궈진 팬에 시금치와 참치캔을 넣고 시금치가 숨이 죽을 때까지 볶아줍니다.</li>
							<li  class="recipe"> 볶은 참치와 시금치를 접시에 옮겨두고, 키친타월을 이용해 팬을 닦은 뒤 포도씨유를 약간 두르고 중약불에서 달걀물을 부어 70% 정도 익으면 볶아둔 참치와 시금치를 올리고, 치즈도 한 장 올린 뒤 반을 접어 앞뒤로 골고루 익혀줍니다.</li>
							<li  class="recipe"> 마지막으로 케첩을 뿌려주면 완성입니다.</li>
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