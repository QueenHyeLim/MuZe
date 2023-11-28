package com.kh.muze.bookmark.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.muze.bookmark.model.dao.BookmarkDao;
import com.kh.muze.bookmark.model.vo.Bookmark;

@Service
public class BookmarkServiceImpl implements BookmarkService{

	@Autowired
	private BookmarkDao bookmarkDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int selectBookmark(Bookmark bk) {
		return bookmarkDao.selectBookmark(sqlSession,bk);
	}

	@Override
	public int insertBookmark(Bookmark bk) {
		return bookmarkDao.insertBookmark(sqlSession,bk);
	}

	@Override
	public int deleteBookmark(Bookmark bk) {
		return bookmarkDao.deleteBookmark(sqlSession,bk);
	}

}
