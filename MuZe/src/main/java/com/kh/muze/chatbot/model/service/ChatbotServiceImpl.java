package com.kh.muze.chatbot.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.muze.chatbot.model.dao.ChatbotDao;
import com.kh.muze.chatbot.model.vo.ChatbotResponse;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ChatbotServiceImpl implements ChatbotService {
	
	private final SqlSessionTemplate sqlSession;
	
	private final ChatbotDao chatbotDao;
	
	@Override
	public ChatbotResponse chatbotResponse(String userMessage) {
		return chatbotDao.chatbotResponse(sqlSession, userMessage);
	}

}
