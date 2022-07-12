package com.service.unix.memberDao;

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
		return sqlSession.insert("memberMappers.insertMem",map);
	}

	// 아이디 중복 체크
	@Override
	public int idChk(String user_id) {
		return sqlSession.selectOne("memberMappers.idChk", user_id);
	}

	// 로그인할때 회원확인
	@Override
	public boolean loginCheck(MemberVo memberVo) {
		String name = sqlSession.selectOne("memberMappers.selectLoginMem",memberVo);
		
		return  (name == null) ? false : true;
	}

	// 로그인할때 회원정보 가져올때
	@Override
	public MemberVo viewMember(MemberVo memberVo) {
		return sqlSession.selectOne("memberMappers.viewMember",memberVo);
	}
}
