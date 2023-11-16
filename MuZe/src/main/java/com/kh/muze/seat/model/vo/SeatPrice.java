package com.kh.muze.seat.model.vo;

import lombok.Data;

@Data
public class SeatPrice {
	
	private int seatPk; //SEATPK	NUMBER
	private String kind; //KIND	VARCHAR2(10 BYTE)
	private int price; //PRICE	NUMBER

}
