// mypage 메모장에 사용된 기능들에 관련된 코드들 
$(function() {
	$("#add_memo").click(function() {
		$("#add_memo_form").fadeIn();
	});
	
	$("#close").click(function() {
		$("#add_memo_form").fadeOut();
	});
	
	$("#close1").click(function() {
		$("#add_memo_form").fadeOut();
	});
});