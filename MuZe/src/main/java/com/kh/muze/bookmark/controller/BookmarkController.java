package com.kh.muze.bookmark.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.muze.bookmark.model.service.BookmarkServiceImpl;
import com.kh.muze.bookmark.model.vo.Bookmark;
import com.kh.muze.common.template.LoginUser;

@Controller
public class BookmarkController {

	@Autowired
	private BookmarkServiceImpl bookmarkService;
	
	@ResponseBody
	@RequestMapping(value="select.bk", produces="application/json; charset=UTF-8")
	public String selectBookmark(HttpSession session,String musId) {
		
		Bookmark bk = new Bookmark();
		bk.setMusId(musId);
		bk.setUserNo(LoginUser.getUserNo(session));
		
		return new Gson().toJson(bookmarkService.selectBookmark(bk));
	}
	
	@ResponseBody
	@RequestMapping(value="insert.bk", produces="application/json; charset=UTF-8")
	public String insertBookmark(HttpSession session, String musId) {
		
		Bookmark bk = new Bookmark();
		bk.setMusId(musId);
		bk.setUserNo(LoginUser.getUserNo(session));
		
		return new Gson().toJson(bookmarkService.insertBookmark(bk));
	}
	
	@ResponseBody
	@RequestMapping(value="delete.bk", produces="application/json; charset=UTF-8")
	public String deleteBookmark(HttpSession session, String musId) {
		
		Bookmark bk = new Bookmark();
		bk.setMusId(musId);
		bk.setUserNo(LoginUser.getUserNo(session));
		
		return new Gson().toJson(bookmarkService.deleteBookmark(bk));
	}
	
	

}
