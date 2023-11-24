package com.kh.muze.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.muze.board.model.service.BoardService;
import com.kh.muze.board.model.vo.Board;
import com.kh.muze.common.model.vo.PageInfo;
import com.kh.muze.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("fboardList.bo")
	public String selectFboardList(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectFboardCount(), currentPage, 10, 10);
		
		System.out.println(currentPage);
		
		model.addAttribute("list", boardService.selectFboardList(pi));
		model.addAttribute("pi", pi);
		
		return "board/freeListView";
	}
	
	@RequestMapping("finsert.bo")
	public String insertFboard(Board b, HttpSession session) {
		if(boardService.insertFboard(b) > 0) {
			session.setAttribute("alertdeleteMsg", "게시글 등록을 성공헸습니다");
		} else {
			session.setAttribute("alertdeleteMsg", "게시글 등록을 실패했습니다");
		}
		return "redirect:fboardList.bo";
	}
	
	@RequestMapping("fboardWrite.bo")
	public String insertFboardForm() {
		return "board/freeWriteView";
	}
	
	@RequestMapping("fDetail.bo")
	public ModelAndView selectFboard(int fbno, ModelAndView mv) {
		if(boardService.increaseCount(fbno) > 0) {
			mv.addObject("b", boardService.selectFboard(fbno))
			  .setViewName("board/freeDetailView");
		} else {
			mv.addObject("alertdeleteMsg", "자유게시판 상세보기 실패")
			  .setViewName("board/freeListView");
		}
		return mv;
	}
	
	@RequestMapping("fUpdateForm.bo")
	public ModelAndView updateFreeBoard(int fbno, ModelAndView mv) {
		
		mv.addObject("b", boardService.selectFboard(fbno)).setViewName("board/freeUpdateView");
		
		return mv;
	}
	
	@RequestMapping("fUpdate.bo")
	public String updateFBoard(Board b, HttpSession session) {
		if(boardService.updateFBoard(b) > 0) {
			session.setAttribute("alertdeleteMsg", "게시글이 성공적으로 수정되었습니다.");
			return "redirect:fDetail.bo?fbno=" + b.getBoardNo();
		} else {
			session.setAttribute("alertdeleteMsg", "게시글 수정을 실패했습니다.");
			return "redirect:fboardList.bo";
		}
	}
	
	@RequestMapping("fDelete.bo")
	public String deleteFBoard(int fbno, HttpSession session) {
		if(boardService.deleteFBoard(fbno) > 0) {
			session.setAttribute("alertdeleteMsg", "게시글을 삭제했습니다.");
		} else {
			session.setAttribute("alertdeleteMsg", "게시글을 삭제하지 못했습니다.");
		}
		return "redirect:fboardList.bo";
	}
	
}
