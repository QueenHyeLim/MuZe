<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 상세보기</title>
<style>
/*공연장 전체 정보를 감싸는 영역*/
#information{
	background-color : beige;
	padding-top : 10px;
	padding-left : 10px;
	padding-bottom : 10px;	
}

#information > h4{
	margin-bottom : 30px;
}

td{
	padding-left: 10px;
}

table {
	width : 1200px;
}

.title {
	font-weight: 800;
	width: 200px;
}

.value > a{
	color: black;
	font-style: italic;
}

/*지도 전체를 감싸는 영역*/
#map-area{
	background-color : beige;
	margin-top : 30px;
	padding-top : 10px;
	padding-left : 10px;
	padding-right : 10px;
}

#map-area > h4{
	margin-bottom : 30px
}
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>

	 <div class="page" id="content">
	   <div id="blank-area"></div>
	   <div class="page" id="information">
	   		<h4>${fcltynm }</h4>
	   		
	   		<table border="1" align="center">
	   			<tr>
	   				<td class="title">공연시설명</td>
	   				<td class="value">${ fcltynm }</td>
	   			</tr>
	   			
	   			<tr>
	   				<td class="title">시설특성</td>
					<td class="value">${ fcltychartr }</td>
	   			</tr>
	   			
	   			<tr>
	   				<td class="title">공연장 수</td>
	   				<td class="value">${ mt13cnt }개</td>
	   			</tr>
	   			
	   			<tr>
	   				<td class="title">개관연도</td>
	   				<td class="value">
						<c:choose>
							<c:when test="${ opende eq ' ' }">
								-
							</c:when>
							<c:otherwise>
								${ opende }년
							</c:otherwise>
						</c:choose>
					</td>
	   			</tr>
	   			
	   			<tr>
	   				<td class="title">객석 수</td>
	   				<td class="value">총 ${ seatscale }석</td>
	   			</tr>
	   			<tr>
	   				<td class="title">전화번호</td>
	   				<td class="value">
						<c:choose>
							<c:when test="${ telno eq ' ' }">
								-
							</c:when>

							<c:otherwise>
								${ telno }
							</c:otherwise>
						</c:choose>	
					</td>
	   			</tr>
	   			<tr>
	   				<td  class="title">홈페이지</td>
	   				<td  class="value">
						<c:choose>
							<c:when test="${ relateurl eq ' '}">
								-
							</c:when>

							<c:otherwise>
								<a href="${ relateurl }">${ relateurl }</a>
							</c:otherwise>
						</c:choose>
					</td>
	   			</tr>
	   			<tr>
	   				<td class="title">주소</td>
	   				<td class="value">${ adres }</td>
	   			</tr>
	   		</table>
	   		
	   		
	   </div>
	   <div class="page" id="map-area">
	   		<h4>공연장 위치</h4>
	   		
	   		<div id="map" style="width:100%;height:350px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a1504d2243d2f2a4b097d0d500894003"></script>
			<div id="map" style="width:100%;height:350px;"></div>

			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(${la}, ${lo}), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(${la}, ${lo}); 
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			</script>
			
	   </div>
	   <div class="page">03</div>
	</div> 
	
</body>
</html>