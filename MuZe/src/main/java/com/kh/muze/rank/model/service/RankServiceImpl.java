package com.kh.muze.rank.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.muze.rank.model.dao.RankDao;
import com.kh.muze.rank.model.vo.Rank;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RankServiceImpl implements RankService{
	
	private final RankDao rankDao;
	private final SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Rank> selectRankList() {
		return rankDao.selectRankList(sqlSession);
	}

	@Override
	public ArrayList<Rank> searchRankList(Rank rank) {
		
		String rankCategory = rank.getRankCategory();
		ArrayList<Rank> rankList = new ArrayList();
		
		switch(rankCategory) {
		case "popular" : rankList = rankDao.searchPopularList(sqlSession);
		break;
		case "scrap" : rankList = rankDao.searchScrapList(sqlSession);
		break;
		case "range" : rankList = rankDao.searchRangeList(sqlSession);
		break;
		case "myRank" : rankList = rankDao.searchMyRankList(sqlSession,rank.getUserNo());
		break;
		default : System.out.println(rank + "List를 찾지 못했습니다."); 
		}
		return rankList;
	}

}
