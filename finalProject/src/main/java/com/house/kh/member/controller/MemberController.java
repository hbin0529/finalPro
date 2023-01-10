package com.house.kh.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
<<<<<<< HEAD
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "member/loginForm";
	}
=======
	
	
	@RequestMapping("login.me")
	public String login() {
		return "member/login";
	}
	
	
	
>>>>>>> 34c4edb2bfdf003b5a5ed9e90d5a5313265f2e10
}
