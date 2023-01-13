package com.house.kh.charge.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.kh.charge.model.service.ChargeService;
import com.house.kh.charge.model.vo.Charge;

@Controller
public class ChargeController {
	
	@Autowired
	private ChargeService cService;
	
	@RequestMapping("pointCharge.or")
	public String pointCharge(Charge c, Model model, HttpSession session, int point) {
		String id = (String)session.getAttribute("id");
		c.setChargeEmail(id);
		System.out.println(id);
		c.setChargeAmount(point);
		
		
		int pointChargeResult = cService.pointCharge(c);
		int pointUpdateResult = cService.pointUpdate(c);
		
		if(pointChargeResult > 0) {
			model.addAttribute("alertMsg", "충전이 완료되었습니다.");
			return "order/chargeCallback";
		} else {			
			return "";
		}
	}
	
}
