package com.kh.muze.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.kh.muze.kakao.model.vo.Book;
import com.kh.muze.reservation.model.dao.ReservationDao;
import com.kh.muze.reservation.model.vo.Order;
import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.reservation.model.vo.Ticket;
import com.kh.muze.seat.model.vo.Seat;
import com.kh.muze.seat.model.vo.SeatPrice;
import com.kh.muze.show.model.vo.Show;

@EnableTransactionManagement
@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Show> showLatest() {
		return reservationDao.showLatest(sqlSession);
	}

	@Override
	public Show selectMus(String musId) {
		return reservationDao.selectMus(sqlSession, musId);
	}

	@Override
	public ArrayList<SeatPrice> selectMusPrice() {
		return reservationDao.selectMusPrice(sqlSession);
	}

	@Override
	public int totalPrice(String selectseat) {
		return reservationDao.totalPrice(sqlSession, selectseat);
	}
	/*
	@Override
	public int insertReservation(Order order) {
		return reservationDao.insertReservation(sqlSession, order);
	}
	*/
	
	
	@Override
	public ArrayList<Seat> putSeatNo(String selectseat) {
		return reservationDao.putSeatNo(sqlSession, selectseat);
	}
	/*
	@Override
	public int insertReservation(ArrayList<Book> bookList) {
		return reservationDao.insertReservation(sqlSession, bookList);
	}
	*/
	@Override
	public ArrayList<Reservation> selectReserNo(Order order) {
		return reservationDao.selectReserNo(sqlSession, order);
	}

	/*
	@Override
	public int ticektIssuance(ArrayList<Ticket> ticketList) {
		return reservationDao.ticketIssuance(sqlSession, ticketList);
	}
	*/
	
	@Override
	public int insertReservation(Order order, ArrayList<Seat> seatZip, String aid) {
		reservationDao.insertReservation(sqlSession, order);
		
		reservationDao.insertBook(sqlSession, seatZip);
		
		return reservationDao.insertTicket(sqlSession, aid);
	}
	
	/*
	@Override
	public int insertBook(ArrayList<Seat> seatZip) {
		return 
	}

	@Override
	public int insertTicket(String aid) {
		
	}
	*/
}
