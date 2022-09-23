<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diagnosis</title>
<link rel="stylesheet" href="resources/css/diagnosis.css">
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
					<li class="active"><p>산재 자가진단 시작</p></li>
					<li><p>산재 자가진단 결과</p></li>
				</ul>
			</div>
			
			<div class="a">
				<h3>Q 01.직종을 선택해주세요.</h3>
				<p id="chc">*비회원으로 진행하실 경우 진단내용 및 결과는 자동저장되지 않습니다.</p>
			</div>
			<br>
			<div class="lst1">
				<div class="lst2">
					<input type="checkbox" id="1"><label for="1"> 교육&#183;법률&#183;사회복지&#183;경찰&#183;소방 및 공무</label>
					
				</div>
				<div class="lst2">
					<input type="checkbox" id="2"><label for="2"> 경영&#183;사무&#183;금융&#183;보험</label>
					
				</div>
				<div class="lst2">
					<input type="checkbox" id="3"><label for="3"> 농림어업 단순 종사자</label>
					
				</div>
				<div class="lst2">
					<input type="checkbox" id="4"><label for="4"> 건설구조 기능(철골&#183;철근&#183;석공&#183;목공&#183;조적 등)</label>
					
				</div>
				<div class="lst2">
					<input type="checkbox" id="5"><label for="5"> 설치&#183;정비&#183;생산-인쇄&#183;목재&#183;공예 및 제조 단순</label>
					 
				</div>
				<div class="lst2">
					<input type="checkbox" id="6"><label for="6"> 설치&#183;정비&#183;생산-화학&#183;환경&#183;섬유&#183;의복&#183;식품가공</label>
					
				</div>
			</div>
			<div class="next">
				<input type="button" value="이전" id="before" onclick="">
				<input type="button" value="다음" onclick="">
			</div>
		</section>
		<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>