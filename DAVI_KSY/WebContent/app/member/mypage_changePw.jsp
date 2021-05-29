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
		<title>비밀번호 변경</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
		<style>
			 body{
				font-family: 'Sunflower', sans-serif;
			} 
			
			.title_changePW{
				font-size: 3rem;
				color: rgba(0, 59, 251);
				margin-bottom: 3%;
			}
			
			input[type="password"], input[type="password"]:focus {
				border:0 !important;
				border-bottom: solid 1px rgba(0,59,251,0.3) !important;
				border-radius:0;
				box-shadow: none;
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

								<section style="padding-top:3%;">
									<div style="display: flex; justify-content: center;">
										<p class="title_changePW">비밀번호 변경</p>
									</div>
									
										<form method="post" name="changePwForm" action= "${pageContext.request.contextPath}/member/myPageChangePwOk.me">
											<div class="row gtr-uniform" style="text-align:center;">
												<div class="col-12">
													<input type="password" name="memberPw" id="memberPw" placeholder="기존 비밀번호" style="width:30%; margin:1% auto;"/>
												</div>
												<div class="col-12">
													<input type="password" name="newPw" id="newPw" placeholder="새 비밀번호" style="width:30%; margin:3% auto 1% auto;"/>
												</div>
												<div class="col-12">
													<input type="password" name="newPwCheck" id="newPwCheck" placeholder="새 비밀번호 확인" style="width:30%; margin:0 auto 1% auto; "/>
												</div>
												<div class="col-12" style="padding-top:0%;">
													<input type="submit" value="비밀번호 변경" class="primary" style="width:30%; margin:1% auto;">
												</div>
												<div class="col-12" style="padding-top:0%;">
													<input type="button" value="취소" class="" style="width:30%; margin:1% auto 3% auto;" onclick="backToMypage()">
												</div>
											</div>
											
											
											<input type="hidden" value="${session_id}" name ="memberId">
											
										</form>

								</section>
						</div>
								<c:import url="/app/footer/footer.jsp"/>

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
			<script src='https://www.google.com/recaptcha/api.js'></script>
			<script>
			var contextPath = "${pageContext.request.contextPath}";
				
				
				
				function backToMypage() {
					location.href = contextPath + "/member/memberPayListCheckOk.me?check=cancel";
				}
				
			</script>

	</body>
</html>