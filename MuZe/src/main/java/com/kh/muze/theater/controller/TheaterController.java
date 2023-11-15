package com.kh.muze.theater.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

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
		
		//System.out.println(url);
		
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
	@RequestMapping(value="theatermap", produces="text/html; charset=UTF-8")
	public String theatermap(String mt10id, Model model) throws IOException, Exception {
		String url = "http://kopis.or.kr/openApi/restful/prfplc/";
		url += mt10id;
		url += "?service=" + ShowController.SERVICEYKEY;
		
		//System.out.println(url);
		
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
		
		//System.out.println(responseText);
		
		
		return "theater/theaterMapView";
		
	}
	
	
}
