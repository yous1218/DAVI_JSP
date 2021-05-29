<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<title>header</title>
<style>
.headerul ul {
	border-top: 0 !important;
	margin: 0;
	padding: 0;
	list-style: none;
	float: right;	
}

#menufont li {
	margin: 0;
	padding: 0 4% 0 0;
	list-style: none;
	float: right;
	font-weight: bold;
	font-size: 1rem;
}

#myMenu li {
	margin: 0;
	padding: 0 8px 0 0;
	list-style: none;
	float: right;
	font-weight: bold;
	font-size: 1rem;
}

@media screen and (max-width: 1450px) {
	li {
		font-size: 1rem;
	}
}

@media screen and (max-width: 736px) {
	.secret {
		display: none;
	}
}

/* #main-menu>li {
	float: left;
	position: relative;
}

#main-menu>li>a {
	font-size: 1rem;
	color: #ffaec9;
	text-align: center;
	text-decoration: none;
	letter-spacing: 0.05em;
	display: block;
	padding: 14px 36px;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
} */
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

/* #main-menu>li:hover #sub-menu {
	opacity: 1;
	visibility: visible;
} */
#sub-menu>li>a:hover {
	text-decoration: underline;
}

#menuHover:hover #sub-menu {
	opacity: 1;
	visibility: visible;
}

#menufont a {
	color: black;
}

#popup {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -150px;
	margin-top: -100px;
	border: 2px solid #c4c4c4;
	width: 300px;
	height: 200px;
	z-index: 10 !important;
}

.sub_menu_list {
	margin : 0 4px;
}
</style>
</head>
<body onload="counter_init()">
	<!-- Header -->
	<header id="header" style="display: block; border-bottom: solid 2px rgba(210, 215, 217, 0.75);">
		<div class="row headerul" style="display:flex; justify-content:space-between; padding-right:0 !important">
			
			<div style="display:flex; width:70%; padding: 0;">
				<div style="display:flex; margin-right:2%; margin-left:4%;">
					<a href="${pageContext.request.contextPath}/" class="logo" style="padding-bottom: 
					0px; font-weight:bold; font-size:3rem; color: rgba(0, 59, 251, 1); font-style:italic">
						DAVI
					</a>
				</div>
				
				<div  style="padding-left:1.5em; display:flex; align-items:center; width:75%;">
					<ul id="menufont" class="secret" style="width:100%; display:flex; justify-content:flex-start;">						
						<c:if test="${not empty session_id }">
						<li><a href="${pageContext.request.contextPath}/member/reportView.me" style="color:rgba(0, 59, 251, 1);">보고서</a></li>
						<li><a href="${pageContext.request.contextPath}/member/weekMenu.me" style="color:rgba(0, 59, 251, 1);">식단</a></li>
						
								<li id="menuHover"><a href="#">식단인증게시판</a>
									<ul id="sub-menu" style="display: flex;flex-direction: center;">
										<li><a class = "sub_menu_list" href="${pageContext.request.contextPath}/board/ceritificatedBoard.bo" >일반인증게시판</a></li>
										<li><a class = "sub_menu_list"href="${pageContext.request.contextPath}/board/bestList.bo" >베스트인증게시판</a></li>
									</ul>
								</li>
						</c:if>
						<li><a href="${pageContext.request.contextPath}/board/freeList.bo">자유게시판</a></li>	
								<li id="menuHover"><a href="#">치팅모임</a>
									<ul id="sub-menu" style="display: flex;flex-direction: center;">
										<li><a class = "sub_menu_list" href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=서울/경기" >서울/경기</a></li>
										<li><a class = "sub_menu_list" href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=강원도" >강원도</a></li>
										<li><a class = "sub_menu_list" href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=충청도" >충청도</a></li>
										<li><a class = "sub_menu_list" href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=경상도" >경상도</a></li>
										<li><a class = "sub_menu_list"href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=전라도/기타" >전라도</a></li>
									</ul>
								</li>
								<li><a href="${pageContext.request.contextPath}/board/qnaList.bo?qnaHead=식단">QnA</a></li>
						<c:if test="${session_id eq 'admin1234'}">
							<li><a href="${pageContext.request.contextPath}/app/dietary/admin.jsp">관리자 페이지</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			
			<div style="display: flex; justify-content: flex-end; align-items:center; width:30%; padding: 0;">
				<ul id="myMenu" style="margin-right: 3%; display:flex;">
					<!-- 세션의 아이디로그인 정보를 이용하여 if문의 조건 검색 -->
					<c:if test="${not empty sessionScope.session_id}">
						<li style="margin-right:0.5em">${sessionScope.session_id}님&nbsp;</li>
						<li style="margin-right:0.5em"><a href="${pageContext.request.contextPath}/member/memberPayListCheckOk.me"><span><i class="fas fa-user" style="font-size:1.5em;"></i></span></a></li>
						<li><a href="${pageContext.request.contextPath}/member/logoutOk.me"><i class="fas fa-sign-out-alt" style="font-size:1.5em;"></i></a>&nbsp;</li>
					</c:if>
					<c:if test="${empty sessionScope.session_id}">					
						<li><a href="${pageContext.request.contextPath}/app/member/join_before.jsp">회원가입</a></li>
						<li><a href="${pageContext.request.contextPath}/app/member/login.jsp">로그인</a>&nbsp;</li>						
					</c:if>
				</ul>
			</div>
		</div>		
	</header>
	<!-- Timer 설정 -->
	   <span id="counter" style="display: none"></span><!-- <input type="button" value="연장" onclick="counter_reset()"> -->
		
		<!-- Layer Popup 설정 시작 -->
		<!-- div id="popup" style="visibility:hidden" -->
		<div id="popup" style="display:none"> <!-- 초기화면에서는 보여줄 필요가 없으니 아예 생성도 하지 않도록 한다. -->
			<div style="width:300px;height:170px" align="center"><br>
				<!-- 팝업내용 -->
				<span id="ncounter"></span> 후 자동 로그아웃 됩니다. <br><br>
				<input type="button" value="연장하기" onclick="counter_reset(), close_window()">
				<input type="button" value="로그아웃" onclick="logout()">
			</div>
		</div>
		<!-- Layer Popup 설정 끝 -->

</body>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script>
		var path = "${pageContext.request.contextPath}";
		var nowPath = window.location.href;		
		//Layer Popup 설정 시작
		function open_window(){
			var popup = document.getElementById("popup");
			popup.style.display = "block"; //block을 생성해서 보이게한다.
			//popup.style.visibility = "visible"; --> 이미 생성된 영역의 visible 기능만 On 한 경우
		}
		
		function close_window(){
			var popup = document.getElementById("popup");
			popup.style.display = "none"; //해당 영역을 지워서 않보이게 한다.
			//popup.style.visibility = "hidden"; --> 해당 영역을 렌더링한 상태에서 visible 기능만 Off 한 경우
		}
		//Layer Popup 설정 끝
		
		//Timer 설정 시작
		var tid;
		var cnt = parseInt(550);//초기값(초단위)
		var session_id = "${session_id}"
		
		function counter_init() { //메인화면 세션 카운트 실행
			tid = setInterval("counter_run()", 1000);
		}
		
		function counter_run() { //메인화면 세션 카운트
			document.all.counter.innerText = time_format(cnt);
			cnt--;
			if(cnt < 0) {
				clearInterval(tid);
				/*세션연장 여부를 질의하는 팝업을 띄운다.*/
				open_window();

				/*팝업에서 다시 카운트 시작*/
				cnt = parseInt(30);//카운트 초기화(초단위)
				nCounter_init();
			}
		}
		
		function nCounter_init() { //팝업화면 추가 세션 카운트 실행
			tid = setInterval("nCounter_run()", 1000);
		}


		function nCounter_run() { //팝업화면 추가 세션 카운트
			document.all.ncounter.innerText = time_format(cnt);
			cnt--;
			if(cnt < 0) {
				/*추가 세션 카운트가 0이면 로그아웃 후 자동로그아웃 안내화면으로 이동*/
				logoutInfo();
			}
		}
				
		function counter_reset() { //메인화면 카운트 재시작 및 서버 세션 연장
			//(1) WAS session 연장을 위해 WAS의 dummy 페이지 호출
			// => WAS 호출로직 추가!
			
			//(2) 세견 카운트 초기화
			clearInterval(tid);
			cnt = parseInt(550);//초기값(초단위)
			counter_init();
			
			//(3) 팝업화면 추가 세션 카운트도 초기화
			document.all.ncounter.innerText = ""; 
			
			self.location = path + "/member/sessionAdd.me?nowPath=" + nowPath;

		}
		
		function logoutInfo() { //로그아웃 후 자동로그아웃 안내화면으로 이동
			self.location = path + "/member/logoutOk.me";
		}
		
		function logout() { //로그아웃 후 로그인화면으로 이동 
			self.location = path + "/member/logoutOk.me";
		}
		//Timer 설정 끝
		
		function time_format(s) {
			var nHour=0;
			var nMin=0;
			var nSec=0;
			if(s>0) {
				nMin = parseInt(s/60);
				nSec = s%60;

				if(nMin>60) {
					nHour = parseInt(nMin/60);
					nMin = nMin%60;
				}
			} 
			if(nSec<10) nSec = "0"+nSec;
			if(nMin<10) nMin = "0"+nMin;

			return ""+nHour+":"+nMin+":"+nSec;
		}
		
	</script>
</html>