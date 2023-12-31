<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>Diagnosis_start</title>
<link rel="stylesheet" href="resources/css/diagnosis_start.css">
<%@ include file="/WEB-INF/views/common.jsp"%>
</head>
<script>
	$(function() {
		var mem = document.getElementsByName("mem");
		

		$('#label').click(function() {
            const member = document.querySelector('.member');
			const nonmember = document.querySelector('.nonmember');
			member.style.outline = 'solid #326DFB'	
			nonmember.style.outline = 'none'

		});
		$('#label2').click(function() {
            const member = document.querySelector('.member');
			const nonmember = document.querySelector('.nonmember');
			nonmember.style.outline = 'solid #326DFB'
			member.style.outline = 'none'

		});

		$('#nextbtn').click(function() {
			var mem = $('input[id=mem]').is(":checked");
			var id = $("#user_id").val();
			
			if (mem == true) {
				if (id == "" || id == "null") {
					alert("회원으로 진행 하시려면 로그인이 필요합니다.")
				} else{
					location.href = "Checklist_1";
				}
			} else{
				location.href = "Checklist_1";
			}

		});
	});
</script>
<body>
	<%
	String user_id = (String) session.getAttribute("user_id");
	%>
	<div id="headers"><jsp:include
			page="/WEB-INF/views/header/header.jsp"></jsp:include></div>


	<div class="nav">
		<div class="banner">
			<span>산재 자가진단</span>
		</div>
	</div>
	<section>
		<h4 class="a">&lt;${category[0].category_name}&gt;</h4>

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
			<label for="mem" id="label">
				<div class="member">
					<input id="mem" type="radio" name="check" checked> <img
						src="resources/imgs/member.svg">
					<input type="hidden" id="user_id" value="<%=user_id%>">
					<h4>회원이세요?</h4>
					<p>회원님에게 제공하는 다양한 서비스를 사용해보세요.</p>
				</div>
			</label> 
			<label for="nonmem" id="label2">
				<div class="nonmember">
					<input id="nonmem" type="radio" name="check"> <img
						src="resources/imgs/nonmember.svg">
					<h4>비회원이세요?</h4>
					<p>지금 바로 회원가입을 해서 다양한 혜택을 누려보세요.</p>
				</div>
			</label>
		</div>
		<div class="next">
			<input type="button" value="이전" id="before"
				onclick="location.href='Home'"> <input type="button"
				value="다음" id="nextbtn" >
<!-- 				onclick="location.href='Checklist_1'" -->
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>

</body>
</html>