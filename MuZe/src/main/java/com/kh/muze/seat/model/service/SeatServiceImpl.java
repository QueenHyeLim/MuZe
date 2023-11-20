package com.kh.muze.seat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.muze.seat.model.dao.SeatDao;
import com.kh.muze.seat.model.vo.Seat;

@Service
public class SeatServiceImpl implements SeatService {
	
	@Autowired
	private SeatDao seatDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	/*
	@Override
	public ArrayList<Reservation> disabledSeat(Reservation reservation) {
		return reservationDao.disabledSeat(sqlSession, reservation);
	}
	*/
	@Override
	public ArrayList<Seat> disabledSeat(Seat seat) {
		return seatDao.disabledSeat(sqlSession, seat);
	}

}
