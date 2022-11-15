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
var obj11 = document.getElementsByName("answerList11");
var obj12 = document.getElementsByName("answerList12");
var obj13 = document.getElementsByName("answerList13");
var obj14 = document.getElementsByName("answerList14");
var obj15 = document.getElementsByName("answerList15");
$(function() {
	jQuery('#prev').css("display", "none");
	jQuery('#check_submit').css("display", "none");
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
			jQuery('#next').css("display", "block");
			jQuery('#check_submit').css("display", "none");
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
			jQuery('#next').css("display", "none");
			jQuery('#check_submit').css("display", "block");
			if ($(obj14).is(":checked") == false) {
				idx--;
				alert("답변을 체크해주세요.");
				jQuery('.answer14').css("display", "block");
				jQuery('.answer15').css("display", "none");
				jQuery('.h3_14').css("display", "block");
				jQuery('.h3_15').css("display", "none");
				jQuery('#next').css("display", "block");
				jQuery('#check_submit').css("display", "none");
			}
		}
	});

	$('#check_submit').click(function() {
		if ($(obj15).is(":checked") == false) {
			alert("답변을 체크해주세요.");
			jQuery('.answer15').css("display", "block");
			jQuery('.answer14').css("display", "none");
			jQuery('.h3_15').css("display", "block");
			jQuery('.h3_14').css("display", "none");
			jQuery('#next').css("display", "none");
			jQuery('#check_submit').css("display", "block");

		} else if ($(obj15).is(":checked") == true) {

			$("#checkform").submit();
		}



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
	if (idx == 11) {
		for (var i = 0; i < obj11.length; i++) {
			if (obj11[i] != chk) {
				obj11[i].checked = false;
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

}
function uncheck() {
	$(':checkbox:checked').prop('checked', false);
};