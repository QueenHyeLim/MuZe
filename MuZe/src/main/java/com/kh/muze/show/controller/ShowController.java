package com.kh.muze.show.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

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
	@RequestMapping(value="slist.sh", produces="text/html; charset=UTF-8")
	public String showList(String shprfnm, Model model) throws Exception {
		
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
		url += "&shprfnm=" + URLEncoder.encode(shprfnm, "UTF-8");
		
		System.out.println(url);
		System.out.println(shprfnm);
		
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
		
//		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
//		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
//		Document doc = dBuilder.parse(url);
//		
//		doc.getDocumentElement().normalize();
//		
//		NodeList nList = doc.getElementsByTagName("db");
//		
//		for(int i = 0; i < nList.getLength(); i++) {
//			Node nNode = nList.item(i);
//			
//			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
//				Element eElement = (Element)nNode;
//				model.addAttribute("prfnm", getTagValue("prfnm", eElement));
//				model.addAttribute("prfpdfrom", getTagValue("prfpdfrom", eElement));
//				model.addAttribute("prfpdto", getTagValue("prfpdto", eElement));
//				model.addAttribute("fcltynm", getTagValue("fcltynm", eElement));
//				model.addAttribute("poster", getTagValue("poster", eElement));
//				model.addAttribute("genrenm", getTagValue("genrenm", eElement));
//			}
//		}
		
		return responseText;
	}
	
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
}
