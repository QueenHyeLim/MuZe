package com.kh.muze.ticket.model.vo;

import java.util.ArrayList;

import com.kh.muze.seat.model.vo.Seat;

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
public class Mymuze {
	
	private String ticketNo;	 // TICKET_NO
	private String musId;		 // MUS_ID
	private String musTitle;	 // MUS_TITLE
	private int resNo; 		 // BOOK_NO OR RES_NO
	private int seatNo;			 // SEAT_NO
	private String seatId; 		 // SEAT_ID
	//private ArrayList<Seat> seatIdlist; //
	private String resDate;		 // RES_DATE
	private String theaterId;	 // THEATER_ID
	private String theaterName;	 // THEATER_NAME
}
