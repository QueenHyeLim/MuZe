package com.kh.muze.seat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.seat.model.service.SeatService;

@Controller
public class SeatController {
	
	@Autowired
	private SeatService seatService;
	

	
	@RequestMapping("disabled.st")

	@ResponseBody
	@RequestMapping(value="disabled.st", produces="application/json; charset=UTF-8")
	public String disabledSeat(String musId, String selectDate) {
		System.out.println(musId);
		System.out.println(selectDate);
		

		Reservation reservation = new Reservation();
		reservation.setMusId(musId);
		reservation.setSelectDate(selectDate);
				
		return new Gson().toJson(seatService.disabledSeat(reservation));

	}
}
