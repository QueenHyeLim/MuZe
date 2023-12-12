package com.kh.muze.seat.model.vo;

import java.sql.Date;

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
public class Seat {
	
	private int seatNo;				// SEAT_NO	NUMBER
	private String seatType;		// SEAT_TYPE	VARCHAR2(10 BYTE)
	private int seatPk;				// SEATPK	NUMBER
	private String seatId;			// SEAT_ID	VARCHAR2(50 BYTE)
	private int resNo; 				// Reservation VO 중 필요한 필드 추가
	private Date resDate; 			// RES_DATE 예매날짜
	private String selectDate;		// 선택한 날짜 넣을 필드 추가
	private String musId; 			// MUS_ID
	
}
