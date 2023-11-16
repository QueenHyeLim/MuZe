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
	background-color : blue;
	height : 800px;
}

#paging-part{
	height : 50px;
}

img {
	width : 100px;
	height : 150px;
}
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content"> 
	   <div id="blank-area"></div>
	   <div class="page">
	   		<div id="search-part">
	   			<input type="text" placeholder="검색어 입력" name="prfnm" id="prfnm" required>
	   			<button id="btn1" onclick="search();">검색</button>
	   		</div>
	   		
	   		<div id="result-part">
	   			<div class="result">
	   				<div class="poster">
	   					<img src="https://i.namu.wiki/i/MRi4QNUMhWWq1Mc10JHQahMgFfZkd8NhrnkXxoppVhyrIyH2oTlfL94MJ1mDEEaMqdXihVbs61YmyT5fStY_7g.webp">
	   					<p>
	   						오페라의 유령<br>
	   						2023.10.11<br>
	   						2023.11.16<br>
	   						샤롯데<br>
	   						뮤지컬<br>
	   					</p>
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