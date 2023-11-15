package com.kh.muze.diary.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.muze.diary.model.service.DiaryService;
import com.kh.muze.diary.model.vo.Diary;
@Controller
public class DiaryController {

	@Autowired
	private DiaryService diaryService;
	
	@RequestMapping("diary.di")
	public String diary(Model model) {
		
		// forwarding해주면서 다이어리에 있는 데이터를 select해서 보여주기
		int diaryUser = 1; // 임시 회원 번호
		ArrayList<Diary> list = diaryService.selectDiary(diaryUser);
		model.addAttribute("list",list);
		
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
	
	
	
	
	
}
	