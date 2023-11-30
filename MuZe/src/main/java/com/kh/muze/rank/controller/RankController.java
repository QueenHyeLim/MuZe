package com.kh.muze.rank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.muze.rank.model.service.RankService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class RankController {
	
	private final RankService rankService;
	
	@RequestMapping("list.rk")	
	public String selectListRank() {
		return "rank/rankList";
	}

}
