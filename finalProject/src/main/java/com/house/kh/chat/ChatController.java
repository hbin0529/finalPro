package com.house.kh.chat;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.kh.member.model.vo.Member;
import com.house.kh.seller.model.vo.Seller;

@Controller
public class ChatController {
	
	@RequestMapping("chat.in")
	public String chatting(HttpSession session, Seller s, Member m) {
		m = (Member) session.getAttribute("m");
		s = (Seller) session.getAttribute("s");
		return "interrior/chat";
	}
}
