package com.myhome.service;

import java.util.ArrayList;
import java.util.List;

import com.myhome.vo.MainSearchVO;
import com.myhome.vo.SearchItemVo;

public interface SearchItemService {
	// 아이템검색
	public List<SearchItemVo> searchItem(String item) throws Exception;

	// 재료
	public List<MainSearchVO> mainSearch(String item) throws Exception;	
}
