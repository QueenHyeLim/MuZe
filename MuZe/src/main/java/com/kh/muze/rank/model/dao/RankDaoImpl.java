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
	public ArrayList<Rank> searchRankList(SqlSessionTemplate sqlSession, String rank) {
		
		ArrayList<Rank> rankList = new ArrayList();
		
		switch(rank) {
		case "popular" : rankList = (ArrayList)sqlSession.selectList("rankMapper.searchPopularList");
		break;
		case "scrap" : rankList = (ArrayList)sqlSession.selectList("rankMapper.searchScrapList");
		break;
		case "range" : rankList = (ArrayList)sqlSession.selectList("rankMapper.searchRangeList");
		break;
		default : System.out.println(rank + "List를 찾지 못했습니다.");
		}
		return rankList;
	}

}
