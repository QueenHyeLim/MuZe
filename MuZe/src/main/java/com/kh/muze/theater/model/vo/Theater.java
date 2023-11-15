package com.kh.muze.theater.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Theater {

	private String fcltynm; // 시설명
	private int mt13cnt; // 공연장 수
	private String opende; // 개관연도
	private int seatscale; // 객석수
	private String telno; // 전화번호
	private String relateurl; // 홈페이지
	private String adres; // 주소
	private int la; // 위도
	private int lo; // 경도
}
