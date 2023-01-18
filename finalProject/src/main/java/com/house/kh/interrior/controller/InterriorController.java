package com.house.kh.interrior.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.kh.interrior.model.service.InterriorService;
import com.house.kh.interrior.model.vo.Interrior;
import com.house.kh.member.model.service.MemberService;
import com.house.kh.seller.model.service.SellerService;
import com.house.kh.seller.model.vo.Seller;

@Controller
public class InterriorController {
	
	@Autowired
	private SellerService SService;
	
	@Autowired
	private InterriorService IService;
	
	@RequestMapping("interrior.in")
	public String interrior(Model model) {
		ArrayList<Seller> sellList = SService.getAllSeller();
		model.addAttribute("sellList", sellList);
		return "interrior/interriorMain";
	}
	
	@RequestMapping("interior_detail.in")
	public String interriorDetail(int selNo) {
		Interrior interriorInfo = IService.interriorInfo(selNo);
		return "interrior/interriorDetail";
	}
	
	
	
	
	
	
	
	
}
