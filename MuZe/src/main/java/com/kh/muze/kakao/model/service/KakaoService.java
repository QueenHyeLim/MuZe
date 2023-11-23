package com.kh.muze.kakao.model.service;

public interface KakaoService {

	String goKakaoPay(String musTitle, String selectseat, int total_amount, String partner_order_id);

}
