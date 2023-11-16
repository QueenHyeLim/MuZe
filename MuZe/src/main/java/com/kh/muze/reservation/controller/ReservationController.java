package com.kh.muze.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.muze.reservation.model.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	
	@RequestMapping("show.rs")
	public String ShowLatest(Model model) {
		model.addAttribute("list", reservationService.showLatest());
		
		return "reservation/showLatestView";
	}
	
	@RequestMapping("detail.rs")
	public ModelAndView detailMus(String musId, ModelAndView mv) {
		mv.addObject("s", reservationService.selectMus(musId)).setViewName("reservation/detailMusView");
		mv.addObject("sp", reservationService.selectMusPrice()).setViewName("reservation/detailMusView");
		
		return mv;
	}
	
	@RequestMapping("seat.rs")
	public ModelAndView SeatSelect(String musId, int userNo, String selectdate, ModelAndView mv) {
		
		System.out.println("뮤지컬아이디 : " + musId);
		System.out.println("회원번호 : " + userNo);
		System.out.println("예매날짜 : " + selectdate);
		
		
		mv.addObject("musId", musId).setViewName("seat/selectseatView");
		mv.addObject("userNo", userNo).setViewName("seat/selectseatView");
		mv.addObject("selectdate", selectdate).setViewName("seat/selectseatView");
		
		return mv;
	}
}
