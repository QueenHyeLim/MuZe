package com.kh.muze.kakao.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.muze.kakao.model.service.KakaoService;
import com.kh.muze.member.model.vo.Member;

@Controller
public class KakaoController {
	
	@Autowired
	private KakaoService kakaoService;
	
	@ResponseBody
	@RequestMapping(value="kakao", produces="application/json; charset=UTF-8")
	public String gokakaoPay(String musTitle, String selectseat, String totalPrice, HttpSession session) {
		int total_amount = Integer.parseInt(totalPrice);
		Member loginUser = (Member)session.getAttribute("loginUser");
		String partner_order_id = loginUser.getUserId(); 
		System.out.println("나와라얍" + kakaoService.goKakaoPay(musTitle, selectseat,total_amount, partner_order_id));
		String pay_access = kakaoService.goKakaoPay(musTitle, selectseat, total_amount, partner_order_id);
		return pay_access;
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
	
	
	
}
