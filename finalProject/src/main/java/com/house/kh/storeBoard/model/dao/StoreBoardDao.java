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
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("storeBoardMapper.selectList", null, rowBounds);
	}
	
	public ArrayList<Product> selectCateList(SqlSessionTemplate sqlSession, PageInfo pi, Product product) {
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
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
	
	public int deleteReview(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.update("storeBoardMapper.deleteReview", reviewNo); 
	} 
	
	
	public ArrayList<Product> arrayReplyList(SqlSessionTemplate sqlSession, Product p) {
		return (ArrayList)sqlSession.selectList("storeBoardMapper.arrayReplyList", p); 
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("storeBoardMapper.insertReply", p);
	}
	
	public int updateReply(SqlSessionTemplate sqlSession, int proQueNo) {
		return sqlSession.update("storeBoardMapper.updateReply", proQueNo); 
	}
	
	public ArrayList<Product> StarAmount(SqlSessionTemplate sqlSession, int proNo){
		return (ArrayList)sqlSession.selectList("storeBoardMapper.StarAmount", proNo);
	}
	
	
}
