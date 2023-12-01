package com.kh.muze.rank.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.muze.rank.model.vo.Rank;

public interface RankDao {

	ArrayList<Rank> selectRankList(SqlSessionTemplate sqlSession);

	ArrayList<Rank> searchRankList(SqlSessionTemplate sqlSession, String rank);

}
