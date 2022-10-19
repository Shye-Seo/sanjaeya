// mypage 메모장에 사용된 기능들에 관련된 코드들 
var d = new Date();
document.getElementById('this_month').innerHTML=d.getFullYear() + "년 " + (d.getMonth()+1) + "월";

$(function() {
	
	$("#add_memo").click(function() {
		$("#add_memo_form").fadeIn();
		$('#wrap').on('scroll touchmove mousewheel', function(event) {
	        event.preventDefault();
	        event.stopPropagation();
	        return false;
	    }); 
	});
	
	$("#close").click(function() {
		$("#add_memo_form").fadeOut();
		$('#wrap').off('scroll touchmove mousewheel');
	});
	
	$("#close1").click(function() {
		$("#add_memo_form").fadeOut();
		$('#wrap').off('scroll touchmove mousewheel');
	});
});

