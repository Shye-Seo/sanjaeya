

// 휴대폰 번호 인증
var code2 = "";
function sendContact() {
	if ($("#send_userphone").val() == "" || $("#send_userphone").val() == null) {
		alert("로그인이 필요한 서비스 입니다.");
		var user_phone = $("#send_userphone").val();

	} else {
		alert("상담 신청이 완료되었습니다.");

		var user_phone = $("#send_userphone").val();
		var user_name = $("#send_username").val();
		$.ajax({
			type: "GET",
			url: "sendContact?user_phone=" + user_phone,
			cache: false,
			success: function(data) {
				if (data == "error") {
					alert("휴대폰 번호가 올바르지 않습니다.");
					$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
					$(".successPhoneChk").css("color", "red");
					$("#user_phone").attr("autofocus", true);
				}

			}
		});
	}
}

function NsendContact() {
	alert("로그인이 필요한 서비스 입니다.");
	}