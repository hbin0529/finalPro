package com.house.kh.storeBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.house.kh.storeBoard.model.service.StoreBoardService;
import com.house.kh.storeBoard.model.vo.Product;

@Controller
public class StoreBoardController {
	@Autowired
	private StoreBoardService sbService;
	
	@RequestMapping("storelist.bo")  //값은 현재페이지인데, 맨처음에 페이지가 안들어오면 디폴트 1로하고 nowPage변수에 넣어준다
	public ModelAndView selectList(ModelAndView mv) {
		int listCount = sbService.selectListCount();
													  // 페이지갯수 10, 게시글갯수 5
		//PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 5);
		ArrayList<Product> list = sbService.selectList();
		
		//mv.addObject("pi");
		mv.addObject("list",list);
		mv.setViewName("storeBoard/storeBoardListView");
		
		return mv;
	}
}
