package com.kh.muze.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @Setter @ToString
public class Board {
	
	private int boardNo;
	private int boardWriter;
	private int cateNo;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private int count;
	private String boardStatus;
	private String userId;
}
