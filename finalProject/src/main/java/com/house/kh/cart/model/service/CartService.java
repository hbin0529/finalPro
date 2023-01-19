package com.house.kh.cart.model.service;

import java.util.ArrayList;

import com.house.kh.cart.model.vo.Cart;

public interface CartService {

	// 장바구니 리스트 카운트
	int selectCartListCount();
	
	// 장바구니 리스트 
	ArrayList<Cart> selectCartList(); //어떤거 가져올지
	
	// 장바구니 작성
	int insertCart(Cart cart);
	
	
}
