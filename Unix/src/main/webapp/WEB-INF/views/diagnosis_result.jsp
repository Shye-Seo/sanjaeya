<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diagnosis_result</title>
<link rel="stylesheet" href="resources/css/diagnosis_result.css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include>
		
		<div class="nav">
			<div class="banner">
				<span>산재 자가진단</span>
			</div>
		</div>
		<section>
			<h4 class="a">&lt;소음청 난청&gt;</h4>
			<div class="category">
				<ul>
					<li><p>재해자 정보 입력</p></li>
					<li><p>산재 자가진단 시작</p></li>
					<li class="active"><p>산재 자가진단 결과</p></li>
				</ul>
			</div>
			<div class="result_box">
				<div class="result_img"></div>
				<p class="result_txt1">산재 자가진단 결과,</p>
				<h1>산재를 받을 수 있을 확률이 <span>매우 높음.</span></h1>
				
				<p>안녕하세요. ㅁㅁ님의 산재를 받을 수 있는 확률이 매우 높습니다.</p>
				<p>노무사 상담 연결로 빠르게 산재 보험을 받아봐요.</p>
			</div>
			<div class="next">
				<input type="button" value="노무사 상담 연결"  onclick="">
				<input type="button" value="홈으로" id="home" onclick="">
			</div>
			<hr id="arg" />
			<div class="example1">
				<div class="example2">
					<h1><a href="#">비슷한 사례 보러가기 &rsaquo;</a></h1>
				</div>
				<div class="example3">
					<div id="lst">
					이 자리는 세부내용 자리입니다. <span>2022-05-10</span>
					</div>
					<div id="lst">
					이 자리는 세부내용 자리입니다. <span>2022-05-10</span>
					</div>
					<div id="lst">
					이 자리는 세부내용 자리입니다. <span>2022-05-10</span>
					</div>
					<div id="lst">
					이 자리는 세부내용 자리입니다. <span>2022-05-10</span>
					</div>
					<div id="lst">
					이 자리는 세부내용 자리입니다. <span>2022-05-10</span>
					</div>
					<div id="lst">
					이 자리는 세부내용 자리입니다. <span>2022-05-10</span>
					</div>
				</div>
				
				
			</div>
		</section>
		<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>