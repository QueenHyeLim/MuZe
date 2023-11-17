<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 상세보기</title>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content">
	 
	   <div id="blank-area"></div>
	   
	   <div class="page">
	   		<h4>${ prfnm }</h4>
	   		
	   		<hr>
	   		
	   		<div class="info">
	   			<div class="poster">
	   				<img src="${ poster }">
	   			</div>
	   			
	   			<div class="des">
	   				<table border="1">
	   					<thead>
	   						<tr>
	   							<th></th>
	   						</tr>
	   					</thead>
	   				</table>
	   			</div>
	   		</div>
	   </div>
	   
	   <div class="page">02</div>
	   <div class="page">03</div>
	</div> 
</body>
</html>