package com.kh.muze.show.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.muze.show.model.service.ShowService;

@Controller
public class ShowController {

//	@Autowired
//	private ShowService showService;
	
	public static final String SERVICEYKEY = "2ae027dcffd947cd81fbfc2094402bd8";
	
	@RequestMapping(value="list.sh", produces="application/json; charset=UTF-8")
	public String showList() {
		String url = "http://www.kopis.or.kr/openApi/restful/pblprfr";
		url += "?service=" + SERVICEYKEY;
		return "show/showListView";
	}
}
