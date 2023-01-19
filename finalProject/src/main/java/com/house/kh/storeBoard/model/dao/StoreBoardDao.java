package com.house.kh.storeBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.common.model.vo.PageInfo;
import com.house.kh.storeBoard.model.vo.Product;

@Repository
public class StoreBoardDao {
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeBoardMapper.selectListCount");
	}
	public int selectCateListCount(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.selectOne("storeBoardMapper.selectCateListCount", product);
	}
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("storeBoardMapper.selectList");
	}
	
	public ArrayList<Product> selectCateList(SqlSessionTemplate sqlSession, Product product) {
		return (ArrayList)sqlSession.selectList("storeBoardMapper.selectCateList", product);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.update("storeBoardMapper.increaseCount", proNo);
	}
	
	public Product selectBoard(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.selectOne("storeBoardMapper.selectBoard", proNo);
	} 
	
	public ArrayList<Product> selectReviewList(SqlSessionTemplate sqlSession, int proNo) {
		return (ArrayList)sqlSession.selectList("storeBoardMapper.selectReviewList", proNo); 
	}
	
	public ArrayList<Product> selectQuestionList(SqlSessionTemplate sqlSession, int proNo) {
		return (ArrayList)sqlSession.selectList("storeBoardMapper.selectQuestionList", proNo); 
	}
	
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("storeBoardMapper.insertProduct", p); 
	}
	
	public int proDeleteBoard(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.update("storeBoardMapper.proDeleteBoard", proNo); 
	}

	public int proUpdateBoard(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.update("storeBoardMapper.proUpdateBoard", p); 
	}
	
	public int insertQuestion(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("storeBoardMapper.insertQuestion", p);
	}
	
	public int queDelete(SqlSessionTemplate sqlSession,  int proQueNo) {
		return sqlSession.update("storeBoardMapper.queDelete", proQueNo); 
	}
	
	public ArrayList<Product> arrayQuestionList(SqlSessionTemplate sqlSession, Product p) {
		return (ArrayList)sqlSession.selectList("storeBoardMapper.arrayQuestionList", p); 
	}
	
	public int insertReview(SqlSessionTemplate sqlSession, Product p) { 
	      return sqlSession.insert("storeBoardMapper.insertReview", p);
	   }
	
}
