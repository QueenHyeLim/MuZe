package com.kh.muze.chatbot.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.chatbot.model.vo.ChatbotResponse;

@Repository
public class ChatbotDao {

	public ChatbotResponse chatbotResponse(SqlSessionTemplate sqlSession, String userMessage) {
		return sqlSession.selectOne("chatbotMapper.chatbotResponse", userMessage);
	}
	
}
