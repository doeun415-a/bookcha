package com.myhome.pinball;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.myhome.dao.SearchItemDAO;
import com.myhome.service.SearchItemService;
import com.myhome.vo.MainSearchVO;
import com.myhome.vo.SearchItemVo;
import com.mysql.cj.x.json.JsonArray;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	SearchItemService service;
	
	@Autowired
	SearchItemDAO dao;
	
	@GetMapping("/")
	public String home(Model model) {
		// model.addAttribute("serverTime", dao.getTime());
		return "home";
	}

	@RequestMapping(value = "/autocomplete", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public void AutoTest(Locale locale, Model model, HttpServletRequest request, HttpServletResponse resp, SearchItemVo searchItemVo)
			throws IOException {
	
		String result = request.getParameter("term");
		List<SearchItemVo> list = dao.searchItem(result); // result값이 포함되어 있는 emp테이블의 네임을 리턴

		JSONArray ja = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			ja.add(list.get(i).getPlace());
		}

		PrintWriter out = resp.getWriter();

		out.print(ja.toString());

	}
	
	
	@RequestMapping(value = "/mainSearch",  method = RequestMethod.POST)
	public @ResponseBody ArrayList mainSearch(HttpServletRequest request)
			throws Exception {
		
		String item = request.getParameter("item");
		ArrayList list = (ArrayList)dao.mainSearch(item);
		
		return list;

	}
	
	


}
