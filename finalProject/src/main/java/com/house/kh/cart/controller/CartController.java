package com.house.kh.cart.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.house.kh.cart.model.service.CartService;
import com.house.kh.cart.model.vo.Cart;
import com.house.kh.storeBoard.model.vo.Product;

@Controller
public class CartController {
	
	@Autowired
	   private CartService cartService;

   /* 카트 리스트 불러오기 */
   @RequestMapping("cartlist.ca")
   public ModelAndView selectCartList(Cart cart, ModelAndView mv, Model model) {
      ArrayList<Cart> list = new ArrayList<Cart>();
      	 System.out.println(list);
         list = cartService.selectCartList();

      mv.addObject("list", list);
      mv.setViewName("myPage/myPageCartListView");
      
      return mv;
   }
   
   @RequestMapping("cartInsert.ca")
   public String insertCart(Product p, Cart cart, HttpSession session, Model model, HttpServletResponse response) {
	   
	   int result = cartService.insertCart(cart);
	   if(result > 0) {
		   session.setAttribute("alertMsg", "장바구니에 추가되었습니다");
	       return "redirect:productdetail.bo?pno="+p.getProNo();
	   } else {
	         model.addAttribute("errorMsg" , "장바구니 추가 실패");
	         return "common/errorPage";
	   }
   
   }

}

   
   
   
   
   



