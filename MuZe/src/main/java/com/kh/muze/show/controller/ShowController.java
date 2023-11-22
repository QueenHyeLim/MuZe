package com.kh.muze.show.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

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

@Controller
public class ShowController {

//	@Autowired
//	private ShowService showService;
	
	public static final String SERVICEYKEY = "2ae027dcffd947cd81fbfc2094402bd8";
	
	@RequestMapping("list.sh")
	public String list() {
		return "show/showListView";
	}
	
	@ResponseBody
	@RequestMapping(value="slist.sh", produces="application/json; charset=UTF-8")
	public String showList(String shprfnm, String prfstate, Model model) throws Exception {
		
		String url = "http://www.kopis.or.kr/openApi/restful/pblprfr";
		url += "?service=" + SERVICEYKEY;

		url += "&cpage=1";
		url += "&rows=88000";
		if(prfstate != "00") {
			url += "&prfstate=" + prfstate;
		}
		url += "&shprfnm=" + URLEncoder.encode(shprfnm, "UTF-8");
		
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
		
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		
		doc.getDocumentElement().normalize();
		
		NodeList nList = doc.getElementsByTagName("db");
	
		JSONObject xmlToJson = XML.toJSONObject(responseText);
		String jsonStr = xmlToJson.toString();
		
		br.close();
		urlConnection.disconnect();
		
		//System.out.println(jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping(value="detail.sh", produces="text/html; charset=UTF-8")
	public String showDetail(String mt20id, Model model) throws Exception {
		String url = "http://kopis.or.kr/openApi/restful/pblprfr/";
		       url += mt20id;
		       url += "?service=" + SERVICEYKEY;
		
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
		
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		
		doc.getDocumentElement().normalize();
		
		NodeList nList = doc.getElementsByTagName("db");
		
		for(int i = 0; i < nList.getLength(); i++) {
			Node nNode = nList.item(i);
			
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				Element eElement = (Element)nNode;
				model.addAttribute("prfnm", getTagValue("prfnm", eElement)); // 공연명
				model.addAttribute("prfpdfrom", getTagValue("prfpdfrom", eElement)); // 시작일
				model.addAttribute("prfpdto", getTagValue("prfpdto", eElement)); // 종료일
				model.addAttribute("fcltynm", getTagValue("fcltynm", eElement)); // 시설명
				model.addAttribute("prfcast", getTagValue("prfcast", eElement)); // 출연진
				model.addAttribute("prfcrew", getTagValue("prfcrew", eElement)); // 제작자
				model.addAttribute("prfruntime", getTagValue("prfruntime", eElement)); // 런타임
				model.addAttribute("prfage", getTagValue("prfage", eElement)); // 관람연령
				model.addAttribute("entrpsnm", getTagValue("entrpsnm", eElement)); // 제작사
				model.addAttribute("pcseguidance", getTagValue("pcseguidance", eElement)); // 티켓값
				model.addAttribute("poster", getTagValue("poster", eElement)); // 포스터
				model.addAttribute("sty", getTagValue("sty", eElement)); // 줄거리
				model.addAttribute("styurl", getTagValue("styurl", eElement)); // 세부 이미지
				model.addAttribute("dtguidance", getTagValue("dtguidance", eElement)); // 공연일정
				model.addAttribute("genrenm", getTagValue("genrenm", eElement)); // 장르
				model.addAttribute("mt20id", getTagValue("mt20id", eElement)); // 작품ID
				
			}
		}
		
		return "show/showDetailView";
	}
	
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
}
