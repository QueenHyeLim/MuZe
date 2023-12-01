package com.kh.muze.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
 
@AllArgsConstructor @NoArgsConstructor @ToString @Getter @Setter
public class Reply {
	private int brepNo;
	private int boardNo;
	private int userNo;
	private String repContent;
	private String creaetDate;
	private String replyWriter;
}
