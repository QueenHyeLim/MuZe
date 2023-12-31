package com.kh.muze.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.kh.muze.attachment.model.vo.Attachment;
import com.kh.muze.board.model.vo.Board;
import com.kh.muze.board.model.vo.Deal;
import com.kh.muze.board.model.vo.Like;
import com.kh.muze.board.model.vo.Reply;
import com.kh.muze.board.model.vo.Report;
import com.kh.muze.common.model.vo.PageInfo;

public interface BoardService {

	int selectFboardCount();
	
	ArrayList<Board> selectFboardList(PageInfo pi);

	int insertFboard(Board b);

	int increaseCount(int fbno);

	Board selectFboard(int fbno);

	int updateFBoard(Board b);

	int deleteFBoard(int fbno);

	int ajaxInsertFReply(Reply r);

	ArrayList<Reply> selectFReplyList(int boardNo);

	int deleteFReply(int fRno);

	int insertFbReport(Report r);

	int selectDealCount();

	ArrayList<Deal> selectDealList(PageInfo pi);

	int insertDeal(Deal d);

	Deal selectDeal(int dno);

	int updateDeal(Deal d);

	int deleteDeal(int dealNo);

	int ajaxInsertBoardLike(Like like);

	int selectBoardLike(Like like);

	int ajaxDeleteBoardLike(Like like);

	int selectFSearchCount(HashMap<String, String> map);

	ArrayList<Board> selectFSearch(HashMap<String, String> map, PageInfo pi);

	int selectDSearchCount(HashMap<String, String> map);

	ArrayList<Deal> selectDSearchList(HashMap<String, String> map, PageInfo pi);

}
