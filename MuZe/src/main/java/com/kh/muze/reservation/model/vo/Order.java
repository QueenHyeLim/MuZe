package com.kh.muze.reservation.model.vo;

import java.util.ArrayList;

import com.kh.muze.seat.model.vo.Seat;

import lombok.Data;

@Data
public class Order {
	
	private String orderTitle; //, String selectdate, String selectseat, String totalPrice,
	private String orderMusId; 
	private String orderDate; //
	private String orderSeat; //H12, H13
	private String orderPrice;
	private String orderUser; //주문 회원의 ID
	private String musTheater; //극장명
	private int orderUserNo;
	private ArrayList<Seat> seatZip;// 좌석번호
}