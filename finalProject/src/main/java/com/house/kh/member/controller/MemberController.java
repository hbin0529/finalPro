package com.house.kh.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.house.kh.member.model.service.MemberService;
import com.house.kh.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService mService;
	
	
	/*
	@Inject
	private SnsValue naverSns;
	
	@Inject
	private SnsValue googleSns;
	*/
	
	
	//로그인시도
	//로그인처리
	
	@RequestMapping("loginUser.me")
	public String login(Member m, HttpSession session, Model model) {
		
		Member loginUser = mService.searchUser(m);
		
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {
			String[] emailFS = m.getMemEmail().split("@");
			String emailF = emailFS[0];
			String emailS = emailFS[1];
			session.setAttribute("emailF", emailF);
			session.setAttribute("emailS", emailS);
			session.setAttribute("id", m.getMemEmail());
			session.setAttribute("nick", loginUser.getMemNick());
			session.setAttribute("permit", 1);
			session.setAttribute("m", loginUser);
			return "redirect:/";
		}else {
			//로그인실패, 에러페이지로 포워딩
			model.addAttribute("alertMsg", "로그인 실패");
			return "member/login";
			
		}
	}
	
	//로그아웃
	@RequestMapping("logout.me")
	public String logout(HttpSession session, Model m) {
		session.invalidate();
		m.addAttribute("alertMsg", "로그아웃되었습니다");
		return "common/logout";
	}
	
	
	
	//로그인페이지로이동
	@RequestMapping("login.me")
	public String login(HttpSession session) {
		String comment = mService.createComment();
		session.setAttribute("randomComment", comment);
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
		//kakaoSnsLoginUser
		if(!m.getMemPwd().equals("kakaoSnsLoginUser")) {
			String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
			m.setMemPwd(encPwd);
		}
		String memberFullEmail = "";
		if(m.getMemEmail()!=null) {
			memberFullEmail = m.getMemEmail();
		}else {
			memberFullEmail = m.getMemEmailF()+"@"+m.getMemEmailS();
		}
		m.setMemEmail(memberFullEmail);
		
		
		int insertMemResult = mService.insertMember(m);
		if(insertMemResult > 0) {
			session.setAttribute("alertMsg", "회원가입에 성공하였습니다.");
			return "member/login";
		}else {
			md.addAttribute("alertMsg", "회원가입에 실패하셨습니다.");
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
	
	//카카오아이디로그인시도가 들어왔을떄 처리
	@RequestMapping("kakaoIdControll.me")
	public String kakaoIdControll(String kakaoUserEmail, String kakaoUserNickname, String kakaoGender, HttpSession session, Model model) throws IOException{
		System.out.println(kakaoGender);
		Member m = mService.kakaoUserSignChk(kakaoUserEmail);
		int mCount = mService.kakaoUserSignChkCount(kakaoUserEmail);
		if(mCount>0) {
			//이미 존재하는 회원이므로 로그인처리
			String[] emailFS = m.getMemEmail().split("@");
			String emailF = emailFS[0];
			String emailS = emailFS[1];
			session.setAttribute("emailF", emailF);
			session.setAttribute("emailS", emailS);
			session.setAttribute("id", kakaoUserEmail);
			session.setAttribute("nick", kakaoUserNickname);
			session.setAttribute("permit", 1);
			session.setAttribute("m", m);
			return "main";
		}
		else {
			//신규회원이므로 회원가입 후 로그인처리
			//회원가입처리하기전에 카카오에서 못받은 정보들 마저 입력하게 설정
			model.addAttribute("kakaoUserEmail", kakaoUserEmail);
			model.addAttribute("kakaoUserNickname", kakaoUserNickname);
			System.out.println(kakaoGender);
			if(kakaoGender=="male") {
				kakaoGender = "M";
			}else if(kakaoGender=="female") {
				kakaoGender = "F";
			}else {
				kakaoGender = "none";
			}
			model.addAttribute("kakaoGender", kakaoGender);
			model.addAttribute("alertMsg", "사용자 필수정보를 추가로 입력해주세요");
			
			return "member/kakaoSignInAddInfo";
		}
		
	}
	
	
	@RequestMapping("kakaoTest.me")
	public String gogosing() {
		return "member/kakaoSignInAddInfo";
	}
	
	
	@RequestMapping("myPage.me")
	public String myPage(String id) {
		return "member/myPage";
	}
	
	
	@RequestMapping("updateMem.me")
	public String updateMem(Member inputM, HttpSession session, Model model, MultipartFile upfile, String existImg) {
		
		
		if(!upfile.getOriginalFilename().equals("")) {
			if(!existImg.contains("logo_user")) {
				new File(session.getServletContext().getRealPath(existImg)).delete();
			}else {
				//기본이미지는 삭제하면 안돼서 따로 뺌
			}
			String originName = upfile.getOriginalFilename(); 
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); 
			int ranNum = (int)(Math.random() * 90000 + 10000); 
			String ext = originName.substring(originName.lastIndexOf(".")); // .jpg .png 이런 확장자만 따로발라낸거 
			String changeName = currentTime + ranNum + ext;
			  
			//업로드시키고자 하는 폴더의 물리적 경로 알아오기(세션에있음) 
			String savePath = session.getServletContext().getRealPath("/resources/userImg/");
			  
			try { 
				upfile.transferTo(new File(savePath + changeName)); 
			} catch(IllegalStateException e) {
				e.printStackTrace(); 
			} catch (IOException e) {
				e.printStackTrace(); 
			}
			 
			inputM.setMemImg("/resources/userImg/" + changeName);
		}else {
			inputM.setMemImg(existImg);
		}
		
		
		
		if(!inputM.getMemPwd().equals("kakaoSnsLoginUser")) {
			String encPwd = bcryptPasswordEncoder.encode(inputM.getMemPwd());
			inputM.setMemPwd(encPwd);
		}
		
		int updateMemberResult = mService.updateMember(inputM);
		if(updateMemberResult>0) {
			model.addAttribute("alertMsg", "정상적으로 수정되었습니다. 다시 로그인해주세요");
			session.invalidate();
			return "main";
		}else {
			return "redirect:/";
		}
		
		
	}
	
	
	
	
	
	@RequestMapping("delete.me")
	public String deleteMember(String id, String pwd, Model model, HttpSession session) {
		boolean isKakao = mService.isKakao(id); 
		if(isKakao) {
			//카카오유저일때
			//그냥탈퇴
			//탈퇴메소드실행
			mService.deleteMem(id);
			model.addAttribute("alertMsg", "성공적으로 탈퇴되었습니다.");
			session.invalidate();
			return "main";
		}else{
			//카카오아닐때
			model.addAttribute("id", id);
			return "member/deleteMem";
		}
	}
	
	@RequestMapping("deleteConfirm.me")
	public String deleteConfirm(String id, String pwd, Model model, HttpSession session) {
		
		Member m = new Member();
		m.setMemEmail(id);
		m.setMemPwd(pwd);
		Member loginUser = mService.searchUser(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {
			mService.deleteMem(id);
			model.addAttribute("alertMsg", "성공적으로 탈퇴되었습니다");
			session.invalidate();
			return "main";
		}else {
			//로그인실패, 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원가입 탈퇴 실패");
			return "redirect:/";
			
		}
		
		
	}
	
	// 형빈 메인 ajax 테스트(유튜브에 태그 걸어놓음 YOUTUBE) 
	@RequestMapping("mainTest.ma")
	public String mainTest() {
		return "main2";
	}
	
	
	
}
