package com.house.kh.charge.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.charge.model.vo.Charge;

@Repository
public class ChargeDao {

	public int pointCharge(SqlSessionTemplate sqlSession, Charge c) {
		return sqlSession.insert("chargeMapper.pointCharge", c);
	}

	public int pointUpdate(SqlSessionTemplate sqlSession, Charge c) {
		return sqlSession.update("chargeMapper.pointUpdate", c);
	}
}
