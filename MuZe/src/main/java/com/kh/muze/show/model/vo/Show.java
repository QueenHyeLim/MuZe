package com.kh.muze.show.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Show {
	
	private String musId; //MUS_ID	VARCHAR2(1000 BYTE) 작품ID
	private String theaterId; //THEATER_ID	VARCHAR2(1000 BYTE) 극장번호
	private int genreNo; //GENRE_NO	NUMBER 장르번호
	private String musTitle; //MUS_TITLE	VARCHAR2(1000 BYTE) 작품명
	private Date startDate; //START_DATE	DATE 시작일
	private Date endDate; //END_DATE	DATE 종료일
	private String producer; //PRODUCER	VARCHAR2(500 BYTE) 제작사
	private String runTime; //RUN_TIME	VARCHAR2(20 BYTE) 런타임
	private String poster; //POSTER	VARCHAR2(1000 BYTE) 포스터
	private String ageRate; //AGE_RATE	VARCHAR2(50 BYTE) 관람연령
	private String status; //STATUS	VARCHAR2(50 BYTE) 공연상태
	private String perTime; //PER_TIME	VARCHAR2(100 BYTE) 공연시간
	private String cast; //CAST	VARCHAR2(200 BYTE) 출연진

}