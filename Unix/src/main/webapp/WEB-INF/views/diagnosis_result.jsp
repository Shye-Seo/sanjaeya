<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diagnosis_result</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="resources/css/diagnosis_result.css">
<%@ include file="/WEB-INF/views/common.jsp"%>
</head>
<script type="text/javascript">
	$(function() {
		var result = '${ResultPoint}';
		console.log(result);
		if (0 <= result && result <= 29) {
			jQuery('.result_img1').css("display", "block");
			console.log("1");
		}
		if (30 <= result && result <= 44) {
			jQuery('.result_img2').css("display", "block");
			console.log("2");
		}
		if (45 <= result && result <= 59) {
			jQuery('.result_img3').css("display", "block");
			console.log("3");
		}
		if (60 <= result && result <= 74) {
			jQuery('.result_img4').css("display", "block");
			console.log("4");
		}
		if (75 <= result) {
			jQuery('.result_img5').css("display", "block");
			console.log("5");
		}

	});
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
								<h3>산재 자가진단 결과, ${test_userid}님의</h3>
								</p>
							</c:when>
							<c:otherwise>
								<p class="result_txt1">
								<h3>
									산재 자가진단 결과,
									<%=user_id%>님의
								</h3>
								</p>
							</c:otherwise>
						</c:choose>

						<h1>
							산재를 받을 수 있을 확률이 <span>${Result}</span>
						</h1>
						<div class="re_comment">
							<c:choose>
								<c:when test="${sessionScope.user_id eq null}">
									<p>안녕하세요. ${test_userid}님의 산재를 받을 수 있는 확률이 ${Result}입니다.</p>
									<p>노무사 상담 연결로 빠르게 산재 보험을 받아봐요.</p>
								</c:when>
								<c:otherwise>
									<p>
										안녕하세요.
										<%=user_id%>님의 산재를 받을 수 있는 확률이 ${Result}입니다.
									</p>
									<p>노무사 상담 연결로 빠르게 산재 보험을 받아봐요.</p>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="point">
							<div class="plus">
								합산점수
								<p>
								<h4>${ResultPoint}점/80점</p>
								</h4>
							</div>
							<div class="percent">
								환산비율
								<p>
								<h4>${pointPer}%/100%</p>
								</h4>
							</div>
						</div>
						<div class="point_span">*합산점수 및 환산비율은 서비스 상용 기간부터 표시되지 않음.</div>
						<div class="next">
<!-- 							<input type="button" value="노무사 상담 연결" onclick=""> <input -->
<!-- 								type="button" value="홈으로" id="home" -->
<!-- 								onclick="location.href='/Unix/Home'"> -->
					    <input type="button" value="다시 진단하기" id="home" onclick="history.back(); return false;">
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
								<h3>산재 자가진단 결과, ${test_userid}님의</h3>
								</p>
							</c:when>
							<c:otherwise>
								<p class="result_txt1">
								<h3>
									산재 자가진단 결과,
									<%=user_id%>님의
								</h3>
								</p>
							</c:otherwise>
						</c:choose>

						<h1>
							산재를 받을 수 있을 확률이 <span>${Result}</span>
						</h1>
						<div class="re_comment">
							<c:choose>
								<c:when test="${sessionScope.user_id eq null}">
									<p>안녕하세요. ${test_userid}님의 산재를 받을 수 있는 확률이 ${Result}입니다.</p>
									<p>노무사 상담 연결로 빠르게 산재 보험을 받아봐요.</p>
								</c:when>
								<c:otherwise>
									<p>
										안녕하세요.
										<%=user_id%>님의 산재를 받을 수 있는 확률이 ${Result}입니다.
									</p>
									<p>노무사 상담 연결로 빠르게 산재 보험을 받아봐요.</p>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="point">
							<div class="plus">
								합산점수
								<p>
								<h4>${ResultPoint}점/80점</p>
								</h4>
							</div>
							<div class="percent">
								환산비율
								<p>
								<h4>${pointPer}%/100%</p>
								</h4>
							</div>
						</div>
						<div class="point_span">*합산점수 및 환산비율은 서비스 상용 기간부터 표시되지 않음.</div>
						<div class="next">
<!-- 							<input type="button" value="노무사 상담 연결" onclick="">  -->
<!-- 							<input type="button" value="홈으로" id="home" onclick="location.href='/Home'"> -->
<!-- 서비스기간 -->
                        <input type="button" value="다시 진단하기" id="home" onclick="history.back(); return false;">
						</div>
					</div>
				</div>
				
				
			</div>
			<hr id="arg" />

			<div class="survey">
				<div class="survey_text">
					<p>*서비스 테스트 기간으로 서비스 이용에 대한 만족도 설문조사를 진행중입니다.</p><br>
					
					<p>*설문조사에 참여해주신 분들을 대상으로(선착순 추첨)을 통해 소정의 상품을 증정드립니다.</p>
				</div>
				<button onclick="window.open('https://remember.qualtrics.com/jfe/form/SV_6J97IlpAWEOGX8a');">만족도 조사 링크 이동 -></button>
			</div>


		</section>
		<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>