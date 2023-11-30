package com.kh.muze.ticket.model.service;

import java.util.ArrayList;

import com.kh.muze.reservation.model.vo.Reservation;
import com.kh.muze.ticket.model.vo.Mymuze;

public interface TicketService {

	ArrayList<Reservation> receiveResno(int userNo);

	ArrayList<Mymuze> ticektList(ArrayList<Reservation> ticketResno);

}
