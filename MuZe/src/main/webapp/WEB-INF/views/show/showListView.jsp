<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품</title>
<style>


#blank{
	height : 200px
}

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
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content">
	   <div id="blank-area"></div>
	   <div class="page">01</div>
	   <div class="page">02</div>
	   <div class="page">03</div>
	</div> 
	
</body>
</html>