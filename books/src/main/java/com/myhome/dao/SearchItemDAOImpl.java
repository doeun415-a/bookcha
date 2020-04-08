package com.myhome.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myhome.vo.MainSearchVO;
import com.myhome.vo.SearchItemVo;

@Repository
public class SearchItemDAOImpl implements SearchItemDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 아이템검색
	@Override
	public List<SearchItemVo> searchItem(String item){
		return sqlSession.selectList("searchMapper.getSearchItem", item);
	}
	
	// 재료
	@Override
	public List<MainSearchVO> mainSearch(String item){
		return sqlSession.selectList("searchMapper.getMainSearch", item);
	}
}
