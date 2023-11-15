package com.kh.muze.theater.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.muze.show.controller.ShowController;

@Controller
public class TheaterController {

	@RequestMapping("list.th")
	public String list() {
		return "theater/theaterListView";
	}
	
	// 공연 목록 불러오기
	@ResponseBody
	@RequestMapping(value="rlist.th", produces="text/html; charset=UTF-8")
	public String theaterList(String shprfnmfct) throws Exception {
		String url = "https://www.kopis.or.kr/openApi/restful/prfplc";
		url += "?service=" + ShowController.SERVICEYKEY;
		url += "&cpage=1";
		url += "&rows=10";
		url += "&shprfnmfct=" + URLEncoder.encode(shprfnmfct, "UTF-8");
		
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
		
		return responseText;
	}
	
	// 공연 상세정보 불러오기
	@RequestMapping("theatermap")
	public String theatermap(String mt10id) throws IOException {
		String url = "http://kopis.or.kr/openApi/restful/prfplc/";
		url += mt10id;
		url += "?service=" + ShowController.SERVICEYKEY;
		
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
		
		return responseText;
		
	}
}
