package com.kh.muze.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.board.model.vo.Board;
import com.kh.muze.common.model.vo.PageInfo;
import com.kh.muze.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.delete("memberMapper.deleteMember", userId);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}

	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", null, rowBounds);
	}

	public int adminDeleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.delete("memberMapper.adminDeleteMember", userId);
	}

	public int deleteMemberById(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.delete("memberMapper.deleteMembeById", userId);
	}

	public int selectSearchCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectSearchCount");
	}

	public ArrayList<Board> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchList", map, rowBounds);
	}


}
