<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 상세보기</title>
<style>
#information {
	background-color : beige;
}

.poster > img{
	width : 250px;
	height : 350px;
	padding: 10px;
	border : 1px solid blue;
}

.info > div{
	float : left;
}

#list {
	list-style : none;
}

.poster {
	border : 1px solid red;
}

.des {
	border : 1px solid red;
	padding : 10px;
}
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content">
	 
	   <div id="blank-area"></div>
	   
	   <div class="page" id="information">
	   		<h4>${ prfnm }</h4>
	   		
	   		<hr>
	   		
	   		<div class="info">
	   			<div class="poster">
	   				<img src="${ poster }">
	   			</div>
	   			
	   			<div class="des">
	   				<ul id="list">
	   					<li>
	   						공연명 : ${ prfnm }
	   					</li>
	   					
	   					<li>
	   						공연 기간 : ${ prfpdfrom } ~ ${ prfpdto }
	   					</li>
	   					
	   					<li>
	   						공연장 : ${ fcltynm }
	   					</li>
	   					<li>
	   						장르 : ${ genrenm }
	   					</li>
	   					<li>
	   						제작진 : ${ prfcrew }
	   					</li>
	   					<li>
	   						출연진 : ${ prfcast }
	   					</li>
	   					<li>
	   						런타임 : ${ prfruntime }
	   					</li>
	   					<li>
	   						관람 연령 : ${ prfage }
	   					</li>
	   					<li>
	   						제작사 : ${ entrpsnm }
	   					</li>
	   					<li>
	   						티켓 가격 : ${ pcseguidance }
	   					</li>
	   				</ul>
	   			</div>
	   			<br clear="both">
	   		</div>
	   </div>
	   
	   <div class="page">
	   		<img src="${ styurl }">
	   </div>
	   <div class="page">03</div>
	</div> 
</body>
</html>