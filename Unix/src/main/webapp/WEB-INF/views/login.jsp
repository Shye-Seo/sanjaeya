<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="resources/css/login.css">
<script type="text/javascript" src="resources/js/login.js"></script>
<script>
	$(function() {
		
	});
</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
        <div class="nav">
            <div class="banner"> 
                <span>로그인</span>
            </div>
        </div>
        <div class="content">
            <div id="log">로그인</div>
            <div id="logwrap">
            	<form action="LoginProc.do" method="post" id="loginform" name="loginform">
	                <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요.">
	                <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요.">
	                <div class="checkwrap">
	                    <div class="idcheck">
	                        <input type="checkbox" id="chk_id">
	                        <label for="chk_id"><span>아이디 저장</span></label>
	                    </div>
	                    <div class="idfind">
	                        <span><a href="#">아이디/비밀번호 찾기</a></span>
	                    </div>
	                </div>
	                <input type="button" value="로그인" class="loginbtn" onclick="loginform_check()">
	                <c:if test="${msg == 'failure'}">
		                <script>
		                	alert("아이디와 비밀번호가 일치하지 않습니다.");
		                </script>
	                </c:if>
	                <h2>아직 회원이 아니세요?</h2>
	                <input type="button" value="지금 바로 회원가입하기" class="joinbtn" onclick="location.href='MemInsert.do'">
                </form>
            </div>
        </div>
		<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>