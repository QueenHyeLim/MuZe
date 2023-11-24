package com.kh.muze.kakao.model.vo;

import lombok.Data;

@Data
public class ApproveResponse {
	
	private String aid; // 요청 고유번호
	private String tid; //	String	결제 고유번호, 결제 준비 API 응답에 포함	O
	private String cid; //가맹점 코드, 10자	O
	private String cid_secret; //가맹점 코드 인증키, 24자, 숫자와 영문 소문자 조합	X
	private String partner_order_id; //	String	가맹점 주문번호, 최대 100자	O
	private String partner_user_id; //	String	가맹점 회원 id, 최대 100자	O
	private String item_name; //	String	상품명, 최대 100자	O
	private String item_code; //	String	상품코드, 최대 100자	X
	private int quantity; //	Integer	상품 수량	O
	private int total_amount; //	Integer	상품 총액	O
	private int tax_free_amount; //	Integer	상품 비과세 금액	O
	//private String approval_url; //	String	결제 성공 시 redirect url, 최대 255자	O
	//private String cancel_url; //	String	결제 취소 시 redirect url, 최대 255자	O
	//private String fail_url; //	String	결제 실패 시 redirect url, 최대 255자	

	//private String pg_token; //	String	결제승인 요청을 인증하는 토큰
	//사용자 결제 수단 선택 완료 시, approval_url로 redirection해줄 때 pg_token을 query string으로 전달	O
	private String payment_method_type;
	private String created_at; //
	private String approved_at; //
	
	
}
