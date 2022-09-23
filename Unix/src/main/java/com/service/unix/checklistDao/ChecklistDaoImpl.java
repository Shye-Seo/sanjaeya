package com.service.unix.checklistDao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.service.unix.checklistVo.CheckCategoryVo;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class ChecklistDaoImpl implements ChecklistDao {

	
	@Autowired
	private SqlSession sqlSession; // mybatis 실행 객체

	//체크리스트 카테고리
	@Override
	public List<CheckCategoryVo> categoryName() {
		
		return sqlSession.selectList("checklist.selectCategory");
	}
	
	

}
