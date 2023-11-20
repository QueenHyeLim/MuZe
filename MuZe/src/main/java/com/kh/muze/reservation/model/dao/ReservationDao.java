package com.kh.muze.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.seat.model.vo.SeatPrice;
import com.kh.muze.seat.model.vo.SeatPrice;
import com.kh.muze.show.model.vo.Show;

@Repository
public class ReservationDao {

	public ArrayList<Show> showLatest(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.showLatest");
	}

	public Show selectMus(SqlSessionTemplate sqlSession, String musId) {
		return sqlSession.selectOne("reservationMapper.selectMus", musId);
	}

	public ArrayList<SeatPrice> selectMusPrice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectMusPrice");
	}
	/*
	public ArrayList<Reservation> disabledSeat(SqlSessionTemplate sqlSession, Reservation reservation) {
		return (ArrayList)sqlSession.selectList("reservationMapper.disabledSeat", reservation);
	}
	*/
}
