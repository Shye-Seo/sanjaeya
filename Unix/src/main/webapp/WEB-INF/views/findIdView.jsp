<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="resources/css/findIdView.css">
<script type="text/javascript" src="resources/js/join.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}
		
</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
		<div class="nav">
			<div class="banner">
				<span>아이디 찾기</span>
			</div>
		</div>
		   <form class="user" action="findId" method="POST">
  				<div class="infomation_item">
					<div class="value_item form">
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
		       <button type="submit">아이디 찾기</button>
		   </form>

		<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	</div>


   

                                    

</body>
</html>