package com.house.kh.homeBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.house.kh.homeBoard.model.service.HomeBoardService;
import com.house.kh.homeBoard.model.vo.HomeBoard;

@Controller
public class HomeBoardController {
   @Autowired //객체생성은 알아서 ,,, BoardService 가져오기
      private HomeBoardService hbService; 
   
      @RequestMapping("list.bo")
      public ModelAndView selectList(ModelAndView mv, Model model) {
         int listCount = hbService.selectListCount(); 
         
          ArrayList<HomeBoard> list = hbService.selectList(); 
      
          mv.addObject("list",list);  
          model.addAttribute("listCount",listCount);
          mv.setViewName("homeBoard/homeBoardListView");
          
         return mv;
      }   
      
      @RequestMapping("detail.bo")
      public ModelAndView selectBoard(int bno, ModelAndView mv) {
         int result = hbService.increaseCount(bno); 
         if(result > 0) {
            HomeBoard h = hbService.selectBoard(bno);
            mv.addObject("h", h).setViewName("homeBoard/homeBoardDetailView");
         } else {
            mv.addObject("errorMsg", "상세조회 실패")
              .setViewName("common/errorPage");
         }
         return mv;
      }
      
    
  }
 