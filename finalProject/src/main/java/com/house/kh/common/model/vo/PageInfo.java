package com.house.kh.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class PageInfo {

	private int listCount;	// 총 게시글의 수
	private int nowPage;	// 현재페이지(요청한 페이지)
	private int pageLimit;	// 하단에 보여질 페이징바의 페이지 목록 최대 개수..prev [2][3][4] .. next
	private int boardLimit;	// 1페이지에 보여줄 게시글 수
	
	private int maxPage;	// 가장 마지막 페이지수
	private int startPage;	// 해당 페이지에 보여질 페이징바의 시작 수
	private int endPage;	// 해당 페이지에 보여질 페이징바의 끝 수
}
