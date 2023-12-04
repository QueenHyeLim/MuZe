package com.kh.muze.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.kakao.model.vo.Book;
import com.kh.muze.reservation.model.vo.Order;
import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.reservation.model.vo.Ticket;
import com.kh.muze.seat.model.vo.Seat;
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

	public int totalPrice(SqlSessionTemplate sqlSession, String selectseat) {
		String[] seatIds = selectseat.split(",");
		
		int totalPrice = 0;
		for (String seatId : seatIds) {
	        // Call the SQL query for each seat and add the result to the totalPrice
	        int seatPrice = sqlSession.selectOne("reservationMapper.totalPrice", seatId);
	        totalPrice += seatPrice;
	    }

	    return totalPrice;
	}
	
	/*
	public int insertReservation(SqlSessionTemplate sqlSession, Order order) {
		/*
		String orderseat = order.getOrderSeat();
		String[] selectedSeat = orderseat.split(",");
		
		
		
		ArrayList<Seat> list = order.getSeatZip();
		int reserSuccess = 0;
		int seatsize = 0;
		
		Map<String , Order> orderMap = new HashMap<String, Order>();
		orderMap.put("listMap", order);

		ArrayList<Map<String, Order>> listMap = new ArrayList<Map<String, Order>>();
		listMap.add(orderMap);
		
		for (Map<String, Order> map : listMap) {
		    for (Order order2 : map.values()) {
		        // Assuming Order class has a getter for seatZip
		        seatsize = order2.getSeatZip().size();
		    }
		}
		
		for (int i=0 ; i<seatsize; i++) {
			for (Map<String, Order> map : new ArrayList<>(listMap)) {
		        int result = sqlSession.insert("reservationMapper.insertReservation", map);
		        reserSuccess += result;
		    }
		}
		/*
		 * for(Seat seatNo : list) { int result =
		 * sqlSession.insert("reservationMapper.insertReservation", seatNo);
		 * reserSuccess += result; }
		 
		
		return reserSuccess;
	}
	*/
	
	public ArrayList<Seat> putSeatNo(SqlSessionTemplate sqlSession, String selectseat) {
		
		String[] seatIds = selectseat.split(",");
		
		ArrayList<Seat> seatList = new ArrayList<Seat>();
		for(String seatId : seatIds) {
			Seat seat = sqlSession.selectOne("reservationMapper.putSeatNo", seatId);
			seatList.add(seat);
		}
		return seatList;
	}

	/*
	public int insertReservation(SqlSessionTemplate sqlSession, ArrayList<Book> bookList) {
		
		int reserSuccess = 0;
		for(Book book : bookList) {
			int result = sqlSession.insert("reservationMapper.bookReserve", book);
			reserSuccess += result;
		}
		
		return reserSuccess;
	}
	*/
	
	public ArrayList<Reservation> selectReserNo(SqlSessionTemplate sqlSession, Order order) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReserNo", order);
	}

	/*
	public int ticketIssuance(SqlSessionTemplate sqlSession, ArrayList<Ticket> ticketList) {
		
		int ticketSuccess = 0;
		for(Ticket ticket : ticketList) {
			int result = sqlSession.insert("reservationMapper.ticketIssuance", ticket);
			ticketSuccess += result;
		}
		
		return ticketSuccess;
	}
	*/
	public int insertReservation(SqlSessionTemplate sqlSession, Order order) {
		return sqlSession.insert("reservationMapper.insertReservation", order);
	}

	
	public int insertBook(SqlSessionTemplate sqlSession, ArrayList<Seat> seatZip) {
		
		int bookSuccess = 0;
		for(Seat seat : seatZip) {
			int seatNo = seat.getSeatNo();
			int result = sqlSession.insert("reservationMapper.insertBook", seatNo);
			bookSuccess += result;
		}
		
		return bookSuccess;
	}
	
	/*잘안됌
	public int insertBook(SqlSessionTemplate sqlSession, ArrayList<Seat> seatZip) {
		
		
		return sqlSession.insert("reservationMapper.insertBook", seatZip);
	}
	*/
	
	
	public int insertTicket(SqlSessionTemplate sqlSession, String aid) {
		return sqlSession.insert("reservationMapper.insertTicket", aid);
	}

	public ArrayList<Show> searchMuze(SqlSessionTemplate sqlSession, int genre) {
		return (ArrayList)sqlSession.selectList("reservationMapper.searchMuze", genre);
	}
}
