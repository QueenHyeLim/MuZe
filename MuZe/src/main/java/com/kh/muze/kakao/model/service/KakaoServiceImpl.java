package com.kh.muze.kakao.model.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.muze.kakao.model.dao.KakaoDao;
import com.kh.muze.kakao.model.vo.ApproveResponse;
import com.kh.muze.kakao.model.vo.ReadyResponse;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class KakaoServiceImpl implements KakaoService {

	private static String SERVICE_APP_ADMIN_KEY = "d1e312a7f32f5f7b5f297a111ae6429f";
	
	private final SqlSessionTemplate sqlSession;
	
	private final KakaoDao kakaoDao;
	
	@Override
	public String goKakaoPay(String musTitle, String selectseat, int total_amount, String partner_order_id, HttpSession session) throws ParseException {
		
		String apiURL = "https://kapi.kakao.com/v1/payment/ready";
		
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", "KakaoAK " + SERVICE_APP_ADMIN_KEY);
		requestHeaders.put("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		String responseUrl = post(apiURL, requestHeaders, musTitle, selectseat, total_amount, partner_order_id);
		/*
		 try {
	            JSONParser jsonParser = new JSONParser();
	            JSONObject jsonObject = (JSONObject) jsonParser.parse(responseBody);

	            // Extract the value of "next_redirect_pc_url" from the JSON response
	            String redirectUrl = (String) jsonObject.get("next_redirect_pc_url");

	            if (redirectUrl != null) {
	                // Make an HTTP GET request to the extracted URL
	                String redirectedContent = makeHttpGetRequest(redirectUrl);
	                return /*"Content received from redirected URL:\n" +  redirectedContent;
	            } else {
	                return "Failed to extract Redirect URL";
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Handle the exception accordingly
	            return "Error processing the response";
	        }
	       */
		
	    JSONParser parser = new JSONParser();
	    JSONObject element = (JSONObject) parser.parse(responseUrl);

	    String tid = element.get("tid").toString();
	    String nextRedirectpcUrl = element.get("next_redirect_pc_url").toString();
	    String orderId = partner_order_id; // Corrected the key name

	    ReadyResponse readyResponse = new ReadyResponse();
	    readyResponse.setTid(tid);
	    readyResponse.setNextRedirectpcUrl(nextRedirectpcUrl);//(next_redirect_pc_url);
	    readyResponse.setPartnerOrderId(orderId);//(order_id); // Corrected the method name
	    System.out.println("tid >>" + readyResponse.getTid()); // Corrected the method name
	    System.out.println("들어오라서비스");
	    
	    session.setAttribute("ReadyResponse", readyResponse);
	    /*
	    int paystandby = kakaoDao.insertReady(sqlSession, readyResponse);
	    if (paystandby > 0) {
	        System.out.println("paystandby " + readyResponse.getNextRedirectpcUrl() + readyResponse.getTid());
	    }
	    */
	    return responseUrl;
	}
	
	private String post(String apiURL, Map<String, String> requestHeaders, String musTitle, String selectseat, int total_amount, String partner_order_id) {
		HttpURLConnection con = connect(apiURL);
		String postParams = "cid=TC0ONETIME" + "&partner_order_id=muzeorder" + "&partner_user_id=" + partner_order_id + "&item_name=" + musTitle + "&item_code=" + selectseat
						  + "&quantity=1" + "&total_amount=" + String.valueOf(total_amount) + "&tax_free_amount=0" 
						  + "&approval_url=http://localhost:8006/muze/payapprove" + "&fail_url=http://localhost:8006/muze/payfail" + "&cancel_url=http://localhost:8006/pay/cancel";
		try {
			con.setRequestMethod("POST");
			for(Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			con.setDoOutput(true);
			try(DataOutputStream wr = new DataOutputStream(con.getOutputStream())){
				wr.write(postParams.getBytes());
				wr.flush();
			}
			
			int responseCode = con.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				return readBody(con.getInputStream());
			} else {
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
		
	}
	
	private HttpURLConnection connect(String apiUrl) {
		URL url;
		try {
			url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}
	
	private String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		
		try (BufferedReader lineReader = new BufferedReader(streamReader)){
			StringBuilder responseBody = new StringBuilder();
			
			String line;
			while((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			//System.out.println(responseBody); //
			return responseBody.toString();
			
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
	

	
	@Override
	public String payApprove(String tid, String pgToken, String userId) {
		
		String apiURL = "https://kapi.kakao.com/v1/payment/approve";
		
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", "KakaoAK " + "d1e312a7f32f5f7b5f297a111ae6429f");
		requestHeaders.put("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		String responseUrl = postBody(apiURL, requestHeaders, tid, pgToken, userId);
		
		return responseUrl;
	}

	private String postBody(String apiURL, Map<String, String> requestHeaders, String tid, String pgToken,
			String userId) {

		HttpURLConnection con = connect(apiURL);
		String postParams = "cid=TC0ONETIME" + "&tid=" + tid + "&partner_order_id=muzeorder" + "&partner_user_id=" + userId + "&pg_token=" + pgToken;
		
		try {
			con.setRequestMethod("POST");
			for(Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			con.setDoOutput(true);
			try(DataOutputStream wr = new DataOutputStream(con.getOutputStream())){
				wr.write(postParams.getBytes());
				wr.flush();
			} 
			
			int responseCode = con.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				return readBody(con.getInputStream());
			} else {
				return readBody(con.getErrorStream());
			}

		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	@Override
	public ApproveResponse payAccess(String payApprove) throws ParseException {
		
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(payApprove);
		
		String ticketId = element.get("aid").toString();
		String userId = element.get("partner_user_id").toString();
		String payType = element.get("payment_method_type").toString();
		String showName = element.get("item_name").toString();
		String seats = element.get("item_code").toString();
		//String amount = element.get("amount").toString();
		JSONObject amount = (JSONObject)element.get("amount");
		int allPrice = Integer.parseInt(amount.get("total").toString());
		String payAprTime = element.get("created_at").toString();
		String payAccTime = element.get("approved_at").toString();
		
		ApproveResponse appResponse = new ApproveResponse();
		appResponse.setAid(ticketId);
		appResponse.setPartner_user_id(userId);
		appResponse.setPayment_method_type(payType);
		appResponse.setItem_name(showName);
		appResponse.setItem_code(seats);
		appResponse.setTotal_amount(allPrice);
		appResponse.setCreated_at(payAprTime);
		appResponse.setApproved_at(payAccTime);
		
		return appResponse;
	}
	
}
    