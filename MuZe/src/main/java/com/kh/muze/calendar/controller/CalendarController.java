package com.kh.muze.calendar.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.muze.attachment.controller.AttachmentController;
import com.kh.muze.attachment.model.vo.Attachment;
import com.kh.muze.calendar.model.service.CalendarService;
import com.kh.muze.calendar.model.vo.Diary;
import com.kh.muze.calendar.model.vo.Schedule;
import com.kh.muze.member.model.vo.Member;
@Controller
public class CalendarController {

	@Autowired
	private CalendarService calendarService;
	@Autowired
	private AttachmentController attController;
	
	// diary forwarding하면서 내용 가지고 오기
	@RequestMapping("diary.di")
	public String diary(Model model,HttpSession session) {
		// forwarding해주면서 다이어리에 있는 데이터를 select해서 보여주기
		Member loginUser = (Member)session.getAttribute("loginUser");
		int diaryUser = loginUser.getUserNo();
		ArrayList<Diary> list = calendarService.selectDiary(diaryUser);
		model.addAttribute("list",list);
		
		if(!list.isEmpty() && list != null) {
			if(list.get(0).getDiaryName().equals("YOU ARE MY DIARY")) {
				model.addAttribute("diaryName","YOU ARE MY DIARY");
			}else {
				String diaryName = list.get(0).getDiaryName();
				model.addAttribute("diaryName",diaryName);
			}
		}else {
			model.addAttribute("diaryName","YOU ARE MY DIARY");
		}
		
		
		return "diary/diaryCalender";
	}
	
	// diary insert 작성 메소드
	@RequestMapping("insert.di")
	public String insertDiary(Diary diary,
							  Attachment att,
							  MultipartFile upfile,
							  HttpSession session) {
		int result = 0;
		
		if(!upfile.getOriginalFilename().isEmpty() && upfile != null) {
			diary.setAttStatus("Y");
			att.setOriginName(upfile.getOriginalFilename());
			att.setModifiedName(attController.saveFiles(upfile,session));
			att.setContentNo(diary.getDiaryNo());
			att.setAttCategoryNo(10);
		}else {
			diary.setAttStatus("N");
		}
		
		result = calendarService.insertTransaction(att, diary);
		
		return "redirect:diary.di";
	}	
	
	// diary Name insert및 update 메소드
	@RequestMapping("name.di")
	public String insertDiaryName(String diaryName, int userNo) { 
		
		HashMap map = new HashMap();
		map.put("userNo", userNo);
		map.put("diaryName", diaryName);
		
		if(calendarService.selectDiaryName(map) > 0) {
			calendarService.updateDiaryName(map);
		}else {
			calendarService.insertDiaryName(map);
		}
		return "redirect:diary.di";
	}
	
	// diary detail내용 select 메소드
	@ResponseBody
	@RequestMapping(value="diaryDetail.di", produces="application/json; charset=UTF-8")
	public String selectDiaryDetail(Diary diary,
									HttpSession session) {
		Member member = (Member)session.getAttribute("loginUser");
		int diaryUser = member.getUserNo();
		
		diary.setDiaryUser(diaryUser);
		
		return new Gson().toJson(calendarService.selectDiaryDetail(diary));
	}
	
	
	@RequestMapping("schedule.di")
	public String insertSchedule(Schedule sc,HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginUser");
		int userNo = member.getUserNo();
		
		// ,00:00으로 출력되는 시간을 → 00:00으로 바꿔주기
		if(sc.getScTime().equals(",00:00")) {
			sc.setScTime("00:00");
		}
		sc.setUserNo(userNo);
		
		calendarService.insertSchedule(sc);
		
		return "redirect:diary.di";
	}
	
	
	
	
}
	