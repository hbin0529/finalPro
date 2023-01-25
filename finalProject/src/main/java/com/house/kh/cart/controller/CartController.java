package com.house.kh.cart.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.house.kh.cart.model.service.CartService;
import com.house.kh.cart.model.vo.Cart;
import com.house.kh.common.model.vo.PageInfo;
import com.house.kh.common.template.Pagination;
import com.house.kh.member.model.vo.Member;
import com.house.kh.seller.model.vo.Seller;
import com.house.kh.storeBoard.model.vo.Product;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	/* 카트 리스트 불러오기 */
	@RequestMapping("cartlist.ca")
	public ModelAndView selectCartList(Cart cart, ModelAndView mv, Model model, HttpSession session, Seller s, Member m) {
		m = (Member) session.getAttribute("m");
		s = (Seller) session.getAttribute("s");
		int cartCount = 0;
		ArrayList<Cart> list = new ArrayList<Cart>();
		list = cartService.selectCartList();
		cartCount = cartService.selectCartListCount();
		mv.addObject("list", list);
		model.addAttribute("cartCount", cartCount);
		mv.setViewName("myPage/myPageCartListView");
		return mv;
	}

	/* 카트 담기 */
	@RequestMapping("cartInsert.ca")
	public String insertCart(Product p, Cart cart, HttpSession session, Model model, HttpServletResponse response) {
		int result = cartService.insertCart(cart);
		if (result > 0) {
			session.setAttribute("alertMsg", "장바구니에 추가되었습니다");
			return "redirect:productdetail.bo?pno=" + p.getProNo();
		} else {
			model.addAttribute("errorMsg", "장바구니 추가 실패");
			return "common/errorPage";
		}
	}

	/* 카트 삭제하기 */
	@RequestMapping("cartDelete.ca")
	public String cartDelete(int cartNo, Model model, HttpSession session) {
		int result = cartService.cartDelete(cartNo);
		if (result > 0) {
			session.setAttribute("alertMsg", "장바구니에서 삭제되었습니다");
			return "redirect:cartlist.ca";
		} else {
			model.addAttribute("errorMsg", "장바구니 삭제실패");
			return "common/errorPage";
		}
	}

	/* 셀러페이지 상품리스트 */
	@RequestMapping("sellerProduct.se")
	public ModelAndView selectList(@RequestParam(value="cpage" , defaultValue="1")int nowPage, Cart cart, ModelAndView mv, Model model) {
		int listCount = cartService.selectProListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 12);
		ArrayList<Cart> list = cartService.selectProList(pi);

		mv.addObject("pi", pi);
		mv.addObject("list", list);
		model.addAttribute("listCount", listCount);
		mv.setViewName("sellerPage/sellerPageProduct");

		return mv;
	}

	/*
	 * 상품디테일정보 불러오기
	 * 
	 * @RequestMapping("productdetailseller.bo") public ModelAndView
	 * selectProBoard(int proNo, ModelAndView mv) {
	 * 
	 * int result = cartService.increaseProCount(proNo); if (result > 0) { Cart cart
	 * = cartService.selectProBoard(proNo); mv.addObject("cart",
	 * cart).setViewName("storeBoard/storeBoardDetailView"); } else {
	 * mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage"); } return
	 * mv; }
	 */
}
