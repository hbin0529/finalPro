package com.house.kh.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.kh.member.model.service.MemberService;
import com.house.kh.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("login.me")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("signIn.me")
	public String signIn() {
		return "member/signIn";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model md, HttpSession session) {
		//System.out.println("m은 " + m);
		//1. 한글깨짐 : 스프링에서 제공하는 인코딩 필터 등록해서 UTF로 변환
		//2. 회원가입시 나이를 안넣으면 에러발생, null을 int형변환할수없어서 => String으로 변환
		//3. 비밀번호 입력 시 암호화하여 DB에 저장
		
		/*
		 * 3.1 단방향 암호화 : 복호화가 불가능함(sha-256, sha-512)
		 * 평문 -------------> 암호문
		 * 
		 * 3.2 양방향 암호화 : 복호화 가능(Bcrypt방식 : 평문+난수를 암호화)
		 * 평문 <------------> 암호문
		 */
		
		//쓰는법
		//1. pom.xml에 라이브러리 추가
		//2. BcryptPasswordEncoder클래스를 빈으로 등록
		//3. web.xml에
		//System.out.println("평문 : " + m.getUserPwd());
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		System.out.println(encPwd);
		
		String memberFullEmail = m.getMemEmailF()+"@"+m.getMemEmailS();
		m.setMemEmail(memberFullEmail);
		
		
		int insertMemResult = mService.insertMember(m);
		if(insertMemResult > 0) {
			//session.setAttribute("alertMsg", "회원가입에 성공하였습니다.");
			return "redirect:/";
		}else {
			//md.addAttribute("error", "회원가입실패");
			return "redirect:/";
		}
		
	}
	
	
	
}
