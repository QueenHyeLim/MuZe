<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뮤지컬 예매 상세보기</title>
  <!-- datepicker CDN-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
            $( "#datepicker" ).datepicker();

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

            $(function() {
                $("#datepicker1").datepicker();
            });
        } );
    </script>
  <script>
    /*
    document.addEventListener('DOMContentLoaded', function() {
        var today = new Date(); // 현재 날짜
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            timeZone: 'UTC',
            initialView: 'dayGridMonth',
            events: '/api/demo-feeds/events.json',
            editable: true,
            selectable: true,

            select: function(info) {
                // 선택한 날짜와 현재 날짜를 비교
                if (info.start < today) {
                    // 오늘 이전의 날짜를 선택하면 취소
                    alert('오늘 날짜 이전 날짜는 선택할 수 없습니다');
                    calendar.unselect();
                }
            },
            navLinks: true,

            navLinkDayClick: function(date, jsEvent) {

                console.log('day', date.format()); // date is a moment

                console.log('coords', jsEvent.pageX, jsEvent.pageY);

            }
        });

        calendar.render();
    });
    */

  </script>
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
        height : 780px;
        border : 1px solid black;
    }

    .muz_content_1{
        width : 100%;
        height : 360px;
        border: 1px solid green;
    }
    
    .muz_content_2{
        width : 100%;
        height : 420px;
        border : 1px solid brown;
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

    .muz_footer{
        width : 100%;
        height : 100px;
        border : 1px solid pink;
    }

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
    }

    #calendar{
        width : 60%;
        height : 400px;
    }

    p{
        padding: 0;
        line-height: 100%;
    }
</style>




</head>
<body>
	<jsp:include page="../common/navibar.jsp" />
	<div class="page" id="content">
	<div id="blank-area"></div>
	 	<div class="page" id="d">
    <div class="choose">
        <div class="muz_header">
            <div class="muz_header_1">${ genreName }</div>
            <div class="muz_header_2">${ musTitle }</div>
        </div>
        <div class="muz_content">
            <div class="muz_content_1">
                <div class="muz_content_1_1">
                    <img src="${ poster }" alt="뮤지컬포스터">
                </div>
                <div class="muz_content_1_2">
                    <ul>
                        <li class="muz_info">
                            <strong>장소</strong>
                            <div class="muz_exp">
                                <p>${ theaterName }</p>
                            </div>
                        </li>
                        <li class="muz_info">
                            <strong>공연기간</strong>
                            <div class="muz_exp">
                                <p>${ startDate } ~ ${ endDate }</p>
                            </div>
                        </li>
                        <li class="muz_info">
                            <strong>등급</strong>
                            <div class="muz_exp">
                                <p>${ ageRate }</p>
                            </div>
                        </li>
                        <li class="muz_info">
                            <strong>관람시간</strong>
                            <div class="muz_exp">
                                <p>${ perTime }</p>
                            </div>
                        </li>
                        <li class="muz_info">
                            <strong>출연</strong>
                            <div class="muz_exp">
                                <p>${ cast }</p>
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
                                <li class="muz_seat">
                                    <span class="sname">R석</span>
                                    <span class="sprice">150,000원</span>
                                </li>
                                <li class="muz_seat">
                                    <span class="sname">S석</span>
                                    <span class="sprice">120,000원</span>
                                </li>
                                <li class="muz_seat">
                                    <span class="sname">A석</span>
                                    <span class="sprice">90,000원</span>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="muz_content_2">
                <!--<div id='calendar'></div>-->
                <!--<input type="date" name="" id="">-->
                <input type="text" id="datepicker">
            </div>
        </div>
        <div class="muz_footer">
            <button>예매하기</button>
        </div>




    </div>
    </div>
	</div> 	
</body>
</html>