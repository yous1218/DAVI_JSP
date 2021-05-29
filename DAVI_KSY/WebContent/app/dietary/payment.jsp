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
		<title>결제 시스템</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />	
		
		<style>
			.betweenBox{
				display:flex;
				justify-content:space-between;
			}
			
			.bgun{
				/* color:#871b37; */
				color: #1290ff;
				font-weight:bold;
			}
			
			.grayBox{
				color:#313131;
			}
			
			#bigFont{
				font-size:1.3em;
			}
			
			#smallFont{
				text-align:right;
				font-size:0.8em;
			}
			
			#btn{
				width:100%;
				box-shadow: inset 0 0 0 2px  #1290ff !important;
				background-color: #1290ff !important;
				color:white !important;
			}
		</style>			
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
								<form action="${pageContext.request.contextPath}/member/payInput.me" method="post">
									<div style="margin:0 auto;padding-top:50px;overflow:hidden;display:flex; justify-content:space-between; ">
										<div style="width:40%;text-align:center;">
											<img alt="" style="width:100%; height:720px;" src="https://cdn.discordapp.com/attachments/821644547493986328/834238346506665994/2.png">
										</div>
										
										<div style="width:50%; height: 720px; text-align:left;margin-right:20px;">
											<h2>일주일 다이어트 식단 주문하기</h2>
											<!-- 심심하면 -->
											<hr>
											<div class="betweenBox">
												<p id="bigFont">판매가격</p>
												<p id="bigFont" class="bgun">72,000원</p>
												<input type="hidden" name="price" value="72000">
												<input type="hidden" name="id" value="${session_id}">
												<input type="hidden" name="product" value="일주일치 식단">
											</div>
											<div class="betweenBox">
												<p id="bigFont">소비자가격</p>
												<p class="grayBox">100,000원</p>
											</div>
											<!-- <div class="betweenBox">
												<p id="bigFont">원산지</p>
												<p class="grayBox">상세설명에표시</p>
											</div> -->
											<div class="betweenBox">
												<p id="bigFont">배송비</p>
												<p class="grayBox">무료배송</p>
											</div>
											<div class="betweenBox">
												<p class="bgun" id="bigFont">배송안내</p>
												<p class="bgun" id="smallFont" >평일 오전 10시 이전 주문시 당일 출고(CJ대한통운) 됩니다.<br>금요일 출고시 토요일에 받으실 배송지(자택/회사)를 꼭 확인해주세요.</p>
											</div>
											<div class="betweenBox">
												<p class="bgun" id="bigFont">주의사항</p>
												<p class="bgun" id="smallFont">선택한 수량이 12개 이상, 24개 이하일 때 주문이 가능합니다.<br>추가구매는 먼저 담은 상품의 결제완료 후 가능합니다.</p>
											</div>
											<div class="betweenBox">
												<p id="bigFont">품목</p>
												<select style="width:40%;">
													<c:forEach var="map" items="${list}">
														<option value="${map.get('RECIPENAME')}">${map.get('RECIPENAME')}</option>
													</c:forEach>
												</select>
											</div>
											<hr>
											<div>
												<input type="submit" id="btn" value="바로구매">
											</div>
										</div>
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