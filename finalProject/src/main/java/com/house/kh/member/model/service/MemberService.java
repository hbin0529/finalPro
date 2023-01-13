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
	
	
	//회원가입처리
	public int insertMember(Member m) {
		int insertResult = mDao.insertMember(sqlSession, m);
		return insertResult;
	}
	
	//아이디중복검사
	public int searchIdVali(String id) {
		int searchResult = mDao.searchIdVali(sqlSession, id);
		return searchResult;
	}
	
	//닉네임중복검사
	public int searchNickVali(String nick) {
		int searchResult = mDao.searchNickVali(sqlSession, nick);
		return searchResult;
	}
	
	
	//로그인시도
	public Member searchUser(Member m) {
		Member searchUserResult = mDao.searchUser(sqlSession, m);
		return searchUserResult;
	}
	
	
	public int kakaoUserSignChk(String kakaoUserEmail) {
		int searchResult = mDao.kakaoUserSignChk(sqlSession, kakaoUserEmail);
		return searchResult;
	}
	
	
	//랜덤문구추출
	public String createComment() {
		
		String[] commentPool = {
				"1",
				"2",
				"3",
				"4",
				"5",
				};
		
		int randomInt = (int)Math.random()*commentPool.length;
		String returnComment = commentPool[randomInt];
		
		return returnComment;
	}
	
	
	
	
	
	
}
