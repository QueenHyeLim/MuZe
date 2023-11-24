package com.kh.muze.kakao.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ReadyResponse {
	
	private String tid; //String	결제 고유번호, 결제 준비 API 응답에 포함	O
	private String nextRedirectpcUrl; //
	private String partnerOrderId; //	String	가맹점 주문번호, 최대 100자	O

}
