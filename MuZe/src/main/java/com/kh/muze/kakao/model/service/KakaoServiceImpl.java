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

import org.springframework.stereotype.Service;

@Service
public class KakaoServiceImpl implements KakaoService {

	private static String SERVICE_APP_ADMIN_KEY = "d1e312a7f32f5f7b5f297a111ae6429f";
	
	@Override
	public String goKakaoPay(String musTitle, String selectseat, int total_amount, String partner_order_id) {
		
		String apiURL = "https://kapi.kakao.com/v1/payment/ready";
		
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", "KakaoAK " + "d1e312a7f32f5f7b5f297a111ae6429f");
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
	       return responseUrl;
	}
	
	private String post(String apiURL, Map<String, String> requestHeaders, String musTitle, String selectseat, int total_amount, String partner_order_id) {
		HttpURLConnection con = connect(apiURL);
		String postParams = "cid=TC0ONETIME" + "&partner_order_id=muzeorder" + "&partner_user_id=" + partner_order_id + "&item_name=" + musTitle + "&item_code=" + selectseat
						  + "&quantity=1" + "&total_amount=" + String.valueOf(total_amount) + "&tax_free_amount=0" 
						  + "&approval_url=http://localhost:8006" + "&fail_url=http://localhost:8006" + "&cancel_url=http://localhost:8006";
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
	
	/*
	private static String makeHttpGetRequest(String url) throws IOException {
        StringBuilder response = new StringBuilder();

        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setRequestMethod("GET");

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
        } finally {
            connection.disconnect();
        }

        return response.toString();
    }
    */
}
    