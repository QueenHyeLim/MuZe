package com.kh.muze.seat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.seat.model.vo.Seat;

@Repository
public class SeatDao {
	
	public ArrayList<Seat> disabledSeat(SqlSessionTemplate sqlSession, Seat seat) {
		return (ArrayList)sqlSession.selectList("seatMapper.disabledSeat", seat);
	}
	
	

}
