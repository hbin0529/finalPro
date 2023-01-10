package com.house.kh.homeBoard.model.service;

import java.util.ArrayList; 
  
import com.house.kh.homeBoard.model.vo.HomeBoard;

public interface HomeBoardService {
	
	
	   //집들이게시판 리스트 페이지
		int selectListCount();
		ArrayList<HomeBoard> selectList();  
	

		//집들이게시글 작성
		int insertHomeBoard(HomeBoard hb);
		
		//집들이게시글 상세조회
		int increaseCount(int boardNo);
		HomeBoard selectHomeBoard(int boardNo);
		
		//게시글 삭제
		int deleteHomeBoard(int boardNo);
		
		//게시글 수정
		int updateHomeBoard(HomeBoard hb);
		
		/*
		//댓글 리스트(ajax)
		ArrayList<Reply> selectReplyList(int boardNo);
		
		//댓글 작성(ajax)
		int insertReply(Reply r); 
		*/ 


}
