package com.kh.muze.calendar.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.muze.attachment.model.vo.Attachment;
import com.kh.muze.calendar.model.dao.CalendarDao;
import com.kh.muze.calendar.model.vo.Diary;
import com.kh.muze.calendar.model.vo.Schedule;
@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDao calendarDao;
	@Autowired
	private SqlSessionTemplate sqlSession;	

	@Override
	@Transactional("transactionManager")
	public int insertTransaction(Attachment att, Diary diary) {
		int result1 = 0;
		int result2 = 1;
		
        result1 = calendarDao.insertDiary(sqlSession, diary);
        
        if (att != null && att.getAttCategoryNo() > 0) {
            result2 = calendarDao.insertAttachment(sqlSession, att);
        }
	    return (result1 * result2);
	}
	
	@Override
	@Transactional("transactionManager")
	public int updateTransaction(Attachment att, Diary diary) {
		int result1 = 0;
		int result2 = 1;
		
		result1 = calendarDao.updateDiary(sqlSession,diary);
		
		if(att != null && att.getAttCategoryNo() > 0 && !att.getOriginName().isEmpty()) {
			result2 = calendarDao.updateAttachment(sqlSession,att);
		}
		
		return (result1 * result2);
	}

	@Override
	public ArrayList<Diary> selectDiary(int diaryUser) {
		return calendarDao.selectDiary(sqlSession,diaryUser);
	}

	@Override
	public int insertDiaryName(HashMap map) {
		return calendarDao.insertDiaryName(sqlSession,map);
	}

	@Override
	public int selectDiaryName(HashMap map) {
		return calendarDao.selectDiaryName(sqlSession,map);
	}

	@Override
	public int updateDiaryName(HashMap map) {
		return calendarDao.updateDiaryName(sqlSession,map);
	}

	@Override
	public Diary selectDiaryDetail(Diary diary) {
		return calendarDao.selectDiaryDetail(sqlSession,diary);
	}

	@Override
	public int insertSchedule(Schedule sc) {
		return calendarDao.insertSchedule(sqlSession,sc);
	}

	@Override
	public ArrayList<Schedule> selectSchedule(int diaryUser) {
		return calendarDao.selectSchedule(sqlSession,diaryUser);
	}

	@Override
	public int deleteSchedule(HashMap map) {
		return calendarDao.deleteSchedule(sqlSession,map);
	}

	@Override
	public int deleteDiary(HashMap map) {
		return calendarDao.deleteDiary(sqlSession,map);
	}






}
