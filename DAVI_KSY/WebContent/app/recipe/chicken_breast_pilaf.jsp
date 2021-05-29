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
<title>닭 가슴살 필라프</title>
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
						닭 가슴살 필라프
						</h2>
						<h3 style="color: #ffb642;">
						칼로리 : 370kcal
						</h3>
						<h3 style="margin-bottom:10%;">
						닭 가슴살은 고단백 식품으로 지방질이 적어 다이어트에 좋으며, 
						카레에 들어있는 강황에는 커큐민 성분이 들어있어 항암효과를 해주고 간의 기능을 강화시켜줘 해독작용 효과가 있다.
						</h3>
					</div>
					<div style="width:40%;">
						<!-- 식단 이미지  -->
						<img alt="" src="${pageContext.request.contextPath}/app/recipe/img/chicken_breast_pilaf.jpg" style="max-width:100%; height:auto;">
					</div>
				</div>
				
				<div style="margin:10%; auto; text-align:center; display:flex; justify-content:space-between;">
					<div style="width:25%;">
							<i class="far fa-hand-point-down" style="font-size:2em;"></i>
							<!-- 준비시간 작성 -->
							<p style="margin-top:3%;">PREP : 10 MINS</p> 
					</div>
					<div style="width:25%;">
							<i class="far fa-clock" style="font-size:2em;"></i>
							<!-- 요리시간 작성  -->
							<p style="margin-top:3%;">COOK : 15 MINS</p> 
					</div>
					<div style="width:25%;">
							<i class="fas fa-user-friends" style="font-size:2em;"></i>
							<!-- 몇 인분인지 작성 -->
							<p style="margin-top:3%;">SERVES : 1</p> 
					</div>
					<div style="width:25%;">
							<i class="fas fa-bread-slice" style="font-size:2em;"></i>
							<!-- 난이도 EASY/NORMAL/HARD -->
							<p style="margin-top:3%;">DIFFICULTY : HARD</p> 
					</div>
							
				</div>
				
				<div style="display:flex; justify-content:space-between; margin:0 auto; padding:0 10%;">
					<div style="margin-right:6%;">
						<h3 style="color: #ffb642;">재료</h3>
						<ul class="material" style="list-style-type:square;">
							<!-- 재료 하나씩 li에 작성 -->
							<li>닭 가슴살 200g</li>
							<li>대파 1대</li>
							<li>당근 1/6개</li>
							<li>애호박 1/4개</li>
							<li>양파 1/4개</li>
							<li>참기름</li>
							<li>굴 소스 2 큰 술</li>
							<li>소금 1/2 작은 술</li>
							<li>후추 1/2 작은 술</li>
						</ul>
					</div>
					<div style="width:50%">
						<h3 style="color: #ffb642;">조리법</h3>
						<ol>
							<!-- 재료 하나씩 li에 작성 -->
							<li  class="recipe">애호박,당근,양파는 모두 잘게 깍둑썰어줍니다.</li>
							<li  class="recipe">대파는 송송 썰어주고 많을수록 좋습니다.</li>
							<li  class="recipe">닭가슴살은 한입크기로 깍둑썰어줍니다.</li>
							<li  class="recipe">닭가슴살은 수비드된 닭가슴살을 준비해도 좋고 익히지 않은 생 닭가슴살은 살짝 데쳐서 준비해주세요.</li>
							<li  class="recipe">팬에 기름 1큰술을 두르고 파를 볶아준 후 파 향이 올라오면 썰어둔 야채들을 모두 넣고 볶아주세요.</li>
							<li  class="recipe">야채들이 익어가면 익힌 닭가슴살과 밥을 넣어주세요.</li>
							<li  class="recipe">볶음밥 간은 굴소스 2큰술과 소금 1/2작은술로 간해주세요.</li>
							<li  class="recipe">후추도 톡톡 1/2작은술 뿌려주세요.</li>
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