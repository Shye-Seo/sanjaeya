<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
	<style>
		.wrap{
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="wrap">
		<h1>error</h1>
		불편을 드려 죄송합니다.<br>
		<span id="timer">3</span>초후 메인페이지로 돌아갑니다.
		<script>
			const timer = document.querySelector('#timer');
			let sec = 3;
			setInterval(function(){
				--sec;
				timer.innerHTML =  sec;
				if(sec==0){
					location.replace("${contextPath}/Home");
				}
			},1000);
		</script>
	</div>
	
</body>
</html>