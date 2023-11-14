package com.kh.muze.diary.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.diary.model.vo.Diary;
@Repository
public class DiaryDao {

	public int insertDiary(SqlSessionTemplate sqlSession, Diary diary) {
		return sqlSession.insert("diaryMapper.insertDiary",diary);
	}

}
