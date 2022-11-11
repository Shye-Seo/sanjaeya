<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diagnosis</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="resources/css/diagnosis.css">
<%@ include file="/WEB-INF/views/common.jsp"%>
</head>
<script>
	var idx = 1;

	var obj1 = document.getElementsByName("answerList1");
	var obj2 = document.getElementsByName("answerList2");
	var obj3 = document.getElementsByName("answerList3");
	var obj4 = document.getElementsByName("answerList4");
	var obj5 = document.getElementsByName("answerList5");
	var obj6 = document.getElementsByName("answerList6");
	var obj7 = document.getElementsByName("answerList7");
	var obj8 = document.getElementsByName("answerList8");
	var obj9 = document.getElementsByName("answerList9");
	var obj10 = document.getElementsByName("answerList10");
	var obj12 = document.getElementsByName("answerList12");
	var obj13 = document.getElementsByName("answerList13");
	var obj14 = document.getElementsByName("answerList14");
	var obj15 = document.getElementsByName("answerList15");
	var obj16 = document.getElementsByName("answerList16");
	$(function() {
		jQuery('#prev').css("display", "none");
		jQuery('#submit').css("display", "none");
		//이전 버튼
		$('#prev').click(function() {
			idx--;

			if (idx == 1) {
				jQuery('.answer1').css("display", "block");
				jQuery('.answer2').css("display", "none");
				jQuery('.h3_1').css("display", "block");
				jQuery('.h3_2').css("display", "none");
				jQuery('#prev').css("display", "none");
			} else if (idx == 2) {
				jQuery('.answer2').css("display", "block");
				jQuery('.answer3').css("display", "none");
				jQuery('.h3_2').css("display", "block");
				jQuery('.h3_3').css("display", "none");
			} else if (idx == 3) {
				jQuery('.answer3').css("display", "block");
				jQuery('.answer4').css("display", "none");
				jQuery('.h3_3').css("display", "block");
				jQuery('.h3_4').css("display", "none");
			} else if (idx == 4) {
				jQuery('.answer4').css("display", "block");
				jQuery('.answer5').css("display", "none");
				jQuery('.h3_4').css("display", "block");
				jQuery('.h3_5').css("display", "none");
			} else if (idx == 5) {
				jQuery('.answer5').css("display", "block");
				jQuery('.answer6').css("display", "none");
				jQuery('.h3_5').css("display", "block");
				jQuery('.h3_6').css("display", "none");
			} else if (idx == 6) {
				jQuery('.answer6').css("display", "block");
				jQuery('.answer7').css("display", "none");
				jQuery('.h3_6').css("display", "block");
				jQuery('.h3_7').css("display", "none");
			} else if (idx == 7) {
				jQuery('.answer7').css("display", "block");
				jQuery('.answer8').css("display", "none");
				jQuery('.h3_7').css("display", "block");
				jQuery('.h3_8').css("display", "none");
			} else if (idx == 8) {
				jQuery('.answer8').css("display", "block");
				jQuery('.answer9').css("display", "none");
				jQuery('.h3_8').css("display", "block");
				jQuery('.h3_9').css("display", "none");
			} else if (idx == 9) {
				jQuery('.answer9').css("display", "block");
				jQuery('.answer10').css("display", "none");
				jQuery('.h3_9').css("display", "block");
				jQuery('.h3_10').css("display", "none");
			} else if (idx == 10) {
				jQuery('.answer10').css("display", "block");
				jQuery('.answer11').css("display", "none");
				jQuery('.h3_10').css("display", "block");
				jQuery('.h3_11').css("display", "none");
			} else if (idx == 11) {
				jQuery('.answer11').css("display", "block");
				jQuery('.answer12').css("display", "none");
				jQuery('.h3_11').css("display", "block");
				jQuery('.h3_12').css("display", "none");
			} else if (idx == 12) {
				jQuery('.answer12').css("display", "block");
				jQuery('.answer13').css("display", "none");
				jQuery('.h3_12').css("display", "block");
				jQuery('.h3_13').css("display", "none");
			} else if (idx == 13) {
				jQuery('.answer13').css("display", "block");
				jQuery('.answer14').css("display", "none");
				jQuery('.h3_13').css("display", "block");
				jQuery('.h3_14').css("display", "none");
			} else if (idx == 14) {
				jQuery('.answer14').css("display", "block");
				jQuery('.answer15').css("display", "none");
				jQuery('.h3_14').css("display", "block");
				jQuery('.h3_15').css("display", "none");
			} else if (idx == 15) {
				jQuery('.answer15').css("display", "block");
				jQuery('.answer16').css("display", "none");
				jQuery('.h3_15').css("display", "block");
				jQuery('.h3_16').css("display", "none");
			} else if (idx == 16) {
				jQuery('.answer16').css("display", "block");
				jQuery('.answer17').css("display", "none");
				jQuery('.h3_16').css("display", "block");
				jQuery('.h3_17').css("display", "none");
				jQuery('#next').css("display", "block");
				jQuery('#submit').css("display", "none");

			}

		});
		//다음 버튼
		$('#next').click(function() {
			idx++;

			if (idx == 2) {
				jQuery('.answer2').css("display", "block");
				jQuery('.answer1').css("display", "none");
				jQuery('.h3_2').css("display", "block");
				jQuery('.h3_1').css("display", "none");
				jQuery('#prev').css("display", "block");

				if ($(obj1).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer1').css("display", "block");
					jQuery('.answer2').css("display", "none");
					jQuery('.h3_1').css("display", "block");
					jQuery('.h3_2').css("display", "none");
					jQuery('#prev').css("display", "none");
				}

			} else if (idx == 3) {
				jQuery('.answer3').css("display", "block");
				jQuery('.answer2').css("display", "none");
				jQuery('.h3_3').css("display", "block");
				jQuery('.h3_2').css("display", "none");
				if ($(obj2).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer2').css("display", "block");
					jQuery('.answer3').css("display", "none");
					jQuery('.h3_2').css("display", "block");
					jQuery('.h3_3').css("display", "none");
				}

			} else if (idx == 4) {
				jQuery('.answer4').css("display", "block");
				jQuery('.answer3').css("display", "none");
				jQuery('.h3_4').css("display", "block");
				jQuery('.h3_3').css("display", "none");
				if ($(obj3).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer3').css("display", "block");
					jQuery('.answer4').css("display", "none");
					jQuery('.h3_3').css("display", "block");
					jQuery('.h3_4').css("display", "none");
				}

			} else if (idx == 5) {
				jQuery('.answer5').css("display", "block");
				jQuery('.answer4').css("display", "none");
				jQuery('.h3_5').css("display", "block");
				jQuery('.h3_4').css("display", "none");
				if ($(obj4).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer4').css("display", "block");
		             jQuery('.answer5').css("display", "none");
		             jQuery('.h3_4').css("display", "block");
		             jQuery('.h3_5').css("display", "none");
				}

			} else if (idx == 6) {
				jQuery('.answer6').css("display", "block");
				jQuery('.answer5').css("display", "none");
				jQuery('.h3_6').css("display", "block");
				jQuery('.h3_5').css("display", "none");
				if ($(obj5).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer5').css("display", "block");
		              jQuery('.answer6').css("display", "none");
		              jQuery('.h3_5').css("display", "block");
		              jQuery('.h3_6').css("display", "none");
				}

			} else if (idx == 7) {
				jQuery('.answer7').css("display", "block");
				jQuery('.answer6').css("display", "none");
				jQuery('.h3_7').css("display", "block");
				jQuery('.h3_6').css("display", "none");
				if ($(obj6).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer6').css("display", "block");
		              jQuery('.answer7').css("display", "none");
		              jQuery('.h3_6').css("display", "block");
		              jQuery('.h3_7').css("display", "none");
				}

			} else if (idx == 8) {
				jQuery('.answer8').css("display", "block");
				jQuery('.answer7').css("display", "none");
				jQuery('.h3_8').css("display", "block");
				jQuery('.h3_7').css("display", "none");
				if ($(obj7).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer7').css("display", "block");
		              jQuery('.answer8').css("display", "none");
		              jQuery('.h3_7').css("display", "block");
		              jQuery('.h3_8').css("display", "none");
				}

			} else if (idx == 9) {
				jQuery('.answer9').css("display", "block");
				jQuery('.answer8').css("display", "none");
				jQuery('.h3_9').css("display", "block");
				jQuery('.h3_8').css("display", "none");
				if ($(obj8).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					 jQuery('.answer8').css("display", "block");
		              jQuery('.answer9').css("display", "none");
		              jQuery('.h3_8').css("display", "block");
		              jQuery('.h3_9').css("display", "none");
				}

			} else if (idx == 10) {
				jQuery('.answer10').css("display", "block");
				jQuery('.answer9').css("display", "none");
				jQuery('.h3_10').css("display", "block");
				jQuery('.h3_9').css("display", "none");
				if ($(obj9).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer9').css("display", "block");
		              jQuery('.answer10').css("display", "none");
		              jQuery('.h3_9').css("display", "block");
		              jQuery('.h3_10').css("display", "none");
				}

			} else if (idx == 11) {
				jQuery('.answer11').css("display", "block");
				jQuery('.answer10').css("display", "none");
				jQuery('.h3_11').css("display", "block");
				jQuery('.h3_10').css("display", "none");
				if ($(obj10).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer10').css("display", "block");
		              jQuery('.answer11').css("display", "none");
		              jQuery('.h3_10').css("display", "block");
		              jQuery('.h3_11').css("display", "none");
				}

			} else if (idx == 12) {
				jQuery('.answer12').css("display", "block");
				jQuery('.answer11').css("display", "none");
				jQuery('.h3_12').css("display", "block");
				jQuery('.h3_11').css("display", "none");
				if ($(obj11).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer11').css("display", "block");
		              jQuery('.answer12').css("display", "none");
		              jQuery('.h3_11').css("display", "block");
		              jQuery('.h3_12').css("display", "none");
				}

			} else if (idx == 13) {
				jQuery('.answer13').css("display", "block");
				jQuery('.answer12').css("display", "none");
				jQuery('.h3_13').css("display", "block");
				jQuery('.h3_12').css("display", "none");
				if ($(obj12).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer12').css("display", "block");
		              jQuery('.answer13').css("display", "none");
		              jQuery('.h3_12').css("display", "block");
		              jQuery('.h3_13').css("display", "none");
				}

			} else if (idx == 14) {
				jQuery('.answer14').css("display", "block");
				jQuery('.answer13').css("display", "none");
				jQuery('.h3_14').css("display", "block");
				jQuery('.h3_13').css("display", "none");
				if ($(obj13).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer13').css("display", "block");
		              jQuery('.answer14').css("display", "none");
		              jQuery('.h3_13').css("display", "block");
		              jQuery('.h3_14').css("display", "none");
				}

			} else if (idx == 15) {
				jQuery('.answer15').css("display", "block");
				jQuery('.answer14').css("display", "none");
				jQuery('.h3_15').css("display", "block");
				jQuery('.h3_14').css("display", "none");
				if ($(obj14).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					 jQuery('.answer14').css("display", "block");
		              jQuery('.answer15').css("display", "none");
		              jQuery('.h3_14').css("display", "block");
		              jQuery('.h3_15').css("display", "none");
				}

			} else if (idx == 16) {
				jQuery('.answer16').css("display", "block");
				jQuery('.answer15').css("display", "none");
				jQuery('.h3_16').css("display", "block");
				jQuery('.h3_15').css("display", "none");
				if ($(obj15).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					 jQuery('.answer15').css("display", "block");
		              jQuery('.answer16').css("display", "none");
		              jQuery('.h3_15').css("display", "block");
		              jQuery('.h3_16').css("display", "none");
				}
			} else if (idx == 17) {
				jQuery('.answer17').css("display", "block");
				jQuery('.answer16').css("display", "none");
				jQuery('.h3_17').css("display", "block");
				jQuery('.h3_16').css("display", "none");
				jQuery('#next').css("display", "none");
				jQuery('#submit').css("display", "block");
				if ($(obj16).is(":checked") == false) {
					idx--;
					alert("답변을 체크해주세요.");
					jQuery('.answer16').css("display", "block");
		              jQuery('.answer17').css("display", "none");
		              jQuery('.h3_16').css("display", "block");
		              jQuery('.h3_17').css("display", "none");
		              jQuery('#next').css("display", "block");
		              jQuery('#submit').css("display", "none");
				}
			}
		});

		$('#submit').click(function() {

			$('input[class="1"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="2"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="3"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="4"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="5"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="6"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="7"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="8"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="9"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="10"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="11"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="12"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="13"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="14"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="15"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="16"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});
			$('input[class="17"]:checked').each(function(i) {//체크된 리스트 저장
				answerList.push($(this).val());
			});

		});

	})
	function NoMultiChk(chk) {

		if (idx == 1) {
			for (var i = 0; i < obj1.length; i++) {
				if (obj1[i] != chk) {
					obj1[i].checked = false;
				}
			}
		}
		if (idx == 2) {
			for (var i = 0; i < obj2.length; i++) {
				if (obj2[i] != chk) {
					obj2[i].checked = false;
				}
			}
		}
		if (idx == 3) {
			for (var i = 0; i < obj3.length; i++) {
				if (obj3[i] != chk) {
					obj3[i].checked = false;
				}
			}
		}
		if (idx == 4) {
			for (var i = 0; i < obj4.length; i++) {
				if (obj4[i] != chk) {
					obj4[i].checked = false;
				}
			}
		}
		if (idx == 5) {
			for (var i = 0; i < obj5.length; i++) {
				if (obj5[i] != chk) {
					obj5[i].checked = false;
				}
			}
		}
		if (idx == 6) {
			for (var i = 0; i < obj6.length; i++) {
				if (obj6[i] != chk) {
					obj6[i].checked = false;
				}
			}
		}
		if (idx == 7) {
			for (var i = 0; i < obj7.length; i++) {
				if (obj7[i] != chk) {
					obj7[i].checked = false;
				}
			}
		}
		if (idx == 8) {
			for (var i = 0; i < obj8.length; i++) {
				if (obj8[i] != chk) {
					obj8[i].checked = false;
				}
			}
		}
		if (idx == 9) {
			for (var i = 0; i < obj9.length; i++) {
				if (obj9[i] != chk) {
					obj9[i].checked = false;
				}
			}
		}
		if (idx == 10) {
			for (var i = 0; i < obj10.length; i++) {
				if (obj10[i] != chk) {
					obj10[i].checked = false;
				}
			}
		}
		if (idx == 12) {
			for (var i = 0; i < obj12.length; i++) {
				if (obj12[i] != chk) {
					obj12[i].checked = false;
				}
			}
		}
		if (idx == 13) {
			for (var i = 0; i < obj13.length; i++) {
				if (obj13[i] != chk) {
					obj13[i].checked = false;
				}
			}
		}
		if (idx == 14) {
			for (var i = 0; i < obj14.length; i++) {
				if (obj14[i] != chk) {
					obj14[i].checked = false;
				}
			}
		}
		if (idx == 15) {
			for (var i = 0; i < obj15.length; i++) {
				if (obj15[i] != chk) {
					obj15[i].checked = false;
				}
			}
		}
		if (idx == 16) {
			for (var i = 0; i < obj16.length; i++) {
				if (obj16[i] != chk) {
					obj16[i].checked = false;
				}
			}
		}
	}
	function uncheck(){
		$(':checkbox:checked').prop('checked',false);
	};
</script>
<body onLoad="uncheck()">
	<div id="wrap">
		<div id="headers"><jsp:include page="/WEB-INF/views/header/header.jsp"></jsp:include></div>

		<div class="nav">
			<div class="banner">
				<span>산재 자가진단</span>
			</div>
		</div>

		<section>
			<h4 class="a">&lt;${category[0].category_name}&gt;</h4>
			<div class="category">
				<ul>
					<li><p>재해자 정보 입력</p></li>
					<li class="active"><p>산재 자가진단 시작</p></li>
					<li><p>산재 자가진단 결과</p></li>
				</ul>
			</div>

			<div class="a">
			    <div class="h3_1">(1/17)</div>
				<h3 class="h3_1">Q1. ${questionContents[0]}</h3>
				<div class="h3_2">(2/17)</div>
				<h3 class="h3_2">Q2. ${questionContents[1]}</h3>
				<div class="h3_3">(3/17)</div>
				<h3 class="h3_3">Q3. ${questionContents[2]}</h3>
				<div class="h3_4">(4/17)</div>
				<h3 class="h3_4">Q4. ${questionContents[3]}</h3>
				<div class="h3_5">(5/17)</div>
				<h3 class="h3_5">Q5.${questionContents[4]}</h3>
				<div class="h3_6">(6/17)</div>
				<h3 class="h3_6">Q6.${questionContents[5]}</h3>
				<div class="h3_7">(7/17)</div>
				<h3 class="h3_7">Q7.${questionContents[6]}</h3>
				<div class="h3_8">(8/17)</div>
				<h3 class="h3_8">Q8.${questionContents[7]}</h3>
				<div class="h3_9">(9/17)</div>
				<h3 class="h3_9">Q9.${questionContents[8]}</h3>
				<div class="h3_10">(10/17)</div>
				<h3 class="h3_10">Q10.${questionContents[9]}</h3>
				<div class="h3_11">(11/17)</div>
				<h3 class="h3_11">Q11.${questionContents[10]}</h3>
				<div class="h3_12">(12/17)</div>
				<h3 class="h3_12">Q12.${questionContents[11]}</h3>
				<div class="h3_13">(13/17)</div>
				<h3 class="h3_13">Q13.${questionContents[12]}</h3>
				<div class="h3_14">(14/17)</div>
				<h3 class="h3_14">Q14.${questionContents[13]}</h3>
				<div class="h3_15">(15/17)</div>
				<h3 class="h3_15">Q15.${questionContents[14]}</h3>
				<div class="h3_16">(16/17)</div>
				<h3 class="h3_16">Q16.${questionContents[15]}</h3>
				<div class="h3_17">(17/17)</div>
				<h3 class="h3_17">Q17.${questionContents[16]}</h3>

				<p id="chc">*비회원으로 진행하실 경우 진단내용 및 결과는 자동저장되지 않습니다.</p>
			</div>
			<br>
			<form method="post" action="${pageContext.request.contextPath}/Checklist_1_cal" id="checkform">
				<div class="lst1">
					<div class="lst2">
						<c:forEach items="${answer1}" var="answer">
							<div class="answer1">
								<label for="${answer.id}"><input type="checkbox"
									class="1" id="${answer.id}" name="answerList1"
									value="<c:out value='${answer.id}'/>"
									onclick="NoMultiChk(this)">
								<c:out value='${answer.contents}' /></label>
								<div class="answerpoint"><c:out value='${answer.point}' /></div>
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
									<div class="answerpoint"><c:out value='${answer2.point}' /></div>
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
								<div class="answerpoint"><c:out value='${answer3.point}' /></div>
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
								<div class="answerpoint"><c:out value='${answer4.point}' /></div>
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
								<div class="answerpoint"><c:out value='${answer5.point}' /></div>
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
										<div class="answerpoint"><c:out value='${answer6.point}' /></div>
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
								<div class="answerpoint"><c:out value='${answer7.point}' /></div>
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
								<div class="answerpoint"><c:out value='${answer8.point}' /></div>
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
								<div class="answerpoint"><c:out value='${answer9.point}' /></div>
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
								<div class="answerpoint"><c:out value='${answer10.point}' /></div>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer11}" var="answer11">
							<div class="answer11">
								<label for="${answer11.id}"><input type="checkbox"
									class="11" id="${answer11.id}" name="answerList11"
									value="${answer11.id}">
								<c:out value='${answer11.contents}' /></label>
								<div class="answerpoint"><c:out value='${answer11.point}' /></div>
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
								<div class="answerpoint"><c:out value='${answer12.point}' /></div>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer13}" var="answer13">
							<div class="answer13">
								<label for="${answer13.id}"><input type="checkbox"
									class="13" id="${answer13.id}" name="answerList13"
									value="${answer13.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer13.contents}' /></label>
								<div class="answerpoint"><c:out value='${answer13.point}' /></div>
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
								<div class="answerpoint"><c:out value='${answer14.point}' /></div>
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
										<div class="answerpoint"><c:out value='${answer15.point}' /></div>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer16}" var="answer16">
							<div class="answer16">
								<label for="${answer16.id}"><input type="checkbox"
									class="16" id="${answer16.id}" name="answerList16"
									value="${answer16.id}" onclick="NoMultiChk(this)">
								<c:out value='${answer16.contents}' /></label>
								<div class="answerpoint"><c:out value='${answer16.point}' /></div>
							</div>
						</c:forEach>
					</div>
					<div class="lst2">
						<c:forEach items="${answer17}" var="answer17">
							<div class="answer17">
								<label for="${answer17.id}"><input type="checkbox"
									class="17" id="${answer17.id}" name="answerList17"
									value="${answer17.id}">
								<c:out value='${answer17.contents}' /></label>
								<div class="answerpoint"><c:out value='${answer17.point}' /></div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="next">
					<input type="button" value="이전" id="prev" onclick=""> <input
						type="button" value="다음" id="next" onclick=""> <input
						type="submit" value="완료" id="submit" onclick="">
				</div>
			</form>
		</section>
		<jsp:include page="/WEB-INF/views/footer/footer.jsp"></jsp:include>
	</div>
</body>
</html>