package com.house.kh.homeBoard.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.house.kh.common.model.vo.PageInfo;
import com.house.kh.common.template.Pagination;
import com.house.kh.homeBoard.model.service.HomeBoardService;
import com.house.kh.homeBoard.model.vo.HomeBoard;
import com.house.kh.homeBoard.model.vo.HomeReply;

@Controller
public class HomeBoardController {
   @Autowired //객체생성은 알아서 ,,, BoardService 가져오기
      private HomeBoardService hbService; 
   
      @RequestMapping("list.bo")
      public ModelAndView selectList(@RequestParam(value="cpage" , defaultValue="1")int nowPage, ModelAndView mv, Model model) {
         int listCount = hbService.selectListCount(); 
         
         PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 12);
         ArrayList<HomeBoard> list = hbService.selectList(pi); 
      
         mv.addObject("pi", pi);
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
		   return new Gson().toJson(list);
	   
	   }
	   
	   @ResponseBody
	   @RequestMapping(value="rinsert.bo")
	   public String ajaxSelectReplyList(HomeReply hr) {
		 int result = hbService.insertReply(hr);
	         return result >0 ? "success" : "fail";
	   } 
	   
	   @ResponseBody
	   @RequestMapping("delete.bo")
	   public void deleteReply(int rbno, HttpSession session, Model model, HomeBoard h, HttpServletResponse response, int bno) throws IOException {  //파일이 있으면 삭제하면 안되기 때문에 파일도 넘겨받아야함
		   int result = hbService.deleteReply(rbno); 
		   if(result > 0) { 
			   session.setAttribute("alertMsg", "성공적으로 댓글이 삭제되었습니다.");
			   response.sendRedirect("detail.bo?bno="+ bno);
		   }else {
			   System.out.println("실패입니다");
		   }
		   
	   } 
	   
	   @RequestMapping("enrollForm.bo") //페이지로 넘겨주기
	   public String enrollForm() {
	      return "homeBoard/boardEnrollForm";
	   }
	   
	   
	   
	   @RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	   @ResponseBody
	    public Map<Object, Object> SummerNoteImageFile(@RequestParam("file") MultipartFile file, @RequestParam("pathF") String pathF, HttpSession session) {
	       Map<Object, Object> returnMap = new HashMap<Object, Object>();
	       String fileRoot = pathF + "/resources/summernoteImg/";   
	       String originalFileName = file.getOriginalFilename();
	       String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
	       String savePath = session.getServletContext().getRealPath("/resources/summernoteImg/");
	      
	       String saveFileName = UUID.randomUUID() + extension;
	       
	       File targetFile = new File(savePath + saveFileName);
	       try {
	          InputStream inputstream = file.getInputStream();
	          FileUtils.copyInputStreamToFile(inputstream, targetFile); //파일 저장
	          returnMap.put("url", savePath+saveFileName);
	          returnMap.put("responseCode", "success");
	          returnMap.put("fileName", saveFileName);
	          returnMap.put("fileRoot", fileRoot);
	       } catch(IOException e) {
	          FileUtils.deleteQuietly(targetFile);
	          e.printStackTrace();
	       } 
	       return returnMap;
	    }
		   
	   
	   @RequestMapping("insert.bo")
	   public String insertBoard(HomeBoard h, MultipartFile upfile, HttpSession session, Model model) {
		  if(!upfile.getOriginalFilename().equals("")) {
			  String changeName = changeFilename(upfile, session);
		        h.setBoardMainimgOrigin(upfile.getOriginalFilename());
		       h.setBoardMainimgChange("resources/uploadFile/" + changeName);
		   }
	      int result = hbService.insertBoard(h);
	      if(result > 0) { 
	    	  session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
	          return "redirect:list.bo";
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
	   
	   @RequestMapping("deleteBoard.bo")
	   public String deleteBoard(int bno, String filePath,HttpSession session, Model model) {  //파일이 있으면 삭제하면 안되기 때문에 파일도 넘겨받아야함
	      int result = hbService.deleteBoard(bno);
	           if(result > 0) {
	        	   if(!filePath.equals("")) { //파일이 비어있지 않으면
	        		 new File(session.getServletContext().getRealPath(filePath)).delete();  //물리적인 경로에서 삭제
	        	   } 
	        	   session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
	        	   return "redirect:list.bo";        //삭제 후 리스트로 돌아옴
	        	   
	           } else {
	        	   model.addAttribute("errorMsg", "게시글 삭제 실패");
	        	   return "common/errorPage";
	           }
	       } 	
	   
	   
	   @RequestMapping("updateForm.bo") 
	   public String updateForm(int bno, Model model) {
		   model.addAttribute("h", hbService.selectBoard(bno));
	      return "homeBoard/boardUpdateForm";
	   }
	   
	   @RequestMapping("update.bo") 
	   public String updateBoard(HomeBoard h, MultipartFile reupfile, HttpSession session, Model model) {
		   if(!reupfile.getOriginalFilename().equals("")) {
			  if(h.getBoardMainimgOrigin() != null) {
				  new File(session.getServletContext().getRealPath(h.getBoardMainimgChange())).delete();
			  }
			  String changeName = changeFilename(reupfile, session);
			   h.setBoardMainimgOrigin(reupfile.getOriginalFilename());
			   h.setBoardMainimgChange("/resources/uploadFile/" + changeName); 
		   }	
		   int result = hbService.updateBoard(h);
		   
		   if(result > 0) { //업데이트가 잘 되었으면
			  session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			  return "redirect:detail.bo?bno=" + h.getBoardNo();
		   }else {
			   model.addAttribute("errorMsg","게시글 수정 실패");
			   return "common/errorPage";
		   } 
	   } 
	}
	    
 