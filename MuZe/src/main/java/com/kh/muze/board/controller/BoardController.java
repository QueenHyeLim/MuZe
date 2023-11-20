package com.kh.muze.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("fboardList.bo")
	public String freeBoard() {
		return "board/freeListView";
	}
	
	@RequestMapping("fboardWrite.bo")
	public String insertFboardForm() {
		return "board/freeWriteView";
	}
}
