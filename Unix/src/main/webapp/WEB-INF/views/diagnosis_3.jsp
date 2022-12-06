<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>Diagnosis</title>
<link rel="stylesheet" href="resources/css/diagnosis.css">
<%@ include file="/WEB-INF/views/common.jsp"%>
<script type="text/javascript" src="resources/js/diagnosis_3.js"></script>
</head>

<body onLoad="uncheck()">
	<div id="wrap">
		<div id="headers"><jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include></div>

		<div class="nav">
			<div class="banner">
				<span>산재 자가진단</span>
			</div>
		</div>

		<section>
			<h4 class="a">&lt;${category[2].category_name}&gt;</h4>
			<div class="category">
				<ul>
					<li><p>재해자 정보 입력</p></li>
					<li class="active"><p>산재 자가진단 시작</p></li>
					<li><p>산재 자가진단 결과</p></li>
				</ul>
			</div>

			<div class="a">
				<div class="h3_1">(1/15)</div>
				<h3 class="h3_1">Q1. ${questionContents[0]}</h3>
				<div class="h3_2">(2/15)</div>
				<h3 class="h3_2">Q2. ${questionContents[1]}</h3>
				<div class="h3_3">(3/15)</div>
				<h3 class="h3_3">Q3. ${questionContents[2]}</h3>
				<div class="h3_4">(4/15)</div>
				<h3 class="h3_4">Q4. ${questionContents[3]}</h3>
				<div class="h3_5">(5/15)</div>
				<h3 class="h3_5">Q5.${questionContents[4]}</h3>
				<div class="h3_6">(6/15)</div>
				<h3 class="h3_6">Q6.${questionContents[5]}</h3>
				<div class="h3_7">(7/15)</div>
				<h3 class="h3_7">Q7.${questionContents[6]}</h3>
				<div class="h3_8">(8/15)</div>
				<h3 class="h3_8">Q8.${questionContents[7]}</h3>
				<div class="h3_9">(9/15)</div>
				<h3 class="h3_9">Q9.${questionContents[8]}</h3>
				<div class="h3_10">(10/15)</div>
				<h3 class="h3_10">Q10.${questionContents[9]}</h3>
				<div class="h3_11">(11/15)</div>
				<h3 class="h3_11">Q11.${questionContents[10]}</h3>
				<div class="h3_12">(12/15)</div>
				<h3 class="h3_12">Q12.${questionContents[11]}</h3>
				<div class="h3_13">(13/15)</div>
				<h3 class="h3_13">Q13.${questionContents[12]}</h3>
				<div class="h3_14">(14/15)</div>
				<h3 class="h3_14">Q14.${questionContents[13]}</h3>
				<div class="h3_15">(15/15)</div>
				<h3 class="h3_15">Q15.${questionContents[14]}</h3>


				<p id="chc">*비회원으로 진행하실 경우 진단내용 및 결과는 자동저장되지 않습니다.</p>
			</div>
			<br>
			<form method="post" action="${pageContext.request.contextPath}/Checklist_3_cal" id="checkform">
				<div class="lst1">
					<div class="lst2">
						<c:forEach items="${answer1}" var="answer">
							<div class="answer1">
								<label for="${answer.id}"><input type="checkbox"
									class="1" id="${answer.id}" name="answerList1"
									value="<c:out value='${answer.id}'/>"
									onclick="NoMultiChk(this)">
								<c:out value='${answer.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer2}" var="answer2">
							<div class="answer2">
								<label for="${answer2.id}"><input type="checkbox"
									class="2" id="${answer2.id}" name="answerList2"
									value="${answer2.id}" onclick="NoMultiChk(this)"> <c:out
										value='${answer2.contents}' /></label>
<%-- 									<div class="answerpoint"><c:out value='${answer2.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer3}" var="answer3">
							<div class="answer3">
								<label for="${answer3.id}"><input type="checkbox"
									class="3" id="${answer3.id}" name="answerList3"
									value="${answer3.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer3.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer3.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer4}" var="answer4">
							<div class="answer4">
								<label for="${answer4.id}"><input type="checkbox"
									class="4" id="${answer4.id}" name="answerList4"
									value="${answer4.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer4.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer4.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer5}" var="answer5">
							<div class="answer5">
								<label for="${answer5.id}"><input type="checkbox"
									class="5" id="${answer5.id}" name="answerList5"
									value="${answer5.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer5.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer5.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer6}" var="answer6">
							<div class="answer6">
								<label for="${answer6.id}"><input type="checkbox"
									class="6" id="${answer6.id}" name="answerList6"
									value="${answer6.id}" onclick="NoMultiChk(this)"> <c:out
										value='${answer6.contents}' /></label>
<%-- 										<div class="answerpoint"><c:out value='${answer6.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer7}" var="answer7">
							<div class="answer7">
								<label for="${answer7.id}"><input type="checkbox"
									class="7" id="${answer7.id}" name="answerList7"
									value="${answer7.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer7.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer7.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer8}" var="answer8">
							<div class="answer8">
								<label for="${answer8.id}"><input type="checkbox"
									class="8" id="${answer8.id}" name="answerList8"
									value="${answer8.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer8.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer8.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer9}" var="answer9">
							<div class="answer9">
								<label for="${answer9.id}"><input type="checkbox"
									class="9" id="${answer9.id}" name="answerList9"
									value="${answer9.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer9.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer9.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer10}" var="answer10">
							<div class="answer10">
								<label for="${answer10.id}"><input type="checkbox"
									class="10" id="${answer10.id}" name="answerList10"
									value="${answer10.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer10.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer10.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer11}" var="answer11">
							<div class="answer11">
								<label for="${answer11.id}"><input type="checkbox"
									class="11" id="${answer11.id}" name="answerList11"
									value="${answer11.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer11.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer11.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer12}" var="answer12">
							<div class="answer12">
								<label for="${answer12.id}"><input type="checkbox"
									class="12" id="${answer12.id}" name="answerList12"
									value="${answer12.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer12.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer12.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer13}" var="answer13">
							<div class="answer13">
								<label for="${answer13.id}"><input type="checkbox"
									class="13" id="${answer13.id}" name="answerList13"
									value="${answer13.id}">
								<c:out value='${answer13.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer13.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer14}" var="answer14">
							<div class="answer14">
								<label for="${answer14.id}"><input type="checkbox"
									class="14" id="${answer14.id}" name="answerList14"
									value="${answer14.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer14.contents}' /></label>
<%-- 								<div class="answerpoint"><c:out value='${answer14.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer15}" var="answer15">
							<div class="answer15">
								<label for="${answer15.id}"><input type="checkbox"
									class="15" id="${answer15.id}" name="answerList15"
									value="${answer15.id}" onclick="NoMultiChk(this)"> <c:out
										value='${answer15.contents}' /></label>
<%-- 										<div class="answerpoint"><c:out value='${answer15.point}' /></div> --%>
							</div>
						</c:forEach>
					</div>

				</div>
				<div class="next">
					<input type="button" value="이전" id="prev" onclick=""> <input
						type="button" value="다음" id="next" onclick=""> <input
						type="button" value="완료" id="check_submit" onclick="">
				</div>
			</form>
		</section>
		<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>