package com.kh.muze.diary.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	@Override
	public ArrayList<Diary> selectDiary(int diaryUser) {
		return diaryDao.selectDiary(sqlSession,diaryUser);
	}

	@Override
	public int insertDiaryName(HashMap map) {
		return diaryDao.insertDiaryName(sqlSession,map);
	}

	@Override
	public int selectDiaryName(HashMap map) {
		return diaryDao.selectDiaryName(sqlSession,map);
	}

	@Override
	public int updateDiaryName(HashMap map) {
		return diaryDao.updateDiaryName(sqlSession,map);
	}

	@Override
	public Diary selectDiaryDetail(Diary diary) {
		return diaryDao.selectDiaryDetail(sqlSession,diary);
	}

}
