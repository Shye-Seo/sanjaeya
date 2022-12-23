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
		@charset "UTF-8";
		@import
			url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

		*{margin: 0; padding: 0;}
		
		body{
			font-family: 'Pretendard';
			color: #333333;
		}
		.wrap{
			width: 100%; height: 100vh;
			position: relative;
		}
		.error_wrap{
			text-align: center;	
			width: 100%; height: 300px;
			position: absolute;
			top: calc(50% - 150px);
			display: flex;
    		flex-direction: column;
    		gap: 10px;
		}
		.hr{
			width: 100px; height: 1px;
			background-color: #707070;
			margin: 0 auto;
		}
		#timer{
			font-weight: 600;
		}
		.error_wrap p:nth-child(4){
			margin-top: 10px;
		}
	</style>
</head>
<body>
	<div class="wrap">
		<div class="error_wrap">
			<div class="hr"></div>
			<h1>404</h1>
			<div class="hr"></div>
			<p>찾을 수 없는 페이지 입니다.</p>
			<p><span id="timer">3</span>초 후 메인페이지로 돌아갑니다.</p>
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
	</div>
	
</body>
</html>