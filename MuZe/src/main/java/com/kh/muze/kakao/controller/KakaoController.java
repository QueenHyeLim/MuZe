package com.kh.muze.kakao.controller;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.muze.kakao.model.service.KakaoService;
import com.kh.muze.kakao.model.vo.ApproveResponse;
import com.kh.muze.kakao.model.vo.ReadyResponse;
import com.kh.muze.member.model.vo.Member;
import com.kh.muze.reservation.model.service.ReservationService;
import com.kh.muze.reservation.model.vo.Order;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class KakaoController {
	
	private final KakaoService kakaoService;
	
	private final ReservationService reservationService;
	
	
	// 메일 전송에 필요한 객체
	private final JavaMailSender sender;
	
	@GetMapping("payapprove")
	public ModelAndView payApprove(@RequestParam("pg_token") String pgToken,
														     HttpSession session,
														     HttpServletRequest request, 
														     ModelAndView mv) throws ParseException {
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		String tid = ((ReadyResponse)session.getAttribute("ReadyResponse")).getTid();
		String payApprove = kakaoService.payApprove(tid, pgToken, userId);
		
		Order order = (Order)session.getAttribute("OrderList");

		ApproveResponse appResponse = kakaoService.payAccess(payApprove);
		mv.addObject("ApproveResponse", appResponse).setViewName("payment/payAccessView");
		mv.addObject("Order", order).setViewName("payment/payAccessView");

		int insertReserve = reservationService.insertReservation(order, 
																 order.getSeatZip(), 
																 appResponse.getAid());
		if(insertReserve > 0) {
			
			if((Member)session.getAttribute("loginUser") != null && 
			   !("").equals(((Member)session.getAttribute("loginUser")).getEmail())) {
				
				try {
					mail(order, appResponse, request, session);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
			}
			session.removeAttribute("OrderList");
			session.removeAttribute("readyResponse");
			
		} else {
			mv.addObject("errorMsg", "예매가 완료되지 않았습니다.")
			  .setViewName("common/errorPage");
		}
		
		return mv; 																												
	}
	
	
	@GetMapping("payfail")
	public ModelAndView payFail(ModelAndView mv, HttpSession session) {
		mv.addObject("errorMsg", "결제 실패 -카드사점검시간 - 잔액확인").setViewName("common/errorPage");
		session.removeAttribute("OrderList");
		session.removeAttribute("readyResponse");
		return mv;
	}
	
	@GetMapping("paycancel")
	public ModelAndView payCancel(ModelAndView mv, HttpSession session) {
		mv.addObject("errorMsg", "결제 취소되었습니다").setViewName("common/errorPage");
		session.removeAttribute("OrderList");
		session.removeAttribute("readyResponse");
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
	}
	
}
