package com.house.kh.seller.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.member.model.vo.Member;
import com.house.kh.seller.model.dao.SellerDao;
import com.house.kh.seller.model.vo.Seller;
import com.house.kh.storeBoard.model.vo.Product;

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
	
	
	//(인테리어)모든 업자 다 가져오기
	public ArrayList<Seller> getAllSeller(){
		ArrayList<Seller> sellList = sDao.getAllSeller(sqlSession);
		return sellList;
	}

	
	//판매자보유포인트불러오기(ajax)
	public int getSellerPoint(int selNo) {
		return sDao.getSellerPoint(sqlSession, selNo);
	}
	
	
	public Seller getSellerInfo(int selNo) {
		return sDao.getSellerInfo(sqlSession, selNo);
	}
	
	public int doUpdate(Seller seller) {
		return sDao.doUpdate(sqlSession, seller);
	}
	
	
	
}
