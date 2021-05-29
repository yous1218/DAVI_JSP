<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!-- jsp에서form으로 보낼때 인코딩이 안됫을때 해결방법  -->
<% request.setCharacterEncoding("UTF-8"); %> 
<!DOCTYPE HTML>
<!--
	Editorial by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>기본 프레임</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />		
		<style>
		
		.textTitle {
			display: flex;
			justify-content: space-between;
			margin-bottom:5%; 
			margin-top:5%;
			margin-left : 2%;
			font-size: 1.1em;			
		
		}
		
		.textMain {
			display: flex;
			justify-content: space-between;
			color: #7F888F;
			font-size: 0.9em;
		}
		
		.textMainBox {
			margin: 0 4%;
		}
		
		.textTitleFinalPay {
			display: flex;
			justify-content: space-between;
			margin-bottom:5%; 
			margin-top:5%;
			font-size: 1.1em;		
			color: white;
			margin-left : 2%;
		}
		
		.textMainFinalPay {
			display: flex;
			justify-content: space-between;
			color: white;
			font-size: 0.9em;
		}
		.titleBox {
			width: 30%;
			padding : 2% 2%;
			border-right:solid 1px rgba(210, 215, 217, 0.75);
		}
		
		.titleTextDeliver {
			margin : 1.2%;
		}
		.deliveryLocation {
			margin-bottom: 40%;
		}
		
		.detailBox {
			padding : 2% 2%;
			background-color: #1290ff;
			color: white;
			width: 70%;
		}
		
		.detailTextDeliver {
			margin: 1%;
		}
		
		.payBtn {
			box-shadow: inset 0 0 0 2px  #1290ff !important;
			background-color: #1290ff !important;
			color:white !important;
			margin-top : 4%;
		
		}
		
		</style>
		
		
				
	</head>
	<body class="is-preload">
	
	<c:set var="payNum" value ="${param.payNum}"></c:set>
	<c:set var="memberId" value="${param.memberId}"></c:set>
	<c:set var="memberName" value="${param.memberName}"></c:set>
	<c:set var="memberPhone" value="${param.memberPhone}"></c:set>
	<c:set var="memberEmail" value="${param.memberEmail}"></c:set>
	<c:set var="memberZipcode" value="${param.memberZipcode}"></c:set>
	<c:set var="memberAddress" value="${param.memberAddress}"></c:set>
	<c:set var="memberAddressDetail" value="${param.memberAddressDetail}"></c:set>
	<c:set var="payDate" value="${param.payDate}"></c:set>
	<c:set var="product" value="${param.product}"></c:set>
	<c:set var="price" value="${param.price}"></c:set>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<c:import url="/app/header/header.jsp" />
					

							<!-- Content -->
								<section style="margin-top: -4%;">
								<div style="width:80%; margin:0 auto; margin-bottom:4%;">
									<h3>주문/결제 금액 정보</h3>
									<hr style="margin:0 auto;">
									<div style="display:flex; justify-content:space-between;">
										<div style="width:30%;height:auto; border-right:solid 1px rgba(210, 215, 217, 0.75);">
											<div class="textTitle">
												<span>주문정보</span>
											</div>
											<div class="textMainBox">
												<div class="textMain">
													<span>상품명</span> 
													<span>${product}</span> 
												</div>
												<div class="textMain">
													<span>상품금액</span> 
													<span>${price} 원</span> 
												</div>
												<div class="textMain">
													<span>쿠폰할인</span> 
													<span>(-) 0원</span> 
												</div>
												<div class="textMain">
													<span>배송비</span> 
													<span>(+) 0원</span> 
												</div>
												<div class="textMain">
													<span>주문금액</span> 
													<span>${price} 원</span> 
												</div>
											</div>
										</div>
										<div style="width: 30%;height:auto; ">
											<div class="textTitle">
												<span>결제상세</span>
											</div>
											<div class="textMainBox">
												<div class="textMain">
													<span>카드결제</span> 
													<span>${price} 원</span> 
												</div>
											</div>
										</div>
										<div style="width: 40%; height:auto; background-color: #1290ff " >

											<div class="textTitleFinalPay">
												<span>주문금액</span>
											</div>
											<div class="textMainBox">
												<div class="textMainFinalPay">
													<span>카드 간편 결제</span> 
													<span>${price} 원</span> 
												</div>
											</div>
										</div>
									</div>
								</div>
								<div style="width:80%;margin: auto; ">
									<h3>배송지 정보</h3>
									<hr style="margin: 2em 0 0 0;">
									<div style="display:flex; justify-content:space-between;">
									
									<div class="titleBox">
										<div class="titleTextDeliver">수령인</div>
										<div class="titleTextDeliver">연락처</div>
										<div class="titleTextDeliver">이메일 주소</div>
										<div class="titleTextDeliver deliveryLocation">배송지</div>
										<div class="titleTextDeliver">구매일자</div>
									</div>
									<div class="detailBox">
										<div class="detailTextDeliver">${memberName}</div>
										<div class="detailTextDeliver">${memberPhone }</div>
										<div class="detailTextDeliver">${memberEmail}</div>
										<div class="detailTextDeliver">${memberZipcode}</div>
										<div class="detailTextDeliver">${memberAddress}</div>
										<div class="detailTextDeliver">${memberAddressDetail}</div>
										<div class="detailTextDeliver">${payDate}</div>
									</div>
									<div>
									
									</div>
									</div>
								</div>
								<form method="post" action ="${pageContext.request.contextPath}/member/memberPayListOk.me">
									<div style="width: 80%; margin: 0 auto;">
										<button class = "payBtn" style="width: 20%;"type="submit">목록 보기</button>
									</div>
								</form>
								
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

	</body>
	
	
</html>