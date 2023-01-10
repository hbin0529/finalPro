package com.house.kh.homeBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.house.kh.homeBoard.model.service.HomeBoardService;
import com.house.kh.homeBoard.model.vo.HomeBoard;

@Controller
public class HomeBoardController {
	@Autowired //객체생성은 알아서 ,,, BoardService 가져오기
	   private HomeBoardService hbService;

	 @RequestMapping("list.bo")  //값은 현재페이지인데, 맨처음에 페이지가 안들어오면 디폴트 1로하고 nowPage변수에 넣어준다
	   public ModelAndView selectList(ModelAndView mv) {
	     int listCount = hbService.selectListCount();
	                                         // 페이지갯수 10, 게시글갯수 5
	     //PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 5);
	      ArrayList<HomeBoard> list = hbService.selectList();
	      
	      //mv.addObject("pi",pi);
	      mv.addObject("list");
	      mv.setViewName("homeBoard/homeBoardListView"); 
	      return mv;
	   }	
	
	
	   }
	   