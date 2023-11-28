<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUZE 결제페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    	color : fff;
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
        height : 30%;
        background-color: rgb(112, 146, 190);
        font-size: 20px;
    }

    .payment-selected{
        width : 100%;
        height : 60%;
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
        color : fff;
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
    }

    .mus-information{
        height : 100%;
               float : right;
    }
    .mus-area{

        width : 50%;
        height : 15%;
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
		                    <img id="musposter" src="${ musInfo.poster }" alt="">
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
		                        <input type="radio" class="form-check-input" id="fastpay" name="payments" value="fastpay">간편결제
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
		                <div class="terms_1">전자 금융거래 이용에 동의합니다. <a id="finanace-agree" href="">약관보기<a></div>
		                <div class="terms_2">개안정보 수집 및 이용에 동의합니다. <a id="personal-agree" href="">약관보기</a></div>
		                <div class="terms_3">취소 수수료 및 취소기한을 확인하였으며 이에 동의합니다. <a id="cancel-agree" href="">약관보기</a> </div>
		            </div>
		        </div>
		        <div class="reservation-result">
		            <div class="summary">
		
		            </div>
		
		            <form action="kakao/kakaoPay">
		                <div class="total-price">
		                    최종 결제금액
		                    <div class="pay-price">
		                        ${ totalPrice }<strong>원</strong>
		                    </div>
		                </div>
		                <hr>
		                <div class="payment-selected">
		                    결제수단
		                    <strong>카카오페이</strong>
		                </div>
		                <input type="hidden" name="musTitle" value="${ musInfo.musTitle }">
		                <input type="hidden" name="selectdate" value="${ selectdate }">
		                <input type="hidden" name="selectseat" value="${ selectseat }">
		                <input type="hidden" name="totalPrice" value="${ totalPrice }">
		                <button type="submit" id="paybtn1">결제하기</button><!--  /*onclick="return payment();" */ -->
		            </form>
		                <button type="submit" id="paybtn" onclick="return payment();">결제하기</button>	<!--  /*onclick="return payment();" */ -->
		        </div>
		    </div>
	 	</div>
	</div>
</body>

<script>
    $(document).ready(() => {
        let $card = $('#card');
        let $cellphone = $('#cellphone');
        let $bank = $('#bank');

        let $fastpay = $('#fastpay');
        let $paymentRadios = $('[name="pay"]');
        
        let $paymentsDetail = $('.payments-detail');

        $paymentRadios.attr('disabled', true);

        $fastpay.on('change', () => {
            if ($fastpay.is(':checked')) {
                $paymentRadios.attr('disabled', false);
                $paymentsDetail.show();
                
            } else {
                $paymentRadios.attr('disabled', true);
                $paymentsDetail.hide();
                if($card.is(':checked') || $cellphone.is(':checked') || $bank.is(':checked')){
                    $paymentRadios.attr('disabled', true);
                    $paymentsDetail.hide(); 
                }
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