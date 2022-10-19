<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="resources/css/mypage.css?45">
<script type="text/javascript" src="resources/js/mypage.js?4443"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
        <div class="nav">
            <div class="banner">
                <span>마이페이지</span>
            </div>
        </div>
		        <div id="css_tabs">
            <input id="tab1" type="radio" name="tab" />
            <input id="tab2" type="radio" name="tab" checked="checked"/>
            <label for="tab1">개인정보수정</label>
            <label for="tab2">메모장</label>
            <div class="tab1_content">
                
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
                                        <input type="text" id="user_id" name="user_id" class="input" value="${user_id}" readonly="readonly">
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
                                        <input class="member_pw" id="user_pass" name="user_pass" type="password" placeholder="비밀번호를 입력해주세요."/>
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
                                    <input class="member_pw_check" name="re_user_pass" id="re_user_pass" type="password" placeholder="비밀번호를 다시 입력해주세요."/> <br>
                                    <span id="member_pw_check"></span>
                                </div>
                            </div>
                            <div class="infomation_item">
                                <div class="name_item">
                                    <span>*</span>
                                    <p>이름</p>
                                </div>
                                <div class="value_item">
                                    <input type="text" name="user_name" placeholder="이름을 입력해주세요." id="user_name" value="${memberVo.user_name}" readonly="readonly">
                                </div>
                            </div>
                            <div class="infomation_item">
                                <div class="name_item">
                                    <span>*</span>
                                    <p>이메일</p>
                                </div>
                                <div class="value_item form">
                                    <input type="text" name="user_mail_id" class="mail_item_1" id="user_mail_id" placeholder="이메일을 입력" value="${mail_id}">@
                                        <input type="text" name="user_mail_domain" maxlength="50" class="mail_item_2" id="user_mail_domain" placeholder="직접입력" value="${mail_domain}">
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
                                    <input type="text" name="user_phone" placeholder="연락처를 입력해주세요" class="input" id="user_phone" value="${memberVo.user_phone}">
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
            <div class="tab2_content">
				<section id="memo">
					<h4>&lsaquo;&nbsp;&nbsp;<span id="this_month"></span>&nbsp;&nbsp;&rsaquo;</h4>
					<div class="memo_table"> <!-- 메모장 테이블 -->
						<div class="memo_add_box"><input type="button" id="add_memo"></div>
						<c:forEach var="board" items="${boardList }">
							<div class="memo_box">
								<input type="button" id="memo_delete" onClick="location.href='Delmemo.do?title=${board.title}&date=${board.date }&time=${board.time }&content=${board.content }&writer=${board.writer }'">
								<h3>${board.title }</h3>
								<p>일정 : ${board.date }</p>
								<hr>
								<p>시간 : ${board.time }</p>
								<hr>
								<p>내용 : ${board.content }</p>
							</div>
						</c:forEach>
					</div>
					<form method="post" action="Addmemo.do">
						<div id="add_memo_form">
							<div class="modal_layer"></div>
							<div class="memo_form">
								<input type="button" id="close">
								<h1>Add</h1>
								<hr>
								<div class="memo_form_detail">
									<p><span>제목</span>  <input type="text" name="title"></p>
									<p><span>시간</span> <input type="time" name="time"></p>
									<p><span>날짜</span> <input type="date" name="date"></p>
									<p><span id="arg">메모</span> <textarea rows="10" cols="54" name="content"></textarea></p>
									<input type="text" name="writer" value="${user_id }" hidden>
								</div>
								<hr>
								<div class="member_submit">
	                                <input type="submit" value="저장" id="member_submit_btn">
	                                <input type="reset" value="취소"  id="close1" class="reset">
	                            </div>
							</div>
						</div>
					</form>
					<!-- 페이징 기능 -->
					
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo">
							<!-- 이전 -->
							<c:if test="${makerpaging.prev}">
								<li><a href="MyPage?page=${makerpaging.cri.page-1 }">&lsaquo;</a></li>
							</c:if>
							<!-- 번호 -->
							<c:forEach var="num" begin="${makerpaging.startPage }" end="${makerpaging.endPage }">
								<li><a href="MyPage?page=${num }">${num }</a></li>
							</c:forEach>
							
							<!-- 다음 -->
							<c:if test="${makerpaging.next}">
								<li><a href="MyPage?page=${makerpaging.endPage+1 }">&rsaquo;</a></li>
							</c:if>
						</ul>
					</div>
					
				</section>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
    </div>
    <script type="text/javascript" src="resources/js/memo.js?343"></script>
    
</body>
</html>