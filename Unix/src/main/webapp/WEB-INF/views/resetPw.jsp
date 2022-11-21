<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="resources/css/findID_PASS.css">
<%@ include file="/WEB-INF/views/common.jsp"%>
<script type="text/javascript" src="resources/js/join.js"></script>
<script>
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}

	$(document).ready(function() {
		$(".tab_title li").click(function() {
			var idx = $(this).index();
			$(".tab_title li").removeClass("on");
			$(".tab_title li").eq(idx).addClass("on");
			$(".tab_cont > form > div").hide();
			$(".tab_cont > form > div").eq(idx).show();
		})
	});
	function joinform_check() {
		if ($("#pwDoubleChk").val() == "true") {
			alert("비밀번호가 변경되었습니다.");
		} else {
			alert("비밀번호를 변경할 수 없습니다. 다시한번 확인해주십시오.");
			if ($("#pwDoubleChk").val() != "true") {
				$(".successPwChk").text("비밀번호가 일치하지 않습니다.");
				$(".successPwChk").css("color", "red");
			}
			return false;
		}
		 document.resetform.submit();
	}
</script>

<title>비밀번호 찾기</title>
</head>
<body>
	<div id="headers"><jsp:include
			page="/WEB-INF/views/header/header.jsp"></jsp:include></div>
	<header>
		<div class="nav">
			<div class="banner">
				<span>아이디/비밀번호 찾기</span>
			</div>
		</div>
	</header>
	<section class="tab_menu">
		<div class="tab">
			<div class="tab_container">
				<ul class="tab_title">
					<li class="on">아이디 찾기</li>
					<li>비밀번호 찾기</li>
				</ul>
				<div class="tab_cont">
					<form class="user" action="findId" method="POST">
						<div class="on" id="tab1">
							<p>휴대폰 번호</p>
							<input type="text" name="user_phone"
								placeholder="휴대전화 번호 입력('-' 제외)" class="input" id="user_phone"
								maxlength="11" required> <input type="button"
								value="인증번호 전송" class="certification_button" id="phoneChk">
							<p>인증번호</p>
							<input type="text" name="user_phone2" placeholder="인증번호를 입력해주세요"
								id="user_phone2" disabled required /> <input type="button"
								value="인증완료" name="sms_send" id="sms_send">
							<p class="point successPhoneChk"></p>
							<input type="hidden" id="phoneDoubleChk" />
							<button type="submit">아이디 찾기</button>
						</div>

					</form>
					<form class="user" action="PassReset" method="POST" name="resetform">
						<div>
							<div class="on" id="tab1">
								<p>새로운 비밀번호</p>
								<input class="member_pw" name="user_pass" id="user_pass"
									type="password" placeholder="비밀번호를 입력해주세요." maxlength="16"
									required /> <br>
								<span id="lengthchek">(영문 대소문자/숫자/특수문자 중 2가지 이상조합,
									10~16자)</span> <span id="member_pw"></span>
								<p>새로운 비밀번호 확인</p>
								<input class="member_pw_check" name="re_user_pass"
									id="re_user_pass" type="password"
									placeholder="새로운 비밀번호를 다시 입력해주세요." autocomplete="off"
									maxlength="16" required /> <br>
								<p class="point successPwChk"></p>
								<input type="hidden" id="pwDoubleChk" /> <input type="button"
									value="비밀번호 변경" id="member_submit_btn"
									onclick="passResetform_check()">
								<!-- 								<button type="submit">비밀번호 변경</button> -->
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
</body>
</html>