package com.house.kh.test.controller;

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
import com.house.kh.test.model.service.TestService;
import com.house.kh.test.model.vo.Test;

@Controller
public class TestController {
   @Autowired
   private TestService tService;


   /* 메인페이지 상품 TOP 리스트 불러오기 sbService*/
   @ResponseBody
	@RequestMapping(value="topStoreBoardList.bo", produces="application/json; charset=UTF-8")
	public String ajaxTopStoreBoardList() {
		ArrayList<Test> list = tService.topStoreBoardList();
		return new Gson().toJson(list);
	}
   
   

}