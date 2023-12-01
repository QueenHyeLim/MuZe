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
	public ArrayList<Rank> searchRankList(String rank) {
		return rankDao.searchRankList(sqlSession,rank);
	}

}
