package com.house.kh.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class commonController {
	
	
	@RequestMapping("home.com")
	public String logoClick() {
		return "main";
	}
	
	
	
	
	
}
