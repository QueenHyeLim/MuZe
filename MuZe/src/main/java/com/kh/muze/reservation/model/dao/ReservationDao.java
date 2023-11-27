package com.kh.muze.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.reservation.model.vo.Order;
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
	
	
	public int insertReservation(SqlSessionTemplate sqlSession, Order order) {
		/*
		String orderseat = order.getOrderSeat();
		String[] selectedSeat = orderseat.split(",");
		*/
		ArrayList<Seat> list = order.getSeatZip();
		int reserSuccess = 0;
		for(Seat seatNo : list) {
			int result = sqlSession.insert("reservationMapper.insertReservation", seatNo);
			reserSuccess += result;
		}
		
		return reserSuccess;
	}
	
	
	public ArrayList<Seat> putSeatNo(SqlSessionTemplate sqlSession, String selectseat) {
		
		String[] seatIds = selectseat.split(",");
		
		ArrayList<Seat> seatList = new ArrayList<Seat>();
		for(String seatId : seatIds) {
			Seat seat = sqlSession.selectOne("reservationMapper.putSeatNo", seatId);
			seatList.add(seat);
		}
		return seatList;
	}
}
