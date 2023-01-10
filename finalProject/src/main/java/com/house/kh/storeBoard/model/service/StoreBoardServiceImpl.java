package com.house.kh.storeBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.storeBoard.model.dao.StoreBoardDao;
import com.house.kh.storeBoard.model.vo.Product;

@Service
public class StoreBoardServiceImpl implements StoreBoardService{
	
	@Autowired //객체 자동생성 변수 만들어주기
	private StoreBoardDao sbDao;
	
	@Autowired //객체 자동생성 변수 만들어주기
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return sbDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> selectList() {
		return sbDao.selectList(sqlSession);
	}

	@Override
	public int insertBoard(Product p) {
		return 0;
	}

	@Override
	public int increaseCount(int boardNo) {
		return 0;
	}

	@Override
	public Product selectBoard(int boardNo) {
		return null;
	}

	@Override
	public int deleteBoard(int boardNo) {
		return 0;
	}

	@Override
	public int updateBoard(Product p) {
		return 0;
	}
	

}
