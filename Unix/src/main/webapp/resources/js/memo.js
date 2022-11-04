// mypage 메모장에 사용된 기능들에 관련된 코드들 
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
	
	$("#prev_month").click(function() {
		if(month==0) {
			year-=1;
			month=12;
		}
		else {
			month-=1;
		}
	});
});

