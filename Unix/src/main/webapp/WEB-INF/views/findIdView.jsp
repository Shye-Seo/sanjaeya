<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Title</title>
<link rel="stylesheet" href="resources/css/findIdView.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}
		
	    // 이메일 선택했을때 도메인 자동 입력되게
	    function setEmailDomain(domain) {
	        $("#user_mail_domain").val(domain);
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
						<div class="mail_wrap">
							<input type="text" name="user_mail_id" class="mail_item_1" id="user_mail_id" placeholder="이메일을 입력" required>@
			                      <input type="text" name="user_mail_domain" class="mail_item_2" id="user_mail_domain" maxlength="50"  placeholder="직접입력" required>
							<select name="sel_email" id="sel_email" class="mail_item_3" onclick="setEmailDomain(this.value);return false;">
								<option value="etc">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="kakao.com">kakao.com</option>
								<option value="nate.com">nate.com</option>
							</select>
						</div>
				
					</div>
				</div>
		       <button type="submit">아이디 찾기</button>
		   </form>

		<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	</div>


   

                                    

</body>
</html>