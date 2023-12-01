package com.kh.muze.rank.model.service;

import java.util.ArrayList;

import com.kh.muze.rank.model.vo.Rank;

public interface RankService {

	ArrayList<Rank> selectRankList();

	ArrayList<Rank> searchRankList(String rank);

}
