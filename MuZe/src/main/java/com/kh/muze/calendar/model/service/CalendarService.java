package com.kh.muze.calendar.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import com.kh.muze.attachment.model.vo.Attachment;
import com.kh.muze.calendar.model.vo.Diary;
import com.kh.muze.calendar.model.vo.Schedule;

public interface CalendarService {
	
	int insertTransaction(Attachment att, Diary diary);
	
	ArrayList<Diary> selectDiary(int diaryUser);

	int insertDiaryName(HashMap map);

	int selectDiaryName(HashMap map);

	int updateDiaryName(HashMap map);

	Diary selectDiaryDetail(Diary diary);

	int insertSchedule(Schedule sc);

}
