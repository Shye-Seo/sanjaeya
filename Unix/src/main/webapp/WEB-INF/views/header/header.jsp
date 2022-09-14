<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Title</title>
<link rel="stylesheet" href="resources/css/header.css">
</head>
<body>
	<div class="header">
		<div id="header_left">
			<img src="resources/imgs/logo.svg"alt="logo"/>
		</div>
		<div id="header_right">
			<c:choose>
				<c:when test="${sessionScope.user_id == null}">
					<a href="Login">로그인</a>&nbsp;|&nbsp;<a href="MemInsert">회원가입</a>
				</c:when>
				<c:otherwise>
					<a href="Logout">로그아웃</a>&nbsp;|&nbsp;<a href="MyPage">마이페이지</a>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
</body>
</html>