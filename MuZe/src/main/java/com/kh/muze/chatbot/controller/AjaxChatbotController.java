package com.kh.muze.chatbot.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.muze.chatbot.model.service.ChatbotService;
import com.kh.muze.chatbot.model.vo.ChatbotResponse;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class AjaxChatbotController {
	
	private final ChatbotService chatbotService;
	
	@PostMapping(value="message.ch", produces="application/json; charset=UTF-8")
	public String chatbotMessage(String userMessage) {
		
		ChatbotResponse chatbotRes = chatbotService.chatbotResponse(userMessage);
		
		return new Gson().toJson(chatbotRes);
	}

}
