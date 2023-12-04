package com.kh.muze.chatbot.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class ChatbotResponse {
	
	private int responseNo; //RESPONSE_NO	NUMBER
	private String responseKey; //RESPONSE_KEY	VARCHAR2(100 BYTE)
	private String responseCon; //RESPONSE_CON	VARCHAR2(2000 BYTE)
}
