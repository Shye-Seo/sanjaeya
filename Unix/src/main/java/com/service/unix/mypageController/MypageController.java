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
		
		mypageservice.create(mypagevo);
		return "redirect:/MyPage";
	} 
	
	@RequestMapping(value="Updatememo.do", method=RequestMethod.POST)
	public String updatememo(@ModelAttribute MypageVo mypagevo) throws Exception {
		
		mypageservice.update(mypagevo);
		return "redirect:/MyPage";
	}
	  
	@RequestMapping(value="Delmemo.do", method=RequestMethod.GET)
	public String deletememo(@ModelAttribute MypageVo mypagevo) throws Exception {
		
		System.out.println("이게 실행된다면 함수 실행을 했다는 의미이다. 만약에 되지 않는다면.. 실행이 되지 않았다는 것이고. 근데 실행이 안 될 이유는 없어 보이는데.. 그럼 뭘까? 텍스트 부분에서 문제가 생긴다는 의미 아닐까?");
		mypageservice.delete(mypagevo);
		return "redirect:/MyPage";
	}
	
}
