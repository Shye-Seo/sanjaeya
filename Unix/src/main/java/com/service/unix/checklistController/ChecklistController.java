package com.service.unix.checklistController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.unix.checklistService.ChecklistService;
import com.service.unix.checklistVo.CheckCategoryVo;

@Controller
public class ChecklistController {
	
	@Autowired
	ChecklistService checkService;
	
	//체크리스트 화면
	@RequestMapping("Checklist")
	public String checklist(CheckCategoryVo categoryVo, Model model) {
		
		List<CheckCategoryVo> checkCategory =checkService.categoryName();
		
		System.out.println(checkCategory.get(0)+"222222222222");
		
		model.addAttribute("category", checkCategory);
		
				
		return "check_1";
	}

}
