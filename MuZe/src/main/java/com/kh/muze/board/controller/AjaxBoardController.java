package com.kh.muze.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.muze.board.model.service.BoardService;
import com.kh.muze.board.model.vo.Like;
import com.kh.muze.board.model.vo.Reply;
import com.kh.muze.common.template.LoginUser;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AjaxBoardController {
	
	private final BoardService boardService;
	
	@PostMapping(value="fRInsert.bo")
	public String ajaxInsertFReply(Reply r) {
		return boardService.ajaxInsertFReply(r) > 0 ? "success" : "fail";
	}
	
	@GetMapping(value="fRList.bo", produces="application/json; charset=UTF-8")
	private String ajaxSelectFReplyList(int boardNo) {
		return new Gson().toJson(boardService.selectFReplyList(boardNo));
	}
	
	@PostMapping(value="insertLike.bo")
	public String ajaxInsertBoardLike(Like like, HttpSession session) {
		
		like.setUserNo(LoginUser.getUserNo(session));
		
		return boardService.ajaxInsertBoardLike(like) > 0 ? "success" : "fail";
	}
	
	@PostMapping(value="selectLike.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectBoardLike(Like like, HttpSession session) {
		
		like.setUserNo(LoginUser.getUserNo(session));
		
		return new Gson().toJson(boardService.selectBoardLike(like));
	}
	
	@PostMapping(value="deleteLike.bo")
	public String ajaxDeleteBoardLike(Like like, HttpSession session) {
		
		like.setUserNo(LoginUser.getUserNo(session));
		
		return boardService.ajaxDeleteBoardLike(like) > 0 ? "success" : "fail";
	}

	
}
