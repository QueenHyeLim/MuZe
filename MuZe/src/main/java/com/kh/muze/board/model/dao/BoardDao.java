package com.kh.muze.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.attachment.model.vo.Attachment;
import com.kh.muze.board.model.vo.Board;
import com.kh.muze.board.model.vo.Deal;
import com.kh.muze.board.model.vo.Like;
import com.kh.muze.board.model.vo.Reply;
import com.kh.muze.board.model.vo.Report;
import com.kh.muze.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int selectFboardCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectFboardCount");
	}

	public ArrayList<Board> selectFboardList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectFboardList", null, rowBounds);
	}

	public int insertFboard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertFboard", b);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int fbno) {
		return sqlSession.update("boardMapper.increaseCount", fbno);
	}

	public Board selectFboard(SqlSessionTemplate sqlSession, int fbno) {
		return sqlSession.selectOne("boardMapper.selectFboard", fbno);
	}

	public int updateFBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateFBoard", b);
	}

	public int deleteFBoard(SqlSessionTemplate sqlSession, int fbno) {
		return sqlSession.update("boardMapper.deleteFBoard", fbno);
	}

	public int ajaxInsertFReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertFReply", r);
	}

	public ArrayList<Reply> selectFReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectFReplyList", boardNo);
	}

	public int deleteFReply(SqlSessionTemplate sqlSession, int fRno) {
		return sqlSession.delete("boardMapper.deleteFReply", fRno);
	}

	public int insertFbReport(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.insert("boardMapper.insertFbReport", r);
	}

	public int selectDealCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectDealCount");
	}

	public ArrayList<Deal> selectDealList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectDealList", null, rowBounds);
	}

	public int insertDeal(SqlSessionTemplate sqlSession, Deal d) {
		return sqlSession.insert("boardMapper.insertDeal", d);
	}

	public Deal selectDeal(SqlSessionTemplate sqlSession, int dno) {
		return sqlSession.selectOne("boardMapper.selectDeal", dno);
	}

	public int updateDeal(SqlSessionTemplate sqlSession, Deal d) {
		return sqlSession.update("boardMapper.updateDeal", d);
	}

	public int deleteDeal(SqlSessionTemplate sqlSession, int dealNo) {
		return sqlSession.delete("boardMapper.deleteDeal", dealNo);
	}

	public int insertDealAtt(SqlSessionTemplate sqlSession, Attachment att) {
		return sqlSession.insert("boardMapper.insertDealAtt", att);
	}

	public int insertFboardLike(SqlSessionTemplate sqlSession, Like l) {
		return sqlSession.insert("boardMapper.insertFboardLike", l);
	}

	public int selectFboardLike(SqlSessionTemplate sqlSession, Like like) {
		return sqlSession.selectOne("boardMapper.selectFboardLike", like);
	}

	public int deleteFboardLike(SqlSessionTemplate sqlSession, Like l) {
		return sqlSession.delete("boardMapper.deleteFboardLike", l);
	}

	public int selectFSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.selectFSearchCount", map);
	}

	public ArrayList<Board> selectFSearch(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectFSearch", map, rowBounds);
	}

	public int selectDSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.selectDSearchCount", map);
	}

	public ArrayList<Deal> selectDSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectDSearchList", map, rowBounds);
	}


}
