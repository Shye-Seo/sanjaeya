package com.service.unix;

import java.util.HashMap;
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

import com.service.unix.memberService.MemberService;
import com.service.unix.memberVo.MemberVo;

@Controller
public class HomeController {
	@Inject
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/Home")
	public String home(Locale locale, Model model, BoardVo boardvo, LibraryVo libraryvo) throws Exception {
		
		List<BoardVo> board_list = service.getmainBoard();
		model.addAttribute("board_list", board_list);
		
		List<LibraryVo> library_list = service.getmainLibrary();
		model.addAttribute("library_list", library_list);
		
		return "home";
	}

	@RequestMapping("MemInsert") // �쉶�썝媛��엯 �럹�씠吏�
	public String meminsert() {
		return "/join";
	}

	@RequestMapping("MemInsertProc") // �쉶�썝媛��엯 泥섎━
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

	// �븘�씠�뵒 以묐났 泥댄겕
	@ResponseBody
	@RequestMapping(value = "idChk", method = RequestMethod.POST)
	public int idChk(@RequestParam("user_id") String user_id) {
		return memberService.idChk(user_id);
	}

	@RequestMapping("Login") // 濡쒓렇�씤 �럹�씠吏�
	public String login() {
		return "/login";
	}

	// 濡쒓렇�씤 泥섎━
	@RequestMapping("LoginProc")
	public ModelAndView loginCheck(@ModelAttribute MemberVo memberVo, HttpSession session) {
		boolean result = memberService.loginCheck(memberVo, session);
		ModelAndView mav = new ModelAndView();

		if (result == true) { // 濡쒓렇�씤 �꽦怨�
			// home.jsp濡� �씠�룞
			System.out.println("濡쒓렇�씤�꽦怨�");
			session.setAttribute("user_id", memberService.viewMember(memberVo).getUser_id());
			mav.setViewName("home");
			mav.addObject("msg", "succcess");
		} else { // 濡쒓렇�씤 �떎�뙣
			System.out.println("濡쒓렇�씤�떎�뙣");
			mav.setViewName("login");
			mav.addObject("msg", "failure");
		}

		return mav;
	}

	// �븘�씠�뵒 李얘린 �럹�씠吏��씤 findIdView 而⑦듃濡ㅻ윭
	@RequestMapping(value = "find_ID", method = RequestMethod.GET)
	public String findIdView() throws Exception {
		return "findID_PASS";
	}

	// �븘�씠�뵒 李얘린 濡쒖쭅�씤 findId
	@RequestMapping(value = "findId", method = RequestMethod.POST)
	public String findId(MemberVo memberVo, Model model) throws Exception {

		if (memberService.findIdCheck(memberVo.getUser_phone()) == 0) {
			// count�븳 媛믪씠 0�씠硫� �븘�씠�뵒李얘린 �럹�씠吏�濡� msg�씪�뒗 String媛믪쓣 蹂대궦�떎
			model.addAttribute("msg", "�뾾�뒗 �쟾�솕踰덊샇 �엯�땲�떎.");
			return "findID_PASS";
		} else {
			model.addAttribute("member", memberService.findId(memberVo.getUser_phone()));
			return "findId";
		}
	}

	/* 鍮꾨�踰덊샇 李얘린 */
	@RequestMapping(value = "find_PASS", method = RequestMethod.GET)
	public String findPwGET() throws Exception {
		return "findID_PASS";
//		return "resetPw";
	}

	@RequestMapping(value = "findPw", method = RequestMethod.POST)
	public String findPwPOST(@ModelAttribute MemberVo memberVo, HttpServletResponse response, Model model)
			throws Exception {

		if (memberService.findPASSIdCheck(memberVo.getUser_id()) == 0) {
			// count�븳 媛믪씠 0�씠硫� �븘�씠�뵒李얘린 �럹�씠吏�濡� msg�씪�뒗 String媛믪쓣 蹂대궦�떎
			model.addAttribute("msg", "�뾾�뒗 �븘�씠�뵒 �엯�땲�떎.");
			return "findID_PASS";
		} else {
//			model.addAttribute("member", memberService.findId(memberVo.getUser_phone()));
//			model.addAttribute("id", memberVo.getUser_id());
			model.addAttribute("member", memberService.findId(memberVo.getUser_phone()));
			return "resetPw";
		}
//		memberService.findPw(response, memberVo);
	}

	/* 鍮꾨�踰덊샇 �떎�떆 �꽕�젙 */
	@RequestMapping(value = "PassReset", method = RequestMethod.GET)
	public String PassReset(MemberVo memberVo) throws Exception {
		memberService.updatePw(memberVo);
		return "redirect:login";
	}

	// 濡쒓렇�븘�썐 泥섎━
	@RequestMapping("Logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "home";
	}

	@RequestMapping("MyPage") // 留덉씠�럹�씠吏�
	public String mypage(HttpSession session, Model model) {

		return "/mypage";
	}

	// �궡 �쉶�썝�젙蹂� �닔�젙
	@RequestMapping("MyPageUpdate.do")
	public String myPageUpdate(MemberVo memberVo, HttpSession session) {

		memberService.mypageUpdate(memberVo);
		session.invalidate();

		return "/";

	}

	// �씠硫붿씪 �씤利�
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("mailMerge") String mailMerge) throws Exception {
		int serti = (int) ((Math.random() * (99999 - 10000 + 1)) + 10000);

		String from = "algo0426@naver.com";// 蹂대궡�뒗 �씠 硫붿씪二쇱냼
		String to = mailMerge;
		String title = "�쉶�썝媛��엯�떆 �븘�슂�븳 �씤利앸쾲�샇 �엯�땲�떎.";
		String content = "[�씤利앸쾲�샇] " + serti + " �엯�땲�떎. <br/> �씤利앸쾲�샇 �솗�씤���뿉 湲곗엯�빐二쇱떗�떆�삤.";
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

		} catch (Exception e) {
			num = "error";
		}
		return num;
	}

	// �쑕���룿�씤利�
	@RequestMapping(value = "phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("user_phone") String userPhoneNumber) { // �쑕���룿 臾몄옄蹂대궡湲�
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000); // �궃�닔 �깮�꽦

		memberService.certifiedPhoneNumber(userPhoneNumber, randomNumber);

		return Integer.toString(randomNumber);
	}

	@RequestMapping("Board") // 濡쒓렇�씤 �럹�씠吏�
	public String board() {
		return "/boardlist";
	}

}
