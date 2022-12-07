package com.service.unix;


import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.service.unix.boardService.BoardService;
import com.service.unix.boardVo.BoardVo;
import com.service.unix.boardVo.LibraryVo;
import com.service.unix.memberService.MemberService;
import com.service.unix.memberVo.MemberVo;



@Controller
public class HomeController {
	@Inject
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	BoardService service;
	
	@RequestMapping("/Home")
	public String home(Locale locale, Model model, BoardVo boardvo, LibraryVo libraryvo) throws Exception {
		
		List<BoardVo> board_list = service.getmainBoard();
		model.addAttribute("board_list", board_list);
		
		List<LibraryVo> library_list = service.getmainLibrary();
		model.addAttribute("library_list", library_list);
		
		return "home";
	}
	
	@RequestMapping("MemInsert") // 회원가입 페이지
	public String meminsert() {
		return "/join";
	}
	
	@RequestMapping("MemInsertProc") // 회원가입 처리
	public String meminsertProc(MemberVo memberVo) {
		Map<String, String> map = new HashMap<>();
		
		map.put("user_id", memberVo.getUser_id());
		map.put("user_name", memberVo.getUser_name());
		map.put("user_pass", memberVo.getUser_pass());
		map.put("user_phone", memberVo.getUser_phone());
		map.put("user_mail_id", memberVo.getUser_mail_id());
		map.put("user_mail_domain", memberVo.getUser_mail_domain());
		
		memberService.memInsert(map);
		
		return "/home";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="idChk", method=RequestMethod.POST)
	public int idChk(@RequestParam("user_id") String user_id) {
		return memberService.idChk(user_id);
	}
	
	@RequestMapping("Login") // 로그인 페이지
	public String login() {
		return "/login";
	}
	
	// 로그인 처리
	@RequestMapping("LoginProc")
	public ModelAndView loginCheck(@ModelAttribute MemberVo memberVo, HttpSession session) {
		boolean result = memberService.loginCheck(memberVo, session);
		ModelAndView mav = new ModelAndView();
		
		if(result == true) { // 로그인 성공
			// home.jsp로 이동
			System.out.println("로그인성공");
			session.setAttribute("user_id", memberService.viewMember(memberVo).getUser_id());			
			mav.setViewName("home");
			mav.addObject("msg", "succcess");
		}else { // 로그인 실패
			System.out.println("로그인실패");
			mav.setViewName("login");
			mav.addObject("msg", "failure");
		}
		
		return mav;
	}
	
	// 아이디 찾기 페이지인 findIdView 컨트롤러
	@RequestMapping(value="find_ID", method=RequestMethod.GET)
	public String findIdView() throws Exception {
		return "findID_PASS";
	}
	
	// 아이디 찾기 로직인 findId
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String findId(MemberVo memberVo, Model model) throws Exception {
		System.out.println(memberVo.getUser_phone()+"222222222222");
		
		if(memberService.findIdCheck(memberVo.getUser_phone()) == 0) {
			System.out.println(memberVo.getUser_phone()+"3333333333333");
			// // count한 값이 0이면 아이디찾기 페이지로 msg라는 String값을 보낸다
			model.addAttribute("msg", "없는 전화번호 입니다.");
			return "findID_PASS";
		}else {
			model.addAttribute("member", memberService.findId(memberVo.getUser_phone()));
			return "findId";
		}
	}
	
	/* 비밀번호 찾기 */
	@RequestMapping(value = "find_PASS", method = RequestMethod.GET)
	public String findPwGET() throws Exception{
		return "findID_PASS";
	}

	@RequestMapping(value = "findPw", method = RequestMethod.POST)
	public String findPwPOST(@ModelAttribute MemberVo memberVo, HttpServletResponse response, Model model) throws Exception{
		System.out.println(memberVo.getUser_phone()+"222222222222");
		System.out.println(memberVo.getUser_id()+"333333333333");
		
		if(memberService.findIdCheck(memberVo.getUser_id()) == 0) {
			// count한 값이 0이면 아이디찾기 페이지로 msg라는 String값을 보낸다
			model.addAttribute("msg", "없는 아이디 입니다.");
			return "findID_PASS";
		}else {
			model.addAttribute("member", memberService.findId(memberVo.getUser_phone()));
			model.addAttribute("id", memberVo.getUser_id());
			System.out.println(memberVo.getUser_id()+"444444444444");
			return "resetPw";
		}
//		memberService.findPw(response, memberVo);
	}
	
	/* 비밀번호 다시 설정 */
	@RequestMapping(value = "PassReset", method = RequestMethod.GET)
	public String PassReset(MemberVo memberVo) throws Exception {
		memberService.updatePw(memberVo);
		return "redirect:login";
	}
	
	// 로그아웃 처리
	@RequestMapping("Logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "home";
	}
	
	@RequestMapping("MyPage") // 마이페이지
	public String mypage(HttpSession session, Model model) {
		
		return "/mypage";
	}
	
	// 내 회원정보 수정
	@RequestMapping("MyPageUpdate.do")
	public String myPageUpdate(MemberVo memberVo, HttpSession session) {
		
		memberService.mypageUpdate(memberVo);
		session.invalidate();
		
		return "/";
		
	}

	
	// 이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("mailMerge") String mailMerge) throws Exception{
	    int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
	    
	    String from = "algo0426@naver.com"; // 보내는 이 메일주소
	    String to = mailMerge;
	    String title = "회원가입시 필요한 인증번호 입니다.";
	    String content = "[인증번호] " + serti + " 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
	    String num = "";
	    try {
	    	MimeMessage mail = mailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
	        
	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(title);
	        mailHelper.setText(content, true);       
	        
	        mailSender.send(mail);
	        num = Integer.toString(serti);
	        
	    } catch(Exception e) {
	        num = "error";
	    }
	    return num;
	}
	
	// 휴대폰인증
	@RequestMapping(value = "phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("user_phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random() *(9999 - 1000 +1)) + 1000); // 난수 생성
		
		memberService.certifiedPhoneNumber(userPhoneNumber, randomNumber);
		
		return Integer.toString(randomNumber);
	}


}
