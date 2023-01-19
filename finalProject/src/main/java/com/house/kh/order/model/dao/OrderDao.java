package com.house.kh.order.model.dao;

import java.util.ArrayList;

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
	
	public void insertDetail(SqlSessionTemplate sqlSession, Order o) {
		sqlSession.insert("orderMapper.insertDetail", o);
	}
	
	
	public ArrayList<Order> sellersOrderList(SqlSessionTemplate sqlSession, int selNo){
		return (ArrayList)sqlSession.selectList("orderMapper.sellersOrderList", selNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public boolean isThereStock(SqlSessionTemplate sqlSession, Order o) {
		int result = sqlSession.selectOne("orderMapper.isThereStock", o);
		System.out.println(result);
		//남은수량 꺼낸게 result, 이게 주문하려는 수량보다 크면 통과 아니면 false
		if(result > o.getOrdCount()) {
			return true;
		}else {
			return false;
		}
	}
	
	
}
