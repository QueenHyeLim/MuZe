package com.kh.muze.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.muze.board.model.vo.Board;
import com.kh.muze.common.model.vo.PageInfo;
import com.kh.muze.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);

	int insertMember(Member m);

	int updateMember(Member m);

	int deleteMember(String userId);

	int idCheck(String checkId);

	int selectListCount();

	ArrayList<Member>selectList(PageInfo pi);

	int deleteMemberById(String userId);

	int selectSearchCount();
	
	ArrayList<Board> selectSearchList(HashMap<String, String> map, PageInfo pi);

	

	
	

}
