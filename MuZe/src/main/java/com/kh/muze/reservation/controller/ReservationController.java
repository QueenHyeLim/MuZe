package com.kh.muze.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.muze.reservation.model.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	
	@RequestMapping("show.rs")
	public String ShowLatest(Model model) {
		reservationService.showLatest();
	}
	
}
