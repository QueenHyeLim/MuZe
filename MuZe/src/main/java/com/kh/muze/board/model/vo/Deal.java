package com.kh.muze.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Setter @Getter @ToString
public class Deal {
	private int dealNo;
	private int userNo;
	private String showTitle;
	private String ticketDate;
	private String ticketTime;
	private String seatFloor;
	private String seatRank;
	private String seatArea;
	private int seatCol;
	private String seatDes;
	private int ticketPrice;
	private int ticketMany;
	private String other;
	private String saleStatus;
	private String originName;
	private String changeName;
	private String dealWriter;
}
