package com.kh.muze.seat.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Seat {
	
	int seatNo; //SEAT_NO	NUMBER
	String seatType; //SEAT_TYPE	VARCHAR2(10 BYTE)
	int seatPk; //SEATPK	NUMBER
	String seatId; //SEAT_ID	VARCHAR2(50 BYTE)

	// Reservation VO 중 필요한 필드 추가
	int resNo; //
	Date resDate; //
	
	// 선택한 날짜 넣을 필드 추가
	String selectDate; //
	String musId; 
}
