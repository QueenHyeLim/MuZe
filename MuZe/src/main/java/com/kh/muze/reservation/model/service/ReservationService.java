package com.kh.muze.reservation.model.service;

import java.util.ArrayList;

import com.kh.muze.kakao.model.vo.Book;
import com.kh.muze.reservation.model.vo.Order;
import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.reservation.model.vo.Ticket;
import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.seat.model.vo.Seat;
import com.kh.muze.seat.model.vo.SeatPrice;
import com.kh.muze.show.model.vo.Show;

public interface ReservationService {
	
	// 예매하기 버튼 클릭시 최신 뮤지컬 목록 띄우기
	ArrayList<Show> showLatest();

	// 선택한 뮤지컬의 상세 정보
	Show selectMus(String musId);

	ArrayList<SeatPrice> selectMusPrice();

	int totalPrice(String selectseat);
	
	//int insertReservation(ArrayList<Book> bookList);

	ArrayList<Seat> putSeatNo(String selectseat);

	ArrayList<Reservation> selectReserNo(Order order);

	//int ticektIssuance(ArrayList<Ticket> ticketList);

	//int insertReservation(Order order);

	//int insertBook(ArrayList<Seat> seatZip);

	//int insertTicket(String aid);

	int insertReservation(Order order, ArrayList<Seat> seatZip, String aid);

	ArrayList<Show> searchMuze(int genre);

	//int insertReservation(Order order);



}
