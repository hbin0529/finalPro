package com.house.kh.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.house.kh.common.model.vo.PageInfo;
import com.house.kh.common.template.Pagination;
import com.house.kh.homeBoard.model.service.HomeBoardService;
import com.house.kh.homeBoard.model.vo.HomeBoard;
import com.house.kh.order.model.service.OrderService;
import com.house.kh.order.model.vo.Order;
import com.house.kh.storeBoard.model.service.StoreBoardService;
import com.house.kh.storeBoard.model.vo.Product;

@Controller
public class MyPageHomeBoardController {

	@Autowired // 객체생성은 알아서 ,,, BoardService 가져오기
	private HomeBoardService hbService;
	@Autowired
	private StoreBoardService sbService;
	@Autowired
	private OrderService oService;

 
	@RequestMapping("mypagehblist.bo")
	public ModelAndView selectList(@RequestParam(value="cpage" , defaultValue="1")int nowPage, ModelAndView mv, Model model) {
		  int listCount = hbService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 12);
		ArrayList<HomeBoard> list = hbService.selectList(pi);

		mv.addObject("pi", pi);
		mv.addObject("list", list);
		model.addAttribute("listCount", listCount);
		mv.setViewName("myPage/myPageHomeListView");

		return mv;
	}

	@RequestMapping("mypagehbdetail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		int result = hbService.increaseCount(bno);
		if (result > 0) {
			HomeBoard h = hbService.selectBoard(bno);

			String addr = h.getMemAddr(); // 경기도 광명시 하안동 어어엉
			String[] addrSplit = addr.split(" ");// [경기도, 광명시, 하안, ㅣㅇ네ㅣ]
			String outputAddr = addrSplit[0] + " " + addrSplit[1];

			mv.addObject("h", h).setViewName("myPage/myPagehomeBoardDetailView");
			mv.addObject("outputAddr", outputAddr).setViewName("myPage/myPagehomeBoardDetailView");
		} else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("myPageOrderlist.bo")
	public String usersOrderList(String id, Model model){
		
		ArrayList<Order> orderList = oService.usersOrderList(id);
		model.addAttribute("o", orderList);
		return "myPage/myPageOrderListView";
	
	}
	  
	   @RequestMapping("reviewinsert.bo")
	   public String insertReview(Product p, MultipartFile upfile, HttpSession session, Model model) {
		   if(!upfile.getOriginalFilename().equals("")) { 
				  String changeName = changeFilename(upfile, session);
			         p.setReviewImgOrigin(upfile.getOriginalFilename());
			         p.setReviewImgChange("resources/uploadFile/" + changeName);
			   } else { 
			   }
	      int result = sbService.insertReview(p);
	      if(result > 0) { 
	    	  session.setAttribute("alertMsg", "성공적으로 리뷰가 등록되었습니다."); 
			  return  "redirect: myPageOrderlist.bo?id=" + session.getAttribute("id");
			
			  
			  
	      } else {
	         return "common/errorPage";
	      }
	   }
	   
	   public String changeFilename(MultipartFile upfile, HttpSession session) {
		      String originName = upfile.getOriginalFilename();
		      String currentTime = new SimpleDateFormat("yyyyMMdddHHmmss").format(new Date());
		      int ranNum = (int)(Math.random() * 90000 + 10000); //10000~99999까지 랜덤값
		      String ext = originName.substring(originName.lastIndexOf(".")); //이름제일 뒤에서 .뒤에있는것 추출하기 (.jpg)
		      String changeName = currentTime + ranNum + ext;
		      
		      //업로드 시키고자하는 폴더의 물리적인 경로 알아오기
		      String savePath = session.getServletContext().getRealPath("/resources/uploadFile/");
		      
		      try {
		         upfile.transferTo(new File(savePath + changeName));
		      } catch (IllegalStateException | IOException e) {
		         e.printStackTrace();
		      }
		      
		      return changeName;
		   } 
	      
	   
	   /* 리뷰 삭제하기 */
	   @GetMapping("reviewdelete.bo")
	   public String deleteReview(@RequestParam("reviewNo") int reviewNo, Model model, HttpSession session) { 
	      int result = sbService.deleteReview(reviewNo);
	      if(result > 0) {
	         session.setAttribute("alertMsg", "성공적으로 문의가 삭제되었습니다");
	         return  "redirect: mypagereviewlist.bo?id=" + session.getAttribute("id");
	      } else {
	         model.addAttribute("errorMsg" , "문의 삭제 실패");
	         return "common/errorPage";
	      }
	   }   
	   @RequestMapping("mypagereviewlist.bo")
	   public ModelAndView usersReviewList(String id, ModelAndView mv, Model model){
			
			ArrayList<Order> reviewList = oService.usersReviewList(id);
			mv.addObject("o", reviewList);
			mv.setViewName("myPage/myPageReviewList");
			 
			 return mv;
		
		} 
	   
}
