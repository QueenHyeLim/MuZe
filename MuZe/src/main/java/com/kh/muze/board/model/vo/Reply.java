package com.kh.muze.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
 
@AllArgsConstructor @NoArgsConstructor @ToString @Getter @Setter
public class Reply {
	private int brefNo;
	private int boardNo;
	private String userId;
	private String repContent;
	private String creaetDate;
}
