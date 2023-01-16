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
	
	//판매자로그인
	public Seller searchUser(Seller s) {
		Seller searchUserResult = sDao.searchUser(sqlSession, s);
		return searchUserResult;
	}
	
	//아이디중복검사
	public int searchIdVali(String id) {
		int searchResult = sDao.searchIdVali(sqlSession, id);
		return searchResult;
	}
	
	
	
}
