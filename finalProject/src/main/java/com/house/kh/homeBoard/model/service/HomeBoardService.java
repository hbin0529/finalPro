package com.house.kh.homeBoard.model.service;

import java.util.ArrayList; 
  
import com.house.kh.homeBoard.model.vo.HomeBoard;
import com.house.kh.homeBoard.model.vo.HomeReply;

public interface HomeBoardService {  
      //집들이게시판 리스트 페이지
      int selectListCount();
      ArrayList<HomeBoard> selectList();  
    
      //집들이게시글 작성
      int insertBoard(HomeBoard h); 

      
      //집들이게시글 상세조회
      int increaseCount(int boardNo);
      HomeBoard selectBoard(int boardNo); 
       
      //게시글 수정
      int updateBoard(HomeBoard h);
      
    //댓글 리스트(ajax)
  	ArrayList<HomeReply> selectReplyList(int boardNo);
  	
  	//댓글 작성(ajax)
  	int insertReply(HomeReply hr); 
  	
  //댓글 삭제(ajax)
    int deleteReply(int homeReplyNo);

    
  //게시글 삭제
  	int deleteBoard(int boardNo);

}