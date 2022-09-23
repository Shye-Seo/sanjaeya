<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/css/join.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="resources/js/join.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
    <div class="nav">
         <div class="banner"> 
                <span>회원가입</span>
         </div>
    </div>

    <section id="join">
        <div class="text_area">
			<div class="item_1">
				<p>기본정보</p>
			</div>
			<div class="item_2">
				<span>*</span>
				<p>필수입력사항</p>
			</div>
		</div>

        <div id="member">
			<form id="joinform" name="joinform" method="post" action="MemInsertProc">
				<div class="infomation_item">
					<div class="name_item">
						<span>*</span>
						<p>아이디</p>
					</div>
					<div class="value_item">
                        <div class="id_wrap">
                            <input type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요." class="input">
                            <button type="button" class="idchk_button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
                            <p class="point successIdChk">(영문 대소문자/숫자,4~16글자)</p>
                            <input type="hidden" id="idDoubleChk"/>
                        </div>
					</div>
				</div>
				<div class="infomation_item">
					<div class="name_item">
						<span>*</span>
						<p>비밀번호</p>
					</div>
					<div class="value_item">
                        <div class="pw_wrap">
                            <input class="member_pw" name="user_pass" id="user_pass" type="password" placeholder="비밀번호를 입력해주세요."/>
                            <p>(영문 대소문자/숫자/특수문자 중 2가지 이상조합, 10~16자)</p>
                            <span id="member_pw"></span>
                        </div>
					</div>
				</div>

				<div class="infomation_item">
					<div class="name_item">
						<span>*</span>
						<p>비밀번호 확인</p>
					</div>
					<div class="value_item">
						<div class="pw_wrap">
							<input class="member_pw_check" name="re_user_pass" id="re_user_pass" type="password" placeholder="비밀번호를 다시 입력해주세요." autocomplete="off"/> <br>
							<p class="point successPwChk"></p>
							<input type="hidden" id="pwDoubleChk"/>
						</div>
					</div>
				</div>
				<div class="infomation_item">
					<div class="name_item">
						<span>*</span>
						<p>이름</p>
					</div>
					<div class="value_item">
						<div class="pw_wrap">
							<input type="text" class="member_name" name="user_name" placeholder="이름을 입력해주세요." id="user_name">
							<p class="point successNameChk"></p>
							<input type="hidden" id="nameDoubleChk"/>
						</div>
					</div>
				</div>

				<div class="infomation_item">
					<div class="name_item">
                        <span>*</span>
						<p>이메일</p>
					</div>
					<div class="value_item form">
						<div class="mail_wrap">
							<input type="text" name="user_mail_id" class="mail_item_1" id="user_mail_id" placeholder="이메일을 입력" required>@
	                        <input type="text" name="user_mail_domain" class="mail_item_2" id="user_mail_domain" maxlength="50"  placeholder="직접입력" required>
							<select name="sel_email" id="sel_email" class="mail_item_3" onclick="setEmailDomain(this.value);return false;">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="kakao.com">kakao.com</option>
								<option value="nate.com">nate.com</option>
							</select>
<!-- 							<input type="button" value="인증하기" class="emailChk_button" id="emailChk">
							<input type="text" name="user_mail_number" id="user_mail_number" placeholder="인증번호를 입력해주세요" disabled required>
							<input type="button" value="인증완료" class="emailChk_button" id="emailChk2">
						    <p class="point successMailChk"></p>
							<input type="hidden" id="mailDoubleChk"> -->
						</div>
				
					</div>
				</div>
				<div class="infomation_item" style="border-bottom: solid; border-width: 1px; border-color: #707070;">
					<div class="name_item">
						<span>*</span>
						<p>연락처</p>
					</div>

					<div class="value_item">
						<div class="id_wrap">
							<input type="text" name="user_phone" placeholder="연락처를 입력해주세요" class="input" id="user_phone" maxlength="11" required>
							<input type="button" value="인증하기" class="certification_button" id="phoneChk">
							<input type="text" name="user_phone2" placeholder="인증번호를 입력해주세요" id="user_phone2" disabled required/>
							<input type="button" value="인증완료" name="sms_send" id="sms_send">
							<p class="point successPhoneChk"></p>
							<input type="hidden" id="phoneDoubleChk"/>
						</div>
					</div>
				</div>



                <!-- 이용약관 -->
                <div class="agreement">
					<div class="agree_title_area">
						<span>전체동의</span>
						<div class="check_area check_allwrap">
							<input type="checkbox" id="all_check_item">
							<label for="all_check_item"><span>이용약관/개인정보이용에 모두 동의합니다.</span></label>
						</div>
					</div>
						
					<div class="agreement_area">
						<span class="title_span">[필수] 이용약관 동의</span>
						<textarea rows="" cols="">
                            이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의
                            이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의
                            이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의
                            이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의
                            이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의
                            이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의
                            이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의
                            이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의 이용약관 동의
						</textarea>
						<div class="check_area check_subwrap">	
							<input type="checkbox" id="check_item_1" class="normal">
                            <label for="check_item_1">이용약관에 동의하십니까?</label>
						</div>
					</div>

                    <div class="agreement_area">
						<span class="title_span">[필수] 개인정보 수집 및 이용 동의</span>
						<textarea rows="" cols="">
                            개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의
                            개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의
                            개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의
                            개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의
                            개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의
                            개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의
                            개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의
                            개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의 개인정보 수집 및 이용 동의
						</textarea>
						<div class="check_area check_subwrap">		
							<input type="checkbox" id="check_item_2" class="normal">
                            <label for="check_item_2">이용약관에 동의하십니까?</label>
						</div>
					</div>
                </div>

                <div class="member_submit">
					<input type="button" value="등록" id="member_submit_btn" onclick="joinform_check()">
					<input type="reset" value="취소" class="reset">
				</div> 
            </form>
        </div>
    </section>

	<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	<script>
	// * 이용약관 체크박스(https://emessell.tistory.com/149) *
    // 체크박스 전체 선택
    $(".agreement").on("click","#all_check_item", function() { // class가 agreement인 요소에 클릭이벤트 핸들러 바인딩
        // this는 내가 클릭한 객체
        $(this).parents(".agreement").find('input').prop("checked", $(this).is(":checked"));
    });
    // 체크박스 개별 선택
    $(".agreement").on("click", ".normal", function() {
        var is_checked = true;

        $(".agreement .normal").each(function() {
            is_checked = is_checked && $(this).is(":checked");
        });

        $("#all_check_item").prop("checked",is_checked);
    });
	</script>
</body>
</html>