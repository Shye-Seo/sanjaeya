package com.service.unix.memberService;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.service.unix.memberDao.MemberDaoImpl;

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
	
	// DAO작업과 Mapper작업은 없음
	// Service에서 coolsms에 정보를 보내 coolsms에서 입력자 번호로 문자가 전송됨
	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		// coolsms 본인 API키 입력
		String api_key = "NCSFGLWNPHJUTG1Q";
		// coolsms 본인 API_secret키 입력
		String api_secret = "ZK5DEEDCXR0T6LXJDNQCVCAUYZ1BMHA6";
		Message coolsms = new Message(api_key, api_secret);
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); // 수신전화번호
		params.put("from", "010-4840-7522"); // 발신전화번호. 테스트시에는 발신, 수신 둘다 본인 번호로 하면됨
		params.put("type", "SMS");
		params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
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
