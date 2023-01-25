package com.house.kh.storeBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.house.kh.cart.model.vo.Cart;
import com.house.kh.common.model.vo.PageInfo;
import com.house.kh.common.template.Pagination;
import com.house.kh.homeBoard.model.service.HomeBoardService;
import com.house.kh.homeBoard.model.vo.HomeBoard;
import com.house.kh.storeBoard.model.service.StoreBoardService;
import com.house.kh.storeBoard.model.vo.Product;

@Controller
public class StoreBoardController {
   @Autowired
   private StoreBoardService sbService;

   /* 스토어리스트 불러오기 */
   @RequestMapping("storelist.bo")
   public ModelAndView selectList(@RequestParam(value="cpage" , defaultValue="1")int nowPage, Product product,ModelAndView mv, Model model) {
      int listCount = sbService.selectListCount();
	  													// 페이지갯수 10, 게시글갯수 12
      PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 12);
      
      ArrayList<Product> list = new ArrayList<Product>();
      if((product.getCateNo() > 0)) {
         list = sbService.selectCateList(product, pi);
         listCount = sbService.selectCateListCount(product);
      }else {
         list = sbService.selectList(pi);
         listCount = sbService.selectListCount();
      }   

      mv.addObject("pi", pi);
      mv.addObject("list", list);
      model.addAttribute("listCount", listCount);
      mv.setViewName("storeBoard/storeBoardListView");

      return mv;
   }

   /* 상품디테일정보 불러오기 */
   @RequestMapping("productdetail.bo")
   public ModelAndView selectBoard(int pno, ModelAndView mv) {
      
	  ArrayList<Product> starAmount = sbService.StarAmount(pno);
	  int[] stars = {0, 0, 0, 0, 0};
	  
	  
	  for(int i = 0; i < starAmount.size(); i++) {
		  if(starAmount.get(i).getStarAmount()>0) {
			  int thisStar = Integer.parseInt(starAmount.get(i).getReviewStar());
			  stars[thisStar-1] += starAmount.get(i).getStarAmount();
		  }
	  }
	  
	  
      int result = sbService.increaseCount(pno);
      if (result > 0) {
         Product p = sbService.selectBoard(pno);
         mv.addObject("p", p).setViewName("storeBoard/storeBoardDetailView");
         mv.addObject("stars", stars);
      } else {
         mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
      }
      return mv;
   }

   
   /* 리뷰리스트 불러오기 */
   @ResponseBody
   @RequestMapping(value = "reviewlist.bo", produces = "application/json; character=utf-8")
   public String ajaxSelectReviewList(int pno) {
      ArrayList<Product> list = sbService.selectReviewList(pno);
      return new Gson().toJson(list);
   }
   
   /* 문의리스트 불러오기 */
   @ResponseBody
   @RequestMapping(value = "qlist.bo", produces = "application/json; character=utf-8")
   public String ajaxSelectQuestionList(int pno) {
      ArrayList<Product> list = sbService.selectQuestionList(pno);
      return new Gson().toJson(list);
   }   

   /* 문의리스트 어레이리스트 불러오기 */
   @RequestMapping("qArrayList.bo")
   public ModelAndView arrayQuestionList(Product p, ModelAndView mv, Model model) {
      ArrayList<Product> list = new ArrayList<Product>();
      
      list = sbService.arrayQuestionList(p);   

      mv.addObject("list", list);
      mv.setViewName("myPage/myPageQuestionView");

      return mv;
   }

   @RequestMapping("productWrite.bo") // 글쓰는 페이지로 넘겨주기
   public String productWrite() {
      return "storeBoard/productWrite";
   }
   
   // 파일 이름바꾸는거 메소드로 정의한것 !
      public String[] changeFilename(MultipartFile upfile,MultipartFile upfile1, MultipartFile upfile2, HttpSession session) {
         String originName = upfile.getOriginalFilename();
                         upfile1.getOriginalFilename();
                         upfile2.getOriginalFilename();
         
         String currentTime = new SimpleDateFormat("yyyyMMdddHHmmss").format(new Date());
         int ranNum = (int)(Math.random() * 90000 + 10000); //10000~99999까지 랜덤값
         String ext = originName.substring(originName.lastIndexOf(".")); //이름제일 뒤에서 .뒤에있는것 추출하기 (.jpg)
         String changeName = currentTime + ranNum + "0" + ext;
         String changeName1 = currentTime + ranNum + "1" + ext;
         String changeName2 = currentTime + ranNum + "2" + ext;
         
         //업로드 시키고자하는 폴더의 물리적인 경로 알아오기
         String savePath = session.getServletContext().getRealPath("/resources/uploadFile/");
         String[] changeNameArray = {changeName, changeName1, changeName2};
         try {
            upfile.transferTo(new File(savePath + changeName));
            upfile1.transferTo(new File(savePath + changeName1));
            upfile2.transferTo(new File(savePath + changeName2));
         } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
         }
         return changeNameArray;
      }
   
   
   @RequestMapping("proInsert.bo") //게시글 입력후 데이터에 넣어주기
   public String insertProduct(Product p, MultipartFile upfile, MultipartFile upfile1, MultipartFile upfile2, HttpSession session, Model model, String selNo2) {
	   p.setSelNo(Integer.parseInt(selNo2));
         String[] changeName = changeFilename(upfile, upfile1, upfile2, session);

         p.setProOriginImg(upfile.getOriginalFilename());
         p.setProChangeImg("resources/uploadFile/" + changeName[0]);
         p.setProOriginImg1(upfile1.getOriginalFilename());
         p.setProChangeImg1("resources/uploadFile/" + changeName[1]);
         p.setProOriginDetailimg(upfile2.getOriginalFilename());
         p.setProChangeDetailimg("resources/uploadFile/" + changeName[2]);
      
      // 넘어온 파일이 있으면 : 제목, 작성자, 내용, 파일원본명, 파일저장경로가 있는 바뀐이름
      // 넘어온 파일이 없으면 : 제목, 작성자, 내용
      int result = sbService.insertProduct(p);
      if(result > 0) { //insert가 잘 되었으면
         session.setAttribute("alertMsg", "상품이 등록 되었습니다");
         return "redirect:storelist.bo";
      } else {
         model.addAttribute("errorMsg", "상품 등록 실패");
         return "common/errorPage";
      }
   }
   
   @RequestMapping("productDelete.bo")
   public String proDeleteBoard(int proNo, String filePath, Model model, HttpSession session) {
      int result = sbService.proDeleteBoard(proNo);
      if(result > 0) {
         if( !filePath.equals("")) { //만약 filePath가 비어있지 않으면(파일이있으면) 같이 삭제해야함
            new File(session.getServletContext().getRealPath(filePath)).delete(); //파일삭제해주는것
         }
         session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다");
         return "redirect:storelist.bo";
      } else {
         model.addAttribute("errorMsg" , "게시글 삭제 실패");
         return "common/errorPage";
      }
   }

   @RequestMapping("productUpdate.bo") 
   public String updateForm(int proNo, Model model) {
      model.addAttribute("p", sbService.selectBoard(proNo));
      return "storeBoard/productUpdate";
   }
   
   @RequestMapping("proUpdate.bo") 
   public String proUpdateBoard(Product p, MultipartFile reupfile,MultipartFile reupfile1, MultipartFile reupfile2, HttpSession session, Model model) {
      if(!reupfile.getOriginalFilename().equals("")) {
         if(p.getProOriginImg() != null && p.getProOriginImg1() != null && p.getProOriginDetailimg() != null) {
            new File(session.getServletContext().getRealPath(p.getProChangeImg())).delete();
            new File(session.getServletContext().getRealPath(p.getProChangeImg1())).delete();
            new File(session.getServletContext().getRealPath(p.getProChangeDetailimg())).delete();
         }
         String[] changeName = changeFilename(reupfile, reupfile1, reupfile2, session);
         
         p.setProOriginImg(reupfile.getOriginalFilename());
         p.setProChangeImg("resources/uploadFile" + changeName[0]);
         p.setProOriginImg1(reupfile1.getOriginalFilename());
         p.setProChangeImg1("resources/uploadFile" + changeName[1]);
         p.setProOriginDetailimg(reupfile2.getOriginalFilename());
         p.setProChangeDetailimg("resources/uploadFile" + changeName[2]);
      }
      int result = sbService.proUpdateBoard(p);
      if(result > 0) {
         session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다");
         return "redirect:productdetail.bo?pno=" + p.getProNo();
      } else {
         model.addAttribute("errorMsg", "게시글 수정 실패");
         return "common/errorPage";
      }
   }
   
   /* 문의 생성하기 */
   @ResponseBody
   @RequestMapping(value="qinsert.bo")
   public void ajaxInsertQuestion(Product p, Model model, HttpServletResponse response) throws IOException {
      int result = sbService.insertQuestion(p);
      System.out.println(result);
      if(result > 0) {
         model.addAttribute("alertMsg", "문의 등록이 완료 되었습니다.");
         response.sendRedirect("productdetail.bo?pno="+ p.getProNo());
      }
   }
   
   /* 문의 삭제하기 */
   @RequestMapping(value="qdelete.bo" , method = {RequestMethod.GET, RequestMethod.POST}) 
   public String queDelete(@RequestParam("proQueNo")int proQueNo, Model model, HttpSession session) {
      int result = sbService.queDelete(proQueNo);
      if(result > 0) {
         session.setAttribute("alertMsg", "성공적으로 문의가 삭제되었습니다");
         return "redirect:storelist.bo";
      } else {
         model.addAttribute("errorMsg" , "문의 삭제 실패");
         return "common/errorPage";
      }
   }    
   
   /* 답변리스트 어레이리스트 불러오기 */
   @RequestMapping("rArrayList.bo")
   public ModelAndView arrayReplyList(Product p, ModelAndView mv, Model model) {
      ArrayList<Product> list = new ArrayList<Product>();
     
      list = sbService.arrayReplyList(p);   
        System.out.println(list);
      mv.addObject("list", list);
      mv.setViewName("sellerPage/sellerPageQuestionView");

      return mv;
   }


   
   /* 문의에 답변 처리하기 */
	@RequestMapping("replyinsert.bo")
	public String insertReply(Product p, Model model, ModelAndView mv , HttpSession session, int proQueNo) {
		int result = sbService.insertReply(p); 
		int result2 = sbService.updateReply(proQueNo);
		if (result > 0) { 
			if (result2 > 0) {
				session.setAttribute("alertMsg", "성공적으로 답변이 등록되었습니다");
				 return  "redirect: rArrayList.bo";
				 
			}else {
				model.addAttribute("errorMsg", "업데이트 실패");
				return "common/errorPage";
			} 	 
		} else {
			model.addAttribute("errorMsg", "답변 등록 실패");
			return "common/errorPage";
		}
	   }
	}
	   