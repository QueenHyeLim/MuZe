package com.kh.muze.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.kh.muze.board.model.dao.BoardDao;
import com.kh.muze.board.model.vo.Board;
import com.kh.muze.common.model.vo.PageInfo;

@Service
@EnableTransactionManagement
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

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

}
