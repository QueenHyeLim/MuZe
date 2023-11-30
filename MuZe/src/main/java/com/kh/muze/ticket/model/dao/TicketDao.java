package com.kh.muze.ticket.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.ticket.model.vo.Mymuze;

@Repository
public class TicketDao {

	public ArrayList<Reservation> receiveResno(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("reservationMapper.receiveResno", userNo);
	}

	public ArrayList<Mymuze> ticketList(SqlSessionTemplate sqlSession, ArrayList<Reservation> ticketResno) {
		return (ArrayList)sqlSession.selectList("reservationMapper.ticketList", ticketResno);
	}
	
	

}
