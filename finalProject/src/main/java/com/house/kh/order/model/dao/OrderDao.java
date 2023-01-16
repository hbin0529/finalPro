package com.house.kh.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.member.model.vo.Member;
import com.house.kh.order.model.vo.Order;

@Repository
public class OrderDao {
	
	public Member holdPoint(SqlSessionTemplate sqlSession, String o) {
		return sqlSession.selectOne("orderMapper.holdPoint", o);
	}
}
