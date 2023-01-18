package com.house.kh.interrior.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.house.kh.interrior.model.vo.Interrior;

@Repository
public class InterriorDao {
	
	public Interrior interriorInfo(SqlSession sqlSession, int selNo) {
		return sqlSession.selectOne("interriorMapper.interriorInfo", selNo);
	}
	
	
	
}
