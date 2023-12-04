package com.kh.muze.chatbot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ChatbotController {
	
	//private final ChatbotService chatbotService;
	
	@GetMapping("chatbot.ch")
	public String goChatbot() {
		
		
		return "chatbot/chatbotView";
	}
	

}
