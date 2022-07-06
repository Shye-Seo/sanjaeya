<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/css/join.css">
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
			<form id="joinform" name="joinform" method="post" action="MemInsertProc.do">
				<div class="infomation_item">
					<div class="name_item">
						<span>*</span>
						<p>아이디</p>
					</div>
					<div class="value_item">
                        <div class="id_wrap">
                                <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요." class="input">
                                <button type="button" class="idchk_button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
                                <!-- <input type="button" value="중복확인" class="idchk_button" name="dbCheckId" id="idChk" onclick="fn_idChk()"> -->
                            <p>(영문소문자/숫자,4~16글자)</p>
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
                            <input class="member_pw" name="pw" id="pw" type="password" placeholder="비밀번호를 입력해주세요."/>
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
						<input class="member_pw_check" name="repw" id="repw" type="password" placeholder="비밀번호를 다시 입력해주세요."/> <br>
						<span id="member_pw_check"></span>
					</div>
				</div>
				<div class="infomation_item">
					<div class="name_item">
						<span>*</span>
						<p>이름</p>
					</div>
					<div class="value_item">
						<input type="text" class="member_name" name="name" placeholder="이름을 입력해주세요." id="name">
					</div>
				</div>

				<div class="infomation_item">
					<div class="name_item">
                        <span>*</span>
						<p>이메일</p>
					</div>
					<div class="value_item form">
						<input type="text" name="email_id" class="mail_item_1" id="email_id" placeholder="이메일을 입력">@
                        <input type="text" name="email_domain" class="mail_item_2" id="email_domain" maxlength="50"  placeholder="직접입력">
						<select name="sel_email" id="sel_email" class="mail_item_3" onclick="setEmailDomain(this.value);return false;">
							<option value="etc">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="kakao.com">kakao.com</option>
							<option value="nate.com">nate.com</option>
						</select>
						<input type="hidden" id="email_check" value="">
					</div>
				</div>
				<div class="infomation_item" style="border-bottom: solid; border-width: 1px; border-color: #707070;">
					<div class="name_item">
						<span>*</span>
						<p>연락처</p>
					</div>

					<div class="value_item">
						<input type="text" name="tel" placeholder="연락처를 입력해주세요" class="input" id="tel" maxlength="11">
						<input type="button" value="인증하기" class="certification_button">
						<input type="button" id="sms_certification" value="" name="sms_certification">
					</div>
				</div>



                <!-- 이용약관 -->
                <div class="agreement">
					<div class="agree_title_area">
						<span>전체동의</span>
						<div class="check_area">
							<input type="checkbox" id="all_check_item">
							<label for="all_check_item"><span>이용약관/개인정보이용/전시회정보수신에 모두 동의합니다.</span></label>
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
						<div class="check_area">	
							<input type="checkbox" id="check_item_1" class="normal">
                            <label for="check_item_1"><span>이용약관에 동의하십니까?</span></label>
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
						<div class="check_area">		
							<input type="checkbox" id="check_item_2" class="normal">
                            <label for="check_item_2"><span>이용약관에 동의하십니까?</span></label>
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
</body>
</html>