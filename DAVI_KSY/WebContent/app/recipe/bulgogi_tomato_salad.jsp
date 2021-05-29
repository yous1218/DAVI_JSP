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
<title>불고기 토마토 샐러드</title>
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
						불고기 토마토 샐러드
						</h2>
						<h3 style="color: #ffb642;">
						칼로리 : 247kcal
						</h3>
						<h3 style="margin-bottom:10%;">
						토마토에 있는 펙틴 성분은 섭취 시, 위에서 오랜 시간 동안 머물러 포만감을 꽤 오래 유지시켜줍니다.
						</h3>
					</div>
					<div style="width:40%;">
						<!-- 식단 이미지  -->
						<img alt="" src="${pageContext.request.contextPath}/app/recipe/img/bulgogi_tomato_salad.png" style="max-width:100%; height:auto;">
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
							<p style="margin-top:3%;">COOK : 15 MINS</p> 
					</div>
					<div style="width:25%;">
							<i class="fas fa-user-friends" style="font-size:2em;"></i>
							<!-- 몇 인분인지 작성 -->
							<p style="margin-top:3%;">SERVES : 2</p> 
					</div>
					<div style="width:25%;">
							<i class="fas fa-bread-slice" style="font-size:2em;"></i>
							<!-- 난이도 EASY/NORMAL/HARD -->
							<p style="margin-top:3%;">DIFFICULTY : NORMAL</p> 
					</div>
							
				</div>
				
				<div style="display:flex; justify-content:space-between; margin:0 auto; padding:0 10%;">
					<div style="margin-right:6%;">
						<h3 style="color: #ffb642;">재료</h3>
						<ul class="material" style="list-style-type:square;">
							<!-- 재료 하나씩 li에 작성 -->
							<li>쇠고기(불고기용) 100g</li>
							<li>체리 토마토 2개</li>
							<li>어린잎채소 한줌</li>
							<li>고기 밑간 :　양파 1/4개, 설탕 1 큰 술,<br> 올리고당 1 큰 술</li>
							<li>불고기 양념: 간장 2 큰 술, 참기름 1 큰 술,<br> 다진 마늘 1/2 큰 술, 후추와 통깨 약간씩</li>
							<li>드레싱 : 올리브오일 3 큰 술, 식초 1 큰 술,<br> 올리고당 1/2 큰 술, 소금과 후추 약간씩</li>
						</ul>
					</div>
					<div style="width:50%">
						<h3 style="color: #ffb642;">조리법</h3>
						<ol>
							<!-- 재료 하나씩 li에 작성 -->
							<li  class="recipe">쇠고기는 5cm 길이로 자른 후강판에 간 양파, 설탕, 올리고당에 10분간 재워 밑간을 해두세요.</li>
							<li  class="recipe">쇠고기에 불고기 양념 재료를 골고루 버무린 후 달군 팬에 넣고 익을 때까지 볶아주세요.</li>
							<li  class="recipe">체리 토마토는 길게 4등분 합니다. 어린잎 채소는 찬물에 담갔다가 헹구고 물기를 제거해 주세요.</li>
							<li  class="recipe">드레싱 재료를 잘 섞어 체리 토마토에 버무려주세요.</li>
							<li  class="recipe">그릇에 쇠고기-체리토마토-어린잎 채소 순으로 올려내주세요. 쇠고기를 약간 식힌 후에 올려야 채소의 아삭함이 잘 살아요.</li>
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