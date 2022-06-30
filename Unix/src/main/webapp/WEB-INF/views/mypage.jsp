<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="resources/css/mypage.css">
<script type="text/javascript" src="resources/js/mypage.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
        <div class="nav">
            <div class="title">
                <span>마이페이지</span>
            </div>
        </div>
        <div class="content">
            <div class="tabmenu">
                <ul>
                    <li id="tab1" class="btnCon"> 
                      <input type="radio" checked name="tabmenu" id="tabmenu1">
                      <label for="tabmenu1" class="sub_tabmenu">개인정보수정</label>
                      <div class="tabCon" >
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
                                <form id="updateform" name="updateform" method="post" action="MyPage_Update.do">
                                    <div class="infomation_item">
										<div class="name_item">
											<span>*</span>
											<p>아이디</p>
										</div>
										<div class="value_item">
					                        <div class="id_wrap">
				                                <input type="text" id="id" name="id" class="input" value="${memberDto.id}" readonly="readonly">
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
                                                <input class="member_pw" id="pw" name="password" type="password" placeholder="비밀번호를 입력해주세요."/>
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
                                            <input class="member_pw_check" id="repw" type="password" placeholder="비밀번호를 다시 입력해주세요."/> <br>
                                            <span id="member_pw_check"></span>
                                        </div>
                                    </div>
                                    <div class="infomation_item">
                                        <div class="name_item">
                                            <span>*</span>
                                            <p>이름</p>
                                        </div>
                                        <div class="value_item">
                                            <input type="text" name="name" placeholder="이름을 입력해주세요." id="name" value="${memberDto.name}">
                                        </div>
                                    </div>
                                    <div class="infomation_item">
                                        <div class="name_item">
                                            <span>*</span>
                                            <p>이메일</p>
                                        </div>
                                        <div class="value_item form">
                                            <input type="text" name="email" class="mail_item_1" id="email_id" placeholder="이메일을 입력" value="${memberDto.email_id}">@
                                                <input type="text" name="email_add" maxlength="50" class="mail_item_2" id="email_domain" placeholder="직접입력" value="${memberDto.email_domain}">
                                            <select name="sel_email" class="mail_item_3" onclick="setEmailDomain(this.value);return false;">
                                                <option value="">직접입력</option>
                                                <option value="naver.com">naver.com</option>
                                                <option value="hanmail.net">hanmail.net</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="yahoo.com">yahoo.com</option>
                                                <option value="nate.com">nate.com</option>
                                            </select>
                                            <input type="hidden" id="email_check" value="">
                                        </div>
                                    </div>
                                    <div class="infomation_item" style="border-bottom:1px solid #707070;">
                                        <div class="name_item">
                                            <span>*</span>
                                            <p>연락처</p>
                                        </div>
                    
                                        <div class="value_item">
                                            <input type="text" name="tel" placeholder="연락처를 입력해주세요" class="input" id="tel" value="${memberDto.tel}">
                                            <input type="button" value="인증하기" class="certification_button">
                                            <input type="button" id="sms_certification" value="" name="sms_certification">
                                        </div>
                                    </div>

                                    <div class="member_submit">
                                        <input type="button" value="저장" id="member_submit_btn" onclick="joinform_check()">
                                        <input type="reset" value="취소" class="reset">
                                    </div>
                                </form>
                            </div>
                        </section>

                      </div>
                      
                    </li>
                    <li id="tab2" class="btnCon">
                      <input type="radio" name="tabmenu" id="tabmenu2">
                      <label for="tabmenu2" class="sub_tabmenu">메모장</label>
                      <div class="tabCon" >It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</div>
                      
                    </li>    
                  </ul>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>