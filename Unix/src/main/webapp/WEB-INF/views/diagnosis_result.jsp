<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diagnosis_result</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="resources/css/diagnosis_result.css">
<%@ include file="/WEB-INF/views/common.jsp"%>
</head>
<script type="text/javascript">
	var categoryNum = '${categoryNum}';

	$(function() {
		var result = '${ResultPoint}';

		console.log(result);
		if (0 <= result && result <= 29) {
			jQuery('.result_img1').css("display", "block");

		}
		if (30 <= result && result <= 44) {
			jQuery('.result_img2').css("display", "block");

		}
		if (45 <= result && result <= 59) {
			jQuery('.result_img3').css("display", "block");

		}
		if (60 <= result && result <= 74) {
			jQuery('.result_img4').css("display", "block");

		}
		if (75 <= result) {
			jQuery('.result_img5').css("display", "block");

		}

	});
	function recheck() {
		location.href = '/Checklist_' + categoryNum;
	};
</script>

<body>
	<%
	String user_id = (String) session.getAttribute("user_id");
	String test_userid = (String) session.getAttribute("test_userid");
	%>
	<div id="headers"><jsp:include
			page="/WEB-INF/views/header/header.jsp"></jsp:include></div>
	<div id="wrap">

		<div class="nav">
			<div class="banner">
				<span>산재 자가진단</span>
			</div>
		</div>
		<section>
			<h4 class="a">&lt;자가진단 결과&gt;</h4>
			<div class="category">
				<ul>
					<li><p>재해자 정보 입력</p></li>
					<li><p>산재 자가진단 시작</p></li>
					<li class="active"><p>산재 자가진단 결과</p></li>
				</ul>
			</div>
			<div class="wrap">
				<div class="result_box">
					<div class="re_img">
						<div class="result_img1" id="result_img1"></div>
						<div class="result_img2" id="result_img2"></div>
						<div class="result_img3" id="result_img3"></div>
						<div class="result_img4" id="result_img4"></div>
						<div class="result_img5" id="result_img5"></div>
					</div>
					<div class="re_text">
						<c:choose>
							<c:when test="${sessionScope.user_id eq null}">
								<p class="result_txt1">
								<h3>${test_userid}님의 산재 자가진단 결과</h3>
								</p>
							</c:when>
							<c:otherwise>
								<p class="result_txt1">
								<h3>
									<%=user_id%>님의 산재 자가진단 결과
								</h3>
								</p>
							</c:otherwise>
						</c:choose>

						<h1>
						<span id="resultspan">${Result}</span>
						</h1>
						<div class="re_comment">
							<c:choose>
								<c:when test="${sessionScope.user_id eq null}">
									<p>${test_userid}님의 산재를 받을 수 있는 확률은 ${Result}입니다.</p>
									<p>노무사 상담 연결로 빠르게 산재 보험을 받아봐요.</p>
								</c:when>
								<c:otherwise>
									<p>
										<%=user_id%>님의 산재를 받을 수 있는 확률은 ${Result}입니다.
									</p>
									<p>노무사 상담 연결로 빠르게 산재 보험을 받아봐요.</p>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="next">
							
							<p id="line1">서비스 이용 만족도 조사</p>
							<br>
							<p id="line2">만족도 조사까지 진행하셔야만 <br>설문조사 리워드 지급이 가능합니다.</p>
							<input type="button" value="만족도 조사 바로가기" id="home"
								onclick="window.open('https://forms.gle/ArmqyTEdxSJsb7A79');">
						</div>
					</div>
				</div>

				<div class="result_box2">
					<div class="re_img">
						<div class="result_img1" id="result_img1"></div>
						<div class="result_img2" id="result_img2"></div>
						<div class="result_img3" id="result_img3"></div>
						<div class="result_img4" id="result_img4"></div>
						<div class="result_img5" id="result_img5"></div>
					</div>
					<div class="re_text">
						<c:choose>
							<c:when test="${sessionScope.user_id eq null}">
								<p class="result_txt1">
								<h3>${test_userid}님의 산재 자가진단 결과</h3>
								</p>
							</c:when>
							<c:otherwise>
								<p class="result_txt1">
								<h3>
									<%=user_id%>님의 산재 자가진단 결과
								</h3>
								</p>
							</c:otherwise>
						</c:choose>

						<h1>
							<span id="resultspan">${Result}</span>
						</h1>
						<div class="re_comment">
							<c:choose>
								<c:when test="${sessionScope.user_id eq null}">
									<p>${test_userid}님의 산재를 받을 수 있는 확률은 ${Result}입니다.</p>
									<p>노무사 상담 연결로 빠르게 산재 보험을 받아봐요.</p>
								</c:when>
								<c:otherwise>
									<p>
										<%=user_id%>님의 산재를 받을 수 있는 확률은 ${Result}입니다.
									</p>
									<p>노무사 상담 연결로 빠르게 산재 보험을 받아봐요.</p>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="next">
							
						<p id="line1">서비스 이용 만족도 조사</p>
							<br>
							<p id="line2">만족도 조사까지 진행하셔야만 <br>설문조사 리워드 지급이 가능합니다.</p>
							<input type="button" value="만족도 조사 바로가기" id="home"
								onclick="window.open('https://forms.gle/ArmqyTEdxSJsb7A79');">
						</div>
					</div>
				</div>


			</div>
			<hr id="arg" />


		</section>
		<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>