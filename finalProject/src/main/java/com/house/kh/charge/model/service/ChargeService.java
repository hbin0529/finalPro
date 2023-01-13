package com.house.kh.charge.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.kh.charge.model.dao.ChargeDao;
import com.house.kh.charge.model.vo.Charge;

@Service
public class ChargeService {
	
	@Autowired
	private ChargeDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int pointCharge(Charge c) {
		int pointCharge = cDao.pointCharge(sqlSession, c);
		return pointCharge;
	}

	public int pointUpdate(Charge c) {
		int chargePoint = c.getChargeAmount();
		int pointUpdate = cDao.pointUpdate(sqlSession, c);
		return pointUpdate;
	}
	
}
