package com.house.kh.common.template;

import com.house.kh.common.model.vo.PageInfo;

public class Pagination {

	public static PageInfo getPageInfo(int listCount, int nowPage, int pageLimit, int boardLimit) {
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);	
		int startPage = (nowPage-1) / pageLimit * pageLimit+1;	
		int endPage = startPage+pageLimit-1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		/*
		PageInfo pi = new PageInfo(listCount,nowPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		return pi;
		*/
		return new PageInfo(listCount,nowPage,pageLimit,boardLimit,maxPage,startPage,endPage);
	}
}
