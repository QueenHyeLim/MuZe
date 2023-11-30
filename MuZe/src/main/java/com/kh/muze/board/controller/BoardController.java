package com.kh.muze.board.controller;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.muze.attachment.controller.AttachmentController;
import com.kh.muze.board.model.service.BoardService;
import com.kh.muze.board.model.vo.Board;
import com.kh.muze.board.model.vo.Deal;
import com.kh.muze.board.model.vo.Report;
import com.kh.muze.common.model.vo.PageInfo;
import com.kh.muze.common.template.Pagination;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService boardService;
	
	private final AttachmentController attController;
	
	@GetMapping("fboardList.bo")
	public String selectFboardList(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectFboardCount(), currentPage, 10, 10);
		
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
	
	@GetMapping("fDetail.bo")
	public ModelAndView selectFboard(int fbno, ModelAndView mv, HttpSession session) {
		
		if(boardService.increaseCount(fbno) > 0) {
			mv.addObject("b", boardService.selectFboard(fbno))
			  .setViewName("board/freeDetailView");
		} else {
			mv.addObject("alertdeleteMsg", "자유게시판 상세보기 실패")
			  .setViewName("board/freeListView");
		}
		return mv;
	}
	
	@GetMapping("fUpdateForm.bo")
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
	
	@GetMapping("fDelete.bo")
	public String deleteFBoard(int fbno, HttpSession session) {
		if(boardService.deleteFBoard(fbno) > 0) {
			session.setAttribute("alertdeleteMsg", "게시글을 삭제했습니다.");
		} else {
			session.setAttribute("alertdeleteMsg", "게시글을 삭제하지 못했습니다.");
		}
		return "redirect:fboardList.bo";
	}
	
	@GetMapping("fRDelete.bo")
	public String deleteFReply(int fRno, HttpSession session, HttpServletRequest request) {
		if(boardService.deleteFReply(fRno) > 0) {
			session.setAttribute("alertdeleteMsg", "댓글을 삭제했습니다");
		} else {
			session.setAttribute("alertdeletemsg", "댓글을 삭제하지 못했습니다");
		}
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("fbReport.bo")
	public String insertFbReport(Report r, HttpSession session, HttpServletRequest request) {
		if(boardService.insertFbReport(r) > 0) {
			session.setAttribute("alertdeleteMsg", "게시글을 신고했습니다");
		} else {
			session.setAttribute("alertdeleteMsg", "게시글 신고를 실패했습니다.");
		}
		
		return "redirect:" + request.getHeader("Referer");

	}
	
	@GetMapping("fSearch.bo")
	public String selectFSearch(String condition, String keyword, int currentPage, Model model) {
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectFSearchCount(map), currentPage, 10, 10);
		
		model.addAttribute("list", boardService.selectFSearch(map, pi));
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pi", pi);
		
		return "board/freeListView";
	}
    
	@GetMapping("dealList.bo")
	public String selectDealList(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectDealCount(), currentPage, 10, 10);
		
		model.addAttribute("list", boardService.selectDealList(pi));
		model.addAttribute("pi", pi);
		
		return "board/dealListView";
	}
  
	@GetMapping("dealInsertForm.bo")
	public String dealInsertForm() {
		return "board/dealEnrollFormView";
	}
	
	@RequestMapping("dealEnroll.bo")
	public String insertDeal(Deal d, HttpSession session, MultipartFile upfile) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			d.setOriginName(upfile.getOriginalFilename());
			d.setChangeName(attController.saveFiles(upfile, session));
		}
		
		if(boardService.insertDeal(d) > 0) {
			session.setAttribute("alertdeleteMsg", "게시글 둥록을 완료했습니다");
		} else {
			session.setAttribute("alertdeleteMsg", "게시글 등록을 실패했습니다");
		}
		return "redirect:dealList.bo";
	}
	
	@GetMapping("dealDetail.bo")
	public String selectDeal(int dealNo, Model model) {
		model.addAttribute("deal", boardService.selectDeal(dealNo)); 
		return "board/dealDetailView";
	}
	
	@GetMapping("dealUpdateForm.bo")
	public ModelAndView dealUpdateForm(int dealNo, ModelAndView mv) {
		mv.addObject("deal", boardService.selectDeal(dealNo))
		.setViewName("board/dealUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("dealUpdate.bo")
	public String updateDeal(Deal d, MultipartFile reUpfile, HttpSession session) {
		
		if(!reUpfile.getOriginalFilename().equals("")) {
			if(d.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(d.getChangeName())).delete();
			} else {
				d.setOriginName(reUpfile.getOriginalFilename());
				d.setChangeName(attController.saveFiles(reUpfile, session));
			}
		}
		
		if(boardService.updateDeal(d) > 0) {
			session.setAttribute("alertdeleteMsg", "게시글 수정 성공");
		} else {
			session.setAttribute("alertdeleteMsg", "게시글 수정 실패");
		}
		
		if(d.getSaleStatus().equals('N')) {
			return "redirect:dealDetail.bo?dealNo=" + d.getDealNo();
		} else {
			return "redirect:dealList.bo";
		}
		
	}
	
	@RequestMapping("dealDelete.bo")
	public String deleteDeal(int dealNo, String filepath, HttpSession session) {
		
		if(!filepath.equals("")) {
			new File(session.getServletContext().getRealPath(filepath)).delete();
		}
		
		if(boardService.deleteDeal(dealNo) > 0) {
			session.setAttribute("alertdeleteMsg", "게시글을 삭제했습니다");
		} else {
			session.setAttribute("alertdeleteMsg", "게시글 삭제를 실패했습니다");
		}
		
		return "redirect:dealList.bo";
	}
	
	@RequestMapping("dealSearch.bo")
	public String selectDealSearch(String condition, String keyword, int currentPage, Model model) {
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectDSearchCount(map), currentPage, 10, 10);
		
		model.addAttribute("list", boardService.selectDSearchList(map, pi));
		model.addAttribute("pi", pi);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "board/dealListView";
	}
	
}
