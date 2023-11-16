package com.kh.muze.diary.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.muze.diary.model.service.DiaryService;
import com.kh.muze.diary.model.vo.Diary;
import com.kh.muze.member.model.vo.Member;
@Controller
public class DiaryController {

	@Autowired
	private DiaryService diaryService;
	
	@RequestMapping("diary.di")
	public String diary(Model model,HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// forwarding해주면서 다이어리에 있는 데이터를 select해서 보여주기
		int diaryUser = loginUser.getUserNo();
		
		ArrayList<Diary> list = diaryService.selectDiary(diaryUser);
		
		System.out.println("list : " + list);
		
		model.addAttribute("list",list);
		
		if(!list.isEmpty() && list != null) {
			if(list.get(0).getDiaryName().isEmpty()) {
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
	public String insertDiary(String diaryTitle,
							  String diaryContent, // int diaryUser값 뽑기!!
							  String diaryDate,
							  MultipartFile upfile) {
		
		Diary diary = new Diary();
		diary.setDiaryTitle(diaryTitle);
		diary.setDiaryContent(diaryContent);
		diary.setDiaryUser(1); // 나중에 회원 완성되면 userNo값 넘기기
		diary.setDiaryDate(diaryDate);
		if(upfile != null && !upfile.isEmpty()) {
			diary.setAttStatus("Y");
		}else {
			diary.setAttStatus("N");
		}
		
		int result = diaryService.insertDiary(diary);
		
		
		return "redirect:diary.di";
	}
	
	
	@RequestMapping("name.di")
	public String insertDiaryName(String diaryName, int userNo) { // userNo회원 값 나중에 뽑기
		
		
		HashMap map = new HashMap();
		map.put("userNo", userNo);
		map.put("diaryName", diaryName);
		
		
		if(diaryService.selectDiaryName(map) > 0) {
			diaryService.updateDiaryName(map);
		}else {
			diaryService.insertDiaryName(map);
		}
		
		
		return "redirect:diary.di";
	}
	
	
	
	
	
	
	
}
	