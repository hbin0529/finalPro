package com.house.kh.homeBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.house.kh.homeBoard.model.service.HomeBoardService;
import com.house.kh.homeBoard.model.vo.HomeBoard;
import com.house.kh.homeBoard.model.vo.HomeReply;

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
            
            String addr = h.getMemAddr(); //경기도 광명시 하안동 어어엉
            String[] addrSplit = addr.split(" ");// [경기도, 광명시, 하안, ㅣㅇ네ㅣ]
            String outputAddr = addrSplit[0]+" "+addrSplit[1];
            
            mv.addObject("h", h).setViewName("homeBoard/homeBoardDetailView");
            mv.addObject("outputAddr", outputAddr).setViewName("homeBoard/homeBoardDetailView");
         } else {
            mv.addObject("errorMsg", "상세조회 실패")
              .setViewName("common/errorPage");
         }
         return mv;
      }
      
      @ResponseBody
	   @RequestMapping(value="rlist.bo", produces="application/json; charset=utf-8")
	   public String ajaxSelectReplyList(int bno) {
		   ArrayList<HomeReply> list = hbService.selectReplyList(bno);
		   System.out.println(list);
	         return new Gson().toJson(list);
	   
	   }
	   
	   @ResponseBody
	   @RequestMapping(value="rinsert.bo")
	   public String ajaxSelectReplyList(HomeReply r) {
		 int result = hbService.insertReply(r);
	         return result >0 ? "success" : "fail";
	   }
	   
      
    
  }
 