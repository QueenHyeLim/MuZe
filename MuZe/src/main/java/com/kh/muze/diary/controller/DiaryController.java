package com.kh.muze.diary.controller;

import org.apache.commons.fileupload.MultipartStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.muze.diary.model.service.DiaryService;
import com.kh.muze.diary.model.vo.Diary;
@Controller
public class DiaryController {

	@Autowired
	private DiaryService diaryService;
	
	@RequestMapping("diary.di")
	public String diary() {
		return "diary/diaryCalender";
	}

	@RequestMapping("insert.di")
	public String insertDiary(String diaryTitle,
							  String diaryContent, // int userNo값 뽑기!!
							  String diaryDate,
							  MultipartFile upfile) {
		
		System.out.println("insert.di에 들어옴");
		
		System.out.println("diaryDate : " + diaryDate);
		
		Diary diary = new Diary();
		diary.setDiaryTitle(diaryTitle);
		diary.setDiaryContent(diaryContent);
		diary.setUserNo(1); // 나중에 회원 완성되면 userNo값 넘기기
		diary.setDiaryDate(diaryDate);
		
		int result = diaryService.insertDiary(diary);
		
		System.out.println("result : " + result);
		// 유저가 파일을 업로드 했을때만 DB를 갔다옴
		return "diary/diaryCalender";
	}
	
	
}
	