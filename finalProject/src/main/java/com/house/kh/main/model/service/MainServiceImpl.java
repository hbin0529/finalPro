package com.house.kh.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.main.model.dao.MainDao;
import com.house.kh.main.model.vo.Main;
import com.house.kh.storeBoard.model.dao.StoreBoardDao;
import com.house.kh.storeBoard.model.vo.Product;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired //객체 자동생성 변수 만들어주기
	private MainDao mDao;
	
	@Autowired //객체 자동생성 변수 만들어주기
	private SqlSessionTemplate sqlSession;


	
	@Override
	public ArrayList<Main> topStoreBoardList() {
		return mDao.topStoreBoardList(sqlSession);
	}
	
	@Override
	public ArrayList<Main> topStoreBoardList2() {
		return mDao.topStoreBoardList2(sqlSession);
	}
	
	@Override
	public ArrayList<Main> topStoreBoardList3() {
		return mDao.topStoreBoardList3(sqlSession);
	}
	
	@Override
	public ArrayList<Main> topStoreBoardList4() {
		return mDao.topStoreBoardList4(sqlSession);
	}



	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int selectCateListCount(Product product) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public ArrayList<Product> selectList() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public ArrayList<Product> selectCateList(Product product) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int increaseCount(int proNo) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public Product selectBoard(int proNo) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public ArrayList<Product> selectReviewList(int proNo) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public ArrayList<Product> selectQuestionList(int proNo) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int insertProduct(Product p) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int proDeleteBoard(int proNo) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int proUpdateBoard(Product p) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int insertQuestion(Product p) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public int queDelete(int proQueNo) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public ArrayList<Product> arrayQuestionList(Product p) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Main> searchList(String searchWord) {
		return mDao.searchList(sqlSession, searchWord);
	}

}
