package com.house.kh.interrior.controller;

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
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.house.kh.homeBoard.model.vo.HomeBoard;
import com.house.kh.interrior.model.service.InterriorService;
import com.house.kh.interrior.model.vo.Interrior;
import com.house.kh.member.model.service.MemberService;
import com.house.kh.seller.model.service.SellerService;
import com.house.kh.seller.model.vo.Seller;

@Controller
public class InterriorController {
	
	@Autowired
	private SellerService SService;
	
	@Autowired
	private InterriorService IService;
	
	@RequestMapping("interrior.in")
	public String interrior(Model model) {
		ArrayList<Seller> sellList = SService.getAllSeller();
		model.addAttribute("sellList", sellList);
		return "interrior/interriorMain";
	}
	
	@RequestMapping("interior_detail.in")
	public String interriorDetail(int selNo, Model model, String selBusName, String selInterIntroduce) {
		ArrayList<Interrior> interriorInfo = IService.interriorInfo(selNo);
		model.addAttribute("i", interriorInfo);
		model.addAttribute("selBusName", selBusName);
		model.addAttribute("selInterIntroduce", selInterIntroduce);
		return "interrior/interriorDetail";
	}
	
	@RequestMapping("enrollForm.in")
	   public String enrollForm() {
	      return "interrior/interriorEnrollForm";
	   }
	
	
	@ResponseBody
    @RequestMapping(value="SummerNoteImageFile2", produces="application/json; charset=utf-8")
    public Map<Object, Object> SummerNoteImageFile(@RequestParam("file") MultipartFile file, @RequestParam("pathF") String pathF, HttpSession session) {
      System.out.println("닿긴함");
       //JsonObject jsonObject = new JsonObject();
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
          //jsonObject.addProperty("url", "/summernoteImage/"+saveFileName);
          //jsonObject.addProperty("responseCode", "success");
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

	@RequestMapping("insert.in")
	public String insertBoard(Interrior i, MultipartFile upfile, HttpSession session, Model model) {
			if(!upfile.getOriginalFilename().equals("")) {
			  	String changeName = changeFilename(upfile, session);
		        i.setInterImgOri(upfile.getOriginalFilename());
		        i.setInterImgChange("resources/uploadFile/" + changeName);
		  	}
		  	int result = IService.insertInterrior(i);
	      	if(result > 0) { 
      			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
	    	  	return "main";
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
	
	
	
}
