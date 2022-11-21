package com.service.unix.memberService;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
	public MemberVo viewMember(MemberVo memberVo);
	
	// 아이디 찾기
	public MemberVo findId(String user_phone) throws Exception;
		
	public int findIdCheck(String user_phone) throws Exception;
	
	//비밀번호 찾기 아이디 체크
	public int findPASSIdCheck(String user_id) throws Exception;
	
	//이메일발송
	public void sendEmail(MemberVo memberVo, String div) throws Exception;
	
	// 비밀번호 찾기
	public void findPw(HttpServletResponse resp, MemberVo memberVo) throws Exception;
	//public void findPw(String user_mail, String user_id)throws Exception;
	//public int findPwCheck(MemberVo memberVo)throws Exception;
	
	// 회원 마이페이지 조회
	public MemberVo mypage(String user_id);
	
	public void mypageUpdate(MemberVo memberVo);

	//비밀번호 다시 설정
	public void updatePw(MemberVo memberVo) throws Exception;

}
