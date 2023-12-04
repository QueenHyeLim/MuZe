package com.kh.muze.reservation.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.muze.reservation.model.service.ReservationService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class AjaxReservationController {

	private final ReservationService reservationService;
	
	@GetMapping(value="search.mz", produces="application/json; charset=UTF-8")
	public String searchMuze(@RequestParam(value="genre", defaultValue="1") int genre, Model model) {
		
		return new Gson().toJson(reservationService.searchMuze(genre));
	}
}
