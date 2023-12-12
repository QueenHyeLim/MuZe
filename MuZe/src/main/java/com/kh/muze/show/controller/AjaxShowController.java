package com.kh.muze.show.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AjaxShowController {

	@GetMapping(value="slist.sh", produces="application/json; charset=UTF-8")
	public String ajaxShowList(String shprfnm, String prfstate, Model model) throws Exception {
		
		StringBuilder stringBuilder = new StringBuilder();
		
		stringBuilder.append("http://www.kopis.or.kr/openApi/restful/pblprfr")
					 .append("?service=")
					 .append(ShowController.SERVICEYKEY)
					 .append("&cpage=1")
					 .append("&rows=88000")
					 .append("&shprfnm=")
					 .append(URLEncoder.encode(shprfnm, "UTF-8"))
					 .append("&prfstate=")
					 .append(prfstate);
		
		String url = stringBuilder.toString();
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
	
		JSONObject xmlToJson = XML.toJSONObject(responseText);
		String jsonStr = xmlToJson.toString();
		
		br.close();
		urlConnection.disconnect();
		
		return jsonStr;
	}
}
