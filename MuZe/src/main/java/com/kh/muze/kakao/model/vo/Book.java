package com.kh.muze.kakao.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Book {
	
	private String bookMusId;
	private String bookDate;
	private int bookUserNo;
	private int bookSeatNo;

}
