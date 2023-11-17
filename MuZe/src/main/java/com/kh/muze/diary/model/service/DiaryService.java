package com.kh.muze.diary.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import com.kh.muze.diary.model.vo.Diary;

public interface DiaryService {
	
	int insertDiary(Diary diary);
	
	ArrayList<Diary> selectDiary(int diaryUser);

	int insertDiaryName(HashMap map);

	int selectDiaryName(HashMap map);

	int updateDiaryName(HashMap map);

	Diary selectDiaryDetail(Diary diary);

}
