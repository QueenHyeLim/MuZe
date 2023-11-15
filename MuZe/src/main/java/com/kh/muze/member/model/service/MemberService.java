package com.kh.muze.member.model.service;

import com.kh.muze.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);

	int insertMember(Member m);

}
