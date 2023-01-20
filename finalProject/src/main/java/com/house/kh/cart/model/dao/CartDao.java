package com.house.kh.cart.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.cart.model.vo.Cart;
import com.house.kh.storeBoard.model.vo.Product;

@Repository
public class CartDao {
	
	public int selectCartListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("cartMapper.selectCartListCount");
	}
	
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("cartMapper.selectCartList");
	}
	
	public int insertCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.insert("cartMapper.insertCart", cart);
	}
	
	public int cartDelete(SqlSessionTemplate sqlSession,  int cartNo) {
		return sqlSession.update("cartMapper.cartDelete", cartNo); 
	}
	
	//셀러페이지 상품리스트 카운트
	public int selectProListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("cartMapper.selectProListCount");
	}

	//셀러페이지 상품리스트
	public ArrayList<Cart> selectProList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("cartMapper.selectProList");
	}
	
}
