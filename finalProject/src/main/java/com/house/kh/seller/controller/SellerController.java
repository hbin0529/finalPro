package com.house.kh.seller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.kh.member.model.vo.Member;
import com.house.kh.seller.model.service.SellerService;
import com.house.kh.seller.model.vo.Seller;

@Controller
public class SellerController {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private SellerService SService;
	
	@RequestMapping("sellerSignIn.se")
	public String signIn() {
		return "seller/sellerSignIn";
	}
	@RequestMapping("sellerLogin.se")
	public String login() {
		return "seller/sellerLogin";
	}
	
	
	
	
	
	
	
	@RequestMapping("sellerInsert.se")//집코드 어드레스 디테일어드레스
	public String insertMember(Seller s, Model md, HttpSession session, int zipcode, String address, String detailaddress) {
		s.setSelZipcode(zipcode);
		s.setSelAddr(address);
		s.setSelDetailAddr(detailaddress);
		System.out.println(s);
		if(!s.getSelPwd().equals("kakaoSnsLoginUser")) {
			String encPwd = bcryptPasswordEncoder.encode(s.getSelPwd());
			s.setSelPwd(encPwd);
		}
		String memberFullEmail = "";
		System.out.println(s.getSelEmailF());
		System.out.println(s.getSelEmailS());
		//if(s.getSelEmail().equals("")||s.getSelEmail()!=null) {
			//memberFullEmail = s.getSelEmail();
		//}else {
			memberFullEmail = s.getSelEmailF()+"@"+s.getSelEmailS();
		//}
		System.out.println(memberFullEmail);
		s.setSelEmail(memberFullEmail);
		
		
		System.out.println(s);
		
		int insertMemResult = SService.insertMember(s);
		if(insertMemResult > 0) {
			session.setAttribute("alertMsg", "회원가입에 성공하였습니다.");
			return "seller/sellerLogin";
		}else {
			//md.addAttribute("error", "회원가입실패");
			return "redirect:/";
		}
		
	}
	
	
	@RequestMapping("loginUser.se")
	public String login(Seller s, HttpSession session, Model model) {
		
		System.out.println(s.getSelEmail());
		Seller loginUser = SService.searchUser(s);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(s.getSelPwd(), loginUser.getSelPwd())) {
			session.setAttribute("id", s.getSelEmail());
			session.setAttribute("nick", loginUser.getSelBusName());
			session.setAttribute("permit", loginUser.getMemPermit());
			session.setAttribute("selNo", loginUser.getSelNo());
			return "redirect:/";
		}else {
			//로그인실패, 에러페이지로 포워딩
			model.addAttribute("errorMsg", "로그인 실패");
			return "seller/sellerSignIn";
			
		}
	}
	
	@ResponseBody
	@RequestMapping("idChk.se")
	public String idChk(String id) {
		int idChkResult = SService.searchIdVali(id);
		if(idChkResult>0) {
			return "N";
		}else {
			return "Y";
		}
	} 
	
	
	
	
	
	
	
}
