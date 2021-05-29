<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <style>
	.sunflower li{
		font-family: 'Sunflower', sans-serif;
		font-weight: bold;		
	}
</style> -->
<title>footer</title>
</head>
<body>
<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				

				<!-- Menu -->				
					<nav id="menu">
						<header class="major">
							<h2 class="sunflower">Menu</h2>
						</header>
						<ul>
							<li><a href="${pageContext.request.contextPath}/index.jsp">메인</a></li>
							<li><a href="${pageContext.request.contextPath}/member/reportView.me">보 고 서</a></li>
							<li><a href="${pageContext.request.contextPath}/member/weekMenu.me">식 단</a></li>
							<li>
								<span class="opener" >식단인증게시판</span>
								<ul>
									<li><a href="${pageContext.request.contextPath}/board/ceritificatedBoard.bo">일반인증게시판</a></li>
									<li><a href="${pageContext.request.contextPath}/board/bestList.bo">베스트인증게시판</a></li>									
								</ul>
							
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/board/freeList.bo">자유게시판</a>							
							</li>
							<li>
								<span class="opener" >치팅모임</span>
								<ul>
									<li><a href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=서울" >서울/경기</a></li>
										<li><a href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=강원" >강원도</a></li>
										<li><a href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=충청" >충청도</a></li>
										<li><a href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=경상" >경상도</a></li>
										<li><a href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=전라" >전라도</a></li>
								</ul>
							</li>
							<li><a href="${pageContext.request.contextPath}/elements.html">식단 구매</a></li>
							
						</ul>
					</nav>

				<!-- Section -->
					<!-- <section>
						<header class="major">
							<h2>Ante interdum</h2>
						</header>
						<div class="mini-posts">
							<article>
								<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
								<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
							</article>
							<article>
								<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
								<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
							</article>
							<article>
								<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
								<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
							</article>
						</div>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</section> -->

				<!-- Section -->
					<section>
						<header class="major">
							<h2>DAVI</h2>
						</header>
						<p>간단한 소개글</p>
						<ul class="contact">
							<li class="icon solid fa-envelope"><a href="#">대표 이메일</a></li>
							<li class="icon solid fa-phone">대표 전화번호</li>
							<li class="icon solid fa-home">주소<br />
							상세주소</li>
						</ul>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; Untitled. All rights reserved.</p>
					</footer>

			</div>
		</div>	
</body>
</html>