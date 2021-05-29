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
		<title>마이 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
		<style>
			 body{
				font-family: 'Sunflower', sans-serif;
			} 
			
			.title_mypage{
				font-size: 3rem;
				margin-bottom: 3%;
			}
			
			
			.modal .btn{
				cursor: pointer;
				border: 1px solid #999999;
				text-align: center;
				border-radius: 5px;
				outline: none;
				font-weight: 500;
			}
			
			.dimLayer{
				display: block;
				width: 100%;
				background-color: rgba(0, 0, 0, 0.3);
				position: fixed;
				left: 0;
				top: 0px;
				margin: 0;
				padding: 0;
				z-index: 9998;
			}
			.modal{
				width: 600px;
				height: 252px;
				border-radius: 10px;
				padding: 80px 24px;
				box-sizing: border-box;
				text-align: center;
			}
			.modal-section{
				background: #ffffff;
				box-sizing: border-box;
				display: none;
				position: absolute;
				top: 50%;
				left: 50%;
				-webkit-transform: translate(-50%, -50%);
				-ms-transform: translate(-50%, -50%);
				-moz-transform: translate(-50%, -50%);
				-o-transform: translate(-50%, -50%);
				transform: translate(-50%, -50%);
				/* display: none; */ 
				z-index: 9999;
			}
			
			.modal-section-display{
				background: #ffffff;
				box-sizing: border-box;
				/* display: none; */
				position: absolute;
				top: 50%;
				left: 50%;
				-webkit-transform: translate(-50%, -50%);
				-ms-transform: translate(-50%, -50%);
				-moz-transform: translate(-50%, -50%);
				-o-transform: translate(-50%, -50%);
				transform: translate(-50%, -50%);
				/* display: none; */ 
				z-index: 9999;
			}
			.menu_msg{
				font-size: 21px;
				font-weight: 500;
			}
			.enroll_box p{
				padding-bottom: 56px;
			}
			.gray_btn {
				width: 90px;
				background: #ffffff;
				color: #999999;
				height: 36px;
				line-height: 36px;
				transition: 0.5s;
				font-size: 17px;
			}
			.davicolor_btn {
				width: 90px;
				background: #1290FF;
				color: #fff;
				height: 36px;
				line-height: 36px;
				transition: 0.5s;
				font-size: 17px;
				border: none;
			}
			
			.closeBtn {
				padding:0; 
				padding-left:4px;
				box-shadow: inset 0 0 0 2px #1290ff !important;
				background-color:#1290ff !important;
				color:white !important;
			}
			
			.myPageBtn {
				box-shadow: inset 0 0 0 2px #1290ff !important;
				background-color:#1290ff !important;
				color:white !important;
				width:30%; 
				margin:1% auto; 
				font-size: 1em;
			}
			
			
			
			
			
		</style>
	</head>
	<body class="is-preload">
	<c:set var="listCheck" value="${param.listCheck}"></c:set>
	<c:set var="check" value="${param.check}"></c:set>
	<c:set var="result" value="${param.result}"></c:set>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<c:import url="/app/header/header.jsp" />
					

							<!-- Content -->
								<section style="padding-top:3%;">
										<div style="display: flex; justify-content: center;">
											<p class="title_mypage">마이 페이지 </p>
										</div>
										<div style="text-align: center;">
											<hr style="width: 30%; margin: 1% auto;">
											<div>
												<a href ="${pageContext.request.contextPath}/member/myPageUpdate.me" class="button myPageBtn" style="color:white !important" >내 정보 수정</a>
											</div>
											<div>
												<a href ="${pageContext.request.contextPath}/member/myPageChangePw.me" class="button myPageBtn" style="color:white !important" >비밀번호 변경</a>
											</div>
											<div>
											<c:if test="${listCheck eq 'fail'}">
												<button type="button" id = "alert" class="button payListBtn myPageBtn" style="color:white !important">결제 내역 조회</button>
											</c:if>
											<c:if test="${listCheck eq 'success'}">
												<a href ="${pageContext.request.contextPath}/member/memberPayListOk.me" class="button myPageBtn" style="color:white !important" >결제 내역 조회</a>
											</c:if>
												<!-- <button type ="button" id = "alert" class="button payListBtn" style="display:none; width:30%; margin:1% auto; font-size: 1em;" >결제 내역 조회</button> -->
											</div>
											<hr style="width: 30%; margin: 1% auto;">
											
										</div>
								</section>		
									<section class="modal modal-section type-alert">
							            <div class="enroll_box">
							                <p class="menu_msg"></p>
							            </div>
							            <div class="enroll_btn">
							                <button class="btn davicolor_btn modal_close closeBtn" >확인</button>
							            </div>
	      							 </section>		
	      							 <!-- 상황별 모달창 -->
	      							 <c:if test="${check eq 'true' || check eq 'false' || check eq 'fail' || check eq 'cancel' || 
	      							 result eq 'true' || result eq 'false'}">
											<section class="modal modal-section-display type-alert">
									            <div class="enroll_box">
									                <p class="menu_msg"></p>
									            </div>
									            <div class="enroll_btn">
									                <button class="btn davicolor_btn modal_close closeBtn" >확인</button>
									            </div>
			      							 </section>			
	      							 </c:if>
	      							 
							<div>
							<c:import url="/app/footer/footer.jsp" />
							
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
				var contextPath = "${pageContext.request.contextPath}";
				/* function payListCheck() {
					location.href= contextPath + "/member/memberPayListOk.me";
				} */
			
			</script>
			
			<script>
			function popupUpdate() {
				var width = '700';
			    var height = '800';
			    var left = Math.ceil(( window.screen.width - width )/2);
			    var top = Math.ceil(( window.screen.height - height )/2); 
			    window.open('${pageContext.request.contextPath}/app/member/mypage_updateStatus.jsp', '게시물 작성', 'width='+ width +', height='+ height +', left=' + left + ', top='+ top );
			}
			
			function changePw() {
				changePwForm.submit();
			}
			
			var check = '${param.check}';
			var result = '${param.result}';
			
			if(check == "true") {
				$(function () {
			        action_popup_display.alert("비밀번호 수정이 완료되었습니다 😉");
	
				    $(".modal_close").on("click", function () {
						action_popup_display.close(this);
						$(".modal-section").hide();
				    });
					
				});
				
			} else if (check == "false") {
				$(function () {
			        action_popup_display.alert("서버가 불안정합니다. 다시시도해주세요 🥵");
	
				    $(".modal_close").on("click", function () {
				        action_popup_display.close(this);
				        $(".modal-section").hide();
				    });
					
				});
			} else if (check == "fail") {
				$(function () {
			        action_popup_display.alert("기존 비밀번호를 다시 확인해주세요 😨");
	
				    $(".modal_close").on("click", function () {
				        action_popup_display.close(this);
				        $(".modal-section").hide();
				    });
					
				});
			}
			else if (check == "cancel") {
				$(function () {
			        action_popup_display.alert("비밀번호 변경을 취소했습니다. 😨");
	
				    $(".modal_close").on("click", function () {
				        action_popup_display.close(this);
				        $(".modal-section").hide();
				    });
					
				});
			}
			
			if(result == "true"){
				$(function () {
			        action_popup_display.alert("내 정보 수정 성공 😉");
	
				    $(".modal_close").on("click", function () {
				        action_popup_display.close(this);
				        $(".modal-section").hide();
				    });
					
				});
			}else if(result == "false"){
				$(function () {
			        action_popup_display.alert("내 정보 수정 취소 😨");
	
				    $(".modal_close").on("click", function () {
				        action_popup_display.close(this);
				        $(".modal-section").hide();
				    });
					
				});
			}
			
			var listCheck = '${param.listCheck}';
			
			if(listCheck == "fail") {
				/*  alert ('조회된 결제내역이 없습니다. '); 
				console.log("들어옴"); */
				$(function () {
					$(document).on("click", "#alert", function () {
				        action_popup.alert("결제 내역이 없습니다 😓");
				    });
	
				    $(".modal_close").on("click", function () {
				        action_popup.close(this);
				    });
					
				});

			} 
			 
			/*  $(function () {
				$(document).on("click", "#alert", function () {
			        action_popup.alert("결제 내역이 없습니다.");
			    });

			    $(".modal_close").on("click", function () {
			        action_popup.close(this);
			    });
				
			});  */
			
			 var action_popup = {
				    timer : 500,
				    confirm : function(txt, callback){
				        if(txt == null || txt.trim() == ""){
				            console.warn("confirm message is empty.");
				            return;
				        }else if(callback == null || typeof callback != 'function'){
				            console.warn("callback is null or not function.");
				            return;
				        }else{
				            $(".type-confirm .btn_ok").on("click", function(){
				                $(this).unbind("click");
				                callback(true);
				                action_popup.close(this);
				            });
				            this.open("type-confirm", txt);
				        }
				    },

				    alert : function(txt){
				        if(txt == null || txt.trim() == ""){
				            console.warn("confirm message is empty.");
				            return;
				        }else{
				            this.open("type-alert", txt);
				        }
				    },

				    open : function(type, txt){
				        var popup = $("."+type);
				        popup.find(".menu_msg").text(txt);
				        $("body").append("<div class='dimLayer'></div>");
				        $(".dimLayer").css('height', $(document).height()).attr("target", type);
				        popup.fadeIn(this.timer);
				    },

				    close : function(target){
				        var modal = $(target).closest(".modal-section");
				        var dimLayer;
				        if(modal.hasClass("type-confirm")){
				            dimLayer = $(".dimLayer[target=type-confirm]");
				        }else if(modal.hasClass("type-alert")){
				            dimLayer = $(".dimLayer[target=type-alert]")
				        }else{
				            console.warn("close unknown target.")
				            return;
				        }
				        modal.fadeOut(this.timer);
				        setTimeout(function(){
				            dimLayer != null ? dimLayer.remove() : "";
				        }, this.timer);
				    }
				    
				} 
			 var action_popup_display = {
				    timer : 500,
				    confirm : function(txt, callback){
				        if(txt == null || txt.trim() == ""){
				            console.warn("confirm message is empty.");
				            return;
				        }else if(callback == null || typeof callback != 'function'){
				            console.warn("callback is null or not function.");
				            return;
				        }else{
				            $(".type-confirm .btn_ok").on("click", function(){
				                $(this).unbind("click");
				                callback(true);
				                action_popup.close(this);
				            });
				            this.open("type-confirm", txt);
				        }
				    },

				    alert : function(txt){
				        if(txt == null || txt.trim() == ""){
				            console.warn("confirm message is empty.");
				            return;
				        }else{
				            this.open("type-alert", txt);
				        }
				    },

				    open : function(type, txt){
				        var popup = $("."+type);
				        popup.find(".menu_msg").text(txt);
				        $("body").append("<div class='dimLayer'></div>");
				        $(".dimLayer").css('height', $(document).height()).attr("target", type);
				        popup.fadeIn(this.timer);
				    },

				    close : function(target){
				        var modal = $(target).closest(".modal-section-display");
				        var dimLayer;
				        if(modal.hasClass("type-confirm")){
				            dimLayer = $(".dimLayer[target=type-confirm]");
				        }else if(modal.hasClass("type-alert")){
				            dimLayer = $(".dimLayer[target=type-alert]")
				        }else{
				            console.warn("close unknown target.")
				            return;
				        }
				        modal.fadeOut(this.timer);
				        setTimeout(function(){
				            dimLayer != null ? dimLayer.remove() : "";
				        }, this.timer);
				    }
				    
				} 

			
			
		
			
			
			</script>

	</body>
</html>