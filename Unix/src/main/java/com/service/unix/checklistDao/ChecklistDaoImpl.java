package com.service.unix.checklistDao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.service.unix.checklistVo.CheckAnswerVo;
import com.service.unix.checklistVo.CheckCategoryVo;
import com.service.unix.checklistVo.CheckQuestionVo;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class ChecklistDaoImpl implements ChecklistDao {

	
	@Autowired
	private SqlSession sqlSession; // mybatis 실행 객체

	//체크리스트 카테고리
	@Override
	public List<CheckCategoryVo> categoryName() {
		
		return sqlSession.selectList("checklist.selectCategory");
	}
	
	//체크리스트 질문
	@Override
	public List<CheckQuestionVo> questionName(int categoryNum) {

		return sqlSession.selectList("checklist.selectQuestion", categoryNum);
	}

	// 체크리스트 질문
	@Override
	public List<String> selectQuestionContents(int categoryNum) {

		return sqlSession.selectList("checklist.selectQuestionContents", categoryNum);
	}

	// 체크리스트 답변
	@Override
	public List<CheckAnswerVo> answerName(int categoryNum) {
		
		return sqlSession.selectList("checklist.selectAnswer", categoryNum);
	}
	
	//체크리스트 답변 점수(Point)
	   @Override
	   public List<Integer> selectAnswerPoint(int answerNum) {
	      
	      return sqlSession.selectList("checklist.selectAnswerPoint", answerNum);
	   }

	//체크리스트 테스트 insert
	public Object insertTestUser(HashMap<String, Object> map) {
		 return sqlSession.selectList("checklist.insertTest", map);
	}
	
	   

}
