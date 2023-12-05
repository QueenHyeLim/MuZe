package com.kh.muze.calendar.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.muze.attachment.controller.AttachmentController;
import com.kh.muze.attachment.model.vo.Attachment;
import com.kh.muze.calendar.model.dao.CalendarDao;
import com.kh.muze.calendar.model.vo.Diary;
import com.kh.muze.calendar.model.vo.Schedule;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService{

	private final CalendarDao calendarDao;
	private final SqlSessionTemplate sqlSession;	

	@Override
	@Transactional("transactionManager")
	public int insertTransaction(Attachment att, Diary diary) {
		int diaryResult = 0;
		int attachmentResult = 1;
		diaryResult = calendarDao.insertDiary(sqlSession, diary);
        if (att != null && att.getAttCategoryNo() > 0) {
        	attachmentResult = calendarDao.insertAttachment(sqlSession, att);
        }
	    return (diaryResult * attachmentResult);
	}
	
	@Override
	@Transactional("transactionManager")
	public int updateTransaction(Attachment att, Diary diary) {
		int diaryResult = 0;
		int attachmentResult = 1;
		
		diaryResult = calendarDao.updateDiary(sqlSession,diary);
		
		// 첨부파일이 있을 경우
		if(att != null && att.getAttCategoryNo() > 0) {
			// contentNo로 attachment가 있는지 확인 후
			int selectAtt = calendarDao.selectAttachment(sqlSession, att);
			if(selectAtt > 0 ) {
				// 있을 경우 UPDATE
				attachmentResult = calendarDao.updateAttachment(sqlSession,att);
			}else {
				// 없을 경우 INSERT
				attachmentResult = calendarDao.insertAttachment(sqlSession, att);
			}
		}
		return (diaryResult * attachmentResult);
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
