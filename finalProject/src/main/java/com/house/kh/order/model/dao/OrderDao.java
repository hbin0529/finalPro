package com.house.kh.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.member.model.vo.Member;
import com.house.kh.order.model.vo.Order;
import com.house.kh.seller.model.vo.Seller;
import com.house.kh.storeBoard.model.vo.Product;

@Repository
public class OrderDao {
	
	public Member holdPoint(SqlSessionTemplate sqlSession, String o) {
		return sqlSession.selectOne("orderMapper.holdPoint", o);
	}

	public int orderSheet(SqlSessionTemplate sqlSession, Order o, Member m) {
		return sqlSession.selectOne("orderMapper.orderSheet");
	}
	
	public int orderSheet2(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.insert("orderMapper.orderSheet2", o);
	}
	
	public int orderSheetDetail(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.insert("orderMapper.orderSheetDetail", o);
	}
	

}
