package com.house.kh.interrior.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.homeBoard.model.vo.HomeBoard;
import com.house.kh.interrior.model.dao.InterriorDao;
import com.house.kh.interrior.model.vo.Interrior;
import com.house.kh.member.model.dao.MemberDao;


@Service
public class InterriorService {
	
	@Autowired
	private InterriorDao iDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public ArrayList<Interrior> interriorInfo(int selNo) {
		
		ArrayList<Interrior> interriorInfo = iDao.interriorInfo(sqlSession, selNo);
		
		return interriorInfo;
	}
	

	public int insertInterrior(Interrior i) { 
		return iDao.insertInterrior(sqlSession, i); 
	}
	
	
}
