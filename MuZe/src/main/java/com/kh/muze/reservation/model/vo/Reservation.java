package com.kh.muze.reservation.model.vo;

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
public class Reservation {
	
	int resNo; //RES_NO	NUMBER
	int userNo; //	NUMBER
	String musId; //MUS_ID	VARCHAR2(1000 BYTE)
	int seatNo; //SEAT_NO	NUMBER
	Date resDate; //RES_DATE	DATE
	String resPay; //RES_PAY	VARCHAR2(1 BYTE)
	int resCount; //RES_COUNT	NUMBER
	
	
}
