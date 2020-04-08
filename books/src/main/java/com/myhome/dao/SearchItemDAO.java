package com.myhome.dao;

import java.util.ArrayList;
import java.util.List;

import com.myhome.vo.MainSearchVO;
import com.myhome.vo.SearchItemVo;

public interface SearchItemDAO {
	// 아이템검색
	public List<SearchItemVo> searchItem(String item);
	
	// 재료검색
	public List<MainSearchVO> mainSearch(String item);
} 
