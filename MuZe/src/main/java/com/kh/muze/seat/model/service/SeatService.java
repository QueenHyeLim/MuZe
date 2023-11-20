package com.kh.muze.seat.model.service;

import java.util.ArrayList;

import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.seat.model.vo.Seat;

public interface SeatService {

	ArrayList<Seat> disabledSeat(Seat seat);

}
