<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 상세보기</title>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>

	 <div class="page" id="content">
	   <div id="blank-area"></div>
	   <div class="page">
	   		<h4>${fcltynm }</h4>
	   		
	   		<table border="1">
	   			<thead>
	   				<tr>
	   					<th>공연시설명</th>
	   					<th>공연장수</th>
	   					<th>개관연도</th>
	   					<th>객석 수</th>
	   					<th>전화번호</th>
	   					<th>홈페이지</th>
	   					<th>주소</th>
	   				</tr>
	   			</thead>
	   			
	   			<tbody>
	   				<tr>
	   					<td>${ fcltynm }</td>
	   					<td>${ mt13cnt }개</td>
	   					<td>${ opende }년</td>
	   					<td>총 ${ seatscale }석</td>
	   					<td>${ telno }</td>
	   					<td>${ relateurl }</td>
	   					<td>${ adres }</td>
	   				</tr>
	   			</tbody>
	   		</table>
	   </div>
	   <div class="page">
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
			
			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);    
			</script>
			
	   </div>
	   <div class="page">03</div>
	</div> 
	
</body>
</html>