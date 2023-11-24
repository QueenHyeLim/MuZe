package com.kh.muze.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.board.model.vo.Board;

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


}
