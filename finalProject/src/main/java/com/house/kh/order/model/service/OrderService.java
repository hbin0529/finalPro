package com.house.kh.order.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.member.model.vo.Member;
import com.house.kh.order.model.dao.OrderDao;
import com.house.kh.order.model.vo.Order;
import com.house.kh.seller.model.vo.Seller;
import com.house.kh.storeBoard.model.vo.Product;

@Service
public class OrderService {
	
	//객체 자동생성 변수 만들어주기
	@Autowired
	private OrderDao oDao;
	
	//객체 자동생성 변수 만들어주기
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	// 포인트충전 처리
	public int holdPoint(String o) {
		int holdPoint = oDao.holdPoint(sqlSession, o).getMemPoint();
		return holdPoint;
	}
	
	// 주문자 확인
	public int orderSheet(Order o, Member m, Seller s, Product p) {
		int searchOrder = oDao.orderSheet(sqlSession, o, m);
		return searchOrder; 
	}
	
	// 상품 가져오기
}
