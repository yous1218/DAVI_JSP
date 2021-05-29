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
<title>bestBoard</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/app/board/css/bestBoard.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<style>
	#wrap{
		width:60%;
		height:500px;
		display:flex;
		justify-content:space-between;
		height:500px;
		background-color: #fefefe;
	}
	
	#img{
		width:60%;
	}
	
	#img img {
		width:100%;
		height:100%;
	}	
	
	#detail{
		display:flex;
		flex-direction:column;
		align-items:center;
		width:39.7%;
	}
	
	#memberId, #title{
		display:flex;
		flex-wrap:wrap;
		align-items:center;
		width:100%;
		height:50px;
		border:2px solid rgba(210, 215, 217, 0.75);
		border-top:0;
		box-sizing : border-box;
		padding:0 4%;
		font-weight:bold;
	}
	
	#memberId{
		border-top: 2px solid rgba(210, 215, 217, 0.9);
		justify-content:space-between;
	}
	
	#content{
		padding:4% 4%;
		display:flex;
		word-break:break-all;
		flex-wrap:wrap;
		box-sizing : border-box;
		width:100%;
		height:400px;
		border:2px solid rgba(210, 215, 217, 0.9);
		border-top:0;
		font-weight:bold;
	}
	
	.memberId {
		font-weight:bold;
	}
	
	.container{
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0,0,0,0.8);
		z-index:1 !important;
		display:none;
		/* display:flex;
		justify-content:center;
		align-items:center; */
	}
	
	/* .hidden {
		display:none;
	} */
	
	.container #close{
		position:absolute;
		top:50px;
		left:90%;
		box-shadow:none !important;
		font-size:1.3em;
		cursor:pointer;
	}
	
</style>
</head>
<body class="is-preload">
<c:set var="listsVO" value="${listsVO}"></c:set>
<c:set var="likeCntList" value="${likeCntList}"></c:set>
<div class="container">
	<div style="width:100%; height:100%; display:flex; justify-content:center; align-items:center;">
	<i class="fas fa-times" id="close"></i>
	<i class="fas fa-chevron-left" style="margin-right:5%; font-size:2em; cursor:pointer;" id="left"></i>
	<div id="wrap">
			<div id="img">
				<img alt="" src="">
			</div>	
			
			<div id="detail">
				<div id="memberId" style="padding:0 4%;"></div>
				<div id="title"></div>
				<div id="content"></div>
			</div>
		</div>	
	<i class="fas fa-chevron-right" style="margin-left:5%; font-size:2em; cursor:pointer;" id="right"></i>
	</div>	
</div>	
	<!-- Wrapper -->
	<div id="wrapper">
	
		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<c:import url="/app/header/header.jsp" />

				<!-- Section -->
				<div style="display: flex; flex-direction: column; align-items: center; padding:5em 0 2em 0;">
					<img style="width:80%; height:auto;" src="https://cdn.discordapp.com/attachments/829186101029502990/829186131043287060/28e4f757ba966512.png">
				</div>
				<section style="padding-top: 30px; width: 80%; margin: auto;">
					<!-- <form name="detailForm" method="post"> -->
					<div id="best_posts" class="best_posts">
						<c:if test="${fn:length(listsVO) != 0}">
						<c:forEach var="i" begin="0" end="${fn:length(listsVO) - 1}">
								<div style="width:30%; margin-bottom:5%; ">
									<a href="javascript:bestDetail(${i + 1})" id="border-${i}" class="image" style="border:1px solid rgba(210, 215, 217, 0.75); ">
									<img
										src="${listsVO[i].getCertificatedPath()}"
										alt=""
										style="display: inline-block; width: 100%; height: 100%; position: absolute; top: 0; left: 0;" />
									<div id="cover" style="color:white;">
										<i class="fas fa-gem fa-lg"></i> &nbsp; ${likeCntList[i]}개
									</div>
									</a>
								</div>
								<input type="hidden" name = "path${i + 1}" value="${listsVO[i].getCertificatedPath()}">
								<input type="hidden" name = "id${i + 1}" value="${listsVO[i].getMemberId()}">
								<input type="hidden" name = "content${i + 1}" value="${listsVO[i].getCertificatedContent()}">
								<input type="hidden" name = "title${i + 1}" value="${listsVO[i].getCertificatedTitle()}">
						</c:forEach>
						</c:if>
						<c:if test="${fn:length(listsVO) == 0}">
							<div style="width:100%; display:flex; justify-content:center;">
								<h2>현재 베스트 게시판이 존재하지 않습니다.</h2>
							</div>
						</c:if>
					</div>
					<!-- </form> -->
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
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script>
		/* function bestDetail(num) {
			var width = '1100';
		    var height = '530';
		    var left = Math.ceil(( window.screen.width - width )/2);
		    var top = Math.ceil(( window.screen.height - height )/2); 
		    window.open('${pageContext.request.contextPath}/board/bestBoardDetail.bo', 'bestDetail', 'width='+ width +', height='+ height +', left=' + left + ', top='+ top ); 
		    detailForm.action = "${pageContext.request.contextPath}/board/bestBoardDetail.bo?num=" + num;
		    detailForm.target = 'bestDetail';
		    detailForm.submit(); 
		} */
		
		var number;
		
		function bestDetail(num){
			number = num;
			var path = $("input[name=path"+num+"]").val();
			var id = $("input[name=id"+num+"]").val();
			var content = $("input[name=content"+num+"]").val();
			var title = $("input[name=title"+num+"]").val();
			
			console.log("id: " + id);
			console.log("content: " + content);
			console.log("title: " + title);
			
			var text = "";
			
			if(num== 1){
				text += '<div style="display:flex; align-items:center; width:30%;">';
				text += '<div style="border:2px solid gold; border-radius:50%; padding:3%;">';
				text += '<i class="fas fa-trophy" style="color:gold"></i></div>';
				text += '<div class="memberId">&nbsp;'+id+'</div></div>';
				text += '<div style="border:2px solid gold; padding:1.2%; color:gold;">No.1</div>';
			}else if(num == 2){
				text += '<div style="display:flex; align-items:center; width:30%;">';
				text += '<div style="border:2px solid #878787; border-radius:50%; padding:3%;">';
				text += '<i class="fas fa-trophy" style="color:#878787"></i></div>';
				text += '<div class="memberId">&nbsp;'+id+'</div></div>';
				text += '<div style="border:2px solid #878787; padding:1.2%; color: #878787;">No.2</div>';
			}else if(num == 3){
				text += '<div style="display:flex; align-items:center; width:30%;">';
				text += '<div style="border:2px solid #964b00; border-radius:50%; padding:3%;">';
				text += '<i class="fas fa-trophy" style="color:#964b00"></i></div>';
				text += '<div class="memberId">&nbsp;'+id+'</div></div>';
				text += '<div style="border:2px solid #964b00; padding:1.2%; color: #964b00;">No.3</div>';
			}else{
				text += '<div style="display:flex; align-items:center; width:30%;">';
				text += '<div style="border:2px solid #008080; border-radius:50%; padding:3%;">';
				text += '<i class="fas fa-medal" style="color:#008080"></i></div>';
				text += '<div class="memberId">&nbsp;'+id+'</div></div>';
				text += '<div style="border:2px solid #008080; padding:1.2%; color:#008080;">No.'+num+'</div>';
			}
			
			$("#memberId").html(text);
			$("#title").text(title);
			$("#content").text(content);
			$("#img").children("img").attr("src",path);
			
			$(".container").fadeIn(500);
		}
		
		
		$("#close").click(function(){
			/* $(".container").css("display","none"); */
			$(".container").fadeOut(500);
		});
		
		
		$('#left').click(function(){
			number = number - 1;
			if(number < 1){
				number = 12;
			}
			bestDetail(number);
		});
		
		$('#right').click(function(){
			number = number + 1;
			if(number > 12){
				number = 1;
			}
			bestDetail(number);
		});
		
		
	</script>

</body>
</html>