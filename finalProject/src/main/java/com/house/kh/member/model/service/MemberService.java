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
				"\"주먹은 법보다 빠르다\"-강지민-",
				"\"뭉치면 죽고 흩어지면 산다\"-이것도 강지민-",
				"\"일찍 일어나는 지렁이가 잡아먹히는거야\"-강지민-",
				"\"티끌은 모아봤자 티끌이다 \"-강지민-",
				"\"아프리카 청춘이다 \"-강지민(틀)-",
				"\"정환아 도와줘 \"-안효빈-",
				"\"자바 두명 타요\"",
				"\"오늘 점심도 구내식당이네...\"",
				"\"콘솔창에 오류메시지가 안뜨네..\"",
				"\"오늘은 꼭 집가서 해야겠다\"",
				"\"왜 값이 안넘어가는거야...\""
				};
		
		int randomInt = (int)(Math.random()*commentPool.length);
		System.out.println("randomInt는"+randomInt);
		String returnComment = commentPool[randomInt];
		return returnComment;
	}
	
	
	
	
	
	
}
