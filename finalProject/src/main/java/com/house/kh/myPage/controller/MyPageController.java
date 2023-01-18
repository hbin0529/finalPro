package com.house.kh.myPage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.house.kh.homeBoard.model.service.HomeBoardService;
import com.house.kh.homeBoard.model.vo.HomeBoard;

@Controller
public class MyPageController {
	
	 @Autowired //객체생성은 알아서 ,,, BoardService 가져오기
     private HomeBoardService hbService; 
	 
	 @RequestMapping("mypagehblist.bo")
     public ModelAndView selectList(ModelAndView mv, Model model) {
        int listCount = hbService.selectListCount(); 
        
         ArrayList<HomeBoard> list = hbService.selectList(); 
     
         mv.addObject("list",list);  
         model.addAttribute("listCount",listCount);
         mv.setViewName("member/myPageListView");
         
        return mv;
     }   

}
