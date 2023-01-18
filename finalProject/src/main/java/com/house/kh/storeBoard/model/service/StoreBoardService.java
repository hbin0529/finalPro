package com.house.kh.storeBoard.model.service;

import java.util.ArrayList;

import com.house.kh.storeBoard.model.vo.Product;

public interface StoreBoardService {
	// 게시판리스트 카운트
	int selectListCount();
	int selectCateListCount(Product product);
	
	// 게시판리스트 페이지
	ArrayList<Product> selectList(); //어떤거 가져올지
	ArrayList<Product> selectCateList(Product product); //어떤거 가져올지
	
	// 게시글 상세조회
	int increaseCount(int proNo); //조회수올리기
	Product selectBoard(int proNo);
	
	// 리뷰리스트 (ajax)
	ArrayList<Product> selectReviewList(int proNo);
	
	// 문의리스트 (ajax)
	ArrayList<Product> selectQuestionList(int proNo);
	
	// 게시글 작성
	int insertProduct(Product p);
	
	// 게시글삭제
	int proDeleteBoard(int proNo);
	
	// 게시글 수정
	int proUpdateBoard(Product p);
	
	// 문의작성 (ajax)
	int insertQuestion(Product p);
	
	// 문의삭제
	int queDelete(Product p);
	
	// 게시판리스트 페이지
	ArrayList<Product> arrayQuestionList(int proNo); //어떤거 가져올지
		
	
	// 8. Top5 조회수 리스트 (ajax)
	//ArrayList<Board> selectTopBoardList();

}
