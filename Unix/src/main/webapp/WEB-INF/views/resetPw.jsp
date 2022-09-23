<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="resources/js/join.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
var msg = "${msg}";

if (msg != "") {
	alert(msg);
}
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "findPw.do",
				type : "POST",
				data : {
					user_id : $("#user_id").val(),
					user_mail : $("#user_mail").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
<style type="text/css">
.mybtn{
  width:150px;
  height:40px;
  padding:0;
  display:inline; 
  border-radius: 4px; 
  background: #212529;
  color: #fff;
  margin-top: 20px;
  border: solid 2px #212529; 
  transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover .mybtn:focus {
  background: white;
  color: #212529;
  text-decoration: none;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>


<div class="jumbotron">
	  <h2>아이디는: ${member.user_id} 입니다</h2>
	  <h2>아이디는: ${id} 입니다</h2>
	  <button type="button" onclick="location.href='/'">메인페이지</button>
	</div>
	<div class="nav">
			<div class="banner">
				<span>비밀번호 재설정</span>
			</div>
		</div>
		   <form class="user" action="findPw" method="POST">
  				<div class="infomation_item">
					<div class="value_item form">
						<div class="id_wrap">
						    <input type="text" name="user_id" placeholder="아이디를 입력해주세요" class="input" id="user_id" maxlength="15" required>
							<input type="text" name="user_phone" placeholder="연락처를 입력해주세요" class="input" id="user_phone" maxlength="11" required>
							<input type="button" value="인증하기" class="certification_button" id="phoneChk">
							<input type="text" name="user_phone2" placeholder="인증번호를 입력해주세요" id="user_phone2" disabled required/>
							<input type="button" value="인증완료" name="sms_send" id="sms_send">
							<p class="point successPhoneChk"></p>
							<input type="hidden" id="phoneDoubleChk"/>
						</div>
			
					</div>
				</div>
		       <button type="submit">아이디 찾기</button>
		   </form>
	
<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
</body>
</html>