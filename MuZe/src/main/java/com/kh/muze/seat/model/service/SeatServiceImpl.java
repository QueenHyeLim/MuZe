package com.kh.muze.seat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.muze.reservation.model.dao.ReservationDao;
import com.kh.muze.reservation.model.vo.Reservation;

@Service
public class SeatServiceImpl implements SeatService {
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Reservation> disabledSeat(Reservation reservation) {
		return reservationDao.disabledSeat(sqlSession, reservation);
	}

}
