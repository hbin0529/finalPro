package com.house.kh.cart.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.cart.model.dao.CartDao;
import com.house.kh.cart.model.vo.Cart;
import com.house.kh.common.model.vo.PageInfo;
import com.house.kh.storeBoard.model.vo.Product;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Cart> selectCartList() {
		return cDao.selectCartList(sqlSession);
	}
	
	@Override
	public int insertCart(Cart cart) {
		return cDao.insertCart(sqlSession, cart);
	}

	@Override
	public int selectCartListCount() {
		return cDao.selectCartListCount(sqlSession);
	}

	@Override
	public int cartDelete(int cartNo) {
		return cDao.cartDelete(sqlSession, cartNo);
	}

	@Override
	public int selectProListCount() {
		return cDao.selectProListCount(sqlSession);
	}

	@Override
	public ArrayList<Cart> selectProList(PageInfo pi) {
		return cDao.selectProList(sqlSession, pi);
	}

	/*
	 * @Override public int increaseProCount(int proNo) { return
	 * cDao.increaseCount(sqlSession, proNo); }
	 * 
	 * @Override public Cart selectProBoard(int proNo) { return
	 * cDao.selectProBoard(sqlSession, proNo); }
	 */


}
