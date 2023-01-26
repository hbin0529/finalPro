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
		if(!s.getSelPwd().equals("kakaoSnsLoginUser")) {
			String encPwd = bcryptPasswordEncoder.encode(s.getSelPwd());
			s.setSelPwd(encPwd);
		}
		String memberFullEmail = "";
			memberFullEmail = s.getSelEmailF()+"@"+s.getSelEmailS();
		s.setSelEmail(memberFullEmail);
		
		
		
		int insertMemResult = SService.insertMember(s);
		if(insertMemResult > 0) {
			session.setAttribute("alertMsg", "회원가입에 성공하였습니다.");
			return "member/login";
		}else {
			//md.addAttribute("error", "회원가입실패");
			return "redirect:/";
		}
		
	}
	
	
	@RequestMapping("loginUser.se")
	public String login(Seller s, HttpSession session, Model model) {
		
		Seller loginUser = SService.searchUser(s);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(s.getSelPwd(), loginUser.getSelPwd())) {
			session.setAttribute("id", s.getSelEmail());
			session.setAttribute("nick", loginUser.getSelBusName());
			session.setAttribute("permit", loginUser.getMemPermit());
			session.setAttribute("selNo", loginUser.getSelNo());
			session.setAttribute("s", loginUser);
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
	
	
	@RequestMapping("myPage.se")
	public String myPage(String id) {
		return "";
	}
	
	
	@ResponseBody
	@RequestMapping("getSellerPoint.se")
	public int getSellerPoint(int selNo) {
		int getSellerPoint = SService.getSellerPoint(selNo);
		return getSellerPoint;
	}
	
	
	@RequestMapping("sellerInfoUpdate.se")
	public String sellerInfoUpdate(int selNo, Model model) {
		
		Seller getSellerInfo = SService.getSellerInfo(selNo);
		String fullEmail = getSellerInfo.getSelEmail();
		String[] emails = fullEmail.split("@");
		getSellerInfo.setSelEmailF(emails[0]);
		getSellerInfo.setSelEmailS(emails[1]);
		model.addAttribute("seller", getSellerInfo);
		return "sellerPage/sellerInfoUpdate";
	}
	
	@RequestMapping("doUpdate.se")
	public String doUpdate(Seller seller, String address, int zipcode, String detailaddress, Model model) {
		
		seller.setSelZipcode(zipcode);
		seller.setSelAddr(address);
		seller.setSelDetailAddr(detailaddress);
		
		int updateResult = SService.doUpdate(seller);
		
		if(updateResult>0) {
			model.addAttribute("alertMsg", "정보가 성공적으로 수정되었습니다.");
			return "main";
			
		}else {
			model.addAttribute("alertMsg", "회원정보 수정에 실패하였습니다.");
			return "common/errorPage";
		}
		
	}
	
	
}
