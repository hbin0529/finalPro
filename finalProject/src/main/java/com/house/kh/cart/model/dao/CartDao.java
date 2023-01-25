package com.house.kh.cart.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.cart.model.vo.Cart;
import com.house.kh.common.model.vo.PageInfo;
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
	public ArrayList<Cart> selectProList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		
		return (ArrayList)sqlSession.selectList("cartMapper.selectProList", null, rowBounds);
	}
	
	/*
	 * //셀러페이지>클릭시 조회수올리기 public int increaseCount(SqlSessionTemplate sqlSession,
	 * int proNo) { return sqlSession.update("cartMapper.increaseProCount", proNo);
	 * }
	 * 
	 * //셀러페이지>클릭시 디테일보여주기 public Cart selectProBoard(SqlSessionTemplate sqlSession,
	 * int proNo) { return sqlSession.selectOne("cartMapper.selectProBoard", proNo);
	 * }
	 */
}
