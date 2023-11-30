package com.kh.muze.ticket.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.ticket.model.dao.TicketDao;
import com.kh.muze.ticket.model.vo.Mymuze;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@EnableTransactionManagement
@Service
public class TicketServiceImpl implements TicketService {
	
	private final TicketDao ticketDao;
	
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Reservation> receiveResno(int userNo) {
		return ticketDao.receiveResno(sqlSession, userNo);
	}

	@Override
	public ArrayList<Mymuze> ticektList(ArrayList<Reservation> ticketResno) {
		return ticketDao.ticketList(sqlSession, ticketResno);
	}

}
