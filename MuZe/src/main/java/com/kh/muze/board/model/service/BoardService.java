package com.kh.muze.board.model.service;

import java.util.ArrayList;

import com.kh.muze.board.model.vo.Board;
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

}
