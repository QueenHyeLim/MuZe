package com.kh.muze.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.muze.reservation.model.service.ReservationService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReservationController {
	
	private final ReservationService reservationService;
	
	
	@GetMapping("show.rs")
	public String ShowLatest(Model model) {
		model.addAttribute("list", reservationService.showLatest());
		
		return "reservation/showLatestView";
	}
	
	
	@PostMapping("detail.rs")
	public ModelAndView detailMus(String musId, ModelAndView mv) {
		mv.addObject("s", reservationService.selectMus(musId)).setViewName("reservation/detailMusView");
		mv.addObject("sp", reservationService.selectMusPrice()).setViewName("reservation/detailMusView");
		
		return mv;
	}
	
	@PostMapping("seat.rs")
	public ModelAndView SeatSelect(String musId, int userNo, String selectdate, ModelAndView mv) {
		
		System.out.println("뮤지컬아이디 : " + musId);
		System.out.println("회원번호 : " + userNo);
		System.out.println("예매날짜 : " + selectdate);
		
		
		mv.addObject("musInfo", reservationService.selectMus(musId)).setViewName("seat/selectseatView");
		mv.addObject("userNo", userNo).setViewName("seat/selectseatView");
		mv.addObject("selectdate", selectdate).setViewName("seat/selectseatView");

		return mv;
	}
	
	@PostMapping("payment.rs")
	public ModelAndView reserPayment(String musId, String selectdate, String selectseat, ModelAndView mv) {
		
		System.out.println("musId >>" + musId);
		System.out.println("selectdate >> " + selectdate);
		System.out.println("selectseat >> " + selectseat);
		
		int totalPrice = reservationService.totalPrice(selectseat);
		if(totalPrice > 0) {
			mv.addObject("musInfo", reservationService.selectMus(musId)).setViewName("payment/paymentView");
			mv.addObject("selectdate", selectdate).setViewName("payment/paymentView");
			mv.addObject("selectseat", selectseat).setViewName("payment/paymentView");
			mv.addObject("totalPrice", totalPrice).setViewName("payment/paymentView");
			
			return mv;
		} else {
			mv.addObject("errorMsg", "결제페이지로 이동에 실패했습니다.").setViewName("common/errorPage");
			return mv;
		}
		
		
	}
}
