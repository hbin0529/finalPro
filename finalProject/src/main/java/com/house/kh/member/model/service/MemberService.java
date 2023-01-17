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
	
	
	public Member kakaoUserSignChk(String kakaoUserEmail) {
		Member searchResult = mDao.kakaoUserSignChk(sqlSession, kakaoUserEmail);
		return searchResult;
	}
	public int kakaoUserSignChkCount(String kakaoUserEmail) {
		int searchResult = mDao.kakaoUserSignChkCount(sqlSession, kakaoUserEmail);
		return searchResult;
	}
	
	
	//랜덤문구추출
	public String createComment() {
		
		String[] commentPool = {
				"\"주먹은 법보다 빠르다\"-강지민-",
				"\"뭉치면 죽고 흩어지면 산다\"-강지민-",
				"\"일찍 일어나는 지렁이가 잡아먹히는거야\"-강지민-",
				"\"티끌은 모아봤자 티끌이다 \"-강지민-",
				"\"지나친 걱정은 몸과 마음을 해칠 뿐이야\"",
				"\"정환아 도와줘 \"-안효빈-",
				"\"자바 두명 타요\"",
				"\"오늘 점심도 구내식당이네...\"",
				"\"콘솔창에 오류메시지가 안뜨네..\"",
				"\"오늘은 꼭 집가서 해야겠다\"",
				"\"웹소켓도 해야하는데...\"",
				"\"커피가 약빨이 다됐다\"",
				"\"원하는 대로 끄적이다 보면<br>바라는 대로 이루어질거야\"",
				"\"아주 갑작스럽게,<br>혹은 아주 자연스럽게\"",
				"\"왜 값이 안넘어가는거야...\"",
				"쟤 또한 지나가리라<br>-정한나-",
				"\"내가 쟤 보단 낫지\"의 쟤를 맡고있습니다<br>-강지민-",
				"\"낮말은 새가 듣고<br> 밥 말은 국밥 먹고싶다..\"<br>-정한나-",
				"아니<br>인스타 감성문구<br>넣으려고했는데.."
				};
		
		int randomInt = (int)(Math.random()*commentPool.length);
		String returnComment = commentPool[randomInt];
		return returnComment;
	}
	
	
	public int updateMember(Member m) {
		int updateMemberResult = mDao.updateMember(sqlSession, m);
		return updateMemberResult;
	}
	
	
	public boolean isKakao(String id) {
		int isKakaoResult = mDao.isKakao(sqlSession, id);
		if(isKakaoResult > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	public void deleteMem(String id) {
		mDao.deleteMem(sqlSession, id);
	}
	
	
}
