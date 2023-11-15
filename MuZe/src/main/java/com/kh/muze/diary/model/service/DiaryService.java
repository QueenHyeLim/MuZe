package com.kh.muze.diary.model.service;


import java.util.ArrayList;

import com.kh.muze.diary.model.vo.Diary;

public interface DiaryService {
	
	int insertDiary(Diary diary);
	
	ArrayList<Diary> selectDiary(int diaryUser);

}
