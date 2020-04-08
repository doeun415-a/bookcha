package com.myhome.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myhome.dao.SearchItemDAO;
import com.myhome.vo.MainSearchVO;
import com.myhome.vo.SearchItemVo;

@Service
public class SearchItemServiceImpl implements SearchItemService {
	
	@Inject
	private SearchItemDAO dao;	
	
	// 아이템검색
	@Override
	public List<SearchItemVo> searchItem(String item) throws Exception{
		return dao.searchItem(item);
	}
	
	// 아이템검색
	@Override
	public List<MainSearchVO> mainSearch(String item) throws Exception{
		return dao.mainSearch(item);
	}
}
