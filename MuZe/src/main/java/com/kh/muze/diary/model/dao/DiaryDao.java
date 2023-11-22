package com.kh.muze.diary.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.attachment.model.vo.Attachment;
import com.kh.muze.diary.model.vo.Diary;
@Repository
public class DiaryDao {

	public int insertDiary(SqlSessionTemplate sqlSession, Diary diary) {
		return sqlSession.insert("diaryMapper.insertDiary",diary);
	}

	public ArrayList<Diary> selectDiary(SqlSessionTemplate sqlSession, int diaryUser) {
		ArrayList list = (ArrayList)sqlSession.selectList("diaryMapper.selectDiary",diaryUser);
		return list;
	}

	public int insertDiaryName(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.insert("diaryMapper.insertDiaryName",map);
	}

	public int selectDiaryName(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("diaryMapper.selectDiaryName",map);
	}

	public int updateDiaryName(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.update("diaryMapper.updateDiaryName", map);
	}

	public Diary selectDiaryDetail(SqlSessionTemplate sqlSession, Diary diary) {
		return sqlSession.selectOne("diaryMapper.selectDiaryDetail",diary);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment att) {
		return sqlSession.insert("diaryMapper.insertAttachment",att);
	}

}
