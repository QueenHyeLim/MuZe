<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My MUZE 티켓 예매</title>
<style>
    @font-face {
    font-family: 'HakgyoansimWoojuR';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
    }

    *{
        font-family: 'HakgyoansimWoojuR';
    }
    .make{
        width : 1302px;
        height : 100%;
        text-align: center;
    }

    .make-rs{
        width : 100%;
        height : 20%;
        padding: 15px;
        color : #fff;
    }
    .make-rs-header{
        width : 100%;
        height : 80%;
    }

    .make-rs-content{
        width : 100%;
        height : 20%;
        padding: 10px;
    }

    a{
        width : 100%;
        height : 10%;
        text-decoration: none;
        padding: 10px;
    }
    .make-content{
        width : 100%;
        height : 60%;
        text-align : center;
        background-color : #fff;
    }

</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp" />
	<div class="page" id="content">
	<div id="blank-area"></div>
	  <div class="page" id="d">
	    <div class="make">
	        <div class="make-rs">===== MUZE 예매 완료 ====</div>
	        <div class="make-rs-header">
	            <div class="make-rs-content">
	                <a href="">My MUZE에서 티켓 확인하기</a>
	            </div>
	            <table class="make-content">
	                <tr>
	                    <th>티켓번호</th>
	                    <td>${ ApproveResponse.aid }</td>
	                </tr>
	                <tr>
	                    <th>고객명</th>
	                    <td>${ sessionScope.loginUser.userName }</td>
	                </tr>
	                <tr>
	                    <th>공연명</th>
	                    <td>${ ApproveResponse.item_name }</td>
	                </tr>
	                <tr>
	                    <th>공연장소</th>
	                    <td>${ sessionScope.OrderList.musTheater }</td>
	                </tr>
	                <tr>
	                    <th>공연일자</th>
	                    <td>${ sessionScope.OrderList.orderDate }</td>
	                </tr>
	                <tr>
	                    <th>예매좌석</th>
	                    <td>${ ApproveResponse.item_code }</td>
	                </tr>
	                <tr>
	                    <th>결제수단</th>
	                    <td>${ ApproveResponse.payment_method_type }</td>
	                </tr>
	                <tr>
	                    <th>결제금액</th>
	                    <td>${ ApproveResponse.total_amount }</td>
	                </tr>
	                <tr>
	                    <th>결제요청일시</th>
	                    <td>${ ApproveResponse.created_at }</td>
	                </tr>
	                <tr>
	                    <th>결제승인일시</th>
	                    <td>${ ApproveResponse.approved_at }</td>
	                </tr>
	            </table>
	
	        </div>
	
	    </div>	  
	  
	  
	  
	  </div>
	</div>
</body>
</html>