package com.house.kh.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.kh.member.model.service.MemberService;
import com.house.kh.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService mService;
	
	//로그인페이지로이동
	@RequestMapping("login.me")
	public String login() {
		return "member/login";
	}
	
	//회원가입페이지로이동
	@RequestMapping("signIn.me")
	public String signIn() {
		return "member/signIn";
	}
	
	//회원가입처리
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model md, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		System.out.println(encPwd);
		
		String memberFullEmail = m.getMemEmailF()+"@"+m.getMemEmailS();
		m.setMemEmail(memberFullEmail);
		
		
		int insertMemResult = mService.insertMember(m);
		if(insertMemResult > 0) {
			session.setAttribute("alertMsg", "회원가입에 성공하였습니다.");
			return "member/login";
		}else {
			//md.addAttribute("error", "회원가입실패");
			return "redirect:/";
		}
		
	}
	
	//아이디중복검사 ajax통신
	@ResponseBody
	@RequestMapping("idChk.me")
	public String idChk(String id) {
		int idChkResult = mService.searchIdVali(id);
		if(idChkResult>0) {
			return "N";
		}else {
			return "Y";
		}
	}
	
	//닉네임중복검사 ajax통신
	@ResponseBody
	@RequestMapping("nickChk.me")
	public String nickChk(String nick) {
		int nickChkResult = mService.searchNickVali(nick);
		if(nickChkResult>0) {
			return "N";
		}else {
			return "Y";
		}
	}
	
	
	
	
	
	
}
