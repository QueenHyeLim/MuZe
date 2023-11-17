package com.kh.muze.seat.model.service;

import java.util.ArrayList;

import com.kh.muze.reservation.model.vo.Reservation;

public interface SeatService {

	ArrayList<Reservation> disabledSeat(Reservation reservation);

}
