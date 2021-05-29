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
	<c:set var="lists" value="${lists}"/>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<c:import url="/app/header/header.jsp" />

							<!-- Content -->										
								
								<section>																			
									<c:if test="${empty bf_vo.getQnaPassword() or param.flag eq 'true' or session_id eq 'admin1234'}">
									
									
									<div class="mainFrame" style="width:50%; margin: 0 auto; font-size: 1em;margin-bottom: 2em;">
										<form method="post" action="${pageContext.request.contextPath}/board/qnaModifyOk.bo?qnaNum=${bf_vo.getQnaNum()}&page=${page}" name="qnaBoardViewForm">
											<div class="viewHead" style="margin-bottom: 1em;display: flex;align-items: baseline;">

												
												<label for="qnaHead" style="padding-right: 5px;color:#9fa3a6;" >분류:</label>
												<h3 id="qnaHead" style="margin-right: 15px;">${bf_vo.getQnaHead()}</h3>
														<span class="smallTitle">작성자: ${bf_vo.getMemberId()}</span>													
														<span class="smallTitle">${bf_vo.getQnaDate()}</span>
											</div>
											<div class="viewTitle" style="margin-bottom: 1em; width: 80%;">
												<!-- <label for="subject">제목</label>	 -->											
												<!-- <input type="text" id="subject" name="qnaTitle" placeholder="제목" value="제목1" readonly> -->
												<h4 id="subjectH3">${bf_vo.getQnaTitle()}</h4>
												<input type="text" id="subjectInput" name="qnaTitle" placeholder="" value="${bf_vo.getQnaTitle()}" style="display: none;">
												
											</div>
											<div>
											
												<!-- 써머노트  폼 불러오기 -->
												<textarea id="summernote" name="qnaContent" style="box-shadow: inherit; resize: none;" readonly="readonly">${bf_vo.getQnaContent()}</textarea>
											</div>
											<div class="row" style="margin-top:5px;">																																	
												<div class="col-12" style="margin: 10px 0px; text-align: right;">
											<c:if test="${session_id eq bf_vo.getMemberId()}">
												<span id="deleteOk">
													<a href="${pageContext.request.contextPath}/board/qnaDeleteOk.bo?qnaNum=${bf_vo.getQnaNum()}&qnaHead=${bf_vo.getQnaHead()}" style="margin-right: 10px;"><i  class="fas fa-trash-alt"></i></a>													
												</span>
											</c:if>
												<span id="modifyOk" style="display: none">
													<a href="javascript:qnaBoardViewForm.submit()" style="margin-right: 10px;"><i  class="fas fa-edit" ></i></a>
												</span>													
												</div>									
											</div>
											<%-- <c:set var="replyNumber" value="1" />
											<c:set var="replyLevel" value="0" />
											<c:set var="qnaNum" value="0" /> --%>
										</form>
										
										<!-- 관리자 신고 입력 구간  -->
										<c:if test="${session_id eq 'admin1234' and bf_vo.getQnaHead() eq '신고'}">
											
											<form action="${pageContext.request.contextPath}/board/insertWarning.bo" name="reportForm">
												<article class="replyArti" style="padding:2%; border:2px solid black; margin-bottom:2em; ">
												<h5 style="">신고사유 작성(관리자)</h5>	
												<div class="row" style="margin-top:5px">
													<div class="col-10 replyLevel0" >
														<input type="text" name ="id" placeholder="아이디" style="padding:0 !important; margin-bottom:0.3em; border:0 !important;">	
														<input type="text" name="content" placeholder="신고사유" style="padding:0 !important; border:0 !important;">	
													</div>
													<div class="col-2" style="margin:0; display:flex; flex-direction:column; justify-content:flex-end;">
														<a href="javascript:reportFormSubmit()" class="button" id="replyBtn" ><!-- <i class="fas fa-edit"></i> -->전송</a>
													</div>											
												</div>
																						
											</article>
												<input type="hidden" name ="page" value="${param.page}"/>												
												<input type="hidden" name = "qnaHead" value="${param.qnaHead}"/>												
											</form>
										</c:if>
										
										
										<c:if test="${session_id eq 'admin1234' }">
										<form method="post" name="replyForm" action="${pageContext.request.contextPath}/board/qnaReplyWrite.bo">
											<article class="replyArti" style="padding:2%; border:2px solid black ">
												<h5 style="">새댓글 작성</h5>	
												<div class="row" style="margin-top:5px">
													<div class="col-10 replyLevel0" >
														<textarea id="qnaReplyContent" name="qnaReplyContent" class="replycontent" placeholder="이곳에 입력하세요"></textarea>
													</div>
													<div class="col-2" style="margin:auto 0;">
														<c:if test="${not empty session_id}">
															<a href="javascript:qnaReplySubmit()" class="button" id="replyBtn" ><!-- <i class="fas fa-edit"></i> -->댓글</a>
														</c:if>											
													</div>											
												</div>
																						
											</article>
											<input type="hidden" value="${session_id}" name="memberId"/>											
											<input type="hidden" value="${param.qnaNum}" name="qnaNum"/>
											<input type="hidden" value="${param.page}" name="page"/>											
											<input type="hidden" value="${bf_vo.getQnaTitle()}" name="qnaTitle"/>	
																					
										</form>
										</c:if>
										
										
											<div id="replyBox" style="margin-top:1em;">										
											<div id="replyAjax">											
											<!-- 반복문으로 댓글 뿌리기 -->
											<c:forEach var="list" items="${lists}">
											
											<!-- 부모 댓글 -->
												<c:if test="${list.getParentReplyNum() == 0}">
													<c:set var="level" value="0"/>
													<c:set var="parentNumber" value="${parentNumber+1}" />
														<article class="replyArti" id="reply" style="background:#1290ff12; padding:2%; border-top:0;">
												<form action="${pageContext.request.contextPath}/board/qnaReplyUpdate.bo" name="updateForm" method="post">
													<div class="row">
														<div  class="col-12">
															<div id="reply" class="replyLevel-${level}">	
																<div class="firstLine">																
																	<div>
																	<span id="writeId" class="smallTitle">
																		<c:if test="${bf_vo.getMemberId() ne list.getMemberId()}">
																			<span class="" style="font-weight:bold; font-size:0.9em; color:black; margin-right:0.5em;">${list.getMemberId()}</span>
																		</c:if>
																		<c:if test="${bf_vo.getMemberId() eq list.getMemberId()}">
																			<span class="" style="font-weight:bold; font-size:0.9em; color:black;">${list.getMemberId()}</span>
																	 		<span class="hostWriter" style="margin-right:0.5em;">작성자</span>
																	 	</c:if>
																	<span id="writeDate"><i class="far fa-clock" style="font-size:1em; margin-right:0.2em;"></i>${list.getQnaReplyDate()}</span>	
																	</span>
																	</div>
																	<div>		
																	<c:if test="${session_id eq list.getMemberId()}">
																	<i class="fas fa-ellipsis-h" id="toggle${list.getQnaReplyNum()}" onclick="showIcon(${list.getQnaReplyNum()})" style="color: #9fa3a6; font-size:0.7em; cursor:pointer;"></i>
																	<a id="replyModify${list.getQnaReplyNum()}" href="javascript:replyModify(${list.getQnaReplyNum()})"
																		style="font-size:0.7em; display:none;">
																		<i class="fas fa-pencil-alt"></i>
																	</a>
																	<button id="replyModifyOk${list.getQnaReplyNum()}" type="submit" value="수정완료"
																	    style="display: none; box-shadow: none; padding:0 !important;">
																		<i class="fas fa-edit" style="color: rgba(0, 59, 251, 1);"></i>
																	</button>
																	<a id="replyDelete${list.getQnaReplyNum()}" href="${pageContext.request.contextPath}/board/qnaReplyDelete.bo?qnaReplyNum=${list.getQnaReplyNum()}&page=${param.page}&qnaNum=${param.qnaNum}"
																	 style="font-size:0.7em; display:none"><i class="fas fa-trash-alt"></i></a>															
																	</c:if>	
																	</div>														
																</div>																	
																<div style="margin-top:0.5em;">
																<div id="readReplyDiv${list.getQnaReplyNum()}" style="height:auto">
																	<p style="margin-bottom:0;">
																		<span style="word-break:break-all;">
																			<c:if test="${not empty list.getParentReplyId()}">
																				<span class="smallTitle" style="margin-right:0.5em;">
																					@${list.getParentReplyId()}
																				</span>
																			</c:if>
																			${list.getQnaReplyContent()}
																		</span>
																	</p>
																</div>
																	<textarea name="readReply${list.getQnaReplyNum()}" class="replycontent" style="display: none" readonly>
${list.getQnaReplyContent().trim()}
																	</textarea>
																<!-- 답글, 답글보기  -->
															 	<div style="margin-top:0.5em;">
																	<%-- <span>
																		<c:if test="${not empty session_id}">
																			<a id="replyWrite${list.getQnaReplyNum()}" href="javascript:replyAnswer(${list.getQnaReplyNum()}, ${level})" style="font-size:0.7em;">답글</a>
																			<a id="replyWriteHide${list.getQnaReplyNum()}" href="javascript:replyAnswerHide(${list.getQnaReplyNum()}, ${level})" style="display:none;font-size:0.7em;">닫기</a>
																		</c:if>
																	</span>
																	<c:if test="${reReplyCntList[parentNumber] ne 0}">
																	<span style="margin-left:0.5em;">
																		<a id="replyView${parentNumber}" href="javascript:replyView(${parentNumber})" style="font-size:0.7em;">답글 ${reReplyCntList[parentNumber]}개 보기</a>
																		<a id="replyViewHide${parentNumber}" href="javascript:replyViewHide(${parentNumber})" style="display:none;font-size:0.7em;">답글숨기기</a>
																	</span>
																	</c:if> --%>
																</div>	 
																</div>																												
															</div>																						
														</div>																						
															<input type="hidden" name="qnaReplyNum" value="${list.getQnaReplyNum()}">											
															<input type="hidden" name="page" value="${param.page}">											
															<input type="hidden" name="qnaNum" value="${param.qnaNum}">											
													</div>

												</form>
													<form method="post" name="repeatForm" id="repeatForm" action="${pageContext.request.contextPath}/board/qnaReplyWrite.bo">
														<article id="replyAnswer${list.getQnaReplyNum()}" class="replyArti" style="display: none; border-top:0;">
															<h5 id="reReplyLevelName${list.getQnaReplyNum()}" style="margin-top:20px;">댓글 작성</h5>	
															<div class="row" style="margin-top:5px">
																<div class="col-10">
																	<div id="reReplyLevelText${list.getQnaReplyNum()}">
																		<textarea id="writeReReply" name="qnaReplyContent" class="replycontent" placeholder="이곳에 입력하세요" style="background-color:transparent;"></textarea>
																	</div>
																</div>
																<div class="col-2" style="">
																																			
																		<button style="font-size: 0.6em;" type="submit">
																			댓글
																		</button>
																		
																											
																</div>											
															</div>										
														</article>
																										
														<input type="hidden" value="${session_id}" name="memberId"/>											
														<input type="hidden" value="${param.qnaNum}" name="qnaNum"/>
														<input type="hidden" value="${param.page}" name="page"/>
														<input type="hidden" value="${list.getQnaReplyNum()}" name="qnaReplyNum"/>
														
													</form>
													
												</article>
												
												</c:if>
												
												<!-- 대댓글 -->
												<c:if test="${list.getParentReplyNum() != 0}">
													<c:set var="level" value="1"/>
														<article class="replyArti${parentNumber}" style="background:#1290ff12; padding:2%; border-top:0; display:none;">
												<form action="${pageContext.request.contextPath}/board/qnaReplyUpdate.bo" name="updateForm" method="post">
													<div class="row">
														<div  class="col-12">
															<div id="reply" class="replyLevel-${level}">	
																<div class="firstLine">																
																	<div>
																	<span id="writeId" class="smallTitle">
																		<c:if test="${bf_vo.getMemberId() ne list.getMemberId()}">
																			<span class="" style="font-weight:bold; font-size:0.9em; color:black; margin-right:0.5em;">${list.getMemberId()}</span>
																		</c:if>
																		<c:if test="${bf_vo.getMemberId() eq list.getMemberId()}">
																			<span class="" style="font-weight:bold; font-size:0.9em; color:black;">${list.getMemberId()}</span>
																	 		<span class="hostWriter" style="margin-right:0.5em;">작성자</span>
																	 	</c:if>
																	<span id="writeDate"><i class="far fa-clock" style="font-size:1em; margin-right:0.2em;"></i>${list.getQnaReplyDate()}</span>	
																	</span>
																	</div>
																	<div>		
																	<c:if test="${session_id eq list.getMemberId()}">
																	<i class="fas fa-ellipsis-h" id="toggle${list.getQnaReplyNum()}" onclick="showIcon(${list.getQnaReplyNum()})" style="color: #9fa3a6; font-size:0.7em; cursor:pointer;"></i>
																	<a id="replyModify${list.getQnaReplyNum()}" href="javascript:replyModify(${list.getQnaReplyNum()})"
																		style="font-size:0.7em; display:none;">
																		<i class="fas fa-pencil-alt"></i>
																	</a>
																	<button id="replyModifyOk${list.getQnaReplyNum()}" type="submit" value="수정완료"
																	    style="display: none; box-shadow: none; padding:0 !important;">
																		<i class="fas fa-edit" style="color: rgba(0, 59, 251, 1);"></i>
																	</button>																											
																	<a id="replyDelete${list.getQnaReplyNum()}" href="${pageContext.request.contextPath}/board/qnaReplyDelete.bo?qnaReplyNum=${list.getQnaReplyNum()}&page=${param.page}&qnaNum=${param.qnaNum}"
																	 style="font-size:0.7em; display:none"><i class="fas fa-trash-alt"></i></a>			
																	</c:if>	
																	</div>															
																</div>																	
																<div style="margin-top:0.5em;">
																<div id="readReplyDiv${list.getQnaReplyNum()}" style="height:auto">
																	<p style="margin-bottom:0;">
																		<span style="word-break:break-all;">
																			<c:if test="${not empty list.getParentReplyId()}">
																				<span class="smallTitle" style="margin-right:0.5em;">
																					@${list.getParentReplyId()}
																				</span>
																			</c:if>
																			${list.getQnaReplyContent()}
																		</span>
																	</p>
																</div>
																	<textarea name="readReply${list.getQnaReplyNum()}" class="replycontent" style="display: none" readonly>
${list.getQnaReplyContent()}
																	</textarea>
																<!-- 답글, 답글보기  -->
																<div style="margin-top:0.5em;">
																	<span>
																		<c:if test="${not empty session_id}">
																			<a id="replyWrite${list.getQnaReplyNum()}" href="javascript:replyAnswer(${list.getQnaReplyNum()}, ${level})" style="font-size:0.7em;">답글</a>
																			<a id="replyWriteHide${list.getQnaReplyNum()}" href="javascript:replyAnswerHide(${list.getQnaReplyNum()}, ${level})" style="display:none;font-size:0.7em;">닫기</a>
																		</c:if>
																	</span>
																</div>	
																</div>																												
															</div>																						
														</div>																						
															<input type="hidden" name="qnaReplyNum" value="${list.getQnaReplyNum()}">											
															<input type="hidden" name="page" value="${param.page}">											
															<input type="hidden" name="qnaNum" value="${param.qnaNum}">											
													</div>

												</form>
													<form method="post" name="repeatForm" id="repeatForm" action="${pageContext.request.contextPath}/board/qnaReplyWrite.bo">
														<article id="replyAnswer${list.getQnaReplyNum()}" class="replyArti" style="display: none; border-top:0;">
															<h5 id="reReplyLevelName${list.getQnaReplyNum()}" style="margin-top:20px;">댓글 작성</h5>	
															<div class="row" style="margin-top:5px">
																<div class="col-10">
																	<div id="reReplyLevelText${list.getQnaReplyNum()}">
																		<textarea id="writeReReply" name="qnaReplyContent" class="replycontent" placeholder="이곳에 입력하세요" style="background-color:transparent;"></textarea>
																	</div>
																</div>
																<div class="col-2" style="">
																																			
																		<button style="font-size: 0.6em;" type="submit">
																			댓글
																		</button>
																		
																											
																</div>											
															</div>										
														</article>
																										
														<input type="hidden" value="${session_id}" name="memberId"/>											
														<input type="hidden" value="${param.qnaNum}" name="qnaNum"/>
														<input type="hidden" value="${param.page}" name="page"/>
														<input type="hidden" value="${list.getQnaReplyNum()}" name="qnaReplyNum"/>
														
													</form>
													
												</article>
												
												</c:if>
												
											</c:forEach>
											<!-- 여기까지 1번째댓글 -->	
											</div>
											</div>
											
											
									</div>	
								</c:if>
								<c:if  test="${not empty bf_vo.getQnaPassword() and param.flag eq 'false' and session_id ne 'admin1234'}">
									<div style="width:30%; margin:auto;">
									<fieldset style="border:1px solid #7f888f; padding:10% 20%;">
										<legend style="text-align:center;">비밀번호를 입력해주세요</legend>
										<form action="${pageContext.request.contextPath}/board/qnaView.bo">
											<input type="password"  id="password" name="password" placeholder="비밀번호"/>										
											<input type="hidden"  id="qnaNum" name="qnaNum" value="${bf_vo.getQnaNum()}"/>										
											<input type="hidden"  id="page" name="page" value="${param.page}"/>	
										</form>
									</fieldset>
									
									</div>
								</c:if>				
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
			<script>var path = "${pageContext.request.contextPath}" </script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<!-- 써머노트를 사용하기위한 기본 js -->
			<script src="${pageContext.request.contextPath}/app/board/summernote/summernote-lite.js"></script>
			<script src="${pageContext.request.contextPath}/app/board/summernote/lang/summernote-ko-KR.js"></script>
			<!-- 써머노트 로딩과 설정변경 파일 js -->
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
				
				function reportFormSubmit(){
					reportForm.submit();
				}
				
			</script>	
	</body>
</html>