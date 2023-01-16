package com.house.kh.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.kh.order.model.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	// 주문결제페이지 이동
	@RequestMapping("order.or")
	public String order() {
		return "order/order";
	}
	
	// 충전페이지 이동
	@RequestMapping("charge.or")
	public String charge() {
		return "order/charge";
	}
	
	// 
	
	@ResponseBody
	@RequestMapping("showPoint.or")
	public int orderService(String userEmail) {
		return oService.holdPoint(userEmail);
	}
}

