package com.kh.muze.kakao.controller;

import java.text.ParseException;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.muze.kakao.model.service.KakaoService;
import com.kh.muze.member.model.vo.Member;
import com.kh.muze.reservation.model.service.ReservationService;
import com.kh.muze.reservation.model.vo.Order;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class AjaxKakaoController {
	
	private final KakaoService kakaoService;
	
	private final ReservationService reservationService; 
	
	@PostMapping(value="kakao", produces="application/json; charset=UTF-8")
	public String gokakaoPay(String musTitle, String musId, String theaterName, String selectdate, 
							 String selectseat, String totalPrice, HttpSession session) throws ParseException, Exception {
		
		int total_amount = Integer.parseInt(totalPrice);
		Member loginUser = (Member)session.getAttribute("loginUser");
		String partner_order_id = loginUser.getUserId(); 
																																																																			//System.out.println("selectdate>>" + selectdate);
		Order order = new Order();
		order.setOrderTitle(musTitle);																																									//musTitle);
		order.setOrderMusId(musId);
		order.setMusTheater(theaterName);
		order.setOrderDate(selectdate); 																																								//(selectdate);
		order.setOrderSeat(selectseat);
		order.setOrderPrice(totalPrice);
		order.setOrderUserNo(loginUser.getUserNo());
		order.setSeatZip(reservationService.putSeatNo(selectseat));
																																																												// 예약 좌석 번호 ArrayList
		session.setAttribute("OrderList", order);
		
		String pay_approve = kakaoService.goKakaoPay(musTitle, selectseat, total_amount, partner_order_id, session);
		
		return pay_approve;
																																																													//System.out.println( "order나와>>" + order);
	}
																																																														//Order order2 = (Order)session.getAttribute("OrderList");
																																																															//System.out.println("orderdate 세션>>" + order2.getOrderDate());
																																																												//System.out.println("나와라얍" +  pay_approve);
																																															
																																																									/*
																																																									//ReadyResponse readyResponse = new ReadyResponse();
																																																									//readyResponse.set
																																																									//ReadyResponse started = session.setAttribute("readyResponse", ReadyResponse);
																																																									*/
		
		
}
