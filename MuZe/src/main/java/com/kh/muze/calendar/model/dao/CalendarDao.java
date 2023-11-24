package com.kh.muze.calendar.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.attachment.model.vo.Attachment;
import com.kh.muze.calendar.model.vo.Diary;
import com.kh.muze.calendar.model.vo.Schedule;
@Repository
public class CalendarDao {

	public int insertDiary(SqlSessionTemplate sqlSession, Diary diary) {
		return sqlSession.insert("calendarMapper.insertDiary",diary);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment att) {
		return sqlSession.insert("calendarMapper.insertAttachment",att);
	}
	
	public ArrayList<Diary> selectDiary(SqlSessionTemplate sqlSession, int diaryUser) {
		ArrayList list = (ArrayList)sqlSession.selectList("calendarMapper.selectDiary",diaryUser);
		return list;
	}

	public ArrayList<Schedule> selectSchedule(SqlSessionTemplate sqlSession, int diaryUser) {
		return (ArrayList)sqlSession.selectList("calendarMapper.selectSchedule",diaryUser);
	}
	
	public int insertDiaryName(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.insert("calendarMapper.insertDiaryName",map);
	}

	public int selectDiaryName(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("calendarMapper.selectDiaryName",map);
	}

	public int updateDiaryName(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.update("calendarMapper.updateDiaryName", map);
	}

	public Diary selectDiaryDetail(SqlSessionTemplate sqlSession, Diary diary) {
		return sqlSession.selectOne("calendarMapper.selectDiaryDetail",diary);
	}

	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule sc) {
		return sqlSession.insert("calendarMapper.insertSchedule",sc);
	}



}
