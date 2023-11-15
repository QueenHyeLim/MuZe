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
	
	// diary insert 작성 메소드
	@RequestMapping("insert.di")
	public String insertDiary(String diaryTitle,
							  String diaryContent, // int diaryUser값 뽑기!!
							  String diaryDate,
							  MultipartFile upfile) {
		
		// System.out.println("insert.di에 들어옴");
		
		System.out.println("diaryDate : " + diaryDate);
		
		Diary diary = new Diary();
		diary.setDiaryTitle(diaryTitle);
		diary.setDiaryContent(diaryContent);
		diary.setDiaryUser(1); // 나중에 회원 완성되면 userNo값 넘기기
		diary.setDiaryDate(diaryDate);
		
		if(upfile != null) {
			diary.setAttStatus("Y");
		}else {
			diary.setAttStatus("N");
		}
		int result = diaryService.insertDiary(diary);
		
		System.out.println("result : " + result);
		// 유저가 파일을 업로드 했을때만 DB를 갔다옴
		return "diary/diaryCalender";
	}
	
	
	// 화면에 들어왔을때 뿌려주는 
	@RequestMapping("select.di")
	public String selectDiary() {
		
		
		
		return "diary/diaryCalender";
	}
	
	
	
}
	