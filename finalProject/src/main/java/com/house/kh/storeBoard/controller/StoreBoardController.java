package com.house.kh.storeBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.house.kh.common.model.vo.PageInfo;
import com.house.kh.common.template.Pagination;
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
		//int reviewCount = sbService.selectReviewCount();
		//PageInfo pi = Pagination.getPageInfo(reviewCount, nowPage, 10, 5);
		
		//mv.addObject("pi",pi);
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

	/* 문의리스트 불러오기 */
	@ResponseBody
	@RequestMapping(value = "qlist.bo", produces = "application/json; character=utf-8")
	public String ajaxSelectQuestionList(int pno) {
		ArrayList<Product> list = sbService.selectQuestionList(pno);
		return new Gson().toJson(list);
	}

	/*
	 * 답변리스트 불러오기
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "alist.bo", produces =
	 * "application/json; character=utf-8") public String ajaxSelectAnswerList(int
	 * pno) { ArrayList<Product> list = sbService.selectAnswerList(pno); return new
	 * Gson().toJson(list); }
	 */

}
