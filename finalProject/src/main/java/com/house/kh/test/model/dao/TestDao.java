package com.house.kh.test.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.common.model.vo.PageInfo;
import com.house.kh.storeBoard.model.vo.Product;
import com.house.kh.test.model.vo.Test;

@Repository
public class TestDao {
	
	public ArrayList<Test> topStoreBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("testMapper.topStoreBoardList");
	}
	
}
