<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품</title>
<style>
#list-part{
	border : 1px solid;
	height : 900px;
	margin-top : 31.5px;
}

#search-part {
	height : 50px;
}

#result-part {
	background-color : beige;
	height : 800px;
}

#paging-part{
	height : 50px;
}

img {
	width : 100px;
	height : 150px;
}

.show > div{
	float : left;
}

.show {
	border : 1px solid;
	padding-left : 10px;
	padding-top : 10px;
}

.des{
	margin-left : 10px;
}
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content"> 
	   <div id="blank-area"></div>
	   <div class="page">
	   		<div id="search-part">
	   			<input type="text" placeholder="검색어 입력" name="shprfnm" id="shprfnm" required>
	   			<button id="btn1" onclick="search();">검색</button>
	   		</div>
	   		
	   		<div id="result-part">
	   			<div class="result">
	   				<div class="show">
	   					<div class="poster">
	   						<img src="https://i.namu.wiki/i/MRi4QNUMhWWq1Mc10JHQahMgFfZkd8NhrnkXxoppVhyrIyH2oTlfL94MJ1mDEEaMqdXihVbs61YmyT5fStY_7g.webp">
	   					</div>
	   					<div class="des">
	   						<p>오페라의 유령</p>
	   						<p>공연시작일 ~ 공연종료일</p>
	   						<p>공연장</p>
	   						<p>공연장르</p>
	   					</div>
	   					
	   					<br clear="both">
	   				</div>
	   				
	   				
	   			</div>
	   		</div>
	   		
	   		<div id="paging-part">
	   		</div>
	   </div>
	   <div class="page">02</div>
	   <div class="page">03</div>
	</div> 
	
</body>
</html>