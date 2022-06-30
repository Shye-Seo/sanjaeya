// joinform_check 함수로 유효성 검사
        function joinform_check() {
            // 변수에 달아주기
            var id = document.getElementById("id");
            var idChk = document.getElementById("idChk");
            

            // 비밀번호 영문 대소문자/숫자/특수문자 중 2가지 이상조합으로 10~16자리
            var pwdCheck = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{10,16}$/;

            var pw = document.getElementById("pw");
            var repw = document.getElementById("repw");
            var name = document.getElementById("name");
            var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            var email_id = $("#email_id").val();
            var email_domain = $("#email_domain").val();
            var mail = "";
            var tel = document.getElementById("tel");
            var check_item_1 = document.getElementById("check_item_1");
            var check_item_2 = document.getElementById("check_item_2");


            if(id.value == "") { // 해당 입력값이 없을 경우 같은말: if(!id.value)
                alert("아이디를 입력하세요.");
                id.focus(); // focus(): 커서가 깜빡이는 현상. blur(): 커서가 사라지는 현상
                return false; // return: 반환하다  return false: 아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
            }
            
            if(idChk.value == "N") {
            	alert("아이디 중복체크를 해주세요.");
            	return false;
            }
            
            
			if(email_id != "" && email_domain != "") {
		      	$.ajax({
	   				url:"emailChk.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
	   				type:"post", // 데이터를 전송하는 방법
	   				dataType:"json", // 서버에서 보내줄 데이터의 타입
	   				data:{"email_id":email_id, 
	   				      "email_domain":email_domain	
	   				}, // 요청과 함께 서버로 데이터를 전송 할 string 또는 map
	   				success:function(data) {
	   					if(data == 1) {
	   						alert("중복된 이메일입니다.");
	   					}
	   				}
	   				
	   			});
		      //return false;
		      	
			}
            
     
            

            
            // 회원가입 submit 할때 중복아이디일때 alert뜨게
            /*
			$.ajax({
				url:"idChk.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				type:"post", // 데이터를 전송하는 방법
				dataType:"json", // 서버에서 보내줄 데이터의 타입
				data:{"id":$("#id").val()}, // 요청과 함께 서버로 데이터를 전송 할 string 또는 map
				success:function(data) {
					if(data == 1) {
						alert("중복된 아이디입니다.11111");
						//return;
					}
				}
			});
            */

            if(pw.value == "") {
                alert("비밀번호를 입력하세요.");
                pw.focus();
                return false;
            }

            if(!pwdCheck.test(pw.value)) { // test는 인자 안에 패턴에 해당되는 문자열이 있으면 true, 없으면 false
                alert("영문 대소문자/숫자/특수문자 중 2가지 이상으로 조합, 10~16자리");
                pw.focus();
                return false;
            }

            if(pw.value !== repw.value) {
                alert("비밀번호가 일치하지 않습니다.");
                pw.focus();
                return false;
            }

            if(name.value == "") {
                alert("이름을 입력하세요.");
                name.focus();
                return false;
            }

            if(!email_id) {
                alert("이메일을 입력하세요.");
                $("#email_id").focus();
                return false;
            }
            
            if(!email_domain) {
                alert("도메인을 입력하세요.");
                $("#email_domain").focus();
                return false;
            }
                    
            // 합칠변수 mail에 아이디와 도메인을 합침
            mail = email_id+"@"+email_domain;
            $("#mail").val(mail);

            if(!email_rule.test(mail)) {
                alert("이메일을 형식에 맞게 입력해주세요.");
                return false;
            }

            var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
            
            if(tel.value == "") {
                alert("폰 번호를 입력하세요.");
                tel.focus();
                return false;
            }
            if(!regPhone.test(tel.value)) {
                alert("폰 번호를 제대로 입력해주세요.(숫자만)");
                tel.focus();
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

            // 입력 값 전송
            document.joinform.submit();
        }
        
        // 아이디 중복체크 클릭시
        function fn_idChk() {
        	var id = document.getElementById("id");
        	
        	if(id.value == "") { 
            	alert("아이디를 입력하세요.");
       		}
        	
			$.ajax({
				url:"idChk.do",
				type:"post",
				dataType:"json",
				data:{"id":$("#id").val()},
				success:function(data) {
					if(data == 1) {
						alert("중복된 아이디입니다.");
					}else if(data == 0 && id.value != "") {
						$("#idChk").attr("value","Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			});
        }
        


        // 이메일 선택했을때 도메인 자동 입력되게
        function setEmailDomain(domain) {
            $("#email_domain").val(domain);
        }

        // * 이용약관 체크박스(https://emessell.tistory.com/149) *
        // 체크박스 전체 선택
        $(".agreement").on("click","#all_check_item", function() { // class가 agreement인 요소에 클릭이벤트 핸들러 바인딩
            // this는 내가 클릭한 객체
            $(this).parents(".agreement").find('input').prop("checked", $(this).is(":checked"));
        });
        // 체크박스 개별 선택
        $(".agreement").on("click", ".normal", function() {
            var is_checked = true;

            $(".agreement .normal").each(function() {
                is_checked = is_checked && $(this).is(":checked");
            });

            $("#all_check_item").prop("checked",is_checked);
        });