package com.service.unix.checklistService;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.service.unix.checklistDao.ChecklistDaoImpl;
import com.service.unix.checklistVo.CheckAnswerVo;
import com.service.unix.checklistVo.CheckCategoryVo;
import com.service.unix.checklistVo.CheckQuestionVo;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class ChecklistServiceImpl implements ChecklistService {

	@Inject
	ChecklistDaoImpl checkDao;

	// 체크리스트 카테고리
	@Override
	public List<CheckCategoryVo> categoryName() {
		return checkDao.categoryName();
	}

	// 체크리스트 질문
	@Override
	public List<CheckQuestionVo> questionName(int categoryNum) {
		return checkDao.questionName(categoryNum);
	}
	
	// 체크리스트 질문
	@Override
	public List<String> selectQuestionContents(int categoryNum) {
		return checkDao.selectQuestionContents(categoryNum);
	}
	
	// 체크리스트 답변
	@Override
	public List<CheckAnswerVo> answerName(int categoryNum) {

		return checkDao.answerName(categoryNum);
	}

	@Override
	public List<Integer> selectAnswerPoint(int answerNum) {
		return checkDao.selectAnswerPoint(answerNum);
	}

	//체크리스트 테스트 insert
	@Override
	public Object insertTestUser(HashMap<String, Object> map) {
		return checkDao.insertTestUser(map);
		
	}
	
	
}
