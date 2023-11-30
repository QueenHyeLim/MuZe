package com.kh.muze.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.muze.board.model.vo.Board;
import com.kh.muze.common.model.vo.PageInfo;
import com.kh.muze.common.template.Pagination;
import com.kh.muze.member.model.service.MemberService;
import com.kh.muze.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginPage.me")
	public String loginPage() {
		
		return "member/loginPage";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "로그인에 실패하였습니다.")
			.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
			
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd); 
		if(memberService.insertMember(m) > 0) { 
			return "redirect:/";
		} else { 
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("myInfo.me")
	public String myInfo() {
		return "member/myInfo";
	}
	
	@RequestMapping("adminPage.me")
	public String adminPage() {
		return "member/adminPage";
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model, HttpSession session) {
		
		if(memberService.updateMember(m) > 0) {
			session.setAttribute("loginUser", memberService.loginMember(m));
			session.setAttribute("alertMsg", "정보 수정 성공");
			
			return "redirect:myInfo.me";
		} else { 
			model.addAttribute("errorMsg", "정보 수정 실패");
			
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.me")
	public String deleteMember(String userPwd, HttpSession session) {
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		String encPwd = loginUser.getUserPwd();
		if(bcryptPasswordEncoder.matches(userPwd, encPwd)) {
			
			String userId = loginUser.getUserId();
			
			if(memberService.deleteMember(userId) > 0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertdeleteMsg", "탈퇴 되었습니다.");
				return "redirect:/";
				
			} else {
				session.setAttribute("errorMsg", "탈퇴 처리 실패~");
				return "commmon/errorPage";
			}
			
		} else {
			session.setAttribute("alertMsg", "비밀번호가 틀렸어요!!");
			return "redirect:myInfo.me";
		}
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		
		
		return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("memberList.me")
	public String memberList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
		    Model model) {

		PageInfo pi = Pagination.getPageInfo(memberService.selectListCount(), 
		currentPage, 
		10, 
		10);
		
		model.addAttribute("list", memberService.selectList(pi));
		model.addAttribute("pi", pi);
		
		
		return "member/memberList";
	}
	
	@RequestMapping("deleteMemberById.me")
	public String deleteMemberById(String userId, HttpSession session) {

	    if (memberService.deleteMemberById(userId) > 0) {
	        session.setAttribute("alertDeleteMemberMsg", "회원이 삭제되었습니다.");
	        return "redirect:memberList.me";
	    } else {
	    	session.setAttribute("alertDeleteMemberMsg", "잘못 입력하셨습니다.");
			return "redirect:memberList.me";
	    }
	}
	
	@RequestMapping("search.me")
    public String search(@RequestParam("condition") String condition,
                         @RequestParam("keyword") String keyword,
                         @RequestParam("currentPage") int currentPage,
                         Model model) {

        HashMap<String, String> map = new HashMap<>();
        map.put("condition", condition);
        map.put("keyword", keyword);
        PageInfo pi = Pagination.getPageInfo(memberService.selectSearchCount(), currentPage, 10, 10);

        ArrayList<Board> list = memberService.selectSearchList(map, pi);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        model.addAttribute("keyword", keyword);
        model.addAttribute("condition", condition);

        return "member/memberList";
	}
}
