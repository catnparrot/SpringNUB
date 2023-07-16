package org.zerock.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	@GetMapping("/login")
	public String loginInput(String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);
		
		return "/customlogin";
	}
	
	@GetMapping("/logout.do")
	public String logoutGET() {
		log.info("log out");
		return "redirect:/";
	}
	
//	@GetMapping("/accessError")
//	public String accessDenied(Authentication auth, Model model) {
//		log.info("access Denied" + auth);
//		return "redirect:/";
//	}
}
