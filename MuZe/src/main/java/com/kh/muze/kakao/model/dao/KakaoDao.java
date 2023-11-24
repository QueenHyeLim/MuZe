package com.kh.muze.kakao.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.kakao.model.vo.ReadyResponse;

@Repository
public class KakaoDao {

	public int insertReady(SqlSessionTemplate sqlSession, ReadyResponse readyResponse) {
		return sqlSession.insert("kakaoMapper.insertReady", readyResponse);
	}

	public String selectTid(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("kakaoMapper.selectTid");
	}

}
