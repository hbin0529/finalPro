package com.house.kh.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "member/loginForm";
	}
}
