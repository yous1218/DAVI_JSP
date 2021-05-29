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
		<title>내 정보 수정</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
		<style>			
			
			.title_status{
				font-size: 3rem;
				color: rgba(0, 59, 251);
				margin-bottom: 3%;
			}
			
			.join-unit{
				display: flex;
				justify-content: center;
				margin-bottom:10%;
			}
			
			.join-unit_text{
				display:flex;
				padding-left:1%;
				align-items:center;
				padding-top: 2%;
			}
			
			input[type="text"], input[type="text"]:focus,
			input[type="password"], input[type="password"]:focus,
			input[type="email"], input[type="email"]:focus,
			textarea, textarea:focus{
				border-radius:0;
				box-shadow: none;
			}
			
			.fas{
				font-size:1.3rem;
			}
			
			::placeholder {
				font-size:1.1em;
			}
		</style>
	</head>
	<body class="is-preload">
	
	<c:set var="m_vo" value="${m_vo}"></c:set>

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
									<p class="title_status">내 정보 수정</p>
								</div>
								<form name ="updateStatusForm" method="post" action="${pageContext.request.contextPath}/member/myPageUpdateOk.me" style="width: 50%;">	
								<hr style="width:100%; border-bottom: solid 3px rgba(0, 59, 251, 0.3); margin-top:0; margin-bottom:4%;">
									
									<div style = "margin : 0 auto; width : 70%; margin-top: 6%;">
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">이메일 주소</p>	
										</div>
										<div class="join-unit_input" style="width:80%;">
											<input type="email" name="memberEmail" id="memberEmail" value = "${m_vo.getMemberEmail()}" placeholder="이메일 주소"/>
										</div>
									</div>
									
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">휴대폰 번호</p>	
										</div>
										<div class="join-unit_input" style="width:80%;">
											<input type="text" name="memberPhone" id="memberPhone" value = "${m_vo.getMemberPhone()}" placeholder="휴대폰 번호"/>
										</div>
									</div>
									
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">신장</p>	
										</div>
										<div class="join-unit_input" style="width:80%;">
											<input type="text" name="memberHeight" id="memberHeight" value = "${m_vo.getMemberHeight()}" placeholder="신장 (cm)"/>
										</div>
									</div>
									
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">체중</p>	
										</div>
										<div class="join-unit_input" style="width:80%;">
											<input type="text" name="memberWeight" id="memberWeight" value = "${m_vo.getMemberWeight()}" placeholder="체중 (kg)"/>
										</div>
									</div>
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">목표 체중</p>	
										</div>
										<div class="join-unit_input" style="width:80%;">
											<input type="text" name="memberGoalWeight" id="memberGoalWeight" value = "${m_vo.getMemberGoalWeight()}" placeholder="목표체중 (kg)"/>
										</div>
									</div>
									
									<div class="join-unit">
										<div class="join-unit_text" style="width:25%;">
											<p style="margin-bottom:35px; font-weight:bold; font-size:0.9em;">각오</p>	
										</div>
										<div class="join-unit_input" style="width:80%;">
											<textarea id="memberResolution" name="memberResolution" style="resize: none;" placeholder="각오">${m_vo.getMemberResolution()}</textarea>
											<!-- <input type="text" name="memberId" id="memberId" placeholder="각오"/> -->
										</div>
									</div>									
									</div>
									
									<hr style="width:100%; border-bottom: solid 3px rgba(0, 59, 251, 0.3); margin-bottom:8%;">
									
									<div class="btns">
										<div class="col-12">
											<ul class="actions" style="width:100%; display:flex; justify-content:center;">
												<li><input type="button" value="변경하기" class="primary" style="width:150px;" onclick ="updateStatus()"/></li>
												<li><input type="button" value="취소" style="width:150px;" onclick="backToMypage()"/></li>
											</ul>
										</div>
									</div>
									<input type="hidden" name="memberId" value="${session_id}"/>
								</form>
							</div>		

						<c:import url="/app/footer/footer.jsp"/>
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
				function winClose() {
					 history.back()
				}
			</script>
			
			<script>
				var contextPath = "${pageContext.request.contextPath}";
				function updateStatus () {
					
					var check = true;
					
					var memberEmail = $("#memberEmail").val();
					var memberPhone = $("#memberPhone").val();
					var memberHeight = $("#memberHeight").val();
					var memberWeight = $("#memberWeight").val();
					var memberGoalWeight = $("#memberGoalWeight").val();
					var memberResolution = $("#memberResolution").val();
					
					if(memberEmail == null || memberEmail == "") {
						alert('이메일을 입력해주세요');
						check = false;
						return false;
					} else {
						let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
						if (!regExp.test(memberEmail)) {
							alert('이메일을 올바르게 입력해주세요');
							check = false;
							return false;
						}
					}
					if(memberPhone == null || memberPhone == "") {
						alert('핸드폰번호를 입력해주세요');
						check = false;
						return false;
					} else {
						let regExp = /^[0-9]{10,11}$/;
						if(!regExp.test(memberPhone)) {
							alert('핸드폰번호를 올바르게 입력해주세요');
							check = false;
							return false;
						}
					}
					if(memberHeight == null || memberHeight == "") {
						alert('신장을 입력해주세요');
						check = false;
						return false;
					} else {
						let regExp =/^[0-9]{2,3}$/;
						if(!regExp.test(memberHeight)){
							alert('신장 숫자 세자리를 올바르게 입력해주세요');
							check = false;
							return false;
						}
						
					}
					if(memberWeight == null || memberWeight == "") {
						alert('체중을 입력해주세요');
						check = false;
						return false;
					} else {
						let regExp =/^[0-9]{2,3}$/;
						if(!regExp.test(memberWeight)){
							alert('체중을 숫자로 올바르게 입력해주세요');
							check = false;
							return false;
						}
					}
					
					if(memberGoalWeight == null || memberGoalWeight == "") {
						alert('목표 체중을 입력해주세요');
						check = false;
						return false;
					} else {
						let regExp =/^[0-9]{2,3}$/;
						if(!regExp.test(memberGoalWeight)){
							alert('목표 체중을 숫자로 올바르게 입력해주세요');
							check = false;
							return false;
						}
					}
					
					if(memberResolution == null || memberResolution == "") {
						alert('각오를 입력해주세요');
						check = false;
						return false;
					}
					
					if (check == true) {
						updateStatusForm.submit();
					}
						
				}
				
				function backToMypage() {
					location.href = contextPath + "/member/memberPayListCheckOk.me?result=false";
				}
			
			</script>

	</body>
</html>