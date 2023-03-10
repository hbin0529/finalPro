package com.house.kh.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.homeBoard.model.vo.HomeBoard;
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
	public int orderSheet2(Order o) {
		int orderSheet2 = oDao.orderSheet2(sqlSession, o);
		return orderSheet2; 
	}
	// 주문 상세 물건 수량 확인 
	public int orderSheetDetail(Order o) {
		int orderSheetDetail = oDao.orderSheetDetail(sqlSession, o);
		return orderSheetDetail; 
	}

	
	public void insertDetail(Order o) {
		oDao.insertDetail(sqlSession, o);
	}
	
	
	public ArrayList<Order> sellersOrderList(int selNo){
		return oDao.sellersOrderList(sqlSession, selNo);
	}
	
	public ArrayList<Order> usersOrderList(String id){
		return oDao.usersOrderList(sqlSession, id);
	}
	 
	
	// 상품 가져오기
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//통계
	public ArrayList<Order> getStatistics(int selNo) {
	
		ArrayList<Order> stats = oDao.getStatistics(sqlSession, selNo);
		return stats;
	}
	
	
	public boolean isThereStock(Order o) {
		boolean isThereStockResult = oDao.isThereStock(sqlSession, o);
		return isThereStockResult;
	}
	
	public void processOrderConfirm(Order o) {
		oDao.processOrderConfirm(sqlSession, o);
	}
	
	public void orderCancel(Order o) {
		oDao.orderCancel(sqlSession, o);
	}
	
	public void payUserPoint(Order o) {
		oDao.payUserPoint(sqlSession, o);
	}
	
	
	
	
	public ArrayList<Order> usersReviewList(String id){
		return oDao.usersReviewList(sqlSession, id);
	}
	
	
	//주문내역 카운트세기
	public Order orderListCount(int selNo) {
		System.out.println("서비스");
		Order o = oDao.orderListCount(sqlSession, selNo);
		System.out.println("서비스 후");
		return o;
	};
	
	
	

	
}
