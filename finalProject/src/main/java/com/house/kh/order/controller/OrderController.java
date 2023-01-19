package com.house.kh.order.controller;

import java.sql.Date;
import java.util.ArrayList;

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
		System.out.println(p);
		m.addAttribute("p", p);
		m.addAttribute("colorSelect", colorSelect);
		m.addAttribute("countSelect", countSelect);
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
	public String orderSheet2(Order o, Model model, HttpSession session) {
		//주문테이블에 추가
		/*
		o.setOrdEmail(ordEmail);
		o.setOrdDate(ordDate);
		o.setOrdZipcode(ordZipcode);
		o.setOrdAddr(ordAddr);
		o.setOrdDetailAddr(ordDetailAddr);
		o.setCusName(cusName);
		o.setCusPhone(cusPhone);
		o.setOrdRequest(ordRequest);
		*/
		
		
		System.out.println(o);
		
		int orderSheetResult = oService.orderSheet2(o);
		oService.insertDetail(o);
		/* int orderDetailSheetReulst = oService.orderSheet2(o); */
		if(orderSheetResult > 0) {
			model.addAttribute("alertMsg", "결제가 완료되었습니다.");
			return "order/orderDetailView";
		} else {
			model.addAttribute("alertMsg", "결제가 취소되었습니다.");
			return "main";
		}
		//주문상세 테이블에 추가
	}
	

	
	
	
	@RequestMapping("sellerOrderList.or")
	public String sellerOrderList(int selNo, Model model) {
		ArrayList<Order> getSellersOrderList = oService.sellersOrderList(selNo);
		model.addAttribute("o", getSellersOrderList);
		return "order/orderDetailView";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("orderConfirm.or")
	public String orderConfirm(Order o) {
		//먼저 여분의 재고가 있는지부터 확인
		//System.out.println(o);
		boolean isThereStock = oService.isThereStock(o);
		//System.out.println(isThereStock);
		
		
		//있으면 if문을 이용해서 주문처리('Y') 하고 재고 업데이트(stock), 판매자한테 포인트 전달
		return "redirect:/";
	}
	

	/*
	@RequestMapping()
	public String orderCancel(int orderNo) {
		return "redirect:/";
	}
	 */
	
}