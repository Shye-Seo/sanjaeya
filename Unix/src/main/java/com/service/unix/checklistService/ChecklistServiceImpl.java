package com.service.unix.checklistService;


import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.service.unix.checklistDao.ChecklistDaoImpl;
import com.service.unix.checklistVo.CheckCategoryVo;


@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class ChecklistServiceImpl implements ChecklistService{

	@Inject
	ChecklistDaoImpl checkDao;

	//체크리스트 카테고리
	@Override
	public List<CheckCategoryVo> categoryName() {
		
		return checkDao.categoryName();
	}
	



}
