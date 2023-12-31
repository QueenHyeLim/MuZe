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
    			data : { rankCategory : $rank},
    			success : data => {
    				let value = '';
    				for(let i in data){
    					console.log(data[i]);
    					value +='<div id="row-rank-area">'
	    					  + '<div id="muzInfo-area">'
	    					  + '<h4>' +  data[i].musTitle     + '</h4>'
	    					  + '<p>'  +  data[i].startDate    + ' ~  ' 
	    					  +           data[i].endDate      + '</p>'
	    					  + '<p>'  +  data[i].theatherName + '</p>'
	    					  + '<p>'  +  data[i].showStatus   + '</p>'
	    					  + '<p>'  +  data[i].genre        + '</p>'
	    					  /*
	    					  + '<div id="bookmark-area">'
    						  + '<i class="fa-regular fa-bookmark fa-lg" id="unbooked" onclick="unbookedClick();"></i>'
    						  + '<i class="fa-solid fa-bookmark" style="color: #981d26;" id="booked" onclick="bookedClick();"></i>'
    	   				      + '</div>'
	    					  */
	    					  + '</div>'
    	   			          + '<div id="muzImage-area">'
    	   				      + '<img src="' + data[i].poster + '" id="muzImage"/>'
	    					  + '</div>'
	    					  + '</div>';
    				}
    				$('#searchRank-area').html(value);
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
       		<c:if test="${not empty sessionScope.loginUser}">
       		<option value="myRank">MY MUZE순</option>
       		</c:if>
       	</select>
       	<br/><br/>
       	<div id="searchRank-area">
       	<c:forEach var="r" items="${rankList}">
   		<div id="row-rank-area" class="hideRank">
   			<div id="muzInfo-area" >
   				<h4>${r.musTitle}</h4>
   				<p>${r.startDate} ~ ${r.endDate}</p>
   				<p>${r.theatherName}</p>
   				<p>${r.showStatus}</p>
   				<p>${r.genre}</p>
		   		<c:if test="${not empty sessionScope.loginUser}">
				<div class="bookmark">
					<i class="fa-regular fa-bookmark fa-lg" id="unbooked" onclick="unbookedClick(e);"></i>
					<i class="fa-solid fa-bookmark" style="color: #981d26;" id="booked" onclick="bookedClick(e);"></i>
				</div>
				<script>
					$(() => {
						//console.log(${r.musId});
						// bookmarked되어있는 아이콘을 일단 숨겨준다
						$.ajax({
							url : 'select.bk',
							data : { musId : '${r.musId}' },
							success : result => {
								if(result > 0){
									$('#booked').show();
									$('#unbooked').hide();
								}
								else{
									$('#unbooked').show();
									$('#booked').hide();
								}
							},
							error : () => {
								alert('bookmark불러오기 실패');
							}
						})
					});
					
					// unbooked를 클릭 할때 booked로 바꿔야 하기에 insert를 해준다
					function unbookedClick(){
						$.ajax({
							url : 'insert.bk',
							type : 'POST',
							data : { musId : '${r.musId}' },
							success : result => {
								$('#unbooked').hide();
								$('#booked').show();
							},
							error : () => {
								console.log('실패');
							}
						});
					};
					// booked를 클릭할때 unbooked로 바꿔야 하기에 delete를 해준다
					function bookedClick(){
						$.ajax({
							url : 'delete.bk',
							type : 'POST',
							data : { musId : '${r.musId}'},
							success : result => {
								$('#booked').hide();
								$('#unbooked').show();
							},
							error : () => {
								console.log('실패');
							}
						});
					}
				</script>
				</c:if>
   			</div>
   			<div id="muzImage-area">
   				<img src="${r.poster}" id="muzImage"/>
   			</div>
   		</div>
       	</c:forEach>
       	</div>
    </div>
</div>
</body>
</html>