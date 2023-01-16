package com.house.kh.seller.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.member.model.vo.Member;
import com.house.kh.seller.model.dao.SellerDao;
import com.house.kh.seller.model.vo.Seller;

@Service
public class SellerService {
	
	@Autowired
	private SellerDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원가입처리
	public int insertMember(Seller s) {
		int insertResult = sDao.insertMember(sqlSession, s);
		return insertResult;
	}
	
	public Seller searchUser(Seller s) {
		Seller searchUserResult = sDao.searchUser(sqlSession, s);
		return searchUserResult;
	}
	
	
}
