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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

@RestController
public class AjaxShowController {

	@GetMapping(value="slist.sh", produces="application/json; charset=UTF-8")
	public String ajaxShowList(String shprfnm, String prfstate, Model model) throws Exception {
		
		String url = "http://www.kopis.or.kr/openApi/restful/pblprfr";
		url += "?service=" + ShowController.SERVICEYKEY;

		url += "&cpage=1";
		url += "&rows=88000";
		if(prfstate != "00") {
			url += "&prfstate=" + prfstate;
		}
		url += "&shprfnm=" + URLEncoder.encode(shprfnm, "UTF-8");
		
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
		
		return jsonStr;
	}
}
