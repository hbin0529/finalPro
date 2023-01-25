package com.house.kh.order.controller;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.house.kh.member.model.service.MemberService;
import com.house.kh.member.model.vo.Member;
import com.house.kh.order.model.service.OrderService;
import com.house.kh.order.model.vo.Order;
import com.house.kh.seller.model.vo.Seller;
import com.house.kh.storeBoard.model.vo.Product;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	@Autowired
	private MemberService mService;
	
	
	// 주문결제페이지 이동
	// 상품 정보 p에 담음
	@RequestMapping("order.or")
	public String order(Member m, Product p, Model model, String colorSelect, int countSelect, HttpSession session) {
		m = (Member) session.getAttribute("m");
		System.out.println(m);
		model.addAttribute("p", p);
		model.addAttribute("colorSelect", colorSelect);
		model.addAttribute("countSelect", countSelect);
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
		
		System.out.println(o);
		
		int orderSheetResult = oService.orderSheet2(o);
		oService.payUserPoint(o); 
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
	public String sellerOrderList(int selNo, Model model,ModelAndView mv, Order order) {
		System.out.println("메소드 실행 전");
		/*
		Order orderListCount = oService.orderListCount(selNo);
		System.out.println(orderListCount.getAaa());
		System.out.println("메소드 실행 후");
		System.out.println(orderListCount);
		*/
		ArrayList<Order> getSellersOrderList = oService.sellersOrderList(selNo);
		//model.addAttribute("orderListCount", orderListCount);
		model.addAttribute("o", getSellersOrderList);
		return "order/orderDetailView";
		
		
	}
	
		
	
	@ResponseBody
	@RequestMapping("getStatistics.or")
	public ArrayList<Order> getStat(int selNo, Model model) {
		
		ArrayList<Order> stats = oService.getStatistics(selNo);
		
		/*
		for(int i = 0; i < stats.size(); i++) {
			if(stats.get(i).getOrdStatus().equals("F")) {
				model.addAttribute("fcount", stats.get(i).getStatCount());
				model.addAttribute("fprice", stats.get(i).getStatPrice());
			}
			if(stats.get(i).getOrdStatus().equals("N")) {
				model.addAttribute("Ncount", stats.get(i).getStatCount());
				model.addAttribute("Nprice", stats.get(i).getStatPrice());
			}
			if(stats.get(i).getOrdStatus().equals("Y")) {
				model.addAttribute("Ycount", stats.get(i).getStatCount());
				model.addAttribute("Yprice", stats.get(i).getStatPrice());
			}
		}
		*/
		
		return stats;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("orderConfirm.or")
	public String orderConfirm(Order o, Model model) {
		//먼저 여분의 재고가 있는지부터 확인
		boolean isThereStock = oService.isThereStock(o);
		if(isThereStock) {
			//있으면 if문을 이용해서 주문처리('Y', 오더디테일) 하고 재고 업데이트(stock, 프로덕트), 판매자한테 포인트 전달(셀러베이스)
			oService.processOrderConfirm(o);
			return "redirect:/sellerOrderList.or?selNo="+o.getSelNo();
		}
		model.addAttribute("alertMsg", "재고 수량이 부족합니다.");
		return "redirect:/sellerOrderList.or?selNo="+o.getSelNo();
	}
	

	
	@RequestMapping("orderCancel.or")
	public String orderCancel(Order o) {
		//주문취소처리하고('F', 오더디테일) 포인트 일반회원구매자한테 돌려주기(멤버베이스)
		//아직 멤버가 결제할떄 포인트 안빠지는 상태
		oService.orderCancel(o);
		return "redirect:/sellerOrderList.or?selNo="+o.getSelNo();
	}
	
	
	@RequestMapping("searchResult.or")
	public String search() {
		return "common/searchResult";
	}
	
	
	
	
	
 }
