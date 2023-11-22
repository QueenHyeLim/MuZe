package com.kh.muze.diary.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.muze.attachment.model.vo.Attachment;
import com.kh.muze.diary.model.dao.DiaryDao;
import com.kh.muze.diary.model.vo.Diary;
@Service
public class DiaryServiceImpl implements DiaryService{

	@Autowired
	private DiaryDao diaryDao;
	@Autowired
	private SqlSessionTemplate sqlSession;	

	@Override
	@Transactional("transactionManager")
	public int insertTransaction(Attachment att, Diary diary) {
		int result1 = 0;
		int result2 = 1;
		
        result1 = diaryDao.insertDiary(sqlSession, diary);
        
        if (att != null && att.getAttCategoryNo() > 0) {
            result2 = diaryDao.insertAttachment(sqlSession, att);
        }

	    return (result1 * result2);
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
