<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 후기 등록 페이지 --%>

<%-- context path --%>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<%-- 후기 설문 문항 정보 목록 --%>
<c:set var="survey_vo_list" value="${requestScope.survey_vo_list}"/>

<style>
	div#review_register_container {
		width : 100%;
		height : 100%;
		display : flex;
		justify-content : space-between;
		flex-direction : column;
		align-items : center;
	}
	
	div#review_register_container img {
		width : 100%;
		height : 100%;
		object-fit : cover;
	}
	
	div#review_main {
		width : 100%;
		height : 100%;
		display : flex;
		flex-direction : column;
		align-items : center;
	}

	div#register_header {
		margin-top : 10px;
		padding-bottom : 20px;
		width : 100%;
		height : 10%;
		display : flex;
		align-items : center;
		border-bottom: 1px solid #eee;
	}
	
	div#prod_img_box {
		width : 10%;
		height : 100%;
	}
	
	div#prod_info_box {
		display : flex;
		flex-direction : column;
	}
	
	div#feedback_title_box {
		width : 100%;
		margin : 30px 20px;
		display : flex;
		flex-direction : column;
		justify-content : center;
		align-items : flex-start;
	}
	
	span.feedback_title {
		font-size : 17pt;
		font-weight : bold;
	}
	
	div#feedback_btn_box {
		margin : 0 20px;
		width : 80%;
		display : flex;
		justify-content : space-between;
		align-itmes : center;
		cursor : pointer;
	}
	
	div.feedback_btn {
		width : 80px;
		display : flex;
		flex-direction : column;
		justify-content : center;
		align-items : center;
	}
	
	img.feedback_img {
		filter: invert(100%) sepia(70%) saturate(242%) hue-rotate(217deg) brightness(118%) contrast(87%);
		transition : 0.5s ease;
	}
	
	span.feedback_type {
		width : 100px;
		text-align : center;
		font-size : 15pt;
		color : gray;
		transition : 0.5s ease;
		font-weight : bold;
	}
	
	button#review_register_btn {
		border : none;
		margin : 0 10px;
		border-radius : 15px;
		width : 100%;
		padding : 15px;
		background-color : #eee;
		color : white;
		font-size : 15pt;
		margin-bottom : 10px;
	}
	
	button#review_register_btn:hover {
		transition : 0.5s ease;
		background-color : black;
	}
	
	div.survey_box {
		margin : 20px 0;
		width : 100%;
	}
	
	div.survey {
		margin : 15px 0 10px 10px;
		display : flex;
		align-items : center;
		cursor : pointer;
	}
	
	span.survey_span {
		margin-left : 10px;
	}
	
	div.survey_checkbox {
		width : 30px;
		height : 30px;
	}
	
	div.survey_checkbox img {
		filter: invert(100%) sepia(70%) saturate(242%) hue-rotate(217deg) brightness(118%) contrast(87%);
	}
	
	div.add_blacklist_box {
		display : flex;
		flex-direction : column;
		justify-content : center;
	}
	
	span.survey_sub_span {
		margin-left : 10px;
		font-size : 10pt;
		color : gray;
	}
	
	div#review_textarea_box {
		margin-bottom : 20px;
		width : 100%;
		display : flex;
		flex-direction : column;
	}
	
	textarea {
		border-radius : 15px;
		border : solid 1px #eee;
		width : 100%;
		height : 150px;
	}
	
	span.review_span {
		margin-left : 9px;
		font-size : 13pt;
	}
</style>

<div id="review_register_container">
	<div id="review_main">
		<%-- 거래에 대한 상품 정보 --%>
		<div id="register_header">
			<div id="prod_img_box">
				<img src="${ctxPath}/images/sample.png"/>
			</div>
			<div id="prod_info_box">
				<span id="title">망고 사진 팔아요</span>
				<span id="writer">후드티</span>
			</div>
		</div>
		
		<%-- 후기 선택지 제목  --%>
		<div id="feedback_title_box">
			<span class="feedback_title">
				후드티님과의
			</span>
			<span class="feedback_title">
				거래는 어떠셨나요?
			</span>
		</div>
		
		<%-- 후기 선택지  --%>
		<div id="feedback_btn_box">
			<div class="feedback_btn">
				<img class="feedback_img" src="${ctxPath}/images/icon/laugh.svg"/>
				<span class="feedback_type">최고에요!</span>
			</div>
			<div class="feedback_btn">
				<img class="feedback_img" src="${ctxPath}/images/icon/smile.svg"/>
				<span class="feedback_type">좋아요</span>
			</div>
			<div class="feedback_btn">
				<img class="feedback_img" src="${ctxPath}/images/icon/frown.svg"/>		
				<span class="feedback_type">아쉬워요</span>
			</div>
		</div>
		
		<div class="survey_box" id="survey_best_box">
			<c:forEach var="survey" items="${survey_vo_list}">
				<c:if test="${survey.pk_survey_no < 5}">
					<div class="survey" data-pk_survey_no = "${survey.pk_survey_no}">
						<div class="survey_checkbox">
							<img src="${ctxPath}/images/icon/check.svg"/>
						</div>
						<span class="survey_span">${survey.survey_content}</span>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
		<div class="survey_box" id="survey_good_box">
			<c:forEach var="survey" items="${survey_vo_list}">
				<c:if test="${survey.pk_survey_no < 5}">
					<div class="survey" data-pk_survey_no = "${survey.pk_survey_no}">
						<div class="survey_checkbox">
							<img src="${ctxPath}/images/icon/check.svg"/>
						</div>
						<span class="survey_span">${survey.survey_content}</span>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
		<div class="survey_box" id="survey_bad_box">
		
			<c:forEach var="survey" items="${survey_vo_list}">
				<c:if test="${survey.pk_survey_no > 4}">
					<div class="survey" data-pk_survey_no = "${survey.pk_survey_no}">
						<div class="survey_checkbox">
							<img src="${ctxPath}/images/icon/check.svg"/>
						</div>
						<span class="survey_span">${survey.survey_content}</span>
					</div>
				</c:if>
			</c:forEach>
			
			<hr>
			
			<div class="survey add_blacklist_checkbox">
				<div class="survey_checkbox">
					<img src="${ctxPath}/images/icon/check.svg"/>
				</div>
				<div class="add_blacklist_box">
					<span class="survey_span">다음에는 이 분을 만나고 싶지 않아요.</span>
					<span class="survey_sub_span">해당 항목 선택 시, 거래가 차단됩니다.</span>
				</div>
			</div>
		</div>
		
		<div id="review_textarea_box">
			<span class="review_span">자세한 후기를 남겨주세요</span>
			<textarea>
			</textarea>
		</div>
	</div>
	

	
	<button id="review_register_btn" onclick="goReviewRegister()">후기 작성하기</button>
	
</div>

<script>
	$(document).ready(function(){
		
		$("div.survey_box").hide();
		$("div#review_textarea_box").hide();
		
		$("div.feedback_btn").hover(function(){
			$(this).find("img.feedback_img").css({
				"filter" : "invert(56%) sepia(37%) saturate(967%) hue-rotate(91deg) brightness(101%) contrast(98%)"
			});
			$(this).find("span.feedback_type").css({
				"color" : "black"
			});
		}, function(){
			if(!$(this).hasClass("clicked")) {
				$(this).find("img.feedback_img").css({
					"filter" : ""
				});
				$(this).find("span.feedback_type").css({
					"color" : ""
				});
			}
		});
		
		$("div.feedback_btn").click(function(){
			
			if(!$(this).hasClass("clicked")) {
				$("div.survey").removeClass("checked");
				
				$("div.survey_checkbox img").prop("src", "${ctxPath}/images/icon/check.svg");
				
				$("div.survey_checkbox img").css({
					"filter" : ""
				});
				
				$("#review_textarea_box textarea").val("");
			}
					
			$("div.feedback_btn").removeClass("clicked");
			$(this).addClass("clicked");
			
			$("img.feedback_img").css({
				"filter" : ""
			});
			
			$("span.feedback_type").css({
				"color" : ""
			});
			
			$(this).find("img.feedback_img").css({
				"filter" : "invert(56%) sepia(37%) saturate(967%) hue-rotate(91deg) brightness(101%) contrast(98%)"
			});
			
			$(this).find("span.feedback_type").css({
				"color" : "black"
			});
			
			
			// 설문지 보이기
			const index = $("div.feedback_btn").index(this);
			
			switch(index) {
				case 0 :  
					$("div.survey_box").hide();
					$("div#survey_best_box").show();
					break;
				case 1 :
					$("div.survey_box").hide();
					$("div#survey_good_box").show();
					break;
				case 2 :
					$("div.survey_box").hide();
					$("div#survey_bad_box").show();
					break;
			}
			
			
			if($("div.survey").hasClass("checked")) {
				$("div#review_textarea_box").show();
			}
			else {
				$("div#review_textarea_box").hide();
			}
		});
		
		$("div.survey").click(function() {
			
			if($(this).hasClass("checked")){
				$(this).find("div.survey_checkbox img").prop("src", "${ctxPath}/images/icon/check.svg");
				
				$(this).find("div.survey_checkbox img").css({
					"filter" : ""
				});
				
				$(this).removeClass("checked");
			}
			else {
				
				if($(this).hasClass("add_blacklist_checkbox")) {
					
					Swal.fire({
						  title: "후드티님이 차단됩니다.",
						  text: "채팅 불가, 사용자 차단, 단골/찜 해제, 알림 미수신",
						  confirmButtonText: "확인",
						  showDenyButton: true,
						  denyButtonText:"취소",
						  icon: "warning"
						}).then((result) => {
						    if (result.isConfirmed) {
						    	addBlacklist();
						    }
					  });
	
				}
				else {
					$(this).find("div.survey_checkbox img").prop("src", "${ctxPath}/images/icon/checked.svg");
					
					$(this).find("div.survey_checkbox img").css({
						"filter" : "invert(56%) sepia(37%) saturate(967%) hue-rotate(91deg) brightness(101%) contrast(98%)"
					});
					
					$(this).addClass("checked");
				}
				
			}
			
			if($("div.survey").hasClass("checked")) {
				$("div#review_textarea_box").show();
			}
			else {
				$("div#review_textarea_box").hide();
			}
			
		});
		
	});
	
	function goReviewRegister() {
		
		let arr_pk_survey_resp_no = [];
		
		$("div.survey").each(function(index, item){
			if($(item).hasClass("checked")){
				arr_pk_survey_resp_no.push($(item).data("pk_survey_no"));
			}
		});
		
		$.ajax({
			url : "${ctxPath}/review/register",
			type : "post",
			data : {
				"arr_pk_survey_resp_no" : arr_pk_survey_resp_no.join(","),
				"pk_trade_no" : "1",
				"review_content" : $("div#review_textarea_box textarea").val(),
			},
			success : function(json) {
				console.log(json);
				
				if(json.review_success > 0) {
					showAlert("success", "후기 등록을 성공했습니다.")
				}
				else {			
					showAlert("error", "후기 등록을 실패했습니다. 다시 시도해주세요");
				}
			},
			 error: function(request, status, error){
				 console.log(request.responseText);
				 
				 let response = request.responseText;
				 let message = response.substr(0, 4) == "msg/" ? response.substr(4) : "";
				 
			     showAlert("error", message);	 
				 
			}
		});
	}
	
	function addBlacklist() {
    	$.ajax({
			url : "${ctxPath}/review/add_blacklist",
			type : "post",
			data : {
				"pk_target_member_no" : "4",
			},
			success : function(json) {
				console.log(json);
				
				const blacklist_success = json.blacklist_success;
				
				if(blacklist_success != 1) {
					showAlert("error", "사용자 차단을 실패했습니다. 마이페이지에서 다시 시도해주세요");
				}
				else {
					showAlert("success", "사용자를 차단하였습니다.");
					
					$("div.add_blacklist_checkbox").find("div.survey_checkbox img").prop("src", "${ctxPath}/images/icon/checked.svg");
					
					$("div.add_blacklist_checkbox").find("div.survey_checkbox img").css({
						"filter" : "invert(56%) sepia(37%) saturate(967%) hue-rotate(91deg) brightness(101%) contrast(98%)"
					});
					
					$("div.add_blacklist_checkbox").addClass("checked");
				}
			},
			 error: function(request, status, error){
				 console.log(request.responseText);
				 
				 let response = request.responseText;
				 let message = response.substr(0, 4) == "msg/" ? response.substr(4) : "";
				 
			     showAlert("error", message);	 
				 
			}
		});
	}
	
</script>