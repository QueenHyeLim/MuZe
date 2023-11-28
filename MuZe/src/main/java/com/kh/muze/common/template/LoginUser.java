package com.kh.muze.common.template;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.kh.muze.member.model.vo.Member;

@Component
public class LoginUser {
	
	
	public static int getUserNo(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		return userNo;
	}
	

}
