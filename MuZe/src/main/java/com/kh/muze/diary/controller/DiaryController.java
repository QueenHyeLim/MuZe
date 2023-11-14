package com.kh.muze.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class DiaryController {
	
	@RequestMapping("diary.di")
	public String diary() {
		return "diary/diaryListView";
	}

	
	
	
}
	