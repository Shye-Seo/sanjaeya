package com.service.unix.mypageController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.service.unix.memberVo.MemberVo;
import com.service.unix.mypageService.MypageService;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.service.unix.mypageVo.MypageVo;

@Controller
public class MypageController {
	
	@Autowired
	MypageService mypageservice;
	
	@RequestMapping(value="MyPage", method=RequestMethod.GET)
	public ModelAndView boardList(@ModelAttribute MemberVo membervo, HttpSession session) throws Exception {
		
		String str = (String) session.getAttribute("user_id");
		System.out.println(str);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("mypage");
		
		List<MypageVo> boardList = mypageservice.getBoardList(str);
		model.addObject("boardList", boardList);
		
		model.addObject("user_id", str);
		return model;
	}
	
	@RequestMapping(value="Addmemo.do", method=RequestMethod.POST) 
	public String addmemo(@ModelAttribute MypageVo mypagevo) throws Exception {
		
		mypageservice.create(mypagevo);
		return "redirect:/MyPage";
	}
	
	@RequestMapping(value="Delmemo.do")
	public String deletememo(@ModelAttribute MypageVo mypagevo) throws Exception {
		
		mypageservice.delete(mypagevo);
		return "redirect:/MyPage";
	}
	
	// 페이징 처리 
	public String listPage() throws Exception {
		
		return "";
	}
}
