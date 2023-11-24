<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.page{
	padding-top : 30px;
}

.content{
	background-color : beige;
	width:80%;
	margin:auto;
}

</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content">
	   <div id="blank-area"></div>
	   
	   <div class="page">
	   		<a href="#" class="btn btn-primary">수정</a>
			<a href="#" class="btn btn-danger">삭제</a>
	   </div>
	   <div class="page content">
	   		<div class="title-area">
	   			제목
	   		</div>
	   		
	   		<hr>
	   		
	   		<div class="content-area">
	   			내용
	   		</div>
	   		
	   		<hr>
	   		
	   		<div class="reply-area">
	   			댓글
	   		</div>
	   </div>
	   <div class="page">03</div>
	</div>
	 
</body>
</html>