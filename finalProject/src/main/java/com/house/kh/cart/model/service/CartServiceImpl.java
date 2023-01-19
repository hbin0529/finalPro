package com.house.kh.cart.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.cart.model.dao.CartDao;
import com.house.kh.cart.model.vo.Cart;

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

}
