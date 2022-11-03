<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<form method="post" action="Updatememo.do">
		<div id="update_memo_form">
			<div class="modal_layer"></div>
			<div class="memo_form">
				<input type="button" id="close2">
				<h1>Update</h1>
				<hr>
				<div class="memo_form_detail">
					<p><span>제목</span>  <input type="text" name="title" value="${update_board.title }"></p>
					<p><span>시간</span> <input type="time" name="time" value="${update_board.time }"></p>
					<p><span>날짜</span> <input type="date" id="date_form" name="date" data-date="" data-date-format="YYYY년 MM월 DD일" value="${update_board.date }"></p>
					<p><span id="arg">메모</span> <textarea rows="10" cols="54" name="content">${fn:replace(update_board.content, '<br/>', newLineChar)}</textarea></p>
					<input type="text" name="writer" value="${user_id }" hidden>
					<input type="text" name="id" value="${update_board.id }" hidden>
				</div>
				<hr>
				<div class="member_submit">
                    <input type="submit" value="저장" id="member_submit_btn" onclick="">
                    <input type="reset" value="취소"  id="close3" class="reset">
                </div>
			</div>
		</div>
	</form>
</body>
</html>