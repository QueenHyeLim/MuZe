package com.kh.muze.kakao.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;

import com.kh.muze.kakao.model.vo.ApproveResponse;
import com.kh.muze.seat.model.vo.Seat;

public interface KakaoService {

	String goKakaoPay(String musTitle, String selectseat, int total_amount, String partner_order_id, HttpSession session) throws ParseException;

	String payApprove(String tid, String pgToken, String userId);

	ApproveResponse payAccess(String payApprove) throws ParseException;

	

	


}
