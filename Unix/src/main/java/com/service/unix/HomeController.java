package com.service.unix;


import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
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

import com.service.unix.memberService.MemberService;
import com.service.unix.memberVo.MemberVo;



@Controller
public class HomeController {
	@Inject
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	

	@RequestMapping("/")
	public String home(Locale locale, Model model) {

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
		
		return "/";
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
	@RequestMapping(value="findIdView.do", method=RequestMethod.GET)
	public String findIdView() throws Exception {
		return "findIdView";
	}
	
	// 아이디 찾기 로직인 findId
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String findId(MemberVo memberVo, Model model) throws Exception {
		System.out.println(memberVo.getUser_mail_id());
		System.out.println(memberVo.getUser_mail_domain());
		
		if(memberService.findIdCheck(memberVo.getUser_mail_id()+"@"+memberVo.getUser_mail_domain()) == 0) {
			// count한 값이 0이면 아이디찾기 페이지로 msg라는 String값을 보낸다
			model.addAttribute("msg", "없는 이메일 입니다.");
			return "findIdView";
		}else {
			model.addAttribute("member", memberService.findId(memberVo.getUser_mail_id()+"@"+memberVo.getUser_mail_domain()));
			return "findId";
		}
	}
	
	// 로그아웃 처리
	@RequestMapping("Logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "home";
	}
	
	@RequestMapping("MyPage") // 마이페이지
	public String mypage(HttpSession session, Model model) {
		String user_id = (String)session.getAttribute("user_id");
		
		MemberVo memberVo = memberService.mypage(user_id);
		
		String mail = memberVo.getUser_mail();
		
		// 먼저 @ 의 인덱스를 찾는다        
		int idx = mail.indexOf("@");
		
		String mail_id = mail.substring(0, idx);
		String mail_domain = mail.substring(idx+1);
		
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("mail_id",mail_id);
		model.addAttribute("mail_domain",mail_domain);
		
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
	    
	    String from = "algo0426@naver.com";//보내는 이 메일주소
	    String to = mailMerge;
	    String title = "회원가입시 필요한 인증번호 입니다.";
	    String content = "[인증번호] "+ serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
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
