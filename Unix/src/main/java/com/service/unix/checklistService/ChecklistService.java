package com.service.unix.checklistService;

import java.util.List;

import com.service.unix.checklistVo.CheckCategoryVo;

public interface ChecklistService {

	// 체크리스트 카테고리
	public List<CheckCategoryVo> categoryName ();
}
