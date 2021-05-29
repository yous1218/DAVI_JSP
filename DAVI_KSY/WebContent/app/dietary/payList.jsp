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
		<title>다비 페이</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<style>
			.paymentMainBox {
				border : 1px solid #1290FF;
				border-left: none;
				border-right: none;
				margin : 1% 0;
				padding : 5% 3%;
				height: auto;
				
			}
			
			.title_payment{
				font-size: 3rem;
				margin-bottom: 3%;
				text-align: center;
			}
			
			.paymentProduct {
				font-size: 1.2em;
			}
			.paymentInfo {
				font-size: 0.9em;
			}
			
			.paymentMsg {
				margin-left: 20%;
				color: #7F888F;
				font-size: 0.8em;
			}
			
			.paymentBtn {
				box-shadow: inset 0 0 0 2px  #1290ff !important;
				background-color: #1290ff !important;
				color:white !important;
				margin-top : 4%;
			}
		
		</style>
				
	</head>
	<body class="is-preload">
	<c:set var = "payList" value = "${payList}"></c:set>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<c:import url="/app/header/header.jsp" />
					

							<!-- Content -->
								<section style="margin-top: -4%;">
									<div style="width: 60%; margin: 0 auto;">
										<div>
											<p class="title_payment">결제 내역 </p>
										</div>
									
									
									
										<c:forEach var="payment" items ="${payList}">
											<form action="${pageContext.request.contextPath}/member/memberPayDetail.me" method="post">
												<div class = "paymentMainBox">
													<div style = "display: flex; justify-content: center;">
														<div style="width : 20%; margin-right : 5%">
															<div style="position:relative; width:100%; height: 0; padding-bottom:100%; margin-top: 10%;">
																<img style="display:inline-block; width:100%; height:140%; position:absolute; top:0; left:0; z-index:-1"src="https://cdn.discordapp.com/attachments/821644547493986328/834658522788528138/0a586d65b28860b5.jpg">
															</div>
														</div>
														
														<div style="width : 60%; height: auto; margin-top: 4%;">
															<div class ="paymentProduct">${payment.getProduct()}</div>
															<div class ="paymentInfo">
																<span style="color:#1290FF;">${payment.getPrice()}원 </span> | <span style="color:#7F888F;">${payment.getPayDate()} </span>
															</div>
														</div>
														<button class = "paymentBtn" style="width: 20%;"type="submit">상세보기</button>	
													</div>
														<div class ="paymentMsg">
															<div>구매가 완료되었습니다. 이용해주셔서 감사합니다. </div>
															<div>구매확정 이후 상품의 이용방법, 반품 등에 대한 문의는 판매자에게 문의해주세요.</div>
														</div>
													
													<input type="hidden" name ="payNum" value="${payment.getPayNum()}">
													<input type="hidden" name ="memberId" value="${payment.getMemberId()}">
													<input type="hidden" name ="memberName" value="${payment.getMemberName()}">
													<input type="hidden" name ="memberPhone" value="${payment.getMemberPhone()}">
													<input type="hidden" name ="memberEmail" value="${payment.getMemberEmail()}">
													<input type="hidden" name ="memberZipcode" value="${payment.getMemberZipcode()}">
													<input type="hidden" name ="memberAddress" value="${payment.getMemberAddress()}">
													<input type="hidden" name ="memberAddressDetail" value="${payment.getMemberAddressDetail()}">
													<input type="hidden" name ="payDate" value="${payment.getPayDate()}">
													<input type="hidden" name ="product" value="${payment.getProduct()}">
													<input type="hidden" name ="price" value="${payment.getPrice()}">
												</div>
											</form>
										</c:forEach>
		
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

	</body>
	
	
</html>