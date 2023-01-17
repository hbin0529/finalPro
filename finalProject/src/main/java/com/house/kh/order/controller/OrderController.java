package com.house.kh.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.kh.member.model.vo.Member;
import com.house.kh.order.model.service.OrderService;
import com.house.kh.order.model.vo.Order;
import com.house.kh.seller.model.vo.Seller;
import com.house.kh.storeBoard.model.vo.Product;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	// 주문결제페이지 이동
	// 상품 정보 p에 담음
	@RequestMapping("order.or")
	public String order(Product p, Model m, String colorSelect, int countSelect) {
		m.addAttribute("p", p);
		m.addAttribute("colorSelect", colorSelect);
		m.addAttribute("countSelect", countSelect);
		return "order/order";
		
	}
	
	/*
	 * @RequestMapping("order.or") public String order(int proBlackStock) {
	 * proBlackStock = ; return "order/order"; }
	 */
	
	// 충전페이지 이동
	@RequestMapping("charge.or")
	public String charge() {
		return "order/charge";
	}
	
	// 상품 보여주기

	
	// 보유포인트 확인
	@ResponseBody
	@RequestMapping("showPoint.or")
	public int orderService(String userEmail) {
		return oService.holdPoint(userEmail);
	}
	
	@RequestMapping("orderSheet.or")
	public String selectOrder(Order o, Model model, HttpSession session) {
		System.out.println("asdasd");
		Member m = (Member)session.getAttribute("m");
		Product p = (Product)session.getAttribute("p");
		Seller s = (Seller)session.getAttribute("s");
		System.out.println(m);
		System.out.println(p);
		return "";
	}
}

