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
	
	// 카테고리별 조회수 TOP1
	public ArrayList<Test> topStoreBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("testMapper.topStoreBoardList");
	}
	
	// 집들이 조회수 TOP3
	public ArrayList<Test> topStoreBoardList2(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("testMapper.topStoreBoardList2");
	}
	
	// 전체 상품 조회수 TOP3
	public ArrayList<Test> topStoreBoardList3(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("testMapper.topStoreBoardList3");
	}
	
	// 전체 상품 리스트 
	public ArrayList<Test> topStoreBoardList4(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("testMapper.topStoreBoardList4");
	}
	
}
