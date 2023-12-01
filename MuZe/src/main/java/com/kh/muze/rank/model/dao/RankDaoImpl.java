package com.kh.muze.rank.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.rank.model.vo.Rank;

@Repository
public class RankDaoImpl implements RankDao{

	@Override
	public ArrayList<Rank> selectRankList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("rankMapper.selectRankList");
	}

	@Override
	public  ArrayList<Rank> searchPopularList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("rankMapper.searchPopularList");
	}

	@Override
	public  ArrayList<Rank> searchScrapList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("rankMapper.searchScrapList");
	}

	@Override
	public  ArrayList<Rank> searchRangeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("rankMapper.searchRangeList");
	}

	@Override
	public  ArrayList<Rank> searchMyRankList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("rankMapper.searchMyRankList");
	}



}
