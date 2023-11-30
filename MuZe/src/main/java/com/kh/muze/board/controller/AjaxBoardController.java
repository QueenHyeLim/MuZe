package com.kh.muze.board.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.muze.board.model.service.BoardService;
import com.kh.muze.board.model.vo.Like;
import com.kh.muze.board.model.vo.Reply;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AjaxBoardController {
	
	private final BoardService boardService;
	
	@RequestMapping(value="fRInsert.bo")
	public String ajaxInsertFReply(Reply r) {
		return boardService.ajaxInsertFReply(r) > 0 ? "success" : "fail";
	}
	
	@GetMapping(value="fRList.bo", produces="application/json; charset=UTF-8")
	private String ajaxSelectFReplyList(int boardNo) {
		return new Gson().toJson(boardService.selectFReplyList(boardNo));
	}
	
	@RequestMapping(value="fInsertLike.bo")
	public String ajaxInsertFboardLike(Like l) {
		return boardService.ajaxInsertFboardLike(l) > 0 ? "success" : "fail";
	}
	
	@RequestMapping(value="fSelectLike.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectFboardLike(Like l) {
		return new Gson().toJson(boardService.selectFboardLike(l));
	}
	
	@RequestMapping(value="fDeleteLike.bo")
	public String ajaxDeleteFboardLike(Like l) {
		return boardService.ajaxDeleteFboardLike(l) > 0 ? "success" : "fail";
	}

	
}
