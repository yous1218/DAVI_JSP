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
		<title>로그인</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
		<style>
			 body{
				font-family: 'Sunflower', sans-serif;
			} 
			
			@media screen and (min-width: 1400px) {
				.davi-img, .img{
					height:400px !important;
				}
			}
			
			@media screen and (max-width: 1400px) {
				.davi-img, .img{
					height:300px !important;
				}
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
							<section style="padding-top:3%; display:flex; justify-content:center; margin-top:2%;">
							<div style="width:60%;">
								<form method="post" action="${pageContext.request.contextPath}/member/loginOk.me">
								<input type="hidden" name = "certificatedCheck" value="${certificatedCheck}">
									<hr style="background-color: rgba(0, 59, 251, 0.3); height: 3px; width:70%; margin:0 auto;">
									<h2 align="center" style="padding-top: 3%;">다비를 부를까요?</h2>	
									<div class="row gtr-uniform" style="text-align:center;">
										<div class="col-12">
											<input type="text" name="memberId" id="memberId"  placeholder="아이디" style="width:50%; margin:1% auto;" />
											<input type="password" name="memberPw" id="memberPw" placeholder="비밀번호" style="width:50%; margin:1% auto;"/>
											<c:if test="${not empty param.login }">
	   										<c:if test="${not param.login}">
											<div style="width:50%; margin:1% auto; color:red; padding:0;">아이디 혹은 비밀번호가 일치하지 않습니다.</div>
	   										</c:if>
   										</c:if>
										</div>
										<!-- button -->
										<div class="col-12" style="padding-top:0%;">
										<input type="submit" value="Login" class="primary" style="width:50%; margin:1% 0;">
										<div style="display : flex; justify-content: center; margin : 10px auto;">
											<img id="" name="" class="profile" src="${pageContext.request.contextPath}/images/logo_blue.png" alt="" 
											style=" margin:5px; width: 30px; height: 30px; "/>
											<a href="${pageContext.request.contextPath}/member/findId.me" style="margin-top : 8px;"> 아이디/비밀번호 찾기</a>
										</div>
										<hr style="background-color: rgba(0, 59, 251, 0.3); height: 3px; width:70%; margin:5% auto;">
										<div style="display: flex; justify-content: center; ">
											<img id="" name="" class="profile" src="${pageContext.request.contextPath}/images/logo_blue.png" alt="" 
											style=" margin:5px; width: 30px; height: 30px; "/> 
											<div style ="margin-top: 5px;">
												<span>아직 DAVI의 회원이 아니신가요? > </span>
												<a href="${pageContext.request.contextPath}/app/member/join_before.jsp">회원가입</a>
											</div>
											
										</div>
									</div>
									<input type="hidden" id="prepage" name="prepage" />
									<input type="hidden" id="despage" name="despage" />
								</form>
							</div>
							</section>
							<div>
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
				document.getElementById("prepage").value = escape(document.referrer);
				
			</script>
	</body>
</html>