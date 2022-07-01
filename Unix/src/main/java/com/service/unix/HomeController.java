package com.service.unix;


import java.util.Locale;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {

	@RequestMapping("/")
	public String home(Locale locale, Model model) {

		return "home";
	}
	
	@RequestMapping("Login") // 로그인 페이지
	public String login() {
		return "/login";
	}
	
	@RequestMapping("MemInsert") // 회원가입 페이지
	public String join() {
		return "/join";
	}
	
	@RequestMapping("MyPage") // 마이페이지
	public String mypage() {
		return "/mypage";
	}
	

}
