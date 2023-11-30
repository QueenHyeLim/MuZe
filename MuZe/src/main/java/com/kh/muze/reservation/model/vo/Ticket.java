package com.kh.muze.reservation.model.vo;

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
public class Ticket {
	
	private String ticketNo; // 티켓번호 ApproveResponse 객체에 담긴 aid
	private int resNo; 		//  예매번호 Reservation 객체 담긴 resNo

}
