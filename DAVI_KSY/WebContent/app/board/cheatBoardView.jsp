<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>자유게시판뷰</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/board/css/board.css" />	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/board/summernote/summernote-lite.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
		integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
	
	</head>	
	<body class="is-preload">
	
	<!-- 컨트롤러에서 받아온 부분  -->
	<c:set var="bf_vo" value="${bf_vo}"/>	
	
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<c:import url="/app/header/header.jsp" />

							<!-- Content -->										
								
								<section>																			
									<div class="mainFrame" style="width:50%; margin: 0 auto; font-size: 1em;margin-bottom: 2em;">
										<form method="post" action="${pageContext.request.contextPath}/board/cheatModifyOk.bo?cheatNum=${bf_vo.getCheatNum()}&page=${page}" name="cheatBoardViewForm">
											<div class="viewHead" style="margin-bottom: 1em;display: flex;align-items: baseline;">

												
												<label for="cheatHead" style="padding-right: 5px;color:#9fa3a6;" >분류:</label>
												<h3 id="cheatHead" style="margin-right: 15px;">${bf_vo.getCheatHead()}</h3>
														<span class="smallTitle">작성자: ${bf_vo.getMemberId()}</span>													
														<span class="smallTitle">${bf_vo.getCheatDate()}</span>
											</div>
											<div class="viewTitle" style="margin-bottom: 1em; width: 80%;">
												<!-- <label for="subject">제목</label>	 -->											
												<!-- <input type="text" id="subject" name="cheatTitle" placeholder="제목" value="제목1" readonly> -->
												<h4 id="subjectH3">${bf_vo.getCheatTitle()}</h4>
												<input type="text" id="subjectInput" name="cheatTitle" placeholder="" value="${bf_vo.getCheatTitle()}" style="display: none;">
												
											</div>
											<div>
											
												<!-- 써머노트  폼 불러오기 -->
												<textarea id="summernote" name="cheatContent" style="box-shadow: inherit; resize: none;" readonly="readonly";>${bf_vo.getCheatContent()}</textarea>
											</div>
											<div class="row" style="margin-top:5px;">																																
												<div class="col-12" style="margin: 10px 0px; text-align: right;">
												<span id="list">
													<a href="${pageContext.request.contextPath}/board/cheatList.bo?page=${page}&searchWord=${searchWord}" style="margin-right: 10px;"><i class="fas fa-clipboard-list"></i></a>
												</span>
											<c:if test="${session_id eq bf_vo.getMemberId()}">
												<span id="modify">
													<a href="javascript:enable()" style="margin-right: 10px;"><i class="fas fa-pencil-alt"></i></a>								
												</span>
												<span id="deleteOk">
													<a href="${pageContext.request.contextPath}/board/cheatDeleteOk.bo?cheatNum=${bf_vo.getCheatNum()}&searchWord=${searchWord}" style="margin-right: 10px;"><i  class="fas fa-trash-alt"></i></a>													
												</span>
											</c:if>
												<span id="modifyOk" style="display: none">
													<a href="javascript:cheatBoardViewForm.submit()" style="margin-right: 10px;"><i  class="fas fa-edit" ></i></a>
												</span>													
												</div>									
											</div>											
										</form>
										<form method="post" name="replyForm" action="${pageContext.request.contextPath}/board/cheatReplyWrite.bo">
											<article class="replyArti" style="margin-bottom: 10px; ">
												<h5 style="margin-top:20px">새댓글 작성</h5>	
												<div class="row" style="margin-top:5px">
													<div class="col-10 replyLevel0" >
														<textarea id="cheatReplyContent" name="cheatReplyContent" class="replycontent" placeholder="이곳에 입력하세요"></textarea>
													</div>
													<div class="col-2" style="margin:auto 0;padding-left: 10%;">
														<c:if test="${not empty session_id}">
															<a href="javascript:cheatReplySubmit()"><i class="fas fa-edit"></i></a>
														</c:if>											
													</div>											
												</div>										
											</article>
											<input type="hidden" value="${session_id}" name="memberId"/>											
											<input type="hidden" value="${param.cheatNum}" name="cheatNum"/>
											<input type="hidden" value="${param.page}" name="page"/>
											<input type="hidden" value="${searchWord}" name="searchWord"/>
											
											</form>
											<div id="replyAjax">											
											<!-- 반복문으로 댓글 뿌리기 -->
											<c:forEach var="list" items="${replyList}"> 
												<c:if test="${list.getParentReplyNum() == 0}">
													<c:set var="level" value="0"/>
												</c:if>
												<c:if test="${list.getParentReplyNum() != 0}">
													<c:set var="level" value="1"/>
												</c:if>
												<article class="replyArti">
												<form action="${pageContext.request.contextPath}/board/cheatReplyUpdate.bo" name="updateForm" method="post">
													<div class="row">
														<div  class="col-10">
															<div id="reply" class="replyLevel-${level}">	
															<div>
																<span id="writeDate" class="smallTitle">${list.getMemberId()}</span>	
																<span id="writeId" class="smallTitle">${list.getCheatReplyDate()}
																	<c:if test="${bf_vo.getMemberId() eq list.getMemberId()}">
																	 		<span class="hostWriter">작성자</span>
																	 	</c:if>
																</span>	
															</div>
															<div><span class="smallTitle">${list.getParentReplyId()}
																	<c:if test="${not empty list.getParentReplyId()}">
																	 	<c:if test="${list.getParentReplyId() eq bf_vo.getMemberId()}">
																	 		<span class="hostWriter">작성자</span>
																	 	</c:if>
																	</c:if>
																	 </span>
																<div id="readReplyDiv${list.getCheatReplyNum()}" style="height:auto"><p><span style="word-break:break-all;">${list.getCheatReplyContent()}</span></p></div>														
																<textarea name="readReply${list.getCheatReplyNum()}" class="replycontent" readonly style="display: none">
${list.getCheatReplyContent()}
																</textarea>
															</div>	
															</div>																					
														</div>											
														<div class="col-2 iconButtons" style=";margin:auto 0;padding-left: 10%;display: flex;justify-content: space-around;">														
															<c:if test="${session_id eq list.getMemberId()}">
																<a id="replyModify" href="javascript:replyModify(${list.getCheatReplyNum()})"><i class="fas fa-pencil-alt"></i></a>
																<a id="replyDelete" href="${pageContext.request.contextPath}/board/freeReplyDelete.bo?freeReplyNum=${list.getCheatReplyNum()}&page=${param.page}&freeNum=${param.cheatNum}"><i class="fas fa-trash-alt"></i></a>
																<button id="replyModifyOk" type="submit" value="수정완료"><i class="fas fa-edit"></i></button>
															</c:if>		
															<c:if test="${not empty session_id}">																												
																<a id="replyWrite" href="javascript:replyAnswer(${list.getCheatReplyNum()}, ${level})" ><i class="fas fa-edit"></i></a>
															</c:if>
														</div>												
													</div>
														<input type="hidden" name="cheatReplyNum" value="${list.getCheatReplyNum()}">											
														<input type="hidden" name="page" value="${param.page}">											
														<input type="hidden" name="cheatNum" value="${param.cheatNum}">				
													</form>
													<form method="post" name="repeatForm" action="${pageContext.request.contextPath}/board/cheatReplyWrite.bo">
													<article id="replyAnswer${list.getCheatReplyNum()}" class="replyArti" style="display: none;">
														<h5 id="reReplyLevelName${list.getCheatReplyNum()}" style="margin-top:20px;">댓글 작성</h5>	
														<div class="row" style="margin-top:5px">
															<div class="col-10">
																<div id="reReplyLevelText${list.getCheatReplyNum()}">
																	<textarea id="writeReReply" name="cheatReplyContent" class="replycontent" placeholder="이곳에 입력하세요"></textarea>
																</div>
															</div>
															<div class="col-2" style="padding-left: 10%;">
																<button style="box-shadow: none; font-size: 1em; color : rgba(0, 59, 251, 1) !important;" type="submit">
																			<i class="fas fa-edit"></i>
																		</button>						
															</div>											
														</div>										
													</article>
																									
														<input type="hidden" value="${searchWord}" name="searchWord"/>											
														<input type="hidden" value="${session_id}" name="memberId"/>											
														<input type="hidden" value="${param.cheatNum}" name="cheatNum"/>
														<input type="hidden" value="${param.page}" name="page"/>
														<input type="hidden" value="${list.getCheatReplyNum()}" name="cheatReplyNum"/>
													</form>
												</article>
												
											</c:forEach>
											<!-- 여기까지 1번째댓글 -->	
											</div>
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
								
			<script src="${pageContext.request.contextPath}/app/board/js/replyBoard.js"></script>	
			
			<!-- textarea 자동 높이 조절 -->				
			<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>					
				
			<script>
			
			autosize($("textarea"));
			$(document).ready(function () {
			summernoteView();			
			writeDisable();			
			//insertContent('글내용~~~~~');
			
			});		
			
			function enable() {		
				$('#summernote').summernote('destroy');
				summernoteStart();
				$('select').val("1").prop("selected", true);				
				$('#subjectH3').hide();
				$('#deleteOk').hide();
				$('#modify').hide();
				$('#subjectInput').show();
				$('#modifyOk').show();				
				writeAble();
			}			
			
			function disable() {
				document.getElementById('subject').readOnly = true;				
				writeAble();
			}
					
			
			</script>	
	</body>
</html>