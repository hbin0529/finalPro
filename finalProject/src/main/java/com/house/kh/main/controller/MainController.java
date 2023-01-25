package com.house.kh.main.controller;

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
import com.house.kh.main.model.service.MainService;
import com.house.kh.main.model.vo.Main;
import com.house.kh.storeBoard.model.service.StoreBoardService;
import com.house.kh.storeBoard.model.vo.Product;

@Controller
public class MainController {
   @Autowired
   private MainService mService;


   /* 메인페이지 카테고리별 상품 TOP1 리스트 불러오기 sbService*/
   @ResponseBody
	@RequestMapping(value="topStoreBoardList.bo", produces="application/json; charset=UTF-8")
	public String ajaxTopStoreBoardList() {
		ArrayList<Main> list = mService.topStoreBoardList();
		return new Gson().toJson(list);
	}
   
   /* 집들이 조회수 TOP3 리스트 불러오기 sbService*/
   @ResponseBody
	@RequestMapping(value="topStoreBoardList2.bo", produces="application/json; charset=UTF-8")
	public String ajaxTopStoreBoardList2() {
		ArrayList<Main> list = mService.topStoreBoardList2();
		return new Gson().toJson(list);
	}
   
   /* 메인페이지 상품 TOP3 리스트 불러오기 sbService*/
   @ResponseBody
	@RequestMapping(value="topStoreBoardList3.bo", produces="application/json; charset=UTF-8")
	public String ajaxTopStoreBoardList3() {
		ArrayList<Main> list = mService.topStoreBoardList3();
		return new Gson().toJson(list);
	}
   
   /* 전체 상품 리스트 불러오기 sbService*/
   @ResponseBody
	@RequestMapping(value="topStoreBoardList4.bo", produces="application/json; charset=UTF-8")
	public String ajaxTopStoreBoardList4() {
		ArrayList<Main> list = mService.topStoreBoardList4();
		return new Gson().toJson(list);
	}
   
   

}