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
}
