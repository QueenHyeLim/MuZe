package com.kh.muze.seat.controller;

import java.util.ArrayList;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.muze.seat.model.service.SeatService;
import com.kh.muze.seat.model.vo.Seat;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class SeatController {
	
	
	private final SeatService seatService;

	
	@PostMapping(value="disabled.st", produces="application/json; charset=UTF-8")
	public String disabledSeat(String musId, String selectDate) {
		System.out.println("musId >>" + musId);
		System.out.println("selectDate >>" + selectDate);
		
		Seat seat = new Seat();
		seat.setMusId(musId);
		seat.setSelectDate(selectDate);

		ArrayList<Seat> seatResult = seatService.disabledSeat(seat);
	
	    if (seatResult != null) {
	        return new Gson().toJson(seatResult);
	    } else {
	        return "null";
	    }
		
	}
}
