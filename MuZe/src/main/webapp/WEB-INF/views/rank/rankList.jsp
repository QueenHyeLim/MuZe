<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rank.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
#select-drop{
	width : 130px;
}
#rank-area{
	margin-top : 30px;
}
#row-rank-area{
	width : 100%;
	height : 300px;
	border-radius: 4cqmin;
	float : left;
	margin-bottom : 35px;
	background-color: rgba(128, 128, 128, 0.506);
	color : #fff;
}
#muzImage-area{
	width : 200px;
	height : 250px;
	margin-top : 25px;
	margin-left : 25px; 
}
#muzInfo-area{
	width : 75%;
	height : 200px;
	margin-top : 45px;
	margin-right : 35px;
	float:right;
}
#muzImage{
	width : 100%;
	height : 100%;
}
</style>
</head>
<body>
<jsp:include page="../common/navibar.jsp"/>
<div class="page" id="content">
    <div id="blank-area"></div>
    <div id="rank-area">
    <script>
    	// onChange를 이용한 함수
    	function getRankValue(){
    		// selected된 함수
    		let $rank  = $('#select-drop').val();
    		$.ajax({
    			url : 'search.rk',
    			data : { rank : $rank},
    			success : result => {
    				alert('성공');
    				console.log(result);
    			},
    			error : () => {
    				alert('실패');
    			}
    		});
    	}
    </script>
       	<select class="form-control" id="select-drop" name="rank" onChange="getRankValue();">
       		<option value="none">-- 순위</option>
       		<option value="popular">인기순위</option>
       		<option value="scrap">추천순위</option>
       		<option value="range">가나다순</option>
       	</select>
       	<br/><br/>
       	<c:forEach var="r" items="${rankList}">
   		<div id="row-rank-area">
   			<div id="muzInfo-area">
   				<h4>${r.musTitle}</h4>
   				<p>${r.startDate} ~ ${r.endDate}</p>
   				<p>${r.theatherName}</p>
   				<p>${r.showStatus}</p>
   				<p>${r.genre}</p>
   				<div id="bookmark-area">
					<i class="fa-regular fa-bookmark fa-lg" id="unbooked" onclick="unbookedClick();"></i>
					<i class="fa-solid fa-bookmark" style="color: #981d26;" id="booked" onclick="bookedClick();"></i>
   				</div>
   			</div>
   			<div id="muzImage-area">
   				<img src="${r.poster}" id="muzImage"/>
   			</div>
   		</div>
       	</c:forEach>
    </div>
</div>
</body>
</html>