package com.kh.muze.chatbot.model.service;

import com.kh.muze.chatbot.model.vo.ChatbotResponse;

public interface ChatbotService {
	
	ChatbotResponse chatbotResponse(String userMessage);

}
