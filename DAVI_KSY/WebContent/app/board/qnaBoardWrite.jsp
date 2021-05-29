<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>QnA글쓰기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
		integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
		<!-- 써머노트를 사용하기위해 css파일링크 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/board/summernote/summernote-lite.css">		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/board/css/board.css" />		
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
								<section>									
									<div class="mainFrame" style="width:50%; margin: 0 auto; font-size: 1em;">
										<form method="post" action="${pageContext.request.contextPath}/board/qnaWriteOk.bo" id="qnaBoardWriteForm" name="qnaBoardWriteForm">
											<div style="margin-bottom: 1em;display: flex; justify-content: space-between;">
												<div style="width: 40%">
													<select name="qnaHead" id="qnaHead" style="border: none;border-bottom: solid 1px #dde1e2;">
														<option value="식단">식단</option>
														<option value="보고서">보고서</option>
														<option value="결제">결제</option>
														<option value="신고">신고</option>
														<option value="기타">기타</option>
														<c:if test="${session_id eq 'admin1234'}">
															<option value="공지">공지</option>
														</c:if>
													</select>
												</div>
												<div style="width: 30%">
													<input type="password" id="qnaPassword" name="qnaPassword" placeholder="비밀번호" />
												</div>												 
											</div>
											<div style="margin-bottom: 1em;display: flex;">
												
												<input type="text" id="subject" name="qnaTitle" placeholder="제목">
												<a href="javascript:qnaBoardWriteForm.submit()" class="button small" style="font-size: 0.785em">글 등록</a>
											</div>
											<div>
																						
												<!-- 써머노트  폼 불러오기 -->
												<textarea id="summernote" name="qnaContent"></textarea>
											</div>
											<div style="margin: 10px 0px; text-align: right;">
											</div>									
											<input type="hidden" name="boardNum" value="${param.boardNum}">									
											<input type="hidden" name="memberId" value="${sessionScope.session_id}">									
											
										</form>
									</div>
								</section>
								<div>
								<c:import url="/app/footer/footer.jsp" />
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
			<!-- 써머노트를 사용하기위한 기본 js -->
			<script src="${pageContext.request.contextPath}/app/board/summernote/summernote-lite.js"></script>
			<script src="${pageContext.request.contextPath}/app/board/summernote/lang/summernote-ko-KR.js"></script>
			<!-- 써머노트 로딩과 설정변경 파일 js -->
			<script>var path = "${pageContext.request.contextPath}" </script>
			<script src="${pageContext.request.contextPath}/app/board/summernote/summernoteBasic.js"></script>
			<script src="${pageContext.request.contextPath}/app/board/summernote/summernoteAdd.js"></script>
			<script>
			$(document).ready(function () {
				summernoteStart();				
			});	
			</script>
			
	</body>
</html>