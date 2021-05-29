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
			
			.titlePage{
				font-size: 3rem;
				color: rgba(0, 59, 251);
				margin-bottom: 3%;
			}
			
			input[type="password"], input[type="password"]:focus {
				border:0 !important;
				border-bottom: solid 1px rgba(0, 59, 251, 0.3) !important;
				border-radius:0;
				box-shadow: none;
			}
			
			
		</style>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			
			<c:if test="${param.docking eq cookie.docking.value}">
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
							<c:import url="/app/header/header.jsp" />
					
							<!-- Content -->
							
								<section style="padding-top:3%;">
									<div style="display: flex; justify-content: center;">
									</div>
									
										<form method="post" action="${pageContext.request.contextPath}/member/changePwOk.me">
											<hr style="background-color: rgba(0, 59, 251, 0.3); height: 3px; width:45%; margin:0 auto;">
											<h2 align="center" style="padding-top: 3%;">비밀번호 변경</h2>
											<input type="hidden" name="email" value="${param.email}">
											<input type="hidden" name="docking" value="${param.docking}">
											<div class="row gtr-uniform" style="text-align:center;">
												<div class="col-12">
													<input type="password" name="memberPw" id="memberPw" placeholder="새 비밀번호" style="width:30%; margin:1% auto;"/>
												</div>
												<div class="col-12">
													<input type="password" name="memberPwCheck" id="memberPwCheck" placeholder="새 비밀번호 확인" style="width:30%; margin:0 auto 1% auto; "/>
												</div>
												<c:if test="${param.check eq false }">
													<div style="width:50%; margin:1% auto; color:red;">
														서버가 불안정하므로 잠시후 다시 시도해주시기 바랍니다.
													</div>
												</c:if>
												<div class="col-12" style="padding-top:0%;">
													<input type="submit" value="비밀번호 변경" class="primary" style="width:30%; margin:1% auto;">
													<input type="hidden" name="memberId" value="${param.memberId}" />
													
												</div>
											</div>							
											<hr style="background-color: rgba(0, 59, 251, 0.3); height: 3px; width:45%; margin:0 auto;">
										</form>
								</section>
								
							<div>
								<c:import url="/app/footer/footer.jsp"/>
							</div>

						</div>
					</div>

				<!-- Sidebar -->
				<c:import url="/app/footer/sidebar.jsp" />
				
			</div>
			</c:if>
			
			<div id="wrapper">
					<div id="main">
						<div class="inner">
							<c:import url="/app/header/header.jsp" />
							
								<section style="padding-top:3%;">
									<div style="display: flex; justify-content: center;">
										<p class="titlePage">해당페이지는 만료된 페이지입니다.</p>
									</div>
								</section>
							<div>
								<c:import url="/app/footer/footer.jsp"/>
							</div>

						</div>
					</div>
				<c:import url="/app/footer/sidebar.jsp" />
			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script src='https://www.google.com/recaptcha/api.js'></script>
	</body>
</html>