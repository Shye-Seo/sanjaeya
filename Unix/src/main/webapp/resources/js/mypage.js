 // joinform_check 함수로 유효성 검사
          function joinform_check() {
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

            

            var reg = /^[0-9]+/g; // 숫자만 입력하는 정규식
            if(tel.value == "") {
                alert("연락처를 입력하세요.");
                tel.focus();
                return false;
            }
            if(!reg.test(tel.value)) {
                alert("연락처는 숫자만 입력해주세요.");
                tel.focus();
                return false;
            }

            document.join_form.submit();
          }

           // 이메일 선택했을때 도메인 자동 입력되게
            function setEmailDomain(domain) {
                $("#email_domain").val(domain);
            }