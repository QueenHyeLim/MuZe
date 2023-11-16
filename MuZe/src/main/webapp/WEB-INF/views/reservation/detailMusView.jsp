<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>-->
<!-- datepicker CDN-->
<title>뮤지컬 예매 상세보기</title>
<style>
    .choose{
        width : 1302px;
        height : 1000px;
        border : 1px solid red;
    }
    .muz_header{
        width : 100%;
        height : 120px;
        border : 1px solid blue;
    }

    .muz_content{
        width : 100%;
        height : 880px;
        border : 1px solid black;
        color : #fff;
    }

    .muz_content_1{
        width : 100%;
        height : 360px;
        border: 1px solid green;
    }
    
    .muz_content_2{
        width : 100%;
        height : 520px;
        border : 1px solid brown;
    }
    .dateInput-area{
    	width : 100%;
    	height : 420px;
    }
    .muz_content_2_2{
    	width : 100%;
    	height : 100px;
    	border : 1px solid pink;
    }
    
    .muz_content_1 > div {
        float : left;
    }

    .muz_content_1_1{
        height : 100%;
        width : 40%;
    }

    img{
        width : 35%;
        height : 90%;
        margin-left: 50px;
        margin-top : 20px;
    }

    .muz_content_1_2{
        height : 100%;
        width : 60%;
        margin: 0;
    }

/*  .muz_footer{
        width : 100%;
        height : 100px;
        border : 1px solid pink;
    }*/

    ul{
        list-style: none;
        display: inline-block;
    }

    li{
        display: list-item;
        
    }

    .muz_exp{
        display: inline-block;
        padding-left: 10px;
    }

    strong{
        display: inline-block;
        box-sizing: border-box;
        margin: 0;
        color : #fff;
    }

    #calendar{
        width : 60%;
        height : 400px;
    }

    p{
        padding: 0;
        line-height: 100%;
        color : #fff;
    }
</style>




</head>
<body>
	<jsp:include page="../common/navibar.jsp" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(function() {
        $("#datepicker").datepicker();

        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });

    } );

</script>
	<div class="page" id="content">
	<div id="blank-area"></div>
	 	<div class="page" id="d">
    <div class="choose">
        <div class="muz_header">
            <div class="muz_header_1">${ s.genreName }</div>
            <div class="muz_header_2">${ s.musTitle }</div>
        </div>
        <div class="muz_content">
            <div class="muz_content_1">
                <div class="muz_content_1_1">
                    <img src="${ s.poster }" alt="뮤지컬포스터">
                </div>
                <div class="muz_content_1_2">
                    <ul>
                        <li class="muz_info">
                            <strong>장소</strong>
                            <div class="muz_exp">
                                <p>${ s.theaterName }</p>
                            </div>
                        </li>
                        <li class="muz_info">
                            <strong>공연기간</strong>
                            <div class="muz_exp">
                                <p>${ s.startDate } ~ ${ s.endDate }</p>
                            </div>
                        </li>
                        <li class="muz_info">
                            <strong>등급</strong>
                            <div class="muz_exp">
                                <p>${ s.ageRate }</p>
                            </div>
                        </li>
                        <li class="muz_info">
                            <strong>관람시간</strong>
                            <div class="muz_exp">
                                <p>${ s.perTime }</p>
                            </div>
                        </li>
                        <li class="muz_info">
                            <strong>출연</strong>
                            <div class="muz_exp">
                                <p>${ s.cast }</p>
                            </div>
                        </li>
                        <li class="muz_info">
                            <strong>가격</strong>
                            <ul class="muz_cash">
                            	<c:forEach items="${ sp }" var="p">
                                <li class="muz_seat">
                                    <span class="sname">${ p.kind }석</span>
                                    <span class="sprice">${ p.price }원</span>
                                </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            
            <div class="muz_content_2">
            	<form action="">
           		<input type="hidden" name="musId" value="${ s.musId }">
            	<div class="dateInput-area">
            		<strong>날짜 선택 :</strong> 
            		<input type="text" id="datepicker" name="selectdate" >
            	</div>
                <div class="muz_content_2_2" id="seatBtn">
                	<button type="submit">좌석선택</button>
                </div>
            	</form>
                <!-- <input type="text" id="datepicker">-->
                <!-- 날짜선택 : -->
            </div>
        </div>

    </div>
    </div>
	</div> 	
</body>
</html>