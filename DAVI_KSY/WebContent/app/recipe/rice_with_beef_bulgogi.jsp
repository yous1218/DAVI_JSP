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
<title>소불고기 덮밥</title>
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
						소불고기 덮밥
						</h2>
						<h3 style="color: #ffb642;">
						칼로리 : 320kcal
						</h3>
						<h3 style="margin-bottom:10%;">
						소고기는 단백질뿐만 아니라 철분과 비타민, 무기질이 풍부해 빈혈 예방에도 좋다. 또한 소고기에는 필수아미노산이 함유되어 근육과 뼈를 튼튼하게 하는 효능이 있다. 
						소고기는 비타민 B2가 함유되어 면역력 향상과 적혈구 형성의 효능을 가지고 있다
						</h3>
					</div>
					<div style="width:40%;">
						<!-- 식단 이미지  -->
						<img alt="" src="${pageContext.request.contextPath}/app/recipe/img/rice_with_beef_bulgogi.png" style="max-width:100%; height:auto;">
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
							<p style="margin-top:3%;">DIFFICULTY : HARD</p> 
					</div>
							
				</div>
				
				<div style="display:flex; justify-content:space-between; margin:0 auto; padding:0 10%;">
					<div style="margin-right:6%;">
						<h3 style="color: #ffb642;">재료</h3>
						<ul class="material" style="list-style-type:square;">
							<!-- 재료 하나씩 li에 작성 -->
							<li>소고기 불고깃감 570g</li>
							<li>양파 1개</li>
							<li>대파 1개</li>
							<li>말린 표고버섯 1줌</li>
							<li>물 300ml</li>
							<li>녹말 1스푼</li>
							<li>진간장 12스푼</li>
							<li>다진 마늘 1스푼</li>
							<li>설탕 1스푼</li>
							<li>매실 2스푼</li>
							<li>통깨 1스푼</li>
							<li>후춧가루</li>
							<li>참기름</li>
						</ul>
					</div>
					<div style="width:50%">
						<h3 style="color: #ffb642;">조리법</h3>
						<ol>
							<!-- 재료 하나씩 li에 작성 -->
							<li  class="recipe">말린 표고버섯은 미지근한 물에 불려서 사용합니다.</li>
							<li  class="recipe">소고기는 분량의 간장 양념을 넣고 무친 후 준비해놓은 야채들을 넣고 조물조물 다시 버무려줍니다.</li>
							<li  class="recipe">소고기를 기름을 두르지 않은 프라이팬에 넣고 볶기 시작합니다.</li>
							<li  class="recipe">고기가 살짝 익었을 때 물 250~300ml 정도를 넣고 계속 볶습니다.</li>
							<li  class="recipe">녹말 1스푼을 물에 개어두어 국물을 걸쭉하게 끓여주면 완성입니다.</li>
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