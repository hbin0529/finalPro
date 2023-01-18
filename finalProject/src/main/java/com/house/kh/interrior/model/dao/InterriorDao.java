package com.house.kh.interrior.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.house.kh.interrior.model.vo.Interrior;

@Repository
public class InterriorDao {
	
	public ArrayList<Interrior> interriorInfo(SqlSession sqlSession, int selNo) {
		return (ArrayList)sqlSession.selectList("interriorMapper.interriorInfo", selNo);
	}
	
	public int insertInterrior(SqlSession sqlSession, Interrior i) {
		return sqlSession.insert("interriorMapper.insertInterrior", i);
	}
		
	public int increaseCount(SqlSession sqlSession, int interNo) {
		return sqlSession.insert("interriorMapper.increaseCount", interNo);
	}
	
	public Interrior selectInterrior(SqlSession sqlSession, int interNo) {
		return sqlSession.selectOne("interriorMapper.selectInterrior", interNo);
	}

	
}
