package com.service.unix.mypageController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.service.unix.memberVo.MemberVo;
import com.service.unix.mypageService.MypageService;

import java.time.LocalDate;
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
	LocalDate now = LocalDate.now();
	int year = now.getYear();
	int month = now.getMonthValue();
	int tmp_year, tmp_month; // 메모 추가, 삭제할 때 해당 월로 이동
	String default_year=Integer.toString(this.year);;
	
	@RequestMapping(value="MyPage", method=RequestMethod.GET)
	public ModelAndView boardList(@ModelAttribute MemberVo membervo, HttpSession session, Criteria criteria
			,@RequestParam(value="year", required=false, defaultValue="2022") int year
			,@RequestParam(value="month", required=false, defaultValue="11") int month) throws Exception {
		
		// DB 맵핑을 위해 연월 우선 처리
		if(this.month > month) { // 이전 연월 처리 
			if(month==0) {
				year-=1;
				month=12;
			}
		}
		else { // 다음 연월 처리 
			if(month==13) {
				year+=1;
				month=1;
			}
		}
		
		// 필요한 사전 작업(변수 선언 등) 
		HashMap<String, Object> map = new HashMap<String, Object>();
		String str = (String) session.getAttribute("user_id");
		// 1차 put
		map.put("writer", str);
		map.put("year", year);
		map.put("month", month);
		
		// model 선언
		ModelAndView model = new ModelAndView();
		model.setViewName("mypage");
		
		// 페이징 설정 
		makerPaging.setCri(criteria); 
		makerPaging.setTotalCount(mypageservice.count(map));
		
		criteria.setPage(criteria.getPageStart());
		model.addObject("makerpaging", makerPaging);
		
		// boardlist 불러오기 위해 필요한 값들을 map에 추가 
		map.put("page", criteria.getPage());
		map.put("perPageNum", criteria.getPerPageNum());

		
		// 조건에 맞게 메모장 리스트 DB에 요청 
		List<MypageVo> boardList = mypageservice.listCriteria(map);
		
		// model에 String-Object 쌍 생성
		model.addObject("boardList", boardList);
		model.addObject("user_id", str);
		model.addObject("year", year);
		model.addObject("month", month);
		
		this.tmp_year=year;
		this.tmp_month=month;
		return model;
	}
	 
	@RequestMapping(value="Addmemo.do", method=RequestMethod.POST) 
	public String addmemo(@ModelAttribute MypageVo mypagevo) throws Exception {
		
		mypagevo.setContent(mypagevo.getContent().replace("\r\n", "<br/>"));
		
		mypageservice.create(mypagevo);
		return "redirect:/MyPage?year="+this.tmp_year+"&month="+this.tmp_month;
	}
	
	@GetMapping("Readmemo.do")
	public String readmemo(@RequestParam("id") int id, Model model) throws Exception {
		
		//mypagevo = mypageservice.read(id);
		model.addAttribute("update_board", mypageservice.read(id));
		
		return "update_memo";
	}
	
	@RequestMapping(value="Updatememo.do", method=RequestMethod.POST)
	public String updatememo(@ModelAttribute MypageVo mypagevo) throws Exception {
		
		mypagevo.setContent(mypagevo.getContent().replace("\r\n", "<br/>"));
		mypageservice.update(mypagevo);
		return "redirect:/MyPage";
	}

	@RequestMapping(value="Delmemo.do", method=RequestMethod.GET)
	public String deletememo(@ModelAttribute MypageVo mypagevo) throws Exception {
		
		System.out.println("삭제 작동 여부 확인");
		mypageservice.delete(mypagevo);
		
		return "redirect:/MyPage?year="+this.tmp_year+"&month="+this.tmp_month;
	}
}
