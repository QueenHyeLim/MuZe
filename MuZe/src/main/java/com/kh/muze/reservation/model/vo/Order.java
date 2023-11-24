package com.kh.muze.reservation.model.vo;

import lombok.Data;

@Data
public class Order {
	
	private String orderTitle; //, String selectdate, String selectseat, String totalPrice,
	private String orderMusId; 
	private String orderDate; //
	private String orderSeat;
	private String orderPrice;
	private String rderUser; //주문 회원의 ID
}
