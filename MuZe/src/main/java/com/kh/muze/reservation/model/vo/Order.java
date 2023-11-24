package com.kh.muze.reservation.model.vo;

import lombok.Data;

@Data
public class Order {
	
	private String OrderTitle; //, String selectdate, String selectseat, String totalPrice,
	private String OrderMusId; 
	private String OrderDate; //
	private String OrderSeat;
	private String OrderPrice;
	private String OrderUser; //주문 회원의 ID
}
