<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="resources/css/login.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
            	<form action="LoginProc" method="post" id="loginform" name="loginform">
	                <input type="text" name="user_id" id="user_id" placeholder="아이디를 입력해주세요.">
	                <input type="password" name="user_pass" id="user_pass" placeholder="비밀번호를 입력해주세요.">
	                <div class="checkwrap">
	                    <div class="idcheck">
	                        <input type="checkbox" id="chk_id">
	                        <label for="chk_id"><span>아이디 저장</span></label>
	                    </div>
	                    <div class="idfind">
	                        <span id="findIdBtn">아이디</span>
	                        <span>/</span>
	                        <span><a href="#">비밀번호 찾기</a></span>
	                    </div>
	                </div>
	                <input type="button" value="로그인" class="loginbtn" onclick="loginform_check()">
	                <c:if test="${msg == 'failure'}">
		                <script>
		                	alert("아이디와 비밀번호가 일치하지 않습니다.");
		                </script>
	                </c:if>
	                <span>아직 회원이 아니세요?</span>
	                <input type="button" value="지금 바로 회원가입하기" class="joinbtn" onclick="location.href='MemInsert.do'">
                </form>
            </div>
        </div>
		<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
    </div>
</body>
</html>