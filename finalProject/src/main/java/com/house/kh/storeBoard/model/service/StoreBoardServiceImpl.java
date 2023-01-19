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
	public int selectCateListCount(Product product) {
		return sbDao.selectCateListCount(sqlSession, product);
	}

	@Override
	public ArrayList<Product> selectList() {
		return sbDao.selectList(sqlSession);
	}
	
	@Override
	public ArrayList<Product> selectCateList(Product product) {
		return sbDao.selectCateList(sqlSession, product);
	}
	
	@Override
	public ArrayList<Product> selectReviewList(int proNo) {
		return sbDao.selectReviewList(sqlSession, proNo);
	}
	
	@Override
	public ArrayList<Product> selectQuestionList(int proNo) {
		return sbDao.selectQuestionList(sqlSession, proNo);
	}
	
	@Override
	public int insertProduct(Product p) {
		return sbDao.insertProduct(sqlSession, p);
	}

	@Override
	public int increaseCount(int proNo) {
		return sbDao.increaseCount(sqlSession, proNo);
	}

	@Override
	public Product selectBoard(int proNo) {
		return sbDao.selectBoard(sqlSession, proNo);
	}

	@Override
	public int proDeleteBoard(int proNo) {
		return sbDao.proDeleteBoard(sqlSession, proNo);
	}

	@Override
	public int proUpdateBoard(Product p) {
		return sbDao.proUpdateBoard(sqlSession, p);
	}

	@Override
	public int insertQuestion(Product p) {
		System.out.println("제발~~");
		return sbDao.insertQuestion(sqlSession, p);
	}

	@Override
	public int queDelete(int proQueNo) {
		return sbDao.queDelete(sqlSession, proQueNo);
	}
	
	@Override
	public ArrayList<Product> arrayQuestionList(Product p) {
		return sbDao.arrayQuestionList(sqlSession, p);

	}  
	
    @Override
    public int insertReview(Product p) {
       return sbDao.insertReview(sqlSession, p);
   }

	@Override
	public int deleteReview(int reviewNo) {
		return sbDao.deleteReview(sqlSession, reviewNo);
		 
	}

}
