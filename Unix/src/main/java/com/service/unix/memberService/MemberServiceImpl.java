package com.service.unix.memberService;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.service.unix.memberDao.MemberDaoImpl;
import com.service.unix.memberVo.MemberVo;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class MemberServiceImpl implements MemberService{

	@Inject
	MemberDaoImpl memberDao;
	
	// 회원 가입
	@Override
	public int memInsert(Map<String, String> map) {
		return memberDao.memInsert(map);
	}
	
	// 아이디 중복체크
	@Override
	public int idChk(String user_id) {
		return memberDao.idChk(user_id);
	}
	
	// 로그인할때 회원확인
	@Override
	public boolean loginCheck(MemberVo memberVo, HttpSession session) {
	boolean result = memberDao.loginCheck(memberVo);
		
		if(result) { // true일 경우 세션에 등록
			MemberVo memberVo1 = viewMember(memberVo);
			
			session.setAttribute("user_id", memberVo1.getUser_id());
			session.setAttribute("id", memberVo1.getId());
			session.setAttribute("user_name", memberVo1.getUser_name());
			session.setAttribute("user_phone", memberVo1.getUser_phone());
		}
		return result;
	}
	
	// 로그인할때 회원정보 가져올때
	@Override
	public MemberVo viewMember(MemberVo memberVo) {
		return memberDao.viewMember(memberVo);
	}
	
	
	// 아이디 찾기
	@Override
	public MemberVo findId(String user_phone) throws Exception {
		return memberDao.findId(user_phone);
	}

	@Override
	public int findIdCheck(String user_phone) throws Exception {
		return memberDao.findIdCheck(user_phone);
	}
	
	//비밀번호 찾기 아이디 체크
	@Override
	public int findPASSIdCheck(String user_id) throws Exception {
		return memberDao.findPASSIdCheck(user_id);
	}
	//비밀번호 다시 설정
	@Override
	public void updatePw(MemberVo memberVo) throws Exception {
		memberDao.updatePw(memberVo);
	}
	
	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(MemberVo memberVo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "algo0426"; // 본인의 아이디 입력
		String hostSMTPpwd = "qwer1234"; // 본인의 비밀번호 입력

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "algo0426@naver.com"; // 보내는 사람 email
		String fromName = "이상훈";                // 보내는 사람 이름
		String subject = "";                     // 제목
		String msg = "";

		if(div.equals("findpw")) {
			subject = "임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberVo.getUser_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memberVo.getUser_pass() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = memberVo.getUser_mail();
		
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true); // SSL 사용
			//email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); // 네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setStartTLSEnabled(true); // TLS 사용
			//email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
	}

	@Override
	public void findPw(HttpServletResponse resp, MemberVo memberVo) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		MemberVo memberDto1 = memberDao.mypage(memberVo.getUser_id()); // mypage꺼 재사용
		PrintWriter out = resp.getWriter();
		// 가입된 아이디가 없으면
		if(memberDao.idChk(memberVo.getUser_id()) == 0) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 전화번호가 아니면
		else if(!memberVo.getUser_phone().equals(memberDto1.getUser_phone())) {
			out.print("등록되지 않은 전화번호입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			memberVo.setUser_pass(pw);
			// 비밀번호 변경
			memberDao.updatePw(memberVo);
			// 비밀번호 변경 메일 발송
			sendEmail(memberVo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
		
	}	
		
	// 마이페이지
	@Override
	public MemberVo mypage(String user_id) {
		return memberDao.mypage(user_id);
	}

	@Override
	public void mypageUpdate(MemberVo memberDto) {
		memberDao.mypageUpdate(memberDto);
	}
	
	
	// DAO작업과 Mapper작업은 없음
	// Service에서 coolsms에 정보를 보내 coolsms에서 입력자 번호로 문자가 전송됨
	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		// coolsms 본인 API키 입력
//		String api_key = "NCSFGLWNPHJUTG1Q";
		// coolsms 본인 API_secret키 입력
//		String api_secret = "ZK5DEEDCXR0T6LXJDNQCVCAUYZ1BMHA6";
		String api_key = "NCS9HI923SUSM5VF";
		String api_secret = "XLQEOJRXNGAIUHIFRGX5VUTCHEJV7D8N";
		Message coolsms = new Message(api_key, api_secret);
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); // 수신전화번호
		params.put("from", "010-9878-0502"); // 발신전화번호. 테스트시에는 발신, 수신 둘다 본인 번호로 하면됨
		params.put("type", "SMS");
		params.put("text", "인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		}catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	// Service에서 coolsms에 정보를 보내 coolsms에서 입력자 번호로 문자가 전송됨
	@Override
	public void sendContact(String userPhoneNumber) {
		// coolsms 본인 API키 입력
//		String api_key = "NCSFGLWNPHJUTG1Q";
		// coolsms 본인 API_secret키 입력
//		String api_secret = "ZK5DEEDCXR0T6LXJDNQCVCAUYZ1BMHA6";
		String api_key = "NCS9HI923SUSM5VF";
		String api_secret = "XLQEOJRXNGAIUHIFRGX5VUTCHEJV7D8N";
		Message coolsms = new Message(api_key, api_secret);
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); // 수신전화번호
		params.put("from", "010-9878-0502"); // 발신전화번호. 테스트시에는 발신, 수신 둘다 본인 번호로 하면됨
		params.put("type", "SMS");
		params.put("text", "노무사 상담 연결을 신청했습니다.\n"+ "["+userPhoneNumber+"]"); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		}catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}





}
