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
		<title>주소입력</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />		
		<style>
			.betweenBox{
				display:flex;
				justify-content:space-between;
				width:50%;
			}
			
			.betweenBox2{
				display:flex;
				justify-content:space-between;
				width:100%;
				margin-left:1%;
			}
			
			.betweenBox input{
				width:70% !important;
			}
			
			.title{
				font-size:1.3em;
				font-weight:bold;
				margin-bottom:1% !important;
			}
			
			hr {
				margin-bottom:2% !important;
				margin-top:0 !important;
				font-size:1.2em;
				border: 1px solid rgba(210, 215, 217, 0.75) !important;
			}
			
			#btn{
				box-shadow: inset 0 0 0 2px #1290ff !important;
				background-color:#1290ff !important;
				color:white !important;
				width:20% !important;
			}
			
			#btnCancel{
				box-shadow: inset 0 0 0 2px rgba(210, 215, 217, 1) !important;
				background-color:rgba(210, 215, 217, 1) !important;
				width:20% !important;
				margin-right:2%;
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
								<section style="padding-top:3em;">
									<!-- 개인정보 수집동의 -->
									<div>
										<p class="title">개인정보 수집동의</p>
										<textarea disabled style="font-size:0.9em; height:150px;">
■ 수집하는 개인정보 항목

다비는 회원제 서비스 이용에 따른 본인 확인 절차를 위해 아래와 같은 개인정보를 수집하고 있습니다.
○ 수집항목: 성명, 이메일, 휴대폰번호, 주소, 전화번호

■ 개인정보의 수집 및 이용목적

다비는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
○ 서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, 불만처리 등 민원처리, 회원관리 등을 위한 목적

■ 개인정보의 보유 및 이용기간

다비는 개인정보 수집 및 이용목적이 달성된 후에는 예외없이 해당 정보를 지체없이 파기합니다.										
										</textarea>
										<div style="display:flex; justify-content:center; width:100%; margin-top:2%;">
												<input type="checkbox" id="agree" name="agree">
												<label for="agree">동의합니다.</label>
												<input type="checkbox" id="disagree" name="disagree" style="margin-left:2%;">
												<label for="disagree">동의하지 않습니다.</label>
										</div>
									</div>	
										
									<!-- 주문자 정보 -->	
									<div>
										<p class="title">주문자 정보</p>
										<hr>
										<div class="betweenBox">
											<p>주문하시는분</p>
											<input type="text" id="orderName">
										</div>
										<div class="betweenBox">
											<p>핸드폰 번호</p>
											<input type="text" id="phone">
										</div>
										<div class="betweenBox">
											<p>이메일</p>
											<input type="text" id="email">
										</div>
									</div>
									
									<!-- 배송정보 -->
									<div style="margin-top:3%;">
										<p class="title">배송 정보</p>
										<hr>
										<div class="betweenBox">
											<p>받으실 분</p>
											<input type="text" id="name">
										</div>
										<div style="width:100%; display:flex;">
											<div class="betweenBox">
												<p>우편번호</p>
												<input type="text" name="memberZipcode" class="postcodify_postcode5" value="" readonly/>
											</div>
											<input type="button" id="postcodify_search_button" value="검색" style="margin-left:1%;">
										</div>
										<div class="betweenBox">
											<p>주소</p>
											<input type="text" class="postcodify_address">
										</div>
										<div class="betweenBox">
											<p>상세주소</p>
											<input type="text" class="postcodify_details">
										</div>
										<div class="betweenBox">
											<p>남기실 말씀</p>
											<input type="text" class="postcodify_details">
										</div>
										
										<div style="margin-top:3%;">
											<p class="title">결제예정금액</p>
											<hr style="margin-bottom:0 !important;">
											<p style="margin-bottom:0;color:#1290ff;font-size:2.3em;font-weight:bold;margin-left:1%; ">72,000원</p>
											<hr>
											<div class="betweenBox2">
												<p>상품합계금액</p>
												<p>72,000원</p>
											</div>
											<div class="betweenBox2">
												<p>배송비</p>
												<p>무료</p>
											</div>
											<div class="betweenBox2">
												<p>쿠폰할인</p>
												<p>0원</p>
											</div>
											<div class="betweenBox2">
												<p>적립금 사용</p>
												<p>0원</p>
											</div>
										</div>
										
									</div>
									<hr>
									<div style="width:100%;display:flex;justify-content:center;">
										<input type="button" value="취소하기" id="btnCancel">
										<input type="button" value="결제하기" id="btn">
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
			<%-- <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> --%>
			<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); });</script>
		<!-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
			<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
			<script>
			var contextPath = "${pageContext.request.contextPath}";
			$("#btn").click(function(){
				if($("#agree").prop("checked")){
					var id = "${id}";
					var orderName = $("#orderName").val();
					var name = $("#name").val();
					var phone = $("#phone").val();
					var email = $("#email").val();
					var zipcode =$(".postcodify_postcode5").val();
					var adress =$(".postcodify_address").val();
					var adressDetails =$(".postcodify_details").val();
					var realAdd = adress+adressDetails;
					
					var product = "${product}";
					var StringPrice = "${price}";
					var price = parseInt(StringPrice);
					
					var check = paymentCheck(orderName, name, phone, email, zipcode, adress, adressDetails);

					if(!check) {
						return false;
					}
					
					IMP.init('imp68449525');
					IMP.request_pay({
					    pg : 'inicis', // version 1.1.0부터 지원.
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '주문명:' + product,
					    amount : /* price */100,
					    buyer_email : email,
					    buyer_name : /* '구매자이름' */ name,
					    buyer_tel : phone,
					    buyer_addr : realAdd,
					    buyer_postcode : zipcode
					   /*  m_redirect_url : 모바일 있을때 돌아갈 곳  */
					}, function(rsp) {
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.';
					   		alert(msg);
					        location.href=contextPath+"/member/memberPay.me?id="+id+"&name="+name+"&phone="+phone+"&email="+email+"&zipcode="+zipcode+"&adress="+adress+"&adressDetails="+adressDetails+"&product="+product+"&price="+price;
					    } else {
					        var msg = '결제에 실패하였습니다.';
					   		alert(msg);
					        location.href=contextPath + "/member/payment.me";
					    }
					});
				}else{
					alert("동의를 하셔야 결제가 진행됩니다.");
				}
			})	
			
			$("#btnCancel").click(function() {
				alert('결제를 취소하셨습니다 😰');
				location.href=contextPath + "/member/weekMenu.me";
			});
			
			function paymentCheck (orderName, name, phone, email, zipcode, address, addressDetail) {
				
				if(orderName == "") {
					alert("주문하시는분을 입력해주세요");
					return false;
				}
				
				if(phone == "") {
					alert("핸드폰번호를 입력해주세요");
					return false;
				}
				
				let regPhoneExp = /^[0-9]{10,11}$/;
				if(!regPhoneExp.test(phone)) {
					alert("핸드폰번호를 올바르게 입력해주세요");
					return false;
				}
				
				if(email == "") {
					alert("이메일 주소를 입력해주세요");
					return false;
				}
				
				let regEmailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				if (!regEmailExp.test(email)) {
					alert("이메일주소를 올바르게 입력해주세요 ");
					return false;
				}
				if(name == "") {
					alert("받으실분을 입력해주세요");
					return false;
				}
				
				if(zipcode == "") {
					alert("우편번호를 입력해주세요 ");
					return false;
				}
				
				if(address == "") {
					alert("주소를 입력해주세요");
					return false;
				}
				if(addressDetail == "") {
					alert("상세주소를 입력해주세요");
					return false;
				}
				
				return true;
			} 
			
				
			</script>
	</body>
	
	
</html>














