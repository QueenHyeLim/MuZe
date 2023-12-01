<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY MUZE TICKET 보기</title>
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

    .ticket-container{
        width : 1302px;
        height : 100%;
        margin: auto;
    }

    .ticket-frame{
        background-color: rgb(6, 39, 84);
        color : #fff;
        width : 60%;
        height : 20%;
        padding: 15px;
    }

</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp" />
	<div class="page" id="content">
	<div id="blank-area"></div>
	  <div class="page" id="d">
	  	<div class="ticket-container">
	  	<c:forEach items="${ticketList }" var="muze">
        <div class="ticket-frame">
            ⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶
            <div class="ticket-number">⩥티켓번호 : ${ muze.ticketNo }</div>
            <div class="ticket-showName">⩥공연명 : ${ muze.musTitle }</div>
            <div class="ticket-showplace">⩥공연장소 : ${ muze.theaterName }</div>
            <div class="ticket-showtime">⩥공연시간 : ${ muze.resDate }</div>
            <div class="ticket-seatIds">⩥좌석 : 
            	<c:forEach items="${ muze.seatIdlist }" var="seats">
            		<span>${ seats.seatId }</span>
            	</c:forEach>
            </div>
            ⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶⩶
        </div>
		</c:forEach>


    </div>
	  
	  
	  
	  </div>
	</div>
</body>
</html>