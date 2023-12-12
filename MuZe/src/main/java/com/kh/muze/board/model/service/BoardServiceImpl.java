package com.kh.muze.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.kh.muze.board.model.dao.BoardDao;
import com.kh.muze.board.model.vo.Board;
import com.kh.muze.board.model.vo.Deal;
import com.kh.muze.board.model.vo.Like;
import com.kh.muze.board.model.vo.Reply;
import com.kh.muze.board.model.vo.Report;
import com.kh.muze.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@EnableTransactionManagement
public class BoardServiceImpl implements BoardService{
	
	private final BoardDao boardDao;
	
	private final SqlSessionTemplate sqlSession;

	@Override
	public int selectFboardCount() {
		return boardDao.selectFboardCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectFboardList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return boardDao.selectFboardList(sqlSession, rowBounds);
	}

	@Override
	public int insertFboard(Board b) {
		return boardDao.insertFboard(sqlSession, b);
	}

	@Override
	public int increaseCount(int fbno) {
		return boardDao.increaseCount(sqlSession, fbno);
	}

	@Override
	public Board selectFboard(int fbno) {
		return boardDao.selectFboard(sqlSession, fbno);
	}

	@Override
	public int updateFBoard(Board b) {
		return boardDao.updateFBoard(sqlSession, b);
	}

	@Override
	public int deleteFBoard(int fbno) {
		return boardDao.deleteFBoard(sqlSession, fbno);
	}

	@Override
	public int ajaxInsertFReply(Reply r) {
		return boardDao.ajaxInsertFReply(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectFReplyList(int boardNo) { 
		return boardDao.selectFReplyList(sqlSession, boardNo);
	}

	@Override
	public int deleteFReply(int fRno) { 
		return boardDao.deleteFReply(sqlSession, fRno);
	}

	@Override
	public int insertFbReport(Report r) {
		return boardDao.insertFbReport(sqlSession, r); 
	}

	@Override
	public int selectDealCount() {
		return boardDao.selectDealCount(sqlSession);
	}

	@Override
	public ArrayList<Deal> selectDealList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return boardDao.selectDealList(sqlSession, rowBounds);
	}

	@Override
	public int insertDeal(Deal d) {
		return boardDao.insertDeal(sqlSession, d);
	}

	@Override
	public Deal selectDeal(int dno) {
		return boardDao.selectDeal(sqlSession, dno);
	}

	@Override
	public int updateDeal(Deal d) {
		return boardDao.updateDeal(sqlSession, d);
	}

	@Override
	public int deleteDeal(int dealNo) {
		return boardDao.deleteDeal(sqlSession, dealNo);
	}

	@Override
	public int ajaxInsertBoardLike(Like like) {
		return boardDao.insertBoardLike(sqlSession, like);
	}

	@Override
	public int selectBoardLike(Like like) {
		return boardDao.selectBoardLike(sqlSession, like);
	}

	@Override
	public int ajaxDeleteBoardLike(Like like) {
		return boardDao.deleteBoardLike(sqlSession, like);
	}

	@Override
	public int selectFSearchCount(HashMap<String, String> map) {
		return boardDao.selectFSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Board> selectFSearch(HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return boardDao.selectFSearch(sqlSession, map, rowBounds);
	}

	@Override
	public int selectDSearchCount(HashMap<String, String> map) {
		return boardDao.selectDSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Deal> selectDSearchList(HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return boardDao.selectDSearchList(sqlSession, map, rowBounds);
	}


}
