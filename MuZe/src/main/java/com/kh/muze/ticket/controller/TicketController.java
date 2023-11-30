package com.kh.muze.ticket.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.muze.member.model.vo.Member;
import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.ticket.model.service.TicketService;
import com.kh.muze.ticket.model.vo.Mymuze;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class TicketController {
	
	private final TicketService ticketService;
	
	
	@GetMapping("ticket.mz")
	public ModelAndView ticketList(HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<Reservation> ticketResno = ticketService.receiveResno(userNo);
		ArrayList<Mymuze> ticketList = ticketService.ticektList(ticketResno);
		
		
		
		return mv;
	}

}
