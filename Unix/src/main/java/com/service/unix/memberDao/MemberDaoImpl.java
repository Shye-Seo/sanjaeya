package com.service.unix.memberDao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.service.unix.memberVo.MemberVo;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class MemberDaoImpl implements MemberDao {

	// SqlSession 객체를 스프링에서 생성하여 주입
	// 의존관계 주입(Dependency Injection), 느슨한 결합
	
	@Autowired
	private SqlSession sqlSession; // mybatis 실행 객체
	
	
	// 회원 가입
	@Override
	public int memInsert(Map<String, String> map) {
		return sqlSession.insert("user.insertUser",map);
	}

	// 아이디 중복 체크
	@Override
	public int idChk(String user_id) {
		return sqlSession.selectOne("user.idChk", user_id);
	}

	// 로그인할때 회원확인
	@Override
	public boolean loginCheck(MemberVo memberVo) {
		String name = sqlSession.selectOne("user.selectLoginMem",memberVo);
		
		return  (name == null) ? false : true;
	}

	// 로그인할때 회원정보 가져올때
	@Override
	public MemberVo viewMember(MemberVo memberVo) {
		return sqlSession.selectOne("user.viewMember",memberVo);
	}
	
	// 아이디 찾기
	@Override
	public MemberVo findId(String user_phone) throws Exception {
		return sqlSession.selectOne("user.findId",user_phone);
	}

	@Override
	public int findIdCheck(String user_phone) throws Exception {
		return sqlSession.selectOne("user.findIdCheck",user_phone);
	}
	
	//비밀번호변경
	@Override
	public int updatePw(MemberVo memberVo) throws Exception {
		return sqlSession.update("user.updatePw",memberVo);
	}
	
	// 비밀번호 찾기
	@Override
	public int findPwCheck(MemberVo memberVo) throws Exception {
		return sqlSession.selectOne("user.findPwCheck", memberVo);
	}

	@Override
	public int findPw(String user_mail, String user_id, String user_pass) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("user_mail", user_mail);
		map.put("user_id", user_id);
		map.put("user_pass", user_pass);
		
		return sqlSession.update("user.findPw", map);
	}
	
	// 마이페이지
	@Override
	public MemberVo mypage(String user_id) {
		return sqlSession.selectOne("user.mypage",user_id);
	}

	@Override
	public void mypageUpdate(MemberVo memberVo) {
		sqlSession.update("user.mypageUpdate",memberVo);
	}


}
