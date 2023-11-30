package com.kh.muze.bookmark.model.service;

import com.kh.muze.bookmark.model.vo.Bookmark;

public interface BookmarkService {
	
	int selectBookmark(Bookmark bk);
	
	int insertBookmark(Bookmark bk);
	
	int deleteBookmark(Bookmark bk);

}
