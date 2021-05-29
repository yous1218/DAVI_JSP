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
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
		<style>
			 body{
				/* font-family: "scDream5" !important; */
			} 
			
			.titlePage{
				font-size: 2.3rem;
				font-weight:bold;
				margin-bottom: 3%;
			}
			
			.join-unit{
				display: flex;
				justify-content: center;
				margin-bottom:10px;
			}
			.join-unit label{
				font-size: 0.8em;
			}
			
			input[type="text"], input[type="text"]:focus,
			input[type="password"], input[type="password"]:focus{
				border:0;
				border-bottom: solid 1px rgba(0, 59, 251, 0.3);
				border-radius:0;
				box-shadow: none;
			}

			.join-unit_text{
				display:flex;
				padding-left:1%;
				align-items:center;
			}
			
			input[type="button"]{
				font-size:0.9rem;
			}
			
			.fas{
				font-size:1.3rem;
			}
			
			::placeholder {
				font-size:0.8em;
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
							<div style="display:flex; flex-direction:column; align-items:center;">
								<div style="margin:5% 0;">
									<p class="titlePage">다비의 관리를 받아보세요!</p>
								</div>
								<hr style="width:45%; border-bottom: solid 3px rgba(0, 59, 251, 0.3); margin-top:0; margin-bottom:4%;">
								<form id="join" method="post" action="${pageContext.request.contextPath}/member/join.me" style="width:50%;">
									
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">아이디(닉네임)</p>	
										</div>
										<div class="join-unit_input" style="width:40%;">
											<input type="text" name="memberId" id="memberId" placeholder="아이디"/>
											<label class="joinLabel" id="idText">&nbsp;</label>
										</div>
									</div>										
									
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">비밀번호</p>											
										</div>
										<div class="join-unit_input" style="width:40%;">
											<input type="password" name="memberPw" id="memberPw" placeholder="비밀번호"/>
											<label id="pwText">&nbsp;</label>
										</div>
									</div>

									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">비밀번호 확인</p>	
										</div>
										<div class="join-unit_input" style="width:40%;">
											<input type="password" name="memberPwCheck" id="memberPwCheck" placeholder="비밀번호 확인"/>
											<label id="pwOkText">&nbsp;</label>
										</div>
									</div>
									
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">이름</p>	
										</div>
										<div class="join-unit_input" style="width:40%;">
											<input type="text" name="memberName" id="memberName"/>
											<label id="nameText">&nbsp;</label>
										</div>
									</div>
									
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">휴대전화</p>	
										</div>
										<div class="join-unit_input" style="width:40%;">
											<input type="text" name="memberPhone" id="memberPhone" placeholder="- 를 제외하고 입력하세요"/>
											<label id="phoneText">&nbsp;</label>
										</div>
									</div>
									
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">이메일</p>	
										</div>
										<div class="join-unit_input" style="width:40%;">
											<input type="text" name="memberEmail" id="memberEmail" placeholder="abcd@efg.com"/>
											<label id="emailText">&nbsp;</label>
										</div>
									</div>
									
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:0; font-weight:bold; font-size:0.9em;">성별</p>	
										</div>
										<div class="join-unit_radio" style="width:40%;">
											<input type="radio" id="memberGender-w" name="memberGender" value ="여" checked> 
											<label for="memberGender-w" style="margin-bottom:0;">여</label>
											<input type="radio" id="memberGender-m" name="memberGender" value ="남"> 
											<label for="memberGender-m" style="margin-bottom:0;">남</label>
										</div>
									</div>
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:0; font-weight:bold; font-size:0.9em;">키</p>	
										</div>
										<div class="join-unit_input" style="width:40%;">
											<input type="text" name="memberHeight" id="memberHeight" placeholder="키"/>
										</div>
									</div>
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:0; font-weight:bold; font-size:0.9em;">체중</p>	
										</div>
										<div class="join-unit_input" style="width:40%;">
											<input type="text" name="memberWeight" id="memberWeight" placeholder="체중" />
										</div>
									</div>
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:0; font-weight:bold; font-size:0.9em;">목표 체중</p>	
										</div>
										<div class="join-unit_input" style="width:40%;">
											<input type="text" name="memberGoalWeight" id="memberGoalWeight" placeholder="목표 체중" />
										</div>
									</div>
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:0; font-weight:bold; font-size:0.9em;">각오</p>	
										</div>
										<div class="join-unit_input" style="width:40%;">
											<textarea rows="4" name="memberResolution" id="memberResolution" placeholder="각오" style="resize: none;"></textarea>											
										</div>
									</div>
									
									<hr style="width:100%; border-bottom: solid 3px rgba(0, 59, 251, 0.3); margin-top:10%; margin-bottom:8%;">
									
									<div class="btns">
										<div class="col-12">
											<ul class="actions" style="width:100%; display:flex; justify-content:center;">
												<li><input type="button" value="관리받기" class="primary" style="width:150px;" onclick="formOk()" /></li>
												<li><input type="button" value="취소" style="width:150px;"/></li>
											</ul>
										</div>
									</div>
									
								</form>
								
							</div>	
							<div>
								<c:import url="/app/footer/footer.jsp"/>
							</div>
						</div>
						
					</div>
				<!-- Sidebar -->
					<c:import url="/app/footer/sidebar.jsp" />

			</div>

		<!-- Scripts -->
			<script>var path = "${pageContext.request.contextPath}" </script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script src="${pageContext.request.contextPath}/app/member/js/join.js"></script>

	</body>
</html>