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
	
	
	
	
	
	
	
}
