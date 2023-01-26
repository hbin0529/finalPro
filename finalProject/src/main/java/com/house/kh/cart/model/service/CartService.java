package com.house.kh.cart.model.service;

import java.util.ArrayList;

import com.house.kh.cart.model.vo.Cart;
import com.house.kh.common.model.vo.PageInfo;
import com.house.kh.storeBoard.model.vo.Product;

public interface CartService {

	// 장바구니 리스트 카운트
	int selectCartListCount();
	
	// 장바구니 리스트 
	ArrayList<Cart> selectCartList(); 
	
	// 장바구니 작성
	int insertCart(Cart cart);
	
	// 장바구니 삭제
	int cartDelete(int cartNo);
	
	// 셀러페이지 상품 카운트
	int selectProListCount(int selNo);
	
	// 셀러페이지 상품리스트
	ArrayList<Cart> selectProList(PageInfo pi, int selNo); 
	
	/*
	 * // 게시글 상세조회 int increaseProCount(int proNo); //조회수올리기 Cart selectProBoard(int
	 * proNo);
	 */
}
