<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>JSP Title</title>
<link rel="stylesheet" href="resources/css/header.css">
</head>
<body>
<%
String user_id = (String)session.getAttribute("user_id");
%>
	<div class="header1">
		<div id="header1_left">
			<a href="Home"><img src="resources/imgs/logo.svg"alt="logo" /></a>
		</div>
		<div id="header1_right">
		
			<c:choose>
				<c:when test="${sessionScope.user_id == null}">
					<a href="Login">로그인</a>&nbsp;|&nbsp;<a href="MemInsert">회원가입</a>
				</c:when>
				<c:otherwise>
				<div style="color:black"><%=user_id %> 님 환영합니다!</div>
					<a href="Logout">로그아웃</a>&nbsp;|&nbsp;<a href="MyPage">마이페이지</a>
				</c:otherwise>
			</c:choose>
			
		</div>

	</div>
<!-- 	///////////////////////////////// -->
	<div class="header">
        <!-- 최상위 div -->
        <div class="container">
            <!-- 햄버거 메뉴 -->
            <input type="checkbox" id="trigger">
            <label for="trigger">
                <!-- 햄버거 세줄 표현 -->
                <span></span>
                <span></span>
                <span></span>
            </label>
            <!-- 클릭시 나타날 사이드바 -->
            <div class="sidebar">
                <div class="sideLogin">
                <c:choose>
				<c:when test="${sessionScope.user_id == null}">
					<button onclick="location.href='Login'">로그인</button>
				</c:when>
				<c:otherwise>
<%-- 				<div style="color:black"><%=user_id %> 님 환영합니다!</div> --%>
					<button onclick="location.href='Logout'">로그인</button>
				</c:otherwise>
			</c:choose>
                    
                </div>
                <div class="sideLi">
                    <ul>
                        <a href="Home"><li>홈</li></a>
                        <li>진단하기</li>
                        <li>공지사항</li>
                        <li>자료실</li>
                        <a href="MyPage"><li>마이페이지</li></a>
                    </ul>
                </div>
            </div>
        </div>
        <div id="header_left">
            <a href="Home"><img src="resources/imgs/logo.svg"></a>
        </div>
        <div id="header_right">
            <img onclick="location.href='Login'" src="resources/imgs/user.svg">
        </div>
    </div>
</body>
</html>