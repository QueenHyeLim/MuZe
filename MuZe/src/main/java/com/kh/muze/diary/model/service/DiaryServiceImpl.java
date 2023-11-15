package com.kh.muze.diary.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.muze.diary.model.dao.DiaryDao;
import com.kh.muze.diary.model.vo.Diary;
@Service
public class DiaryServiceImpl implements DiaryService{

	@Autowired
	private DiaryDao diaryDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertDiary(Diary diary) {
		return diaryDao.insertDiary(sqlSession,diary);
	}

}
