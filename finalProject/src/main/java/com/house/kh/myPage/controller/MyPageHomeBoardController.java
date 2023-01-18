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
public class MyPageHomeBoardController {
	
	 @Autowired //객체생성은 알아서 ,,, BoardService 가져오기
     private HomeBoardService hbService; 
	 
	 @RequestMapping("mypagehblist.bo")
     public ModelAndView selectList(ModelAndView mv, Model model) {
        int listCount = hbService.selectListCount(); 
         ArrayList<HomeBoard> list = hbService.selectList(); 
     
         mv.addObject("list",list);  
         model.addAttribute("listCount",listCount);
         mv.setViewName("myPage/myPageHomeListView");
         
        return mv;
     }   
	 
	 
	 @RequestMapping("mypagehbdetail.bo")
     public ModelAndView selectBoard(int bno, ModelAndView mv) {
        int result = hbService.increaseCount(bno); 
        if(result > 0) {
           HomeBoard h = hbService.selectBoard(bno);
           
           String addr = h.getMemAddr(); //경기도 광명시 하안동 어어엉
           String[] addrSplit = addr.split(" ");// [경기도, 광명시, 하안, ㅣㅇ네ㅣ]
           String outputAddr = addrSplit[0]+" "+addrSplit[1];
           
           mv.addObject("h", h).setViewName("myPage/myPagehomeBoardDetailView");
           mv.addObject("outputAddr", outputAddr).setViewName("myPage/myPagehomeBoardDetailView");
        } else {
           mv.addObject("errorMsg", "상세조회 실패")
             .setViewName("common/errorPage");
        }
        return mv;
     }
	  

}
