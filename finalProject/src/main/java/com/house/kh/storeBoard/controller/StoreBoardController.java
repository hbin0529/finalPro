package com.house.kh.storeBoard.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.house.kh.storeBoard.model.service.StoreBoardService;
import com.house.kh.storeBoard.model.vo.Product;

@Controller
public class StoreBoardController {
	@Autowired
	private StoreBoardService sbService;

	/* 스토어리스트 불러오기 */
	@RequestMapping("storelist.bo")
	public ModelAndView selectList(Product product,ModelAndView mv, Model model) {
		int listCount = 0;
		ArrayList<Product> list = new ArrayList<Product>();
		if((product.getCateNo() > 0)) {
			list = sbService.selectCateList(product);
			listCount = sbService.selectCateListCount(product);
		}else {
			list = sbService.selectList();
			listCount = sbService.selectListCount();
		}	

		mv.addObject("list", list);
		model.addAttribute("listCount", listCount);
		mv.setViewName("storeBoard/storeBoardListView");

		return mv;
	}

	/* 상품디테일정보 불러오기 */
	@RequestMapping("productdetail.bo")
	public ModelAndView selectBoard(int pno, ModelAndView mv) {
		
		int result = sbService.increaseCount(pno);
		if (result > 0) {
			Product p = sbService.selectBoard(pno);
			mv.addObject("p", p).setViewName("storeBoard/storeBoardDetailView");
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
		public String changeFilename(MultipartFile upfile,MultipartFile upfile1, MultipartFile upfile2, HttpSession session) {
			String originName = upfile.getOriginalFilename();
							    upfile1.getOriginalFilename();
							    upfile2.getOriginalFilename();
			
			String currentTime = new SimpleDateFormat("yyyyMMdddHHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 90000 + 10000); //10000~99999까지 랜덤값
			String ext = originName.substring(originName.lastIndexOf(".")); //이름제일 뒤에서 .뒤에있는것 추출하기 (.jpg)
			String changeName = currentTime + ranNum + ext;
			
			//업로드 시키고자하는 폴더의 물리적인 경로 알아오기
			String savePath = session.getServletContext().getRealPath("/resources/uploadFile/");
			
			try {
				upfile.transferTo(new File(savePath + changeName));
				upfile1.transferTo(new File(savePath + changeName));
				upfile2.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			return changeName;
		}
	
	
	@RequestMapping("proInsert.bo") //게시글 입력후 데이터에 넣어주기
	public String insertProduct(Product p, MultipartFile upfile,MultipartFile upfile1, MultipartFile upfile2, HttpSession session, Model model, String selNo2) {
		p.setSelNo(Integer.parseInt(selNo2));
			
			String changeName = changeFilename(upfile, upfile1, upfile2, session);

			p.setProOriginImg(upfile.getOriginalFilename());
			p.setProChangeImg("resources/uploadFile/" + changeName);
			p.setProOriginImg1(upfile1.getOriginalFilename());
			p.setProChangeImg1("resources/uploadFile/" + changeName);
			p.setProOriginDetailimg(upfile2.getOriginalFilename());
			p.setProChangeDetailimg("resources/uploadFile/" + changeName);
		
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
			String changeName = changeFilename(reupfile, reupfile1, reupfile2, session);
			
			p.setProOriginImg(reupfile.getOriginalFilename());
			p.setProChangeImg("resources/uploadFile" + changeName);
			p.setProOriginImg1(reupfile1.getOriginalFilename());
			p.setProChangeImg1("resources/uploadFile" + changeName);
			p.setProOriginDetailimg(reupfile2.getOriginalFilename());
			p.setProChangeDetailimg("resources/uploadFile" + changeName);
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
	
	@ResponseBody
	@RequestMapping(value="qinsert.bo")
	public void ajaxInsertQuestion(Product p, Model model, HttpServletResponse response) throws IOException {
		int result = sbService.insertQuestion(p);
		
		if(result > 0) {
			model.addAttribute("alertMsg", "문의 등록이 완료 되었습니다.");
			response.sendRedirect("productdetail.bo?pno="+ p.getProNo());
		}
	}
	
	@RequestMapping("qdelete.bo")
	public String queDelete(int proQueNo, Model model, HttpSession session) {
		int result = sbService.queDelete(proQueNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 문의가 삭제되었습니다");
			return "storeBoard/storeBoardListView";
		} else {
			model.addAttribute("errorMsg" , "문의 삭제 실패");
			return "common/errorPage";
		}
	}	
	
	
	

}
