package com.service.unix.memberDao;

import java.util.Map;

public interface MemberDao {

	// 회원 가입
	public int memInsert(Map<String, String> map);
	
	// 아이디 중복체크
	public int idChk(String user_id);
}
