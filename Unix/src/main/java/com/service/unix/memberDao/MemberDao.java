package com.service.unix.memberDao;

import java.util.Map;

import com.service.unix.memberVo.MemberVo;

public interface MemberDao {

	// 회원 가입
	public int memInsert(Map<String, String> map);
	
	// 아이디 중복체크
	public int idChk(String user_id);
	
	// 로그인할때 회원확인
	public boolean loginCheck(MemberVo memberVo);
	
	// 로그인할때 회원정보 가져올때
	public MemberVo viewMember(MemberVo memberVo);
	
	// 아이디 찾기
	public MemberVo findId(String user_mail) throws Exception;
	
	public int findIdCheck(String user_mail) throws Exception;
	
	// 비밀번호 찾기
	public int findPwCheck(MemberVo MemberVo)throws Exception; 
	
	public int findPw(String user_mail, String user_id, String user_pass)throws Exception;
	

	// 마이페이지 폼
	public MemberVo mypage(String user_id);
	
	// 마이페이지 수정
	public void mypageUpdate(MemberVo memberVo);
}
