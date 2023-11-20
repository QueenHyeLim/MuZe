package com.kh.muze.diary.controller;

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
import com.kh.muze.diary.model.service.DiaryService;
import com.kh.muze.diary.model.vo.Diary;
import com.kh.muze.member.model.vo.Member;
@Controller
public class DiaryController {

	@Autowired
	private DiaryService diaryService;
	
	// diary forwarding하면서 내용 가지고 오기
	@RequestMapping("diary.di")
	public String diary(Model model,HttpSession session) {
		// forwarding해주면서 다이어리에 있는 데이터를 select해서 보여주기
		Member loginUser = (Member)session.getAttribute("loginUser");
		int diaryUser = loginUser.getUserNo();
		ArrayList<Diary> list = diaryService.selectDiary(diaryUser);
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
							  MultipartFile upfile,
							  int diaryUser) {
		
		Diary diary = new Diary();
		diary.setDiaryTitle(diaryTitle);
		diary.setDiaryContent(diaryContent);
		diary.setDiaryUser(diaryUser); // 나중에 회원 완성되면 userNo값 넘기기
		diary.setDiaryDate(diaryDate);
		
		if(upfile != null && !upfile.isEmpty()) {
			diary.setAttStatus("Y");
		}else {
			diary.setAttStatus("N");
		}
		
		int result = diaryService.insertDiary(diary);
		return "redirect:diary.di";
	}
	
	// diary Name insert및 update 메소드
	@RequestMapping("name.di")
	public String insertDiaryName(String diaryName, int userNo) { 
		
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
	
	// diary detail내용 select 메소드
	@ResponseBody
	@RequestMapping(value="diaryDetail.di", produces="application/json; charset=UTF-8")
	public String selectDiaryDetail(int diaryNo,
									String diaryTitle,
									HttpSession session) {
		Member member = (Member)session.getAttribute("loginUser");
		int diaryUser = member.getUserNo();
		
		Diary diary = new Diary();
		diary.setDiaryNo(diaryNo);
		diary.setDiaryTitle(diaryTitle);
		diary.setDiaryUser(diaryUser);
		
		return new Gson().toJson(diaryService.selectDiaryDetail(diary));
	}
	
	
	
	
	
}
	