<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE HTML>
<!--
	Editorial by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>인증게시판</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
		<style>
			body{
					font-family: 'Sunflower', sans-serif;
				}
				
			h1, h2, h3, h4, h5, h6 {
					font-family: 'Sunflower', sans-serif;
				}
				
			.board_basic {
					border : 1px solid black; 
			
				}
			
			.certificated_box {
				border : 1px solid rgba(164, 167, 170, 0.3);
				padding : 0.5em;
			}
			
			.certificated_textarea {
				border : 0;
				border-bottom : 1px solid rgba(0, 59, 251, 0.3);
			}
			
			input[type="text"], 
			input[type="text"]:focus{
				border:0;
				border-bottom: solid 1px #ffaec9;
				border-radius:0;
				box-shadow: none;
			}
			
			.profile {
				border-radius: 40%;
			}
			
			.board_main_box {
			
			}
			
			.icon_color {
				color : rgba(164, 167, 170, 0.7);
			}
			
			#sub-menu {
				position: absolute;
				background: #ffffff9e;
				opacity: 0;
				visibility: hidden;
				transition: all 0.15s ease-in;
			}
			
			
			#sub-menu>li {
				padding: 5px 0;
				border-bottom: 1px solid rgba(0, 0, 0, 0.15);
				margin-top: 5px;
			}
			
			
			#sub-menu>li>a {
				color: #7f888f;
				text-decoration: none;
			}
			
			
			#sub-menu>li>a:hover {
				text-decoration: underline;
			}
			
			#menuHover:hover #sub-menu{
				opacity: 1;
				visibility: visible;
			}
			
			.animation-init{
				opacity: 0;
			}
			
			.animation-fade {
				opacity: 1;
				transition: all 1s;
			}			
			
		</style>
		
	</head>
	
	<body class="is-preload">
	
	<c:set var="certificatedList" value="${certificatedList}"/>
	<c:set var="ContentSubStringList" value="${ContentSubStringList}"/>
	<c:set var="LikeCntList" value="${LikeCntList}"/>
	<c:set var="likeChecks" value="${likeChecks}"/>
	<script>
		var arNumbers = [];
	</script>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
						

							<!-- Header -->
								<c:import url="/app/header/header.jsp" />
				
				<!-- body -->
				<div id="scrollDiv" style="display: flex; justify-content: center;">
					<article style="width:50%; margin-bottom: 60px;"> 
						<!-- 일반게시판 글쓰기 아웃라인 -->
					<c:if test="${empty session_id}"> 
						<form id="toLoginForm" name="toLoginForm" action="${pageContext.request.contextPath}/member/login.me">
							<div class ="certificated_box" style="height: auto; margin-top: 50px; ">
								<div style="display:flex; justify-content: center;">
									<img id="" name="" class="profile" src="${pageContext.request.contextPath}/images/logo_blue.png" alt="" style=" margin:5px; width: 35px; height: 35px;
										cursor: pointer;" onclick="#"/>
									
									<textarea class="certificated_textarea" id="" name="" placeholder="게시글을 작성해보세요" style=" 
										resize:none; height:40px; padding: 
										5px; margin: 5px;" readonly="readonly" onclick="login()"></textarea>
									<input id="" name="" type="button" value="인증하기" style="margin:5px;" onclick="login()">
									
									</div>
							</div>
						</form>
						</c:if>
						
						<c:if test="${not empty session_id }">
						<form action="#">
							<div class ="certificated_box" style="height: auto; margin-top: 50px; ">
								<div style="display:flex; justify-content: center;">
									<img id="" name="" class="profile" src="${pageContext.request.contextPath}/images/logo_blue.png" alt="" style=" margin:5px; width: 35px; height: 35px;
										cursor: pointer;" onclick="#"/>
									<textarea class="certificated_textarea" id="" name="" placeholder="게시글을 작성해보세요" style=" 
										resize:none; height:40px; padding: 
										5px; margin: 5px;" readonly="readonly" onclick="popup()"></textarea>
									<input id="" name="" type="submit" value="인증하기" style="margin:5px;" onclick="popup()">
									
									</div>
							</div>
						</form>
						</c:if>
						
						<c:if test="${not empty certificatedList}">
						<c:choose>
							<c:when test="${fn:length(certificatedList) == 1}">
							
							<c:forEach var="i" begin="0" end="0">
									
						<!-- 일반게시판 전체 아웃라인 -->
						<div class="certificated_box" style="height: auto; margin-top: 20px; border-bottom: none;">
							<!-- 작성자 -->
							<div style="display : flex; justify-content: center; height: auto;">
								<div style="width:10%;">
								<img id="" name="" class="profile" src="${pageContext.request.contextPath}/images/logo_blue.png" alt="" style="margin:5px; width: 35px; height: 35px;
									cursor: pointer;" onclick="#"/> <!-- 프로필 사진 클릭시 해당 계정으로 이동 -->
								</div>
								<div id="" style="width:10%; padding-top: 10px; margin-left: 5px;">${certificatedList[i].getMemberId()}</div>
								<div class="icon_color" style="display: flex; justify-content: flex-end; width:80%; padding-top: 10px; padding-right: 10px;">
									<div id="menuHover"><i class="fas fa-ellipsis-h" onclick="#" style="cursor: pointer;"></i>
										
										<c:if test="${session_id eq certificatedList[i].getMemberId()}">
										<ul id="sub-menu" style="display: flex;flex-direction: column;">
											<li><a href="javascript:modifyPopup('${certificatedList[i].getCertificatedNum()}','${certificatedList[i].getCertificatedTitle()}','${certificatedList[i].getCertificatedContent()}','${certificatedList[i].certificatedPath}')" type="button">수정</a></li>
											<li><a href="${pageContext.request.contextPath}/board/certificateDeleteOk.bo?certificatedNum=${certificatedList[i].getCertificatedNum()}" type="button">삭제</a></li>
										</ul>
										</c:if> 
										
									</div>
								
								</div>
							</div>
							
							<!-- 게시판 제목 -->
							
							<div style="height: 30px; padding-top: 5px; margin:5px;">
								<h4>${certificatedList[i].getCertificatedTitle()} </h4>
							</div>
							
							<!-- 사진 -->
							<div style="width: 70%; margin: 3% auto;">
								<div style="position:relative; width:100%; height: 0; padding-bottom:100%; ">
									<img src="${certificatedList[i].getCertificatedPath()}" style="display:inline-block; width:100%; height:100%; position:absolute; top:0; left:0; z-index:-1">
									<!-- 한동석 강사 작업 - likeMark -->
									<img id="likeMark_${certificatedList[i].getCertificatedNum()}" src="${pageContext.request.contextPath}/images/logo_blue.png" style="display:none; width:100%; margin-top:10%">
								</div>
							</div>
							
							<!-- 아이콘들 (다이아몬드, 댓글아이콘등) -->
							<div class="icon_color" style="display : flex; justify-content: flex-start; height: 35px; padding: 5px;">
								<c:choose>
									<c:when test="${likeChecks[i] == 'true'}">
										<div id="checkedDiamond_${certificatedList[i].getCertificatedNum()}" style="font-size: 1.2rem; padding-top: 2px; color:#0038fb;" onclick="unchangeDiamond(${certificatedList[i].getCertificatedNum()})">
											<i class="fas fa-gem fa-lg" style="cursor: pointer; " ></i>
										</div>
										<div id="diamond_${certificatedList[i].getCertificatedNum()}" style="font-size: 1.2rem; padding-top: 2px; display : none;" onclick="changeDiamond(${certificatedList[i].getCertificatedNum()})">
											<i  class="far fa-gem fa-lg" style="cursor: pointer;" ></i>
										</div>
									</c:when>
									<c:otherwise>
										<div id="checkedDiamond_${certificatedList[i].getCertificatedNum()}" style="font-size: 1.2rem; padding-top: 2px; color:#0038fb; display : none;" onclick="unchangeDiamond(${certificatedList[i].getCertificatedNum()})">
											<i class="fas fa-gem fa-lg" style="cursor: pointer; " ></i>
										</div>
										<div id="diamond_${certificatedList[i].getCertificatedNum()}" style="font-size: 1.2rem; padding-top: 2px;" onclick="changeDiamond(${certificatedList[i].getCertificatedNum()})">
											<i  class="far fa-gem fa-lg" style="cursor: pointer;" ></i>
										</div>
									</c:otherwise>
								</c:choose>
								
								<%-- <div id="checkedDiamond_${certificatedList[i].getCertificatedNum()}" style="font-size: 1.2rem; padding-top: 2px; display : none; color:#0038fb;" onclick="unchangeDiamond(${certificatedList[i].getCertificatedNum()})">
									<i class="fas fa-gem fa-lg" style="cursor: pointer; " ></i>
								</div> --%>
								
								<!-- 댓글 더보기 버튼 -->
								<!-- <i class="fas fa-comment"></i> -->
								<div style="font-size: 1.3rem;" onclick ="changeComment(${certificatedList[i].getCertificatedNum()})">
									<i id="replyIcon_${certificatedList[i].getCertificatedNum()}" class="far fa-comment fa-lg" style="cursor: pointer; margin-left: 9px;" onclick="#"></i>
								</div>
								
							</div>
							 
							<!-- 좋아요 숫자  -->
							<div style="display : flex; justify-content: flex-start; height: 30px; padding: 5px;">
								<div>좋아요&nbsp;</div>
								<div class ="icon_color" id="diamond_num_${certificatedList[i].getCertificatedNum()}" style="color:#0038fb;">${LikeCntList[i]}</div>
								<div>개</div>
							</div>
							
							<!-- 본문  -->					
							<div style="display : flex; justify-content: flex-start; height: auto; padding: 5px;">
								<div id="" style="width: auto;">${certificatedList[i].getMemberId()} </div>
								<div id="mainPreview_${certificatedList[i].getCertificatedNum()}" style="width: 70%;">${ContentSubStringList[i]}</div>
								<div class="certificated_textarea" id="mainDetail_${certificatedList[i].getCertificatedNum()}" style="display: none; height: auto; border-bottom: none; width:70%;">${certificatedList[i].getCertificatedContent()}</div>
								
								<div id="iconPlus_${certificatedList[i].getCertificatedNum()}" style="width: 10%; text-align: right; margin: 0 5px; cursor: pointer;"onclick="mainDetail(${certificatedList[i].getCertificatedNum()})">
									<i id="" class="far fa-plus-square icon_color"></i>
								</div>

								<%-- <div id="iconMore_${certificatedList[i].getCertificatedNum()}" style="width: 10%; text-align: right; margin: 0 5px; display: none; cursor: pointer;">
									<input id=""type="button" value="더보기" style="box-shadow: none; padding : 0 5px;;color: rgba(0, 59, 251, 0.3) !important;" )">
								</div> --%>
							</div>
							
							<!-- 댓글 -->							
							<!-- <div style="padding: 5px; margin-top:1%; color: rgba(164, 167, 170, 1);font-size: 0.8em;">댓글</div>
 -->							<div id="ajaxFunction" >								
								<input id="reply_${i}" type="hidden" value="${certificatedList[i].getCertificatedNum()}">
								
								<div id = "replyAjaxDiv_${certificatedList[i].getCertificatedNum()}_mini" style="background-color: aliceblue; padding:0 0.5em;margin: 0 -0.5em;font-size: 0.9em;">
								</div>
								<div id = "replyAjaxDiv_${certificatedList[i].getCertificatedNum()}" style="display : none;background-color: aliceblue; padding:0 0.5em;margin: 0 -0.5em;font-size: 0.9em;">
								</div>
							</div>
							<div style="padding: 5px; margin-top:1%; color: rgba(164, 167, 170, 1);font-size: 0.8em;">
								${times[i]}
							</div>
							
						</div><!-- end 일반게시판 게시물 div박스-->
						<div style="border-top : 1px solid rgba(164, 167, 170, 0.3);)">
						</div>
							<!-- 댓글 입력 칸 -->
						<div style="display : flex; justify-content: flex-start; height: auto; padding: 5px; border: 1px solid rgba(164, 167, 170, 0.3); border-top : none;" >
							<div style="width: auto; padding-top: 5px; display:flex; align-items:center; padding:5px;">${session_id}</div>
							<input id="replyContents_${certificatedList[i].getCertificatedNum()}"type="text" placeholder="댓글을 작성해주세요" style="width:70%; border:0; border-bottom: none;"/>
							<input type="button" value="등록" style="width:10%; margin: 0 5px; box-shadow: none; color: rgba(0, 59, 251, 0.3)!important" 
								onclick="javascript:writeReply(${certificatedList[i].getCertificatedNum()}, '${session_id}')">
							</div>
						
					</c:forEach>
					</c:when>
							<c:otherwise>
							<c:forEach var="i" begin="0" end="1">
									
						<!-- 일반게시판 전체 아웃라인 -->
						<div class="certificated_box" style="height: auto; margin-top: 20px; border-bottom: none;">
							<!-- 작성자 -->
							<div style="display : flex; justify-content: center; height: auto;">
								<div style="width:10%;">
								<img id="" name="" class="profile" src="${pageContext.request.contextPath}/images/logo_blue.png" alt="" style="margin:5px; width: 35px; height: 35px;
									cursor: pointer;" onclick="#"/> <!-- 프로필 사진 클릭시 해당 계정으로 이동 -->
								</div>
								<div id="" style="width:10%; padding-top: 10px; margin-left: 5px;">${certificatedList[i].getMemberId()}</div>
								<div class="icon_color" style="display: flex; justify-content: flex-end; width:80%; padding-top: 10px; padding-right: 10px;">
									<div id="menuHover"><i class="fas fa-ellipsis-h" onclick="#" style="cursor: pointer;"></i>
										
										<ul id="sub-menu" style="display: flex;flex-direction: column;">
											<c:if test="${session_id eq certificatedList[i].getMemberId()}">
												<li><a href="javascript:modifyPopup('${certificatedList[i].getCertificatedNum()}','${certificatedList[i].getCertificatedTitle()}','${certificatedList[i].getCertificatedContent()}','${certificatedList[i].certificatedPath}')" type="button">수정</a></li>
												<li><a href="${pageContext.request.contextPath}/board/certificateDeleteOk.bo?certificatedNum=${certificatedList[i].getCertificatedNum()}" type="button">삭제</a></li>
											</c:if>								
										
										</ul>
									</div>
									
								
								</div>
							</div>
							
							<!-- 게시판 제목 -->
							
							<div style="height: 30px; padding-top: 5px; margin:5px;">
								<h4>${certificatedList[i].getCertificatedTitle()} </h4>
							</div>
							
							<!-- 사진 -->
							<div style="width: 70%; margin: 3% auto;">
								<div style="position:relative; width:100%; height: 0; padding-bottom:100%; ">
									<img src="${certificatedList[i].getCertificatedPath()}" style="display:inline-block; width:100%; height:100%; position:absolute; top:0; left:0; z-index:-1">
									<!-- 한동석 강사 작업 - likeMark -->
									<img id="likeMark_${certificatedList[i].getCertificatedNum()}" src="${pageContext.request.contextPath}/images/logo_blue.png" style="display:none; width:100%; margin-top:10%">
								</div>
							</div>
							
							<!-- 아이콘들 (다이아몬드, 댓글아이콘등) -->
							<div class="icon_color" style="display : flex; justify-content: flex-start; height: 35px; padding: 5px;">
								<c:choose>
									<c:when test="${likeChecks[i] == 'true'}">
										<div id="checkedDiamond_${certificatedList[i].getCertificatedNum()}" style="font-size: 1.2rem; padding-top: 2px; color:#0038fb;" onclick="unchangeDiamond(${certificatedList[i].getCertificatedNum()})">
											<i class="fas fa-gem fa-lg" style="cursor: pointer; " ></i>
										</div>
										<div id="diamond_${certificatedList[i].getCertificatedNum()}" style="font-size: 1.2rem; padding-top: 2px; display : none;" onclick="changeDiamond(${certificatedList[i].getCertificatedNum()})">
											<i  class="far fa-gem fa-lg" style="cursor: pointer;" ></i>
										</div>
									</c:when>
									<c:otherwise>
										<div id="checkedDiamond_${certificatedList[i].getCertificatedNum()}" style="font-size: 1.2rem; padding-top: 2px; color:#0038fb; display : none;" onclick="unchangeDiamond(${certificatedList[i].getCertificatedNum()})">
											<i class="fas fa-gem fa-lg" style="cursor: pointer; " ></i>
										</div>
										<div id="diamond_${certificatedList[i].getCertificatedNum()}" style="font-size: 1.2rem; padding-top: 2px;" onclick="changeDiamond(${certificatedList[i].getCertificatedNum()})">
											<i  class="far fa-gem fa-lg" style="cursor: pointer;" ></i>
										</div>
									</c:otherwise>
								</c:choose>
								
								<%-- <div id="checkedDiamond_${certificatedList[i].getCertificatedNum()}" style="font-size: 1.2rem; padding-top: 2px; display : none; color:#0038fb;" onclick="unchangeDiamond(${certificatedList[i].getCertificatedNum()})">
									<i class="fas fa-gem fa-lg" style="cursor: pointer; " ></i>
								</div> --%>
								
								<!-- 댓글 더보기 버튼 -->
								<!-- <i class="fas fa-comment"></i> -->
								<div style="font-size: 1.3rem;" onclick ="changeComment(${certificatedList[i].getCertificatedNum()})">
									<i id="replyIcon_${certificatedList[i].getCertificatedNum()}" class="far fa-comment fa-lg" style="cursor: pointer; margin-left: 9px;" onclick="#"></i>
								</div>
								
							</div>
							 
							<!-- 좋아요 숫자  -->
							<div style="display : flex; justify-content: flex-start; height: 30px; padding: 5px;">
								<div>좋아요&nbsp;</div>
								<div class ="icon_color" id="diamond_num_${certificatedList[i].getCertificatedNum()}" style="color:#0038fb;">${LikeCntList[i]}</div>
								<div>개</div>
							</div>
							
							<!-- 본문  -->					
							<div style="display : flex; justify-content: flex-start; height: auto; padding: 5px;">
								<div id="" style="width: 20%;">${certificatedList[i].getMemberId()} </div>
								<div id="mainPreview_${certificatedList[i].getCertificatedNum()}" style="width: 70%;">${ContentSubStringList[i]}</div>
								<div class="certificated_textarea" id="mainDetail_${certificatedList[i].getCertificatedNum()}" style="display: none; height: auto; border-bottom: none; width:70%;">${certificatedList[i].getCertificatedContent()}</div>
								
								<div id="iconPlus_${certificatedList[i].getCertificatedNum()}" style="width: 10%; text-align: right; margin: 0 5px; cursor: pointer;"onclick="mainDetail(${certificatedList[i].getCertificatedNum()})">
									<i id="" class="far fa-plus-square icon_color"></i>
								</div>

								<%-- <div id="iconMore_${certificatedList[i].getCertificatedNum()}" style="width: 10%; text-align: right; margin: 0 5px; display: none; cursor: pointer;">
									<input id=""type="button" value="더보기" style="box-shadow: none; padding : 0 5px;;color: rgba(0, 59, 251, 0.3) !important;" )">
								</div> --%>
							</div>
							
							<!-- 댓글 -->							
							<!-- <div style="padding: 5px; margin-top:1%; color: rgba(164, 167, 170, 1);font-size: 0.8em;">댓글</div>
 -->							<div id="ajaxFunction" >								
								<input id="reply_${i}" type="hidden" value="${certificatedList[i].getCertificatedNum()}">
								
								<div id = "replyAjaxDiv_${certificatedList[i].getCertificatedNum()}_mini" style="background-color: aliceblue; padding:0 0.5em;margin: 0 -0.5em;font-size: 0.9em;">
								</div>
								<div id = "replyAjaxDiv_${certificatedList[i].getCertificatedNum()}" style="display : none;background-color: aliceblue; padding:0 0.5em;margin: 0 -0.5em;font-size: 0.9em;">
								</div>
							</div>
							<div style="padding: 5px; margin-top:1%; color: rgba(164, 167, 170, 1);font-size: 0.8em;">
								${times[i]}
							</div>
							
						</div><!-- end 일반게시판 게시물 div박스-->
						<div style="border-top : 1px solid rgba(164, 167, 170, 0.3);)">
						</div>
							<!-- 댓글 입력 칸 -->
						<div style="display : flex; justify-content: flex-start; height: auto; padding: 5px; border: 1px solid rgba(164, 167, 170, 0.3); border-top : none;" >
							<div style="width: 20%; padding-top: 5px; display:flex; align-items:center; padding:5px;">${session_id}</div>
							<input id="replyContents_${certificatedList[i].getCertificatedNum()}"type="text" placeholder="댓글을 작성해주세요" style="width:70%; border:0; border-bottom: none;"/>
							<input type="button" value="등록" style="width:10%; margin: 0 5px; box-shadow: none; color: rgba(0, 59, 251, 0.3)!important" 
								onclick="javascript:writeReply(${certificatedList[i].getCertificatedNum()}, '${session_id}')">
							</div>
						
					</c:forEach>
							</c:otherwise>
						</c:choose>
						
						
						<!-- <input type="button" onclick="javascript:getList()" /> -->
						<div id="listAJAX"></div>
					</c:if>
					<c:if test="${empty certificatedList}">
					
					<!-- 게시물이 없는 경우 기본 게시물 출력 -->
					
						<div class="certificated_box" style="height: auto; margin-top: 20px; border-bottom: none;">
							<!-- 작성자 -->
							<div style="display : flex; justify-content: center; height: auto;">
								<div style="width:10%;">
								<img id="" name="" class="profile" src="${pageContext.request.contextPath}/images/logo_blue.png" alt="" style="margin:5px; width: 35px; height: 35px;
									cursor: pointer;" onclick="#"/> 
								</div>
								<div id="" style="width:80%; padding-top: 10px; margin-left: 5px;"><span>여러분의 다이어트 비서 DAVI :)</span> </div>
								<div class="icon_color" style="display: flex; justify-content: flex-end; width:10%; padding-top: 10px; padding-right: 10px;">
									
								
								</div>
							</div>
							
							<!-- 게시판 제목 -->
							
							<div style="height: 30px; padding-top: 5px; margin:5px;">
								<h4>다비하자 ! </h4>
							</div>
							
							<!-- 사진 -->
							<div style="width: 70%; margin: 3% auto;">
								<div style="position:relative; width:100%; height: 0; padding-bottom:100%; ">
									<img src="https://cdn.discordapp.com/attachments/821644547493986328/833933002114727936/123.png" style="display:inline-block; width:100%; height:100%; position:absolute; top:0; left:0; z-index:-1">
									<!-- 한동석 강사 작업 - likeMark -->
									<img id="likeMark" src="${pageContext.request.contextPath}/images/logo_blue.png" style="display:none; width:100%; margin-top:10%">
								</div>
							</div>
							
							<!-- 아이콘들 (다이아몬드, 댓글아이콘등) -->
							<div class="icon_color" style="display : flex; justify-content: flex-start; height: 35px; padding: 5px;">
										<div style="font-size: 1.2rem; padding-top: 2px;">
											<i  class="far fa-gem fa-lg" style="cursor: pointer;" ></i>
										</div>
								<div style="font-size: 1.3rem;">
									<i class="far fa-comment fa-lg" style="cursor: pointer; margin-left: 9px;"></i>
								</div>
								
							</div>
							 
							<!-- 좋아요 숫자  -->
							<div style="display : flex; justify-content: flex-start; height: 30px; padding: 5px;">
								<div>좋아요&nbsp;</div>
								<div class ="icon_color" style="color:#0038fb;">29789</div>
								<div>개</div>
							</div>
							
							<!-- 본문  -->					
							<div style="display : flex; justify-content: flex-start; height: auto; padding: 5px;">
								<div id="" style="width: 20%;">DAVI</div>
								<div class="certificated_textarea" style="height: auto; border-bottom: none; width:70%;">
								게시물이 없습니다 ㅠ^ㅠ 다비의 첫번째 식단 인증 게시판의 주인공이 되어주세요 ! 지금 바로 여러분의 식단을 인증해주세요!</div>
								
								<div style="width: 10%; text-align: right; margin: 0 5px;">
								</div>
							</div>
							
							<!-- 댓글 -->							
							<!-- <div style="padding: 5px; margin-top:1%; color: rgba(164, 167, 170, 1);font-size: 0.8em;">댓글</div>
 -->							<div id="ajaxFunction" >								
								
								
								<div style="display : none;" style="background-color: aliceblue; padding:0 0.5em;margin: 0 -0.5em;font-size: 0.9em;">
									<div style="display : flex; justify-content: flex-start; height: 30px; padding: 5px;">
									<div style="width: 20%;">DAVI</div>
									<div style="width: 70%;">다비 화이팅!!</div>
								</div>
							</div>
							<div style="padding: 5px; margin-top:1%; color: rgba(164, 167, 170, 1);font-size: 0.8em;">
								방금전
							</div>
						</div>
						</div>
						<div style="border-top : 1px solid rgba(164, 167, 170, 0.3);)">
						</div>
							<!-- 댓글 입력 칸 -->
						<div style="display : flex; justify-content: flex-start; height: auto; padding: 5px; border: 1px solid rgba(164, 167, 170, 0.3); border-top : none;" >
							<div style="width: 20%; padding-top: 5px; display:flex; align-items:center; padding:5px;">DAVI</div>
							<input type="text" placeholder="댓글을 작성해주세요" style="width:70%; border:0; border-bottom: none;"/>
							<input type="button" value="등록" style="width:10%; margin: 0 5px; box-shadow: none; color: rgba(0, 59, 251, 0.3)!important" 
								readonly="readonly">
							</div>
					
					</c:if>
					</article>
						
				</div>
				
				<c:import url="/app/footer/footer.jsp"></c:import>
				<!-- board body end -->

				</div>
			</div>
				<!-- Sidebar -->
			<c:import url="/app/footer/sidebar.jsp" />		
		</div>

		<!-- Scripts -->
			<script>
			var contextPath = "${pageContext.request.contextPath}";
			var sessionId = "${session_id}";
			</script>
			
			<<%-- script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> --%>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script src="${pageContext.request.contextPath}/app/board/js/certificated_board.js"></script>
			<script src="${pageContext.request.contextPath}/app/board/js/certificated_reply.js"></script>
			<!-- <script src="//code.jquery.com/jquery-3.5.1.min.js"></script> -->
			
						
			<script>
				//로그인 상태 아닐 때 로그인으로 돌려보내는 함수
				function login () {
					toLoginForm.submit();
				}				
					getReplyList(document.getElementById("reply_0").value);				
					getReplyList(document.getElementById("reply_1").value);					

			</script>
			
			<script>
				var commentCheck = false;
				
				function changeComment(num) {
					if(!commentCheck){
						$("#replyAjaxDiv_"+num+"_mini").hide();
						$("#replyAjaxDiv_"+num).show();
						$("#replyIcon_"+num).attr("class", "fas fa-comment fa-lg");
						$("#replyIcon_"+num).css("color", "#003BFB");
						commentCheck = true;
					}else {
						$("#replyAjaxDiv_"+num+"_mini").show();
						$("#replyAjaxDiv_"+num).hide();
						$("#replyIcon_"+num).attr("class", "far fa-comment fa-lg");
						$("#replyIcon_"+num).css("color", "rgba(164, 167, 170, 0.7)");
						commentCheck = false;
					}
				}
				

				
			</script>
			
			<script>
				function popup() {
					/* 배경화면 투명도를 낮추기  */
					/* document.getElementById("wrapper").style.backgroundColor = "black";
					document.getElementById("wrapper").style.opacity = "0.3%"; */
					
					var width = '700';
				    var height = '500';
				    var left = Math.ceil(( window.screen.width - width )/2);
				    var top = Math.ceil(( window.screen.height - height )/2); 
				    window.open('${pageContext.request.contextPath}/app/board/certificated_normal_board_photo.jsp', '사진등록', 'width='+ width +', height='+ height +', left=' + left + ', top='+ top );
					
				}
				
				function modifyPopup(num,title,content,path){
					
					var width = '700';
				    var height = '500';
				    var left = Math.ceil(( window.screen.width - width )/2);
				    var top = Math.ceil(( window.screen.height - height )/2); 
				    window.open('${pageContext.request.contextPath}/app/board/certificated_normal_board_modify.jsp?num='+num+'&title='+title+'&content='+content+'&path='+path, 
				    	'modifyPopup', 'width='+ width +', height='+ height +', left=' + left + ', top='+ top );
				}
				
				//플러스 버튼 hover 이벤트
				/* var iconplus = $('#iconplus');
				var iconmore = $('#iconmore');
				
				iconplus.hover(function() {
					iconplus.css('display', 'none');
					iconmore.css('display', '');
					
				});
				
				iconmore.hover(function () {
					
					
				}, function (){
					iconplus.css('display', '');
					iconmore.css('display', 'none');
				});
				
				//마이너스 버튼 hover 이벤트
				var iconminus = $('#iconminus');
				var iconminusmore = $('#iconminusmore');
				
				iconminus.hover(function() {
					iconminus.css('display', 'none');
					iconminusmore.css('display', '');
					
				});
				
				iconminusmore.hover(function () {
					
					
				}, function (){
					iconminus.css('display', '');
					iconminusmore.css('display', 'none');
				}); */
				
								
				//본문 내용 더보기 버튼 (마이너스 버튼 활성화 시키기)
				var mainDetailCheck = false;
				
				function mainDetail(num) {
					$("#mainPreview_"+num).hide();
					$("#mainDetail_"+num).show();
					$("#iconPlus_"+num).hide();
					$("#iconMore_"+num).hide();
				}
			</script>
			
			

	</body>
</html>