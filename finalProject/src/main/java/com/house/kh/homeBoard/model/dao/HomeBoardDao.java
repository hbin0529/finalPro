package com.house.kh.homeBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.house.kh.homeBoard.model.vo.HomeBoard;

@Repository
public class HomeBoardDao {
	
    public int selectListCount(SqlSessionTemplate sqlSession) {
    	return sqlSession.selectOne("homeboardMapper.selectListCount");
    }
    
    public ArrayList<HomeBoard> selectList(SqlSessionTemplate sqlSession){
    	//int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
    	//int limit = pi.getBoardLimit();
    	//RowBounds rowBounds = new RowBounds(startNo, limit); //마이바티스에 있는거
       return (ArrayList)sqlSession.selectList("homeBoardMapper.selectList"); //매개변수 3개 넣어줘야함 
    }

}
