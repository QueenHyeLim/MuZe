package com.kh.muze.kakao.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.muze.kakao.model.service.KakaoService;
import com.kh.muze.kakao.model.vo.ReadyResponse;
import com.kh.muze.member.model.vo.Member;
import com.kh.muze.reservation.model.vo.Order;

@Controller
public class KakaoController {
	
	@Autowired
	private KakaoService kakaoService;
	
	@ResponseBody
	@RequestMapping(value="kakao", produces="application/json; charset=UTF-8")
	public String gokakaoPay(String musTitle, String musId, String selectdate, String selectseat, String totalPrice, HttpSession session) throws ParseException {
		int total_amount = Integer.parseInt(totalPrice);
		Member loginUser = (Member)session.getAttribute("loginUser");
		String partner_order_id = loginUser.getUserId(); 
		
		Order order = new Order();
		order.setOrderTitle(musTitle);
		order.setOrderMusId(musId);
		order.setOrderDate(selectdate);
		order.setOrderSeat(selectseat);
		order.setOrderPrice(totalPrice);
		
		session.setAttribute("OrderList", order);
		
		System.out.println("나와라얍" + kakaoService.goKakaoPay(musTitle, selectseat,total_amount, partner_order_id, session));
		String pay_approve = kakaoService.goKakaoPay(musTitle, selectseat, total_amount, partner_order_id, session);
		
		/*
		ReadyResponse readyResponse = new ReadyResponse();
		readyResponse.set
		ReadyResponse started = session.setAttribute("readyResponse", ReadyResponse);
		*/
		
		
		return pay_approve;
	}
	
	/*
	@RequestMapping("kakao")
	public String kakaoPay(String musTitle, String selectdate, String selectseat, String totalPrice, HttpSession session) {
		/*
		String SERVICE_APP_ADMIN_KEY = "d1e312a7f32f5f7b5f297a111ae6429f"; // REST API키 0d660db638c1ee698ce5e8eb5fe7470a 
		
		String apiURL = "https://kapi.kakao.com/v1/payment/ready";
		*/
		
		/*
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", "KakaoAK " + SERVICE_APP_ADMIN_KEY);
		requestHeaders.put("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		int total_amount = Integer.parseInt(totalPrice);
		Member loginUser = (Member)session.getAttribute("loginUser");
		String partner_order_id = loginUser.getUserId(); 
		
		//String responseBody = post(apiURL, requestHeaders, musTitle, selectdate, total_amount, partner_order_id);
		
		System.out.println(responseBody);
		//return "kakao/kakaoPay";
	}
	*/
	
	@RequestMapping("payapprove")
	public String payApprove(@RequestParam("pg_token") String pgToken, HttpSession session) {
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		String tid = ((ReadyResponse)session.getAttribute("ReadyResponse")).getTid();
		String payApprove = kakaoService.payApprove(tid, pgToken, userId);
		/*
		ReadyResponse ReadyResponse = new ReadyResponse();
		ReadyResponse.setNext_redirect_pc_url(next_redirect_pc_url);
		ReadyResponse.setPartner_order_id("muzeorder");
		ReadyResponse.setTid(tid);
		
		session.setAttribute("ReadyResponse", ReadyResponse);
		*/
		System.out.println("payApprove : " + payApprove);
		// 1. 예매테이블, 티켁테이블
		return "payment/payAccessView";
	}
	/*
	@RequestMapping("payaccess")
	public String payAccess() {
		
	}
	
	@RequestMapping("payfail")
	public String payFail() {
		
	}
	
	@RequestMapping("paycancel")
	public String payCancel() {
		
	}
	*/
}
