package com.service.unix.memberService;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.service.unix.memberVo.MemberVo;


public interface MemberService {

	// 회원 가입
	public int memInsert(Map<String, String> map);
	
	// 아이디 중복체크
	public int idChk(String user_id);
	
	// 휴대폰 인증
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);
	
	// 로그인할때 회원확인
	public boolean loginCheck(MemberVo memberVo, HttpSession session);
	
	// 로그인할때 회원정보 가져올때
	public MemberVo viewMember(MemberVo memberDto);
}
