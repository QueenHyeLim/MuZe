package com.kh.muze.rank.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.muze.rank.model.vo.Rank;

public interface RankService {

	ArrayList<Rank> selectRankList();

	List<Rank> searchRankList(Rank rank);

}
