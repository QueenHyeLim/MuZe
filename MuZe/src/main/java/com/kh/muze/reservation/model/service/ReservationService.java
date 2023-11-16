package com.kh.muze.reservation.model.service;

import java.util.ArrayList;

import com.kh.muze.seat.model.vo.SeatPrice;
import com.kh.muze.show.model.vo.Show;

public interface ReservationService {
	
	// 예매하기 버튼 클릭시 최신 뮤지컬 목록 띄우기
	ArrayList<Show> showLatest();

	// 선택한 뮤지컬의 상세 정보
	Show selectMus(String musId);

	ArrayList<SeatPrice> selectMusPrice();

}
