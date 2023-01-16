package com.house.kh.homeBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.homeBoard.model.vo.HomeBoard;
import com.house.kh.homeBoard.model.vo.HomeReply;

@Repository
public class HomeBoardDao { 
    public int selectListCount(SqlSessionTemplate sqlSession) {
       return sqlSession.selectOne("homeBoardMapper.selectListCount");
    }
    
    public ArrayList<HomeBoard> selectList(SqlSessionTemplate sqlSession){
        return (ArrayList)sqlSession.selectList("homeBoardMapper.selectList"); 
    }
    
    public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
    	return sqlSession.update("homeBoardMapper.increaseCount", boardNo);
    }
    
    public HomeBoard selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
    	return sqlSession.selectOne("homeBoardMapper.selectBoard", boardNo);
    }
    
    public ArrayList<HomeReply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo){
    	return (ArrayList)sqlSession.selectList("homeBoardMapper.selectReplyList",boardNo);
    }
    
    public int insertReply(SqlSessionTemplate sqlSession, HomeReply hr) {
    	return sqlSession.insert("homeBoardMapper.insertReply",hr);
     
    }
    public int deleteReply(SqlSessionTemplate sqlSession, int homeReplyNo) {
	   return sqlSession.update("homeBoardMapper.deleteReply", homeReplyNo);
    }
    
    public int insertBoard(SqlSessionTemplate sqlSession, HomeBoard h) {
    	return sqlSession.insert("homeBoardMapper.insertBoard", h);
     
    }
    
    public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
    	return sqlSession.update("homeBoardMapper.deleteBoard", boardNo);
    }
    

}