package com.house.kh.order.controller;

import java.sql.Date;

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
		System.out.println(colorSelect);
		System.out.println(colorSelect);
		return "order/order";
		
	}
	
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
	public String orderSheet2(Order o, Model model, HttpSession session, String ordEmail, Date ordDate, String ordZipcode, String ordAddr, String ordDetailAddr, String cusName, String cusPhone, String ordRequest) {
		//주문테이블에 추가
		System.out.println(o);
		o.setOrdEmail(ordEmail);
		o.setOrdDate(ordDate);
		o.setOrdZipcode(ordZipcode);
		o.setOrdAddr(ordAddr);
		o.setOrdDetailAddr(ordDetailAddr);
		o.setCusName(cusName);
		o.setCusPhone(cusPhone);
		o.setOrdRequest(ordRequest);
		
		int orderSheetResult = oService.orderSheet2(o);
		/* int orderDetailSheetReulst = oService.orderSheet2(o); */
		if(orderSheetResult > 0) {
			model.addAttribute("alertMsg", "결제가 완료되었습니다.");
			return "order/orderDetailView";
		} else {
			return "";
		}
		//주문상세 테이블에 추가
		
		
	}
}

