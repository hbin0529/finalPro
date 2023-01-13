package com.house.kh.homeBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.homeBoard.model.dao.HomeBoardDao;
import com.house.kh.homeBoard.model.vo.HomeBoard;
import com.house.kh.homeBoard.model.vo.HomeReply;
import com.house.kh.storeBoard.model.dao.StoreBoardDao;

@Service
public class HomeBoardServiceImpl implements HomeBoardService {

   @Autowired //객체 자동생성 변수 만들어주기
   private HomeBoardDao hbDao;
   
   @Autowired //객체 자동생성 변수 만들어주기
   private SqlSessionTemplate sqlSession;
   
   @Override
   public int selectListCount() {
      return hbDao.selectListCount(sqlSession);
      
   }

   @Override
   public ArrayList<HomeBoard> selectList() {
      return hbDao.selectList(sqlSession);
   }
  

   @Override
	public int increaseCount(int boardNo) {
		return hbDao.increaseCount(sqlSession, boardNo);
	} 

	@Override
	public HomeBoard selectBoard(int boardNo) {
		return hbDao.selectBoard(sqlSession, boardNo);
	}
	
	@Override
	   public int insertBoard(HomeBoard h) { 
	      return 0;
	   }

   @Override
   public int deleteBoard(int boardNo) {
      return 0;
   }

   @Override
   public int updateBoard(HomeBoard h) {
      return 0;
   }

	@Override
	public ArrayList<HomeReply> selectReplyList(int boardNo) {
	      return hbDao.selectReplyList(sqlSession, boardNo);

	}
	
	@Override
	public int insertReply(HomeReply hr) {
		return hbDao.insertReply(sqlSession, hr);

	}

	@Override
	public int deleteReply(int homeReplyNo) {
		return hbDao.deleteReply(sqlSession, homeReplyNo);
	}
   
    
}