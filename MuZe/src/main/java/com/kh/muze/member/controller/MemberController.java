package com.kh.muze.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.muze.member.model.service.MemberService;
import com.kh.muze.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("loginPage.me")
	public String loginPage() {
		
		return "member/loginPage";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "로그인 실패 ㅠ.ㅠ.....")
			.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
			
		return "member/memberEnrollForm";
	}

}
