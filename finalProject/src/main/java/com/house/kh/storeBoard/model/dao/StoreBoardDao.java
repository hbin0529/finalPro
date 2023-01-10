package com.house.kh.storeBoard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.storeBoard.model.vo.Product;

@Repository
public class StoreBoardDao {
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeBoardMapper.selectListCount");
	}
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("storeBoardMapper.selectList");
	}
}
