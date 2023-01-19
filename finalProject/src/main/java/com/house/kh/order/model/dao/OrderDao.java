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
	
	public ArrayList<Order> usersOrderList(SqlSessionTemplate sqlSession, String id){
		return (ArrayList)sqlSession.selectList("orderMapper.usersOrderList", id);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public boolean isThereStock(SqlSessionTemplate sqlSession, Order o) {
		Order resultStock = sqlSession.selectOne("orderMapper.isThereStock", o);
		int result;
		if(o.getOrdOption().contentEquals("BLACK")) {
			result = resultStock.getProBlackStock();
		}else{
			result = resultStock.getProWhiteStock();
		}
		//남은수량 꺼낸게 result, 이게 주문하려는 수량보다 크면 통과 아니면 false
		if(result > o.getOrdCount()) {
			return true;
		}else {
			return false;
		}
	}
	
	
	public void processOrderConfirm(SqlSessionTemplate sqlSession, Order o) {
		//있으면 if문을 이용해서 주문처리('Y', 오더디테일) 하고 재고 업데이트(stock, 프로덕트), 판매자한테 포인트 전달(셀러베이스)
		int resultStatusUpdate = sqlSession.update("orderMapper.statusUpdate", o);
		int resultStockUpdate = sqlSession.update("orderMapper.stockUpdate", o);
		int resultSendPointToSeller = sqlSession.update("orderMapper.sendPointToSeller", o);
	}
	
	public void orderCancel(SqlSessionTemplate sqlSession, Order o) {
		//주문취소처리하고('F', 오더디테일) 포인트 일반회원구매자한테 돌려주기(멤버베이스)
		int resultStatusUpdateF = sqlSession.update("orderMapper.statusUpdateF", o);
		int resultRefundPointToUser = sqlSession.update("orderMapper.refundPointToUser", o);
	}
	
	
	public void payUserPoint(SqlSessionTemplate sqlSession, Order o) {
		sqlSession.update("orderMapper.payUserPoint", o);
	}
	
	
	
	
}
