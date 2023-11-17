package com.kh.muze.seat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.muze.seat.model.service.SeatService;

@Controller
public class SeatController {
	
	@Autowired
	private SeatService seatService;
	
	
	@RequestMapping("disabled.st")
	public String disabledSeat(String musId, String selectDate) {
		
		
		seatService.disabledSeat()
	}
}
