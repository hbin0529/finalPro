package com.house.kh.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("chat.in")
	public String chatting() {
		return "interrior/chat";
	}
}
