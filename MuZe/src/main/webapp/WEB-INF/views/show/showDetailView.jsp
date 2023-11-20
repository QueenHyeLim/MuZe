<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 상세보기</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
#information {
	background-color : beige;
}

.poster > img{
	width : 250px;
	height : 350px;
	padding: 10px;
}

.info > div{
	float : left;
}

#list {
	list-style : none;
}

.poster {
	margin-bottom: 10px;
}

.des {
	padding : 10px;
}

.bookmark{
	margin-bottom: 10px;
	padding-left: 10px;
}

.page {
	padding-top: 10px;
}

#styurl{
	margin-top: 10px;
}

#information > h4{
	padding-top: 10px;
	padding-left: 10px;
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
					<div class="bookmark">
						<i class="fa-regular fa-bookmark fa-lg"></i>
					</div>
	   			</div>

				
	   			
	   			<div class="des">
	   				<ul id="list">
	   					<input type="hidden" name="mt20id" id="mt20id" value="${ mt20id }"/>
	   					<li>
	   						공연명 : ${ prfnm }
	   					</li>
	   					
	   					<li>
	   						공연 기간 : ${ prfpdfrom } ~ ${ prfpdto }
	   					</li>
	   					
	   					<li>
	   						공연 시간 : ${ dtguidance }
	   					</li>
	   					
	   					<li>
	   						공연장 : ${ fcltynm }
	   					</li>
	   					<li>
	   						장르 : ${ genrenm }
	   					</li>
	   					
	   					<li>
	   						제작진 : 
	   						<c:choose>
	   							<c:when test="${prfcrew != ' '}">
									${ prfcrew }
	   							</c:when>
	   							
	   							<c:otherwise>
									해당 정보 없음
	   							</c:otherwise>
	   						</c:choose>
	   						
	   					</li>
	   					
	   					<li>
	   						출연진 : 
							<c:choose>
								<c:when test="${prfcast != ' '}">
									${ prfcast }
								</c:when>

								<c:otherwise>
									해당 정보 없음
								</c:otherwise>
							</c:choose>
							
	   					</li>
	   					<li>
	   						런타임 : ${ prfruntime }
	   					</li>
	   					<li>
	   						관람 연령 : ${ prfage }
	   					</li>
	   					<li>
	   						제작사 : 
							<c:choose >
								<c:when test="${entrpsnm != ' '}">
									${ entrpsnm }
								</c:when>

								<c:otherwise>
									해당 정보 없음
								</c:otherwise>
							</c:choose>
							
	   					</li>
	   					<li>
	   						티켓 가격 : ${ pcseguidance }
	   					</li>
	   				</ul>
	   			</div>
	   			<br clear="both">

				
	   		</div>
	   </div>
	   
	   <div class="page" id="styurl" align="center">
	   		<img src="${ styurl }">
	   </div>
	   <div class="page">03</div>
	</div> 
</body>
</html>