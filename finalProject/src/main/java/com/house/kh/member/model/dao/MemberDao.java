package com.house.kh.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int searchIdVali(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.searchIdVali", id);
	}
	
	public int searchNickVali(SqlSessionTemplate sqlSession, String nick) {
		return sqlSession.selectOne("memberMapper.searchNickVali", nick);
	}
	
	public Member searchUser(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchUser", m);
	}
	
	public Member kakaoUserSignChk(SqlSessionTemplate sqlSession, String kakaoUserEmail) {
		return sqlSession.selectOne("memberMapper.kakaoUserSignChk", kakaoUserEmail);
	}
	
	public int kakaoUserSignChkCount(SqlSessionTemplate sqlSession, String kakaoUserEmail) {
		return sqlSession.selectOne("memberMapper.kakaoUserSignChkCount", kakaoUserEmail);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int isKakao(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.isKakao", id);
	}
	
	public void deleteMem(SqlSessionTemplate sqlSession, String id) {
		sqlSession.update("memberMapper.deleteMem", id);
	}
	
}
