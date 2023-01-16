package com.house.kh.seller.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.member.model.vo.Member;
import com.house.kh.seller.model.vo.Seller;

@Repository
public class SellerDao {
	
	public int insertMember(SqlSessionTemplate sqlSession, Seller s) {
		return sqlSession.insert("sellerMapper.insertMember", s);
	}
	
	public Seller searchUser(SqlSessionTemplate sqlSession, Seller s) {
		return sqlSession.selectOne("sellerMapper.searchUser", s);
	}
	
	
	
}
