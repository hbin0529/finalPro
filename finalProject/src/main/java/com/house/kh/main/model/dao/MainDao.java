package com.house.kh.main.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.common.model.vo.PageInfo;
import com.house.kh.main.model.vo.Main;
import com.house.kh.storeBoard.model.vo.Product;

@Repository
public class MainDao {
	
	// 카테고리별 조회수 TOP1
	public ArrayList<Main> topStoreBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.topStoreBoardList");
	}
	
	// 집들이 조회수 TOP3
	public ArrayList<Main> topStoreBoardList2(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.topStoreBoardList2");
	}
	
	// 전체 상품 조회수 TOP3
	public ArrayList<Main> topStoreBoardList3(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.topStoreBoardList3");
	}
	
	// 전체 상품 리스트 
	public ArrayList<Main> topStoreBoardList4(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.topStoreBoardList4");
	}
	
}
