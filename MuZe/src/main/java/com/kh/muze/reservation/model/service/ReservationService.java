package com.kh.muze.reservation.model.service;

import com.kh.muze.show.model.vo.Show;

public interface ReservationService {
	
	// 예매하기 버튼 클릭시 최신 뮤지컬 목록 띄우기
	Show showLatest();

}
