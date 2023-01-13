package com.house.kh.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
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
}

