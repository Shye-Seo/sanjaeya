// mypage 메모장에 사용된 기능들에 관련된 코드들 
var d = new Date();
document.getElementById('this_month').innerHTML=d.getFullYear() + "년 " + (d.getMonth()+1) + "월";
document.getElementById('date_form').value=new Date().toISOString().substring(0, 10);

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
	
	$("#memo_delete").click(function(event) {
	  event.stopPropagation();
	});
	
	$(".memo_box").click(function() {
		$("#update_memo_form").fadeIn();
		$('#wrap').on('scroll touchmove mousewheel', function(event) {
	        event.preventDefault();
	        event.stopPropagation();
	        return false;
	    }); 
	});
	
	$("#close2").click(function() {
		$("#update_memo_form").fadeOut();
		$('#wrap').off('scroll touchmove mousewheel');
	});
	
	
	$("#close3").click(function() {
		$("#update_memo_form").fadeOut();
		$('#wrap').off('scroll touchmove mousewheel');
	});
	
	$("#date_form").on("change", function() {
	    this.setAttribute(
	        "data-date",
	        moment(this.value, "YYYY-MM-DD")
	        .format( this.getAttribute("data-date-format") )
	    );
	}).trigger("change");
});

