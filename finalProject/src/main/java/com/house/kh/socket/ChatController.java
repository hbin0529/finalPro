package com.house.kh.socket;

import java.io.IOException;
import java.security.Principal;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
    
	@RequestMapping("chat.so")
	public String chat() {
		return "chatting";
	}
	
    @Autowired
    private UserService userservice;
    
    // 채팅 메세지 전달
    @MessageMapping("/chat/{room}")
    @SendTo("/subscribe/chat/{room}")
    public ChatMessage sendChatMessage(@DestinationVariable("room") String room, ChatMessage message, SimpMessageHeaderAccessor headerAccessor, Principal principal) {
        System.out.println("채팅 메세지 들어옴");
        
        message.setDatetime(LocalDateTime.now().toString());
        
        try {
            fileWrite(room, message);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return message;
    }

	private void fileWrite(String room, ChatMessage message) {
		// TODO Auto-generated method stub
		
	}

}
