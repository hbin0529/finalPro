package com.house.kh.storeBoard.model.service;

import java.util.ArrayList;

import com.house.kh.storeBoard.model.vo.Product;

public interface StoreBoardService {
	// 1. 게시판리스트 페이지
	int selectListCount();
	ArrayList<Product> selectList(); //어떤거 가져올지
	
	// 2. 게시글 작성
	int insertBoard(Product p);
	
	// 3. 게시글 상세조회
	int increaseCount(int proNo); //조회수올리기
	Product selectBoard(int proNo);
	
	// 6. 리뷰리스트 (ajax)
	ArrayList<Product> selectReviewList(int proNo);

	// 4. 게시글삭제
	int deleteBoard(int boardNo);
	
	// 5. 게시글 수정
	int updateBoard(Product p);
	
	
	
	// 7. 댓글작성 (ajax)
	//int insertReply(Reply r);
	
	// 8. Top5 조회수 리스트 (ajax)
	//ArrayList<Board> selectTopBoardList();

}
