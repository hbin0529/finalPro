package com.house.kh.order.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.order.model.dao.OrderDao;
import com.house.kh.order.model.vo.Order;

@Service
public class OrderService {
	
	@Autowired
	private OrderDao oDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int holdPoint(String o) {
		int holdPoint = oDao.holdPoint(sqlSession, o).getMemPoint();
		return holdPoint;
	}
}
