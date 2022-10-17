<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diagnosis_start</title>
<link rel="stylesheet" href="resources/css/diagnosis_start.css">
<%@ include file ="/WEB-INF/views/common.jsp" %>
</head>
<script>
	$(function() {
		var pageNum = sessionStorage.getItem("pageNum");
		console.log(pageNum);
		$('#aaaaa').attr('src',pageNum); 
	});

</script>
<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
		
		<div class="nav">
			<div class="banner">
				<span>산재 자가진단</span>
			</div>
		</div>
		<section>
			<h4 class="a">&lt;${category[2].category_name}&gt;</h4>

			<div class="category">
				<ul>
					<li class="active"><p>재해자 정보 입력</p></li>
					<li><p>산재 자가진단 시작</p></li>
					<li><p>산재 자가진단 결과</p></li>
				</ul>
			</div>
			
			<div class="a">
				<h3>재해자 선택 유형</h3>
				<p id="chc">*비회원으로 진행하실 경우 진단내용 및 결과는 자동저장되지 않습니다.</p>
			</div>
			<br>
			<div class="type">
				<div class="member">
					<p class="memimg"></p>
					<h4>회원이세요?</h4>
					<p>회원님에게 제공하는 다양한 서비스를 사용해보세요.</p>
				</div>
				<div class="nonmember">
					<p class="nonmemimg"></p>
					<h4>비회원이세요?</h4>
					<p>지금 바로 회원가입을 해서 다양한 혜택을 누려보세요.</p>
				</div>
			</div>
			<div class="next">
				<input type="button" value="이전" id="before" onclick="location.href='Home'">
				<input type="button" value="다음" onclick="location.href='Checklist_3'">
			</div>
		</section>
		<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>