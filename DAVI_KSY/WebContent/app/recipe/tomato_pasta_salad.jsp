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
<title>토마토 파스타 샐러드</title>
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
						토마토 파스타 샐러드
						</h2>
						<h3 style="color: #ffb642;">
						칼로리 : 314kcal
						</h3>
						<h3 style="margin-bottom:10%;">
						토마토에 있는 펙틴 성분은 섭취 시, 위에서 오랜 시간 동안 머물러 포만감을 꽤 오래 유지시켜줍니다.
						</h3>
					</div>
					<div style="width:40%;">
						<!-- 식단 이미지  -->
						<img alt="" src="${pageContext.request.contextPath}/app/recipe/img/tomato_pasta_salad.png" style="max-width:100%; height:auto;">
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
							<p style="margin-top:3%;">DIFFICULTY : EASY</p> 
					</div>
							
				</div>
				
				<div style="display:flex; justify-content:space-between; margin:0 auto; padding:0 10%;">
					<div style="margin-right:6%;">
						<h3 style="color: #ffb642;">재료</h3>
						<ul class="material" style="list-style-type:square;">
							<!-- 재료 하나씩 li에 작성 -->
							<li>파스타 80g</li>
							<li>오이 1/2개</li>
							<li>방울토마토 3개</li>
							<li>블랙 올리브 3개</li>
							<li>샐러드용 잎채소 약간</li>
							<li>올리브오일 2 큰 술</li>
							<li>굵은소금 1/2 큰 술</li>
							<li>파마산 치즈 약간</li>
							<li>드레싱 :　스위트 칠리소스 4 큰 술, 간장 1 큰 술,<br> 올리브오일 1 큰 술, 식초 1 큰 술, 소금 한 꼬집, 후추 약간</li>
						</ul>
					</div>
					<div style="width:50%">
						<h3 style="color: #ffb642;">조리법</h3>
						<ol>
							<!-- 재료 하나씩 li에 작성 -->
							<li  class="recipe">오이는 반달 모양으로 썰고 방울토마토, 블랙 올리브는 이등분합니다. 잎채소는 먹기 좋은 크기로 자른 후 찬물에 담갔다 물기를 제거해 주세요.</li>
							<li  class="recipe">끓는 물에 굵은소금과 올리브오일 1 큰 술을 넣고 파스타를 10분간 삶은 후 체에 밭쳐 물기를 뺀다. 파스타에 올리브오일 1 큰 술을 넣어 버무린 후 식혀둔다.</li>
							<li  class="recipe">볼에 파스타와 미리 썰어둔 재료를 넣고 드레싱 재료를 잘 섞어서 뿌린 후 가볍게 버무려줍니다.</li>
							<li  class="recipe">완성된 요리를 그릇에 담고 파마산 치즈를 뿌려줍니다.</li>
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