<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUZE 결제페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Bootstrap CSS 및 JavaScript 로드 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<style>
    .wrapper{
        width : 1302px;
        height : 1000px;
        
    }

    .reservation-header{
        height : 100%;
        width : 60%;
        float : left;
    }

    .checkedseat-info{
        width : 100%;
        height : 15%;
        background-color: lavender;
    }

    .checkedseat-info > div{
       
        font-size: 20px;
    }
    
    h3{
    	color : #fff;
    }
    .mus-title, .select-date, .selected-seat-list{
        width : 100%;
        height : 20%;
    }
    .payments{
        width : 100%;
        height : 30%;
        background-color: grey;
        border-radius: 15px;
        font-size: 25px;
        
    }

    .payments-list, .payments-detail{
        width : 100%;
        height : 40%;
    }

    .reservation-result{
        height : 100%;
        width : 35%;
        float : left;
    }

    .summary{
        width : 100%;
        height : 20%;
    }

    .total-price{
        width : 100%;
        background-color: rgb(112, 146, 190);
        font-size: 20px;
    }

    .payment-selected{
        width : 100%;
        background-color: rgb(112, 146, 190);
        font-size: 20px;
    }

    .pay-price{
        width : 100%;
        height : 30%;
    }

    .form-check-inline{
        padding : 15px;
    }

    .payment-agree{
        margin-top: 15px;
        font-size: 1.75rem;
        color : #fff;
    }

    input[type=checkbox] {

        zoom: 1.5;

    }

    #all-agree{
        font-size: 1.75rem;
        /*padding : 5px;*/
        /*padding-top: 20px;*/
    }

    #allagree{
        font-size: 100px;
    }

    .payment-terms > div {
        background-color: lavender;
        font-size: 20px;
    }

   

    #finanace-agree, #personal-agree, #cancel-agree{
        text-align: right;
        float: right;
    }
    #paybtn{
        margin-top: 10px;
    }

    #musposter{
        width : 100px;
        height : 100px;
        margin-top: 10px;
        margin-left : 10px;
        display : block;
        float : left;
    }
	
	.mus-po{
		width : 30%;
		margin : 0;
		height : 15%;
		float : left;
	}
    .mus-information{
    	width : 70%;
        height : 15%;
        float : right;
    }
    .mus-area{

        width : 100%;
        height : 100%;
    }


</style>
</head>
<body>
<jsp:include page="../common/navibar.jsp" />
	<div class="page" id="content">
	<div id="blank-area"></div>
	 	<div class="page" id="d">
		    <div class="wrapper">
		        <div class="reservation-header">
		            <h3>예매정보</h3>
		            <div class="checkedseat-info">
		                <div class="mus-area">
		                	<div class="mus-po">
			                    <img id="musposter" src="${ musInfo.poster }" alt="">
		                	
		                	</div>
		                    <div class="mus-information">
		                        <p>${ musInfo.musTitle }</p>
		                        <p>${ selectdate }</p>
		                        <p>${ selectseat }</p>
		                    </div>
		                    
		                </div>
		            </div>
		            <h3>결제수단</h3>
		            <div class="payments">
		                <div class="payments-list">
		                    <div class="form-check-inline">
		                        <label class="form-check-label" for="card">
		                        <input type="radio" class="form-check-input" id="card" name="payments" value="card">신용카드
		                        </label>
		                    </div>
		                    <div class="form-check-inline">
		                        <label class="form-check-label" for="cellphone">
		                        <input type="radio" class="form-check-input" id="cellphone" name="payments" value="cellphone">휴대폰결제
		                        </label>
		                    </div>
		                    <div class="form-check-inline">
		                        <label class="form-check-label" for="fastpay">
		                        <input type="radio" class="form-check-input" id="fastpay" name="payments" value="fastpay" checked>간편결제
		                        </label>
		                    </div>
		                    <div class="form-check-inline">
		                        <label class="form-check-label" for="bank">
		                        <input type="radio" class="form-check-input" id="bank" name="payments" value="bank">무통장입금
		                        </label>
		                    </div>
		                </div>
		                <hr>
		                <div class="payments-detail">
		                    <div class="form-check-inline">
		                        <label class="form-check-label" for="kakaopay">
		                        <input type="radio" class="form-check-input" id="kakaopay" name="pay" value="kakaopay" checked>카카오페이
		                        </label>
		                    </div>
		                    <div class="form-check-inline">
		                        <label class="form-check-label" for="npay">
		                        <input type="radio" class="form-check-input" id="npay" name="pay" value="npay">네이버페이
		                        </label>
		                    </div>
		                    <div class="form-check-inline">
		                        <label class="form-check-label" for="tosspay">
		                        <input type="radio" class="form-check-input" id="tosspay" name="pay" value="tosspay">토스페이
		                        </label>
		                    </div>
		                    <div class="form-check-inline">
		                        <label class="form-check-label" for="payco">
		                        <input type="radio" class="form-check-input" id="payco" name="pay" value="payco">페이코
		                        </label>
		                    </div>
		                </div>
		            </div>
		            
		            <div class="payment-agree">
		                <input type="checkbox" name="payagree" id="payagree"><span id="allaree" for="payagree">결제대행 서비스 및 이용약관 동의</span>
		            </div>
		            <div class="payment-terms">
		                <div class="terms_1">전자 금융거래 이용에 동의합니다. <button type="button" id="finanace-agree" class="btn btn-primary">약관보기</button></div>
		                <div class="terms_2">개인정보 수집 및 이용에 동의합니다. <button type="button" id="personal-agree" class="btn btn-primary">약관보기</button></div>
		                <div class="terms_3">취소 수수료 및 취소기한을 확인하였으며 이에 동의합니다. <button type="button" id="cancel-agree" class="btn btn-primary">약관보기</button></div>
		            </div>
		        </div>
		        <div class="reservation-result">
		            <div class="summary">
		
		            </div>
		
		            <!-- <form action="kakao/kakaoPay"> -->
		                <div class="total-price">
		                    최종 결제금액
		                    <div class="pay-price">
		                        ${ totalPrice }<strong>원</strong>
		                    </div>
		                </div>
		                <hr>
		                <div class="payment-selected">
		                    결제수단
		                    <strong id="payment-conf">카카오페이</strong>
		                </div>
		                <input type="hidden" name="musTitle" value="${ musInfo.musTitle }">
		                <input type="hidden" name="selectdate" value="${ selectdate }">
		                <input type="hidden" name="selectseat" value="${ selectseat }">
		                <input type="hidden" name="totalPrice" value="${ totalPrice }">
		               <!--  <button type="submit" id="paybtn1">결제하기</button> --><!--  /*onclick="return payment();" */ -->
		            <!--</form>  -->
		                <button type="submit" id="paybtn" onclick="return payment();" disabled>결제하기</button>	<!--  /*onclick="return payment();" */ -->
		        </div>
		        
		        <!-- 전자 금융거래 이용 약관 모달 코드 -->
                <div class="modal" tabindex="-1" role="dialog" id="finance-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">전자 금융 거래 이용 약관</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!-- 모달 내용 -->
                                <p>
                                <strong>제1조 (목적)</strong><br/>
								본 약관은 MUZE 금융서비스 주식회사(이하 "회사"라 함)가 제공하는 전자금융거래 서비스(이하 "서비스"라 함)를 이용함에 있어 이용자와 회사 간의 권리, 의무, 책임사항, 기타 필요한 사항을 정하는 것을 목적으로 합니다.
								<br/>
								<strong>제2조 (이용자 자격)</strong><br/>
								회사의 서비스를 이용하기 위해서는 이용자는 본 약관에 동의하여야 하며, 기타 회사가 요구하는 신청서 및 정보를 제출하여야 합니다.
								회사는 이용자가 본 약관에 동의하고, 필요한 정보를 제출한 경우에 한해 서비스 이용을 승낙합니다.
								<br/>
								<strong>제3조 (서비스의 내용 및 범위)</strong><br/>
								회사의 전자금융거래 서비스는 계좌 조회, 자금 이체, 결제 서비스 등을 포함하며, 정확한 서비스 내용은 회사의 안내에 따릅니다.
								서비스의 범위 및 내용은 회사의 정책에 따라 변경될 수 있습니다.
								<br/>
								<strong>제4조 (이용료 및 수수료)</strong><br/>
								회사의 서비스 이용에 따른 이용료, 수수료는 회사의 정책에 따라 적용되며, 고객은 서비스 이용 전에 해당 내용을 확인하여야 합니다.
								이용료 및 수수료의 변경은 회사의 통지 후 적용됩니다.
								<br/>
								<strong>제5조 (이용자의 권리와 의무)</strong><br/>
								이용자는 회사가 제공하는 서비스를 이용할 권리가 있으며, 이용자의 권리는 회사의 정책에 따라 제한될 수 있습니다.
								이용자는 서비스를 이용함에 있어 관계법령, 본 약관 및 회사의 정책을 준수하여야 하며, 타인의 권리를 침해해서는 안 됩니다.
								<br/>
								<strong>제6조 (계좌 보안 및 개인정보)</strong><br/>
								이용자는 자신의 계좌 정보와 개인정보를 적절히 관리하여야 합니다.
								회사는 이용자의 계좌 정보와 개인정보를 안전하게 보호하기 위해 최선을 다하며, 관련법령에 따라 처리합니다.
								<br/>
								<strong>제7조 (서비스 이용의 제한과 해제)</strong><br/>
								이용자가 본 약관 또는 회사의 정책을 위반할 경우, 회사는 해당 이용자의 서비스 이용을 제한할 수 있습니다.
								제한된 이용자는 회사의 정책에 따라 해제를 신청할 수 있습니다.
								<br/>
								<strong>제8조 (책임 및 면책사항)</strong><br/>
								회사는 불가항력적인 사유로 인한 서비스 중단, 제공의 지연, 정보 손실 등에 대해 책임을 지지 않습니다.
								이용자가 서비스 이용으로 발생하는 손실이 정당한 경우에 한해 회사가 책임을 집니다.
								<br/>
								<strong>제9조 (분쟁 해결)</strong><br/>
								서비스 이용에 관한 분쟁이 발생할 경우, 이용자는 회사와 협의하여 해결하고자 노력해야 합니다.
								협의 불가능한 경우, 관련법령 및 회사의 정책에 따라 분쟁을 해결할 수 있습니다.
								<br/>
								<strong>제10조 (약관의 변경)</strong><br/>
								회사는 필요한 경우 본 약관을 변경할 수 있으며, 변경된 약관은 회사의 웹사이트나 앱을 통해 고지됩니다.
								변경된 약관에 대한 이용자의 동의는 회사의 안내에 따라 진행됩니다.
							</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
		        
		        <!-- 개인정보 수집 및 이용 약관 모달 코드 -->
                <div class="modal" tabindex="-1" role="dialog" id="personal-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">개인정보 수집 이용 약관</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!-- 모달 내용 -->
                                <p>
                                <strong>1. 수집하는 개인정보 항목</strong><br/>
								회사는 다음과 같은 개인정보 항목을 수집할 수 있습니다.
								<br/>
								필수 항목: 성명, 연락처, 이메일 주소
								<br/>
								선택 항목: 주소, 생년월일, 성별
								<br/>
								<strong>2. 개인정보의 수집 및 이용 목적</strong><br/>
								회사는 수집한 개인정보를 다음과 같은 목적으로 이용합니다.
								<br/>
								서비스 제공: 사용자에게 제공하는 서비스의 제공 및 운영
								<br/>
								문의 및 상담 응대: 사용자의 문의 또는 상담에 대한 응대
								<br/>
								마케팅 및 홍보: 새로운 서비스나 이벤트 정보의 전달
								<br/>
								<strong>3. 개인정보의 보유 및 이용 기간</strong><br/>
								회사는 수집한 개인정보를 수집 및 이용목적이 달성된 후에는 즉시 파기하거나, 보관 기간이 종료된 경우 해당 정보를 안전하게 삭제합니다.
								<br/>
								<strong>4. 개인정보의 제3자 제공</strong><br/>
								회사는 사용자 동의 없이 제3자에게 개인정보를 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
								<br/>
								법령의 규정에 따른 경우<br/>
								사용자의 동의를 받은 경우<br/>
								
								<strong>5. 개인정보의 안전성 확보 조치</strong><br/>
								회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취합니다.<br/>
								
								개인정보 암호화<br/>
								접근 제한<br/>
								보안 프로그램 설치 및 운영<br/>
								
								<strong>6. 이용자의 권리와 행사 방법</strong><br/>
								이용자는 자신의 개인정보에 대해 언제든지 열람, 정정, 삭제를 요청할 수 있습니다. 이와 관련된 서면, 전자우편 등의 방법으로 연락하면 빠르게 조치하겠습니다.
								<br/>
								
								<strong>7. 개인정보 보호책임자</strong><br/>
								회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 이용자의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
								<br/>
								성명: 손혜림<br/>
								연락처: 010-1113-1213<br/>
								이메일: hyeimson703@gmail.com
							</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
		        
		        <!-- 취소 수수료 및 취소 약관 모달 코드 -->
                <div class="modal" tabindex="-1" role="dialog" id="cancel-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">취소 수수료 및 취소 약관</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!-- 모달 내용 -->
                                <p>
								<strong>1. 예매 취소 시 수수료 정책</strong><br/>
								
								1.1 공연 예매 취소 시 수수료는 아래와 같이 적용됩니다.
								<br/>
								1.2 취소 수수료는 예매 취소 요청 시점에 따라 다르게 부과될 수 있습니다. <br/>
								예매 후 7일 이내 : 취소 수수로 없음<br/>
								예매 후 8일 ~ 취소 요청일로부터 10일 전: 뮤지컬(장당 4,000원), 연극(장당 2,000원)의 취소 수수료가 부과됩니다.<br/>
								취소 요청일로부터 9일 전: 티켓금액의 10%의 취소 수수료가 부과됩니다.<br/>
								취소 요청일로부터 6일 전: 티켓금액의 20%의 취소 수수료가 부과됩니다.<br/>
								취소 요청일로부터 2일 전: 티켓금액의 30%의 취소 수수료가 부과됩니다.<br/>
								취소 요청 당일 또는 공연 시작 후: 환불이 불가능하며, 전액을 취소 수수료로 부과합니다.<br/>
								<br/>
								<strong>2. 취소 요청 및 환불 절차</strong><br/>
								
								2.1 이용자는 예매 취소를 원할 경우 사이트 내 [마이페이지] 또는 고객센터를 통해 취소 요청을 할 수 있습니다.<br/>
								
								2.2 취소 요청 시 취소 수수료가 부과되며, 실제 환불은 취소 수수료를 공제한 나머지 금액으로 이루어집니다.<br/>
								
								2.3 환불은 취소 요청이 접수된 후 일정 기간 이내에 처리되며, 처리 기간은 사이트나 앱을 통해 안내됩니다.<br/>
								
								<strong>3. 특별 사유로 인한 환불</strong><br/>
								
								3.1 특별한 사유로 인해 예매 취소 및 환불이 필요한 경우, 이용자는 고객센터를 통해 사유를 제시하여 추가 안내를 받을 수 있습니다.<br/>
								
								3.2 특별한 사유에 따라 환불이 이루어지는 경우에도 관련된 수수료가 부과될 수 있습니다.<br/>
								
								<strong>4. 취소 수수료 변경 및 예외 사항</strong><br/>
								
								4.1 회사는 사전 고지 없이 취소 수수료 정책을 변경할 수 있으며, 변경된 정책은 사이트나 앱을 통해 공지됩니다.<br/>
								
								4.2 특정 상황에서는 취소 수수료가 면제되거나 특별한 혜택이 제공될 수 있으며, 이에 대한 자세한 내용은 이용자에게 개별적으로 안내됩니다.<br/>
								
								<strong>5. 기타 사항</strong><br/>
								
								5.1 본 정책은 회사의 정책 및 운영에 따라 변경될 수 있으며, 변경된 내용은 사이트나 앱을 통해 업데이트되어 안내됩니다.<br/>
								
								5.2 예매 취소 및 취소 수수료에 대한 자세한 내용은 이용자가 예매 시에 사이트나 앱 내에서 확인할 수 있습니다.
							</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
		        
		        
		        <script>
		        $(document).ready(() => {
		            // 버튼에 클릭 이벤트 핸들러 추가
		            $('#finanace-agree').on('click', () => {
		                // 모달을 보이게 하는 부트스트랩 함수 호출
		                $('#finance-modal').modal('show');
		            });
		            
		            $('#personal-agree').on('click', () => {
		            	$('#personal-modal').modal('show');
		            });
		            
		            $('#cancel-agree').on('click', () => {
		            	$('#cancel-modal').modal('show');
		            });
		        });
		        
		        </script>
		        
		        
		        
		        
		    </div>
	 	</div>
	</div>
</body>

<script>
    $(document).ready(() => {
        let $card = $('#card');
        let $cellphone = $('#cellphone');
        let $bank = $('#bank');

        let $payagree = $('#payagree');
        
        let $fastpay = $('#fastpay');
        let $payRadios = $('[name="pay"]');
        let $paymentRadios = $('[name="payment"]');
        
        let $paymentsDetail = $('.payments-detail');
        
        let $paybtn = $('#paybtn');

        $payRadios.attr('disabled', true);

        let $paymentConf = $('#payment-conf');
        
        $paymentConf.append($paymentRadios.val());
        
        $fastpay.on('change', () => {
            if ($fastpay.is(':checked')) {
                $payRadios.attr('disabled', false);
                $paymentsDetail.show();
                
            } else {
                $payRadios.attr('disabled', true);
                $paymentsDetail.hide();
                if($card.is(':checked') || $cellphone.is(':checked') || $bank.is(':checked')){
                    $payRadios.attr('disabled', true);
                    $paymentsDetail.hide(); 
                }
            }
        });
        
        $('#paybtn').on('click', (e) => {
            if (!$payagree.prop('checked') || $payments.filter(':checked').length === 0) {
                alert('결제 약관에 동의하고 결제 수단을 선택해주세요.');
                e.preventDefault();
            } else {
                $paybtn.prop('disabled', false); // Enable the button
                // Optionally, you can call the payment function here
                // payment();
            }
        });
        
        // 결제수단 추가하고
        $('#payagree').on('click', (e) => {
        	console.log($('#payagree:checked').length);
        	
			console.log(e.target.checked);
        	if (e.target.checked == true) {
        		$paybtn.removeAttr('disabled');
            }
        	else{
        		$paybtn.attr('disabled',true);
            }
        }); 
        
        
        
    });
    // let fastpay = document.getElementById('fastpay');
    // console.log(fastpay);
    // if(fastpay != checked){
    //     document.getElementsByClassName('payments-detail')
    // }
    
    /*
    function payment(){
    	e.preventDefault();
    	
    	if($('#payagree').prop('checked') == false){
    		alert('이용약관에 동의해주세요!');
    		return false;
    	} 
    	else {
    		return true;
    	}
    }
    */
    
    function payment() {
    	

    	
    	/*
    	if($('#payagree').prop('checked', false)){
    		alert('결제 약관에 동의해주세요');
    		return true;
    	}
    	
    	if($('#payments').prop('checked', false)){
    		alert('결제 수단을 선택해주세요');
    		return false;
    	}
    	*/
    	$.ajax({
    		url : 'kakao',
    		type : 'POST',
    		data : {
    			musTitle : '${ musInfo.musTitle }',
    			musId : '${musInfo.musId}',
    			theaterName : '${ musInfo.theaterName}',
    			selectdate : '${ selectdate }',
    			selectseat : '${ selectseat }',
    			totalPrice : '${ totalPrice }'
    		},
    		success : (data) => {
    			console.log(data);
    			location.href = data.next_redirect_pc_url;
    			
    			return true;
    			
    			
    		},
    		error : (data)=> {
    			console.log(data);
    		}
    	});
    };
    
    
    
    </script>
</html>