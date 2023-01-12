package com.house.kh.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	@RequestMapping("order.or")
	public String order() {
		return "order/order";
	}
	
	@RequestMapping("charge.or")
	public String charge() {
		return "order/charge";
	}
}

