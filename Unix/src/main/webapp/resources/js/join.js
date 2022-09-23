
	// 아이디 중복체크 클릭시
	function fn_idChk() {
		var regExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,16}$/;
		var user_id = $("#user_id").val();
		
		if((user_id == "") || (user_id.length < 4) || (!regExp.test(user_id)) ){
			$(".successIdChk").text("아이디는 영어 숫자포함,4~16글자로 설정해주세요");
			$(".successIdChk").css("color","red");
			$("#idDoubleChk").val("false");
		}else {
			$.ajax({
				url:'idChk?user_id='+user_id,
				type:'post',
				cache:false,
				success:function(data) {
					if(data == 0) {
						$(".successIdChk").text("사용가능한 아이디입니다.");
						$(".successIdChk").css("color", "green");
						$("#idDoubleChk").val("true");
					}else {
						$(".successIdChk").text("사용중인 아이디입니다.");
						$(".successIdChk").css("color", "red");
						$("#idDoubleChk").val("false");
					}
				}, error:function() {
					console.log("실패");
				}
			});
		}
	}


$(document).ready(function(){
	// 비밀번호 영문 대소문자/숫자/특수문자 중 2가지 이상조합으로 10~16자리
    var regExp = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{10,16}$/;
	
	// 비밀번호 체크
	$("#re_user_pass").blur(function() {
		if($("#user_pass").val() == $("#re_user_pass").val()) {
			if(!regExp.test($("#user_pass").val()) || !regExp.test($("#re_user_pass").val())) {
				$(".successPwChk").text("영문 대소문자/숫자/특수문자 중 2가지 이상조합, 10~16자");
				$(".successPwChk").css("color","red");
				$("#pwDoubleChk").val("false");
			}else {
				$(".successPwChk").text("비밀번호가 일치합니다.");
				$(".successPwChk").css("color", "green");
				$("#pwDoubleChk").val("true");
			}
		}else {
			$(".successPwChk").text("비밀번호가 일치하지 않습니다.");
			$(".successPwChk").css("color","red");
			$("#pwDoubleChk").val("false");
		}
	});
	
	
	// 이름 체크
	$("#user_name").blur(function() {
		
		if($("#user_name").val() != "") {
			$(".successNameChk").text("");
			$("#nameDoubleChk").val("true");
		}
	});
	
	

        
	// 이메일 인증
	var code = "";
	$("#emailChk").click(function() {
		var user_mail_id = $("#user_mail_id").val();
		var user_mail_domain = $("#user_mail_domain").val();
		var mailMerge = user_mail_id+"@"+user_mail_domain;
		$("#mailMerge").val(mailMerge);
		
		if(user_mail_id == "" || user_mail_domain == "") {
			$(".successMailChk").text("이메일을 입력해주세요.");
			$(".successMailChk").css("color","red");
		}else {
			$.ajax({
				type:"GET",
				url:"mailCheck?mailMerge=" + mailMerge,
				cache:false,
				success:function(data) {
					if(data == "error") {
						alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
						$("#user_mail_id").attr("autofocus",true);
						$(".successMailChk").text("유효한 이메일 주소를 입력해주세요.");
						$(".successMailChk").css("color","red");
					}else {
						alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
						$("#user_mail_number").attr("disabled",false);
						$("#user_mail_number").css("display","inline-block");
						$("#emailChk2").css("display","inline-block");
						$(".successMailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
						$(".successMailChk").css("color","green");
						$("#user_mail_id").attr("readonly",true);
						$("#user_mail_domain").attr("readonly",true);
						code = data;
					}
				}
			});
		}

	});
	
	// 이메일 인증번호 대조
/*	$("#emailChk2").click(function() {
		if($("#user_mail_number").val() == code) {
			$(".successMailChk").text("인증번호가 일치합니다.");
			$(".successMailChk").css("color","green");
			$("#mailDoubleChk").val("true");
			$("#user_mail_number").attr("disabled",true);			
		}else {
			$(".successMailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successMailChk").css("color","red");
			$("#mailDoubleChk").val("false");
			$("#user_mail_number").attr("autofocus",true);
		}
	});*/
	
	
	
		
	// 휴대폰 번호 인증
	var code2 = "";
	$("#phoneChk").click(function() {
		if($("#user_phone").val() == "") {
			$(".successPhoneChk").text("휴대폰 번호를 입력해주세요.");
			$(".successPhoneChk").css("color","red");
		}else {
			alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");

			var user_phone = $("#user_phone").val();
			
			$.ajax({
				type:"GET",
				url:"phoneCheck?user_phone=" + user_phone,
				cache: false,
				success:function(data) {
					if(data == "error") {
						alert("휴대폰 번호가 올바르지 않습니다.");
							$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
							$(".successPhoneChk").css("color","red");
							$("#user_phone").attr("autofocus",true);
					}else {
						// 인증번호가 정상적으로 보내졌다면 인증번호 입력하는 창을 풀어줌
						// 핸드폰 번호 입력했던창은 readonly로 막아줌
						$("#user_phone2").attr("disabled",false);
						$("#user_phone2").css("display","inline-block");
						$("#sms_send").css("display","inline-block");
						$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
						$(".successPhoneChk").css("color","green");
						$("#user_phone").attr("readonly",true);
						code2 = data;
					}
					
				}
			});
		}
	});
		
	// 휴대폰 인증번호 대조
	$("#sms_send").click(function() {
		if($("#user_phone2").val() == code2) {
			$(".successPhoneChk").text("인증번호가 일치합니다.");
			$(".successPhoneChk").css("color","green");
			$("#phoneDoubleChk").val("true");
			$("#user_phone2").attr("disabled",true);
		}else {
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
			$(".successPhoneChk").css("color","red");
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus",true);
		}
	});
	
	
	// 회원가입 취소버튼 눌렀을때
	$(".reset").click(function() {
		$("#idDoubleChk").val("false");
		$("#pwDoubleChk").val("false");
		$("#nameDoubleChk").val("false");
		$("#mailDoubleChk").val("false");
		$("#phoneDoubleChk").val("false");
		$("#user_mail_id").attr("readonly",false);
		$("#user_mail_domain").attr("readonly",false);
		$("#user_phone").attr("readonly",false);
		
	});
	
	// 전체동의 체크여부
	$(".check_allwrap input:checkbox").click(allCheckedChange);
	// 체크박스 체크여부
	$(".check_subwrap input:checkbox").click(checkedChange);
	
});

	function allCheckedChange() {
		if($(this).prop("checked")) {
			$(".check_subwrap label[for=check_item_1]").text("동의되었습니다.");
			$(".check_subwrap label[for=check_item_1]").css("color","blue");
			$(".check_subwrap label[for=check_item_2]").text("동의되었습니다.");
			$(".check_subwrap label[for=check_item_2]").css("color","blue");
		}else {
			$(".check_subwrap label[for=check_item_1]").text("동의 해주시기 바랍니다.");
			$(".check_subwrap label[for=check_item_1]").css("color","red");
			$(".check_subwrap label[for=check_item_2]").text("동의 해주시기 바랍니다.");
			$(".check_subwrap label[for=check_item_2]").css("color","red");
		}
	}


	function checkedChange() {
		if($(this).prop("checked")) {
			$(".check_subwrap label[for="+this.id+"]").text("동의되었습니다.");
			$(".check_subwrap label[for="+this.id+"]").css("color","blue");
		}else {
			$(".check_subwrap label[for="+this.id+"]").text("동의 해주시기 바랍니다.");
			$(".check_subwrap label[for="+this.id+"]").css("color","red");
		}
	}



// joinform_check 함수로 유효성 검사
    function joinform_check() {
        var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var user_mail_id = $("#user_mail_id").val();
        var user_mail_domain = $("#user_mail_domain").val();
        var mail = "";
        
        /*
        var user_name = document.getElementById("user_name");
        var user_phone = document.getElementById("user_phone");
        var check_item_1 = document.getElementById("check_item_1");
        var check_item_2 = document.getElementById("check_item_2");
        */

        /*
        if(user_name.value == "") {
			$(".successNameChk").text("이름을 입력해주세요.");
			$(".successNameChk").css("color","red");
			$("#nameDoubleChk").val("false");
            user_name.focus();
            return false;
        }
		
        if(user_mail_id == "" || user_mail_domain == "") {
            $(".successMailChk").text("이메일을 입력해주세요.");
            $(".successMailChk").css("color","red");
            $("#mailDoubleChk").val("false");
            user_mail_id.focus();
            return false;
        }
        */
        
        
        
        // 합칠변수 mail에 아이디와 도메인을 합침
        mail = user_mail_id+"@"+user_mail_domain;
        $("#mail").val(mail);

		/*
        if(!email_rule.test(mail)) {
            $(".successMailChk").text("이메일에 한글은 사용할 수 없습니다.");
            $(".successMailChk").css("color","red");
            user_mail_id.focus();
            return false;
        }else {
			$(".successMailChk").text("");
		}
		*/



		/*
        var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        
        if(user_phone.value == "") {
            alert("폰 번호를 입력하세요.");
            user_phone.focus();
            return false;
        }
        if(!regPhone.test(user_phone.value)) {
            alert("폰 번호를 제대로 입력해주세요.(숫자만)");
            user_phone.focus();
            return false;
        }

        if(!check_item_1.checked) {
            alert("필수 이용약관 체크해주세요.")
            check_item_1.focus();
            return false;
        }

        if(!check_item_2.checked) {
            alert("필수 이용약관 체크해주세요.");
            check_item_2.focus();
            return false;
        }
        */
        
        /*&& $("#mailDoubleChk").val() == "true" */
        
        if($("#check_item_1").prop("checked") && $("#check_item_2").prop("checked") &&
           $("#idDoubleChk").val() == "true" && $("#pwDoubleChk").val() == "true" &&
           $("#nameDoubleChk").val() == "true" && $("#phoneDoubleChk").val() == "true") {
	
		   alert($('#user_id').val() + "님 환영합니다.\n가입해주셔서 감사합니다.");
		}else {
			alert("회원가입을 완료할 수 없습니다. 다시한번 확인해주십시오.");
			if(!$("#check_item_1").prop("checked")) {
				$("label[for=check_item_1]").text("동의 해주시기 바랍니다.");
				$("label[for=check_item_1]").css("color","red");
			}
			if(!$("#check_item_2").prop("checked")) {
				$("label[for=check_item_2]").text("동의 해주시기 바랍니다.");
				$("label[for=check_item_2]").css("color","red");
			}
			if($("#idDoubleChk").val() != "true") {
				$(".successIdChk").text("아이디를 입력해주세요.");
				$(".successIdChk").css("color", "red");
			}
			if($("#pwDoubleChk").val() != "true") {
				$(".successPwChk").text("비밀번호가 일치하지 않습니다.");
				$(".successPwChk").css("color","red");
			}
			if($("#nameDoubleChk").val() != "true") {
				$(".successNameChk").text("이름을 입력해주세요.");
				$(".successNameChk").css("color","red");
			}
			if($("#mailDoubleChk").val() != "true") {
				$(".successMailChk").text("이메일 인증을 완료해주세요.");
				$(".successMailChk").css("color","red");
			}
			if($("#phoneDoubleChk").val() != "true") {
				$(".successPhoneChk").text("휴대폰 인증을 완료해주세요.");
				$(".successPhoneChk").css("color","red");
			}
			return false;
		}

        // 입력 값 전송
        document.joinform.submit();
    }
        
        
        // 이메일 선택했을때 도메인 자동 입력되게
	    function setEmailDomain(domain) {
	        $("#user_mail_domain").val(domain);
	    }
	    
