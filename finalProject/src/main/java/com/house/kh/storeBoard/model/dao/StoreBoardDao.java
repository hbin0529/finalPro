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
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("storeBoardMapper.selectList");
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
	
	public ArrayList<Product> selectAnswerList(SqlSessionTemplate sqlSession, int proNo) {
		return (ArrayList)sqlSession.selectList("storeBoardMapper.selectAnswerList", proNo); 
	}
	
}
