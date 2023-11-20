package com.kh.muze.seat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.muze.seat.model.service.SeatService;
import com.kh.muze.seat.model.vo.Seat;

@Controller
public class SeatController {
	
	@Autowired
	private SeatService seatService;

	@ResponseBody
	@RequestMapping(value="disabled.st", produces="application/json; charset=UTF-8")
	public String disabledSeat(String musId, String selectDate) {
		System.out.println(musId);
		System.out.println(selectDate);
		
		Seat seat = new Seat();
		seat.setMusId(musId);
		seat.setSelectDate(selectDate);
		/*
		Reservation reservation = new Reservation();
		reservation.setMusId(musId);
		reservation.setSelectDate(selectDate);

		*/
		return new Gson().toJson(seatService.disabledSeat(seat));



	}
}
