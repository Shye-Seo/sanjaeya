package com.service.unix.memberService;

import java.util.Map;

public interface MemberService {

	// 회원 가입
	public int memInsert(Map<String, String> map);
	
	// 아이디 중복체크
	public int idChk(String user_id);
	
	// 휴대폰 인증
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);
}
