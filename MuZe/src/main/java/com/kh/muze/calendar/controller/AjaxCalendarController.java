package com.kh.muze.calendar.controller;


import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.muze.attachment.controller.AttachmentController;
import com.kh.muze.calendar.model.service.CalendarService;
import com.kh.muze.calendar.model.vo.Diary;
import com.kh.muze.common.template.LoginUser;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AjaxCalendarController {

	private final CalendarService calendarService;
	private final AttachmentController attController;
	
	// diary detail내용 select 메소드
	@PostMapping(value="diaryDetail.di", produces="application/json; charset=UTF-8")
	public String selectDiaryDetail(Diary diary,
									HttpSession session) {
		int diaryUser = LoginUser.getUserNo(session);
		
		diary.setDiaryUser(diaryUser);
		
		return new Gson().toJson(calendarService.selectDiaryDetail(diary));
	}
	
}
	