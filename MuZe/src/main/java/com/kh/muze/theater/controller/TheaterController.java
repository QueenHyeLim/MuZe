package com.kh.muze.theater.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.muze.show.controller.ShowController;
import com.kh.muze.show.model.vo.Show;

@Controller
public class TheaterController {

	@RequestMapping("list.th")
	public String list() {
		return "theater/theaterListView";
	}
	
	// 공연장 목록 불러오기
	@ResponseBody
	@RequestMapping(value="rlist.th", produces="application/json; charset=UTF-8")
	public String theaterList(String shprfnmfct, Model model) throws Exception {
		String url = "https://www.kopis.or.kr/openApi/restful/prfplc";
		url += "?service=" + ShowController.SERVICEYKEY;
		url += "&cpage=1";
		url += "&rows=2800";
		url += "&shprfnmfct=" + URLEncoder.encode(shprfnmfct, "UTF-8");
		
//		System.out.println(url);
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));	
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		
		doc.getDocumentElement().normalize();
		
		NodeList nList = doc.getElementsByTagName("db");
		
		JSONObject xmlToJson = XML.toJSONObject(responseText);
		String jsonStr = xmlToJson.toString();
		br.close();
		urlConnection.disconnect();
		
		// json에 저장 후 필요한 수만큼 가져오기
		return jsonStr;
	}
	
	// 공연장 상세정보 불러오기
	@RequestMapping(value="theatermap", produces="text/html; charset=UTF-8")
	public String theatermap(String mt10id, Model model) throws IOException, Exception {
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
		
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		
		doc.getDocumentElement().normalize();
		
		NodeList nList = doc.getElementsByTagName("db");
		
		for(int i = 0; i < nList.getLength(); i++) {
			Node nNode = nList.item(i);
			
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				Element eElement = (Element)nNode;
				
				model.addAttribute("fcltynm", getTagValue("fcltynm", eElement)); // 공연시설명
				model.addAttribute("mt13cnt", getTagValue("mt13cnt", eElement)); // 공연장 수
				model.addAttribute("opende", getTagValue("opende", eElement)); // 개관연도
				model.addAttribute("seatscale", getTagValue("seatscale", eElement)); // 객석 수
				model.addAttribute("telno", getTagValue("telno", eElement)); // 전화번호
				model.addAttribute("relateurl", getTagValue("relateurl", eElement)); // 홈페이지
				model.addAttribute("adres", getTagValue("adres", eElement)); // 주소
				model.addAttribute("la", getTagValue("la", eElement)); // 위도
				model.addAttribute("lo", getTagValue("lo", eElement)); // 경도
				model.addAttribute("fcltychartr", getTagValue("fcltychartr", eElement)); // 시설 특성
			}
		}
		
		return "theater/theaterMapView";
		
	}

	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
	
	
}
