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
	
	//체크리스트 시작 화면(과로, 뇌, 심장)
	@RequestMapping("Checklist_s1")
	public String checklistCategory_1(CheckCategoryVo categoryVo, Model model) {
		
		List<CheckCategoryVo> checkCategory =checkService.categoryName();	
		model.addAttribute("category", checkCategory);	
				
		return "diagnosis_start_1";
	}
	
	//체크리스트 시작 화면(직업성 암)
	@RequestMapping("Checklist_s2")
	public String checklistCategory_2(CheckCategoryVo categoryVo, Model model) {
		
		List<CheckCategoryVo> checkCategory =checkService.categoryName();	
		model.addAttribute("category", checkCategory);	
				
		return "diagnosis_start_2";
	}
	
	//체크리스트 시작 화면(근골격계 질환)
	@RequestMapping("Checklist_s3")
	public String checklistCategory_3(CheckCategoryVo categoryVo, Model model) {
		
		List<CheckCategoryVo> checkCategory =checkService.categoryName();	
		model.addAttribute("category", checkCategory);	
				
		return "diagnosis_start_3";
	}

	//체크리스트 진단 화면(과로, 뇌, 심장)
	@RequestMapping("Checklist_1")
	public String checklist_1(CheckCategoryVo categoryVo, Model model) {
		
		List<CheckCategoryVo> checkCategory =checkService.categoryName();		
		model.addAttribute("category", checkCategory);
		
		System.out.println(checkCategory.get(0)+"000000000000");	
				
		return "diagnosis_1";
	}
	
	//체크리스트 진단 화면(직업성 암)
	@RequestMapping("Checklist_2")
	public String checklist_2(CheckCategoryVo categoryVo, Model model) {
		
		List<CheckCategoryVo> checkCategory =checkService.categoryName();		
		model.addAttribute("category", checkCategory);
		
		System.out.println(checkCategory.get(1)+"111111111111");	
				
		return "diagnosis_2";
	}
	
	//체크리스트 진단 화면(근골격계 질환)
	@RequestMapping("Checklist_3")
	public String checklist_3(CheckCategoryVo categoryVo, Model model) {
		
		List<CheckCategoryVo> checkCategory =checkService.categoryName();		
		model.addAttribute("category", checkCategory);
		
		System.out.println(checkCategory.get(2)+"222222222222");	
				
		return "diagnosis_3";
	}
}
