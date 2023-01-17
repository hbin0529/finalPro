package com.house.kh.interrior.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InterriorController {
	
	
	@RequestMapping("interrior.in")
	public String interrior() {
		return "interrior/interriorMain";
	}
	
	
	
	
}
