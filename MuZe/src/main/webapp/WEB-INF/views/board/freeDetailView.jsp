<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/*수정 및 삭제 버튼 영역*/
#button-area{
	margin-top : 30px;
	border : 1px solid red;
	padding-top : 10px;
	padding-bottom : 10px;
	margin-bottom : 10px;
}

.btn{
	margin-right : 5px
}

/*게시글 내용 출력 영역*/
#board{
	border : 1px solid red;
	background-color : beige;
	display: block;
}

#title, #writer, #createDate{
	display: block;
}

.title-area, .content-area, .reply-area{
	padding-top : 10px;
	padding-left : 10px;
}


</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content">
	   <div id="blank-area"></div>
	   
	   <c:if test="${ sessionScope.loginUser.userId eq b.boardWriter }">
		   <div class="page" id="button-area">
		   		<a href="fUpdateForm.bo?fbno=${ b.boardNo }" class="btn btn-primary">수정</a>
				<a href="#" class="btn btn-danger" id="delete">삭제</a>
		   </div>
	   </c:if>
	   
	   <div class="page" id="board">
	   		<div class="title-area">
	   			<h3 id="title">${ b.boardTitle }</h3>
	   			<span id="writer">${b.boardWriter }</span>
	   			<span id="createDate">${b.createDate }</span>
	   			<span>조회수 ${b.count }</span>
				<input type="hidden" value="${b.boardNo}" id="boardNo"/>
	   		</div>
	   		
	   		<hr>
	   		
	   		<div class="content-area">
	   			<span>${b.boardContent }</span>
	   		</div>
	   		
	   		<hr>
	   		
	   		<div class="reply-area">
	   			<p>댓글수</p>
				<hr/>

				
				<div class="reply-content">
					<h6>작성자</h6>
					<p>내용</p>
					<span>작성일</span>
				</div>
	   		</div>
	   </div>
	   <div class="page">03</div>
	</div>
	
	<script>
		$(function(){
			$('#delete').click(function(){
				var result = confirm('게시글을 삭제하시겠습니까?');

				if(result){
					location.href='fDelete.bo?fbno=' + $('#boardNo').val();
				}
			})
		})
	</script>
	 
</body>
</html>