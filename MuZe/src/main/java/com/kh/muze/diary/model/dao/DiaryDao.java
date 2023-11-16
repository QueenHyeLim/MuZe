package com.kh.muze.diary.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.diary.model.vo.Diary;
@Repository
public class DiaryDao {

	public int insertDiary(SqlSessionTemplate sqlSession, Diary diary) {
		return sqlSession.insert("diaryMapper.insertDiary",diary);
	}

	public ArrayList<Diary> selectDiary(SqlSessionTemplate sqlSession, int diaryUser) {
		return (ArrayList)sqlSession.selectList("diaryMapper.selectDiary",diaryUser);
	}

}
