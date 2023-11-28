package com.kh.muze.calendar.controller;

import java.io.File;
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
import com.kh.muze.calendar.model.dao.CalendarDao;
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
	// Attachment category Number
	// private static final int attNo = 10;
	
	// diary forwarding하면서 내용 가지고 오기
	@RequestMapping("calendar.ca")
	public String diary(Model model,HttpSession session) {
		
		// forwarding해주면서 다이어리에 있는 데이터를 select해서 보여주기
		Member loginUser = (Member)session.getAttribute("loginUser");
		int diaryUser = loginUser.getUserNo();
		
		// DIARY LIST SELECT
		ArrayList<Diary> diaryList = calendarService.selectDiary(diaryUser);
		model.addAttribute("diaryList",diaryList);
		// SCHEDULE LIST SELECT
		ArrayList<Schedule> scheduleList = calendarService.selectSchedule(diaryUser);
		model.addAttribute("scheduleList",scheduleList);
		

		
		if(!diaryList.isEmpty() && diaryList != null) {
			// 어차피 SQL에서 if null일 때  YOU ARE MY DIARY로 뽑았기 때문에 그대로 diaryName을 입력해주면 된다
			String diaryName = diaryList.get(0).getDiaryName();
			
			if(diaryList.get(0).getDiaryName().equals("YOU ARE MY DIARY")) {
				model.addAttribute("diaryName", diaryName);
			}else {
				model.addAttribute("diaryName",diaryName);
			}
			
		}else {
			// diaryList가 null이면 아예 YOU ARE MY DIARY로 값을 입력하여 넘겨준다
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
		
		if(!upfile.getOriginalFilename().isEmpty() && upfile != null) {
			diary.setAttStatus("Y");
			att.setOriginName(upfile.getOriginalFilename());
			att.setModifiedName(attController.saveFiles(upfile,session));
			att.setContentNo(diary.getDiaryNo());
			att.setAttCategoryNo(10);
		}else {
			diary.setAttStatus("N");
		}
		
		calendarService.insertTransaction(att, diary);
		
		return "redirect:calendar.ca";
	}	
	
	
	// diary 수정 update 메소드
	@RequestMapping("updateDiary.di")
	public String updateDiary(Diary diary,
							  Attachment att,
							  MultipartFile upfile,
							  HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginUser");
		int diaryUser = member.getUserNo();
		diary.setDiaryUser(diaryUser);
		System.out.println("upfile : " + upfile);
		// 첨부파일이 존재할 경우
		if(upfile != null && !upfile.getOriginalFilename().isEmpty()) {
			// 새로운 첨부파일이 있으며 기존 첨부파일도 있을 경우
			if(att.getAttNo() > 0) {
				new File(session.getServletContext().getRealPath(att.getModifiedName())).delete();
			}
			// 새로운 첨부파일이 있을 경우 객체에 값을 담아준다
			diary.setAttStatus("Y");
			att.setOriginName(upfile.getOriginalFilename());
			att.setModifiedName(attController.saveFiles(upfile, session));
			att.setContentNo(diary.getDiaryNo());
			att.setAttCategoryNo(10);
		}else {
			// 첨부파일이 없을 경우 attStatus를 "N"으로 값을 넣어준다
			diary.setAttStatus("N");
		}
		
		calendarService.updateTransaction(att,diary);
		
		return "redirect:calendar.ca";
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
		return "redirect:calendar.ca";
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
	
	
	@RequestMapping("schedule.sc")
	public String insertSchedule(Schedule sc,HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginUser");
		int userNo = member.getUserNo();
		
		// 만약을 대비해 내용을 입력 값이 없을땐 "-"를 넣어준다
		if(sc.getScTitle().equals("")) {
			sc.setScTitle("-");
		}
		sc.setUserNo(userNo);
		
		calendarService.insertSchedule(sc);
		
		return "redirect:calendar.ca";
	}
	
	@RequestMapping("deleteSchedule.sc")
	public String deleteSchedule(int sNo,HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginUser");
		int userNo = member.getUserNo();
		
		HashMap map = new HashMap();
		map.put("userNo" ,userNo);
		map.put("scheduleNo",sNo);
		
		calendarService.deleteSchedule(map);
		
		return "redirect:calendar.ca";
	}
	
	@RequestMapping("deleteDiary.di")
	public String deleteDiary(int dNo, HttpSession session) {
		Member member = (Member)session.getAttribute("loginUser");
		int diaryUser = member.getUserNo();
		
		HashMap map = new HashMap();
		map.put("diaryUser" ,diaryUser);
		map.put("diaryNo",dNo);
		
		calendarService.deleteDiary(map);
		
		return "redirect:calendar.ca";
	}
	
	
	
	
}
	