package com.kh.muze.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Setter @Getter @ToString
public class Like {
	private int cateNo;
	private int contentNo;
	private String userNo;
	private String likeDate;
}
