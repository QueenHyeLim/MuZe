package com.kh.muze.rank.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.muze.rank.model.service.RankService;
import com.kh.muze.rank.model.vo.Rank;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class RankController {
	
	private final RankService rankService;
	
	@RequestMapping("list.rk")	
	public String selectRankList(Model model) {
	 	// 랭킹(list.rk)을 누르면 개봉 날짜 순 으로 list를 뿌려주는 list
		ArrayList<Rank> rankList = rankService.selectRankList();
		model.addAttribute("rankList", rankList);
		return "rank/rankList";
	}
	
	@ResponseBody
	@GetMapping(value="search.rk", produces="application/json; charset=UTF-8")
	public String searchRankList(String rank,Model model) {
		if(rank.equals("none")) {
			model.addAttribute("none","카테고리를 선택해주세요.");
			return "redirect:/previousPage";
		}else {
			return new Gson().toJson(rankService.searchRankList(rank));
		}
	}

}


