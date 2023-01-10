package com.house.kh.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.member.model.dao.MemberDao;
import com.house.kh.member.model.vo.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int insertMember(Member m) {
		
		int insertResult = mDao.insertMember(sqlSession, m);
		
		return insertResult;
	}
	
	
	
}
