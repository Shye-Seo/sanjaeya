package com.service.unix.checklistDao;

import java.util.HashMap;
import java.util.List;

import com.service.unix.checklistVo.CheckAnswerVo;
import com.service.unix.checklistVo.CheckCategoryVo;
import com.service.unix.checklistVo.CheckQuestionVo;

public interface ChecklistDao {

	// 체크리스트 카테고리 
	public List<CheckCategoryVo> categoryName();

	public List<CheckQuestionVo> questionName(int categoryNum);

	public List<CheckAnswerVo> answerName(int categoryNum);

	public List<Integer> selectAnswerPoint(int answerNum);

	public List<String> selectQuestionContents(int categoryNum);

	public Object insertTestUser(HashMap<String, Object> map);

	
}
