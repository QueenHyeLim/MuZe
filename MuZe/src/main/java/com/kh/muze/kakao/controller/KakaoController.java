package com.kh.muze.kakao.controller;

import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.muze.kakao.model.service.KakaoService;
import com.kh.muze.kakao.model.vo.ApproveResponse;
import com.kh.muze.kakao.model.vo.ReadyResponse;
import com.kh.muze.member.model.vo.Member;
import com.kh.muze.reservation.model.service.ReservationService;
import com.kh.muze.reservation.model.vo.Order;
import com.kh.muze.seat.model.vo.Seat;

@Controller
public class KakaoController {
	
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private ReservationService reservationService;
	
	
	// 메일 전송에 필요한 객체
	@Autowired
	private JavaMailSender sender;
	
	/*
	@ResponseBody
	@RequestMapping(value="kakao", produces="application/json; charset=UTF-8")
	public String gokakaoPay(String musTitle, String musId, String theaterName, String selectdate, String selectseat, String totalPrice, HttpSession session) throws ParseException {
		int total_amount = Integer.parseInt(totalPrice);
		Member loginUser = (Member)session.getAttribute("loginUser");
		String partner_order_id = loginUser.getUserId(); 
		System.out.println("selectdate>>" + selectdate);
		Order order = new Order();
		order.setOrderTitle(musTitle);//musTitle);
		order.setOrderMusId(musId);
		order.setMusTheater(theaterName);
		order.setOrderDate(selectdate); //(selectdate);
		order.setOrderSeat(selectseat);
		order.setOrderPrice(totalPrice);
		order.setOrderUserNo(loginUser.getUserNo());
		// 예약 좌석 번호 ArrayList
		order.setSeatZip(reservationService.putSeatNo(selectseat));
		
		
		session.setAttribute("OrderList", order);
		System.out.println( "order나와>>" + order);
		Order order2 = (Order)session.getAttribute("OrderList");
		System.out.println("orderdate 세션>>" + order2.getOrderDate());
		System.out.println("나와라얍" + kakaoService.goKakaoPay(musTitle, selectseat,total_amount, partner_order_id, session));
		String pay_approve = kakaoService.goKakaoPay(musTitle, selectseat, total_amount, partner_order_id, session);
		
		/*
		//ReadyResponse readyResponse = new ReadyResponse();
		//readyResponse.set
		//ReadyResponse started = session.setAttribute("readyResponse", ReadyResponse);
		
		
		
		return pay_approve;
	}
	*/
	
	/*
	@RequestMapping("kakao")
	public String kakaoPay(String musTitle, String selectdate, String selectseat, String totalPrice, HttpSession session) {
		/*
		String SERVICE_APP_ADMIN_KEY = "d1e312a7f32f5f7b5f297a111ae6429f"; // REST API키 0d660db638c1ee698ce5e8eb5fe7470a 
		
		String apiURL = "https://kapi.kakao.com/v1/payment/ready";
		*/
		
		/*
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", "KakaoAK " + SERVICE_APP_ADMIN_KEY);
		requestHeaders.put("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		int total_amount = Integer.parseInt(totalPrice);
		Member loginUser = (Member)session.getAttribute("loginUser");
		String partner_order_id = loginUser.getUserId(); 
		
		//String responseBody = post(apiURL, requestHeaders, musTitle, selectdate, total_amount, partner_order_id);
		
		System.out.println(responseBody);
		//return "kakao/kakaoPay";
	}
	*/
	
	@GetMapping("payapprove")
	public ModelAndView payApprove(@RequestParam("pg_token") String pgToken, HttpSession session, HttpServletRequest request, ModelAndView mv) throws ParseException {
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		String tid = ((ReadyResponse)session.getAttribute("ReadyResponse")).getTid();
		String payApprove = kakaoService.payApprove(tid, pgToken, userId);
		/*
		ReadyResponse ReadyResponse = new ReadyResponse();
		ReadyResponse.setNext_redirect_pc_url(next_redirect_pc_url);
		ReadyResponse.setPartner_order_id("muzeorder");
		ReadyResponse.setTid(tid);
		
		session.setAttribute("ReadyResponse", ReadyResponse);
		*/
		Order order = (Order)session.getAttribute("OrderList");
		
		
		//ArrayList<Book> bookList = new ArrayList<Book>();
		ArrayList<Seat> seatList = order.getSeatZip();
				//reservationService.putSeatNo(order.getOrderSeat());
		System.out.println("좌석번호리스트>>" + seatList);
		
		/*
		for(Seat seat : seatList) {
			Book book = new Book();	
			book.setBookUserNo(order.getOrderUserNo());
			book.setBookMusId(order.getOrderMusId());
			book.setBookDate(order.getOrderDate());
			book.setBookSeatNo(seat.getSeatNo());
			System.out.println("Book>>>" + book);
			bookList.add(book);
		}
		System.out.println("BookList>>" + bookList);
		*/
		
		String orderdate = order.getOrderDate();
		System.out.println("orderdate 세션>>" + order.getOrderDate());
		System.out.println("payApprove : " + payApprove);
		// 결제승인
		ApproveResponse appResponse = kakaoService.payAccess(payApprove);
		mv.addObject("ApproveResponse", appResponse).setViewName("payment/payAccessView");
		mv.addObject("Order", order).setViewName("payment/payAccessView");
		//mv.addObject("orderdate", orderdate).setViewName("payment/payAccessView");
		// 1. 예매테이블, 티켓테이블
		/*
		 * "OrderList"세션에 유저가 선택한 예약 정보가 들어있음
		 * - selctseat필드에 선택한 좌석들이 문자열로 들어있음 ex) H11,H12
		 * - 좌석 번호들을 ArrayList<Seat>에 담기 or 배열에 담기 Order테이블에 ArrayList<Seat> seatList에 담기
		 * - 동적으로 reservation 테이블에 INSERT 
		 * - 동적으로  ticket 테이블에 INSERT
		 * - 티켓번호는 카카오페이에서 결제 식별값으로 제공한 aid 를 대입하기
		 * - ticket테이블 insert할 때 메일 보내는 메소드도 호출하기
		 * - 유저의 메일 주소는 session에 "loginUser"의 email 필드에 있음
		 */
		
		// PLAN 수정!!!
		/*
		 * 1. 예매테이블(RESERVE)에 INSERT
		 * => Order에 들어있음
		 * 
		 * 2. 예매상세테이블(BOOK)에 INSERT 동적으로 INSERT
		 * => 예매번호는 SEQ_RESERVE.CURRVAL, 좌석번호는 ArrayList<Seat> seatList = order.getSeatZip(); 의 Seat객체의 seatNo에 있음
		 * 
		 * 3. 티켓테이블(TICKET)에 INSERT
		 * => 티켓번호는 appResponse의 aid 필드에 있음. 예매번호는 SEQ_RESERVE.CURRVAL
		 * 
		 * 4. 티켓 발급 이메일 전송(loginUser 세션의 email필드에 유저의 이메일 주소가 있음)		
		 */
		int insertReserve = reservationService.insertReservation(order, order.getSeatZip(), appResponse.getAid());
		if(insertReserve > 0) {
			System.out.println("들어가나>>"+ insertReserve /*reservationService.insertReservation(bookList)*/);
			
			if(!((Member)session.getAttribute("loginUser")).getEmail().equals("")) {
				
				// 티켓메일 전송 
				try {
					mail(order, appResponse, request, session);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			// 유저가 선택한 예매 정보를 저장해두었던 OrderList 세션 무효화
			session.removeAttribute("OrderList");
			
			/*
			if(reservationService.insertBook(order.getSeatZip()) > 0) {
				
				System.out.println("예매상세테이블insert>>" + reservationService.insertBook(order.getSeatZip()));
				if(reservationService.insertTicket(appResponse.getAid()) > 0) {
					System.out.println("티켓테이블insert>>" + reservationService.insertTicket(appResponse.getAid()));
					// 티켓이메일 발송
				} else {
					System.out.println("타켓테이블실패");
				}
			} else {
				System.out.println("예매상세테이블실패");
			}
			*/
			
			
			// 회원번호, 뮤지컬번호, 예매날짜가 같은 뮤지컬번호를 조회해오면 이전에 예매했던 것들이 다 조회되므로 이렇게 하면 안됌
			/*
			ArrayList<Reservation> reserveList = reservationService.selectReserNo(order);
			System.out.println("예매번호들>>" + reservationService.selectReserNo(order));
			ArrayList<Ticket> ticketList = new ArrayList<Ticket>();
			for(Reservation reserve : reserveList) {
				Ticket ticket = new Ticket();
				ticket.setTicketNo(appResponse.getAid());
				ticket.setResNo(reserve.getResNo());
				ticketList.add(ticket);
				System.out.println("ticket객체에 들어가나>>" + ticket);
			}
			System.out.println("ticketList>>>" + ticketList);
			// 티켓발행메소드
			if(reservationService.ticektIssuance(ticketList) > 0) {
				// 티켓발행 Email 전송 메소드 호출
				System.out.println("티켓발행 성공해라>>" + reservationService.ticektIssuance(ticketList));
			}
			*/
		
		} else {
			// errorMsg]
			mv.addObject("errorMsg", "예매가 완료되지 않았습니다.").setViewName("common/errorPage");
			System.out.println("예매insert실패");
		}
		
		return mv; //"payment/payAccessView";
	}
	/*
	@RequestMapping("payaccess")
	public String payAccess() {
		
	}
	*/
	
	@GetMapping("payfail")
	public ModelAndView payFail(ModelAndView mv) {
		mv.addObject("errorMsg", "결제 실패 -카드사점검시간 - 잔액확인").setViewName("common/errorPage");
		return mv;
	}
	
	@GetMapping("paycancel")
	public ModelAndView payCancel(ModelAndView mv) {
		mv.addObject("errorMsg", "결제 취소되었습니다").setViewName("common/errorPage");
		return mv;
	}
	
	
	// 티켓 발급 이메일 전송
	public void mail(Order order, ApproveResponse appResponse, HttpServletRequest request, HttpSession session) throws MessagingException {
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String ip = request.getRemoteAddr();
		Member member = (Member)session.getAttribute("loginUser");
		helper.setTo(member.getEmail());
		helper.setSubject("Your My MUZE 티켓 예매 성공");
		helper.setText("<h1>==== MY MUZE 티켓 예매 완료 ====</h1>"
					 + "<p>티켓번호 : " + appResponse.getAid() + "</p>"
					 + "<p>고객명 : " + member.getUserName() + "</p>"
					 + "<p>공연명 : " + order.getOrderTitle()+ "</p>"
					 + "<p>공연장소 : " + order.getMusTheater() + "</p>"
					 + "<p>공연날짜 : " + order.getOrderDate() + "</p>"
					 + "<p>공연좌석 : " + order.getOrderSeat() + "</p>"
					 + "<p>결제가격 : " + order.getOrderPrice() + "</p>", true);
		
		sender.send(message);
		
		
		//return "redirect:/";
	}
	
}
