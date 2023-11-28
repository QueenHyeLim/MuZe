package com.kh.muze.bookmark.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.bookmark.model.vo.Bookmark;
@Repository
public class BookmarkDao {

	public int selectBookmark(SqlSessionTemplate sqlSession, Bookmark bk) {
		return sqlSession.selectOne("bookmarkMapper.selectBookmark", bk);
	}

	public int insertBookmark(SqlSessionTemplate sqlSession, Bookmark bk) {
		return sqlSession.insert("bookmarkMapper.insertBookmark", bk);
	}

	public int deleteBookmark(SqlSessionTemplate sqlSession, Bookmark bk) {
		return sqlSession.delete("bookmarkMapper.deleteBookmark",bk);
	}

}
