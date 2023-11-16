package com.kh.muze.show.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShowController {

//	@Autowired
//	private ShowService showService;
	
	public static final String SERVICEYKEY = "2ae027dcffd947cd81fbfc2094402bd8";
	
	@RequestMapping(value="list.sh", produces="application/json; charset=UTF-8")
	public String showList(String shprfnm) throws Exception {
		
		Calendar calendar = new GregorianCalendar();
		calendar.add(Calendar.DATE, -1);
		String yesterday = new SimpleDateFormat("yyyyMMdd").format(calendar.getTime());
		//System.out.println(yesterday + " => 어제");
		
		String url = "http://www.kopis.or.kr/openApi/restful/pblprfr";
		url += "?service=" + SERVICEYKEY;
		url += "&stdate=" + yesterday;
		url += "&eddate="  + yesterday;
		url += "&cpage=1";
		url += "&rows=10";
		url += "&prfstate=02";
		url += "$shprfnm=" + shprfnm;
		
		System.out.println(url);
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
//		return responseText;
		return "show/showListView";
	}
}
