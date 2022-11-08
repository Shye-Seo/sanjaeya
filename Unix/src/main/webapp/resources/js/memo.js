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
	
	/* 
		지금 메모장 div 안에 메모 삭제 div가 중첩되어 있어서 우선은 memo_delete0부터 memo_delete6까지 하나하나 지정했습니다.
		$("#memo_delete0").click(function(event) {
			console.log('작동여부확인');
			event.stopPropagation();  
		});
		위의 코드 처럼 하게 되면 화면의 첫번째 메모에 대해서는 동작을 하지만, 첫번째 이외의 메모에 대해서는 업데이트 창과 같이 나오는 현상이 발생합니다.
		0 1 2 3
		4 5 6 7
		예를 들어, 위의 코드처럼 하나로 작성했다고 가정할 경우 
		0번째가 메모장 추가 버튼이라고 가정하고 하나의 화면에 총 7개의 메모가 보여지는데, 1번 메모의 삭제 버튼을 클릭하면 업데이트 화면이 뜨지 않고 메모가 삭제되지만
		2, 3, 4, 5, 6, 7번의 메모를 삭제하는 경우 업데이트 창이 나오면서 메모가 삭제가 됩니다. 
		
		참고하셔야 할 것 같아서 이 내용을 적습니다. 
	*/
	$("#memo_delete0").click(function(event) {
		console.log('작동여부확인');
		event.stopPropagation();  
	});
	$("#memo_delete1").click(function(event) {
		console.log('작동여부확인');
		event.stopPropagation();  
	});
	$("#memo_delete2").click(function(event) {
		console.log('작동여부확인');
		event.stopPropagation();  
	});
	$("#memo_delete3").click(function(event) {
		console.log('작동여부확인');
		event.stopPropagation();  
	});
	$("#memo_delete4").click(function(event) {
		console.log('작동여부확인');
		event.stopPropagation();  
	});
	$("#memo_delete5").click(function(event) {
		console.log('작동여부확인');
		event.stopPropagation();  
	});
	$("#memo_delete6").click(function(event) {
		console.log('작동여부확인');
		event.stopPropagation();  
	});
	
	
	// 메모장 클릭 시 이벤트 
	$(".memo_box").click(function() {
		var update_memo_id = $(this).attr("id");
		var tmp_update_memo_content;
		$("#update_memo_form").fadeIn();
	    $('#wrap').on('scroll touchmove mousewheel', function(event) {
	         event.preventDefault();
	         event.stopPropagation();
	         return false;
	    });
	    
		$.ajax({
			url:"Readmemo.do",
			data:{id:update_memo_id},
			type:"GET",
			dataType:"json"
		}).done(function(update_memo) { // 가져온 데이터들을 value 값에 설정 
			$("#update_title").attr('value', update_memo.title);
			$("#update_time").attr('value', update_memo.time);
			$("#date_form2").attr('value', update_memo.date);
			$("#date_form2").on("change", function() {
		    this.setAttribute(
			        "data-date",
			        moment(this.value, "YYYY-MM-DD")
			        .format( this.getAttribute("data-date-format"))
			    );
			}).trigger("change");
			tmp_update_memo_content=update_memo.content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
			$("#update_content").val(tmp_update_memo_content);
			$("#id").attr('value', update_memo_id);
		})
	});
});

