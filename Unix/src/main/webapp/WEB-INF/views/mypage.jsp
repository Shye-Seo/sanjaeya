<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>마이페이지</title>
<link rel="stylesheet" href="resources/css/mypage.css?1446">
<script type="text/javascript" src="resources/js/mypage.js?43"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div id="wrap">
			<div id="headers"><jsp:include
				page="/WEB-INF/views/header/header.jsp"></jsp:include></div>
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
                                        <input class="member_pw" id="user_pass" name="user_pass" type="password" value="${user_pass}"placeholder="비밀번호를 입력해주세요."/>
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
                                    <input type="text" name="user_name" placeholder="이름을 입력해주세요." id="user_name" value="${user_name}">
                                </div>
                            </div>
                            <div class="infomation_item">
                                <div class="name_item">
                                    <span>*</span>
                                    <p>이메일</p>
                                </div>
                                <div class="value_item form">
                                    <input type="text" name="user_mail_id" class="mail_item_1" id="user_mail_id" placeholder="이메일을 입력" value="${mail_1}"><span id="at">@</span>
                                        <input type="text" name="user_mail_domain" maxlength="50" class="mail_item_2" id="user_mail_domain" placeholder="직접입력" value="${mail_2}">
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
                                    <input type="text" name="user_phone" placeholder="연락처를 입력해주세요" class="input" id="user_phone" value="0${user_phone}">
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
					<!-- 연월 표시 -->
					<h4>
						<a href="MyPage?year=${year }&month=${month-1}" id="prev_month">&lsaquo;</a>
						&nbsp;&nbsp;
						<span>${year }년 ${month }월</span>
						&nbsp;&nbsp;
						<a href="MyPage?year=${year }&month=${month+1}" id="next_month">&rsaquo;</a>
					</h4>
					
					<!-- 메모장 테이블 -->
					<div class="memo_table"> 
						<div class="memo_add_box"><input type="button" id="add_memo"></div>
						<c:forEach var="board" items="${boardList }" varStatus="status">
							<div class="memo_box" id="${board.id }" onclick="">
								<input type="button" id="memo_delete${status.index }" onClick="location.href='Delmemo.do?id=${board.id }&title=${board.title}&date=${board.date }&time=${board.time }&content=${board.content }&writer=${board.writer }'">
								<h3>${board.title }</h3>
								<p>일정 : ${board.date }</p>
								<hr>
								<p>시간 : ${board.time }</p>
								<hr>
								<p>내용 : ${fn:replace( board.content, newLineChar, '<br/>')}</p>
							</div>
						</c:forEach>
					</div>
					
					<!-- 메모장 추가 -->
					<form method="post" action="Addmemo.do">
						<div id="add_memo_form">
							<div class="modal_layer"></div>
							<div class="memo_form">
								<input type="button" id="close">
								<h1>Add</h1>
								<hr>
								<div class="memo_form_detail">
									<p><span>제목</span>  <input type="text" name="title" value=""></p>
									<p><span>시간</span> <input type="time" id="time_form" name="time" data-time="" data-time-format="HH시 mm분" value=""></p>
									<p><span>날짜</span> <input type="date" id="date_form" name="date" data-date="" data-date-format="YYYY년 MM월 DD일" value=""></p>
									<p><span id="arg">메모</span> <textarea rows="10" cols="54" name="content"></textarea></p>
									<input type="text" name="writer" value="${user_id }" hidden>
								</div>
								<hr>
								<div class="member_submit">
	                                <input type="submit" value="저장" id="member_submit_btn" onclick="">
	                                <input type="reset" value="취소"  id="close1" class="reset">
	                            </div>
							</div> 
						</div>
					</form>
					
					<!-- 메모장 수정 -->
					<form method="post" action="Updatememo.do">
						<div id="update_memo_form">
							<div class="modal_layer"></div>
							<div class="memo_form">
								<input type="button" id="close2">
								<h1>Update</h1>
								<hr>
								<div class="memo_form_detail">
									<p><span>제목</span>  <input type="text" name="title" id="update_title" value=""></p>
									<p><span>시간</span> <input type="time" name="time" id="update_time" data-time="" data-time-format="HH시 mm분" value=""></p>
									<p><span>날짜</span> <input type="date" id="date_form2" name="date" data-date="" data-date-format="YYYY년 MM월 DD일" value=""></p>
									<p><span id="arg">메모</span> <textarea rows="10" cols="54" name="content" id="update_content"></textarea></p>
									<input type="text" name="writer" value="${user_id }" hidden>
									<input type="text" name="id" id="id" value="" hidden>
								</div>
								<hr>
								<div class="member_submit">
				                    <input type="submit" value="저장" id="member_submit_btn" onclick="">
				                    <input type="reset" value="취소"  id="close3" class="reset">
				                </div>
							</div>
						</div>
					</form>
					
					<!-- 페이징 기능 -->
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo">
							<!-- 이전 -->
							<c:choose>
								<c:when test="${makerpaging.startPage==1 }">
									<li><a href="MyPage?year=${year }&month=${month}&page=1">&lsaquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="MyPage?year=${year }&month=${month}&page=${makerpaging.startPage-1 }">&lsaquo;</a></li>
								</c:otherwise>
							</c:choose>
							
							
							<!-- 번호 -->
							<c:forEach var="num" begin="${makerpaging.startPage }" end="${makerpaging.endPage }">
								<li><a href="MyPage?year=${year }&month=${month}&page=${num }">${num }</a></li>
							</c:forEach>
							
							<!-- 다음 -->
							<c:choose>
								<c:when test="${makerpaging.endPage == makerpaging.tempEndPage}">
									<li><a href="MyPage?year=${year }&month=${month}&page=${makerpaging.endPage }">&rsaquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="MyPage?year=${year }&month=${month}&page=${makerpaging.endPage+1 }">&rsaquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					
				</section>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
    </div>
    <script type="text/javascript" src="resources/js/memo.js?565"></script>
    <script>
		
    </script>
</body>
</html>