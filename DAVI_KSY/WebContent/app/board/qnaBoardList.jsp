<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>기본 프레임</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/board/css/board.css" />		
		<style>
			@media screen and (max-width: 620px) {
				#boardList .th1 {
					width: 20%;
				}
				#boardList .th2 {
					width: 60%;
				}
				#boardList .th3 {
					width: 20%;
				}
				#boardList {
					width: 100%;
				}
			}
			#boardList .notice0 {
				background-color: #1290ff1f;
			}
			#boardList tbody .notice0:hover {
				background-color: #1290ff40 !important;
			}
			
			.choiceLine{
				margin-right:3%;
				cursor:pointer;
			}
			
			.check{
				color:rgba(0, 59, 251, 1);
			}
		</style>	
	</head>
	<body class="is-preload">
	 <c:set var="QnaBoardList" value="${QnaBoardList}"/>
     <c:set var="totalCnt" value="${totalCnt}"/>
     <c:set var="startPage" value="${startPage}"/>
     <c:set var="endPage" value="${endPage}"/>
     <c:set var="nowPage" value="${nowPage}"/>
     <c:set var="realEndPage" value="${realEndPage}"/>
     <c:set var="pageSize" value="${pageSize}"/>
     <fmt:parseNumber var="divNow" integerOnly="true" value="${(nowPage - 1)/pageSize}" />
	 <fmt:parseNumber var="divReal" integerOnly="true" value="${realEndPage/pageSize}" />

		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<c:import url="/app/header/header.jsp" />
					

							<!-- Content -->
								<section>
								<div  class="mainFrame" style="width: 65%;margin: 0 auto;">								
										
										<h2 align="center">QnA</h2>										
																		
									<div style="width:100%; margin-bottom:5%;">
										<span id="food" class="choiceLine">식단</span> 		
										<span id="report" class="choiceLine">보고서</span>		
										<span id="pay" class="choiceLine">결제</span> 	 	
										<span id="etc" class="choiceLine">기타</span> 		
										<span id="notice" class="choiceLine">신고</span>		
										<c:if test="${session_id eq 'admin1234' }">
											<span id="noticeList" class="choiceLine">신고목록</span>		
										</c:if>
									</div>	
									
									<c:if test="${empty param.warning}">									
									<div class="table-wrapper mainFrame">
										<table id="boardList">
											<thead>
												<tr>
													<th class="th1" width="15%">분류</th>
													<th class="th2" width="70%">제목</th>
													<th class="th3 secret" width="15%">닉네임</th>
												</tr>
											</thead>
											<tbody>
											<c:choose>
												<c:when test="${QnaBoardList != null and fn:length(QnaBoardList) > 0 }">
													<c:forEach var="qnaVO" items="${QnaBoardList}">
														
														<tr class="notice${qnaVO.getQnaNotice()}">
															<td>${qnaVO.getQnaHead()}</td>													
															<td id="title"><a href="${pageContext.request.contextPath}/board/qnaView.bo?qnaNum=${qnaVO.getQnaNum()}&page=${nowPage}&qnaHead=${param.qnaHead}" class="aboard" style="cursor:pointer;">
																${qnaVO.getQnaTitle()} <c:if test="${not empty qnaVO.getQnaPassword()}">&nbsp;<i class="fas fa-lock" style="font-size:0.9em;"></i></c:if>
															</a></td>													
															<td>${qnaVO.getMemberId()}</td>													
														</tr>														
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td class="aboard" colspan="3">등록된 게시물이 없습니다.</td>
													</tr>
												</c:otherwise>
											</c:choose>
											</tbody>																								
										</table>
										
										<c:if test="${not empty sessionScope.session_id}">	
											<div style="text-align: right; margin-top:4%;">
												<a href="${pageContext.request.contextPath}/app/board/qnaBoardWrite.jsp?page=${nowPage}" 
												style="cursor: pointer;" class="button small" >새 글쓰기</a>
											</div>
										</c:if>
										
										<div align="center" style="margin-top:4%;">
											<ul class="pagination">
											<c:choose>
												<c:when test="${nowPage > pageSize}">
												<fmt:parseNumber var="prevPage" integerOnly="true" value="${divNow*pageSize}" />
													<li><a href="${pageContext.request.contextPath}/board/qnaList.bo?page=${prevPage}&searchQnaHead=${param.searchQnaHead}&searchQnaWord=${param.searchQnaWord}" class="aboard">Prev</a></li>
												</c:when>
												<c:otherwise>
													<li><a class="aboard" style="cursor:pointer;">Prev</a></li>
												</c:otherwise>
											</c:choose>
													
												<c:forEach var="i" begin="${startPage}" end="${endPage}">
													<c:choose>
														<c:when test="${i eq nowPage}">
															<li><a href="${pageContext.request.contextPath}/board/qnaList.bo?page=${i}&searchQnaHead=${param.searchQnaHead}&searchQnaWord=${param.searchQnaWord}" 
															class="page active">${i}</a></li>		
														</c:when>
														<c:otherwise>
															<li><a href="${pageContext.request.contextPath}/board/qnaList.bo?page=${i}&searchQnaHead=${param.searchQnaHead}&searchQnaWord=${param.searchQnaWord}" 
															class="page">${i}</a></li>	
														</c:otherwise>				
													</c:choose>
												</c:forEach>
											
											<c:choose>
												<c:when test="${divReal - divNow >= 1}">
												<fmt:parseNumber var="divPage" integerOnly="true" value="${(nowPage - 1)/pageSize}" />
												<fmt:parseNumber var="nextPage" integerOnly="true" value="${(divPage + 1) * pageSize + 1}" />
													<li><a href="${pageContext.request.contextPath}/board/qnaList.bo?page=${nextPage}&searchQnaHead=${param.searchQnaHead}&searchQnaWord=${param.searchQnaWord}" class="aboard">Next</a></li>
												</c:when>
												<c:otherwise>
													<li><a class="aboard" style="cursor:pointer;">Next</a></li>
												</c:otherwise>
											</c:choose>	
											</ul>
										</div>
									</div>
									</c:if>
									
									
									<!-- 신고목록  -->
									<c:if test="${not empty param.warning }">
										<div class="table-wrapper mainFrame">
										<table id="boardList">
											<thead>
												<tr>
													<th class="th1" width="15%">닉네임</th>
													<th class="th2" width="70%">신고사유</th>
													<th class="th3 secret" width="15%">날짜</th>
												</tr>
											</thead>
											<tbody>
											<c:choose>
												<c:when test="${warningList != null and fn:length(warningList) > 0 }">
													<c:forEach var="warningVO" items="${warningList}">
														<tr class="notice">
															<td>
																<a href="javascript:deleteId('${warningVO.getMemberId()}')" style="color:black; cursor:pointer;">
																	${warningVO.getMemberId()}
																</a>
															</td>													
															<td id="title">
																${warningVO.getWarningContent()} 
															</td>													
															<td>${warningVO.getWarningDate()}</td>													
														</tr>														
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td class="aboard" colspan="3">등록된 게시물이 없습니다.</td>
													</tr>
												</c:otherwise>
											</c:choose>
											</tbody>																								
										</table>
										
										<div align="center" style="margin-top:4%;">
											<ul class="pagination">
											<c:choose>
												<c:when test="${nowPage > pageSize}">
												<fmt:parseNumber var="prevPage" integerOnly="true" value="${divNow*pageSize}" />
													<li><a href="${pageContext.request.contextPath}/board/qnaList.bo?page=${prevPage}&searchQnaHead=${param.searchQnaHead}&searchQnaWord=${param.searchQnaWord}" class="aboard">Prev</a></li>
												</c:when>
												<c:otherwise>
													<li><a class="aboard" style="cursor:pointer;">Prev</a></li>
												</c:otherwise>
											</c:choose>
													
												<c:forEach var="i" begin="${startPage}" end="${endPage}">
													<c:choose>
														<c:when test="${i eq nowPage}">
															<li><a href="${pageContext.request.contextPath}/board/qnaList.bo?page=${i}&searchQnaHead=${param.searchQnaHead}&searchQnaWord=${param.searchQnaWord}" 
															class="page active">${i}</a></li>		
														</c:when>
														<c:otherwise>
															<li><a href="${pageContext.request.contextPath}/board/qnaList.bo?page=${i}&searchQnaHead=${param.searchQnaHead}&searchQnaWord=${param.searchQnaWord}" 
															class="page">${i}</a></li>	
														</c:otherwise>				
													</c:choose>
												</c:forEach>
											
											<c:choose>
												<c:when test="${divReal - divNow >= 1}">
												<fmt:parseNumber var="divPage" integerOnly="true" value="${(nowPage - 1)/pageSize}" />
												<fmt:parseNumber var="nextPage" integerOnly="true" value="${(divPage + 1) * pageSize + 1}" />
													<li><a href="${pageContext.request.contextPath}/board/qnaList.bo?page=${nextPage}&searchQnaHead=${param.searchQnaHead}&searchQnaWord=${param.searchQnaWord}" class="aboard">Next</a></li>
												</c:when>
												<c:otherwise>
													<li><a class="aboard" style="cursor:pointer;">Next</a></li>
												</c:otherwise>
											</c:choose>	
											</ul>
										</div>
									</div>
									</c:if>
									
								</div>
								
								
							
							

								</section>
								
							<div>
							<!-- Footer -->
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
				function clicked(index, len) {
					for(let i=0;i<len;i++){
						if(i == index){					
							document.getElementById("inners" + i).className = "page active";
						}else{
							document.getElementById("inners" + i).className = "page";
						}
					}					
				}
				
				/* $('table tbody tr').on('click', function() {
				    location.href = $(this).children('#title').children('a').attr('href');
				    return false;
				});
				const x = window.matchMedia("(max-width: 620px)");
				if(x.matches){
					console.log("컬럼삭제");
					deleteColumn();
				} */
				
				
				function deleteColumn() {
					  const table = document.getElementById('boardList');
					  
					  for(let i = 0; i < table.rows.length; i++)  {
					    table.rows[i].deleteCell(-1);
					  }
				}
				
				var qnaHead = "${param.qnaHead}";
				var buttonArray = [$("#food"), $("#report"), $("#pay"), $("#etc"), $("#notice"), $("#noticeList")];
				
				$(buttonArray).each(function(num){
					$(this).click(function(){
						var text = $(this).text();
						location.href = "${pageContext.request.contextPath}/board/qnaList.bo?qnaHead=" + text;
					});
					
					if(qnaHead == buttonArray[num].text()){
						var object = buttonArray[num];
						object.addClass("check");
					}
					
				});
				
				function deleteId(id){
					var ok = confirm("정말로 " + id + "를 탈퇴시키겠습니까?");		
					if(ok){
						location.href = "${pageContext.request.contextPath}/board/qnaDeleteId.bo?id=" + id;
					}
				}
				
			</script>

	</body>
</html>