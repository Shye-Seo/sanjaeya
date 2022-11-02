package com.service.unix.mypageController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.service.unix.memberVo.MemberVo;
import com.service.unix.mypageService.MypageService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.service.unix.mypageVo.Criteria;
import com.service.unix.mypageVo.MakerPaging;
import com.service.unix.mypageVo.MypageVo;

@Controller
public class MypageController {
	
	@Autowired
	MypageService mypageservice;
	MakerPaging makerPaging = new MakerPaging();
	
	@RequestMapping(value="MyPage", method=RequestMethod.GET)
	public ModelAndView boardList(@ModelAttribute MemberVo membervo, HttpSession session, Criteria criteria) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String str = (String) session.getAttribute("user_id");
		
		ModelAndView model = new ModelAndView();
		model.setViewName("mypage");
		
		makerPaging.setCri(criteria);
		makerPaging.setTotalCount(mypageservice.count(str));
		 
		criteria.setPage(criteria.getPageStart());
		model.addObject("makerpaging", makerPaging);
		 
		map.put("page", criteria.getPage());
		map.put("perPageNum", criteria.getPerPageNum());
		map.put("writer", str);
		List<MypageVo> boardList = mypageservice.listCriteria(map);
		model.addObject("boardList", boardList);
		model.addObject("user_id", str);
		
		return model;
	}  
	 
	@RequestMapping(value="Addmemo.do", method=RequestMethod.POST) 
	public String addmemo(@ModelAttribute MypageVo mypagevo) throws Exception {
		
		mypagevo.setContent(mypagevo.getContent().replace("\r\n", "<br/>"));
		
		mypageservice.create(mypagevo);
		return "redirect:/MyPage";
	} 
	
	@RequestMapping(value="Readmemo.do")
	public void readmemo(@RequestParam("id") int id, Model model) throws Exception {
		
		System.out.println("넘겨받은 id값 : " + id);
		model.addAttribute("update_board", mypageservice.read(id));
	}
	
	@RequestMapping(value="Updatememo.do", method=RequestMethod.POST)
	public String updatememo(@RequestParam("id") int id) throws Exception {
		
		mypageservice.update(id);
		return "redirect:/Mypage";
	}
 
	@RequestMapping(value="Delmemo.do", method=RequestMethod.GET)
	public String deletememo(@ModelAttribute MypageVo mypagevo) throws Exception {
		
		mypageservice.delete(mypagevo);
		return "redirect:/MyPage";
	}
}
