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
	margin-top: 20px;
}

#title, #writer, #createDate{
	display: block;
}

#writer{
	font-weight: 500;
}

.title-area, .content-area, .reply-area{
	padding-top : 10px;
	padding-left : 10px;
}

#createDate{
	display: inline;
	margin-right: 15px;
}

/*댓글 영역*/
.repText > * {
	float: left;
}

.form-control{
	resize : none;
	width: 90%;
}

.replyPart{
	width: 90%;
	margin-top: 10px;
	margin-bottom: 10px;
}

.reply-items{
	margin-top : 5px;
	border: 1px solid red;
	padding-left: 5px;
}

.reply-items > button{
	float: right;
	margin-top: 5px;
	margin-right: 10px;
}

.repWriter{
	font-weight: 800;
	margin-top: 5px;
}

.replyContent{
	margin-top: 10px;
	margin-bottom: 10px;
	padding-top: 10px;
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
				<a>신고</a>
	   		</div>
	   		
	   		<hr>
	   		
	   		<div class="content-area">
	   			<span>${b.boardContent }</span>
	   		</div>
	   		
	   		<hr>
	   		
	   		<div class="reply-area">
	   			<span>댓글</span> <span id="repCount"></span>
				<hr/>
				
				<c:choose>
					<c:when test="${ empty sessionScope.loginUser }">
						<div id="repText">
							<textarea class="form-control" cols="50" rows="2" style="width: 90%;" readonly>로그인 후 이용 가능한 서비스입니다.</textarea>
							<button>등록하기</button>
						</div>
						
					</c:when>
					
					<c:otherwise>
						<textarea class="form-control" id="rContent" cols="50" rows="2" style="width: 90%;"></textarea>
						<button onclick="insertFReply();">등록하기</button>
					</c:otherwise>
				</c:choose>

				<div class="replyPart">

				</div>
				
	   		</div>
	   </div>
	</div>
	
	<script>
	
	$(() => {
		selectReplyList();
	});
	
		$(function(){
			$('#delete').click(function(){
				var result = confirm('게시글을 삭제하시겠습니까?');

				if(result){
					location.href='fDelete.bo?fbno=' + $('#boardNo').val();
				}
			})
		})
		
		function insertFReply(){
			
			console.log($('#boardNo').val());
			console.log($('#rContent').val());
			
			if($('#rContent').val().trim() != ''){
				$.ajax({
					url : 'fRInsert.bo',
					data : {
						boardNo : $('#boardNo').val(),
						repContent : $('#rContent').val(),
						userId : '${sessionScope.loginUser.userId}'
					},
					success : result => {
						console.log(result);
						selectReplyList();
						$('#rContent').val('');
					},
					error : () => {
						console.log('error');
					}
				})
			} else {
				alert('댓글을 작성해주세요.');
			}
		}
		
		function selectReplyList(){
			$.ajax({
				url : 'fRList.bo',
				data : {
					boardNo : $('#boardNo').val()
				},
				success : result => {
					
					let value = '';

					console.log(result[0]);
					
					for(let i in result){
						value += '<div class="reply-items">'
										+ '<span class="repWriter">' + result[i].userId + '</span>'
										+ '<button class="deleteRep" onclick="deleteRep(' + result[i].brepNo + ');">삭제</button>'
									+ '<hr/>'
									
										+ '<p>' + result[i].repContent + '</p>'
									
										+ '<span>' + result[i].creaetDate + '</span>'
							  + '</div>'
								
					}
					$('.replyPart').html(value);
					$('#repCount').html(result.length)
				},
				error : () => {
					console.log('error');
				}
			})
		}

		function deleteRep(brepNo){
			var result = confirm('댓글을 삭제하겠습니까?');

			if(result){
				location.href = 'fRDelete.bo?fRno=' + brepNo;
			}

			console.log(brepNo);
		}
	</script>
	 
</body>
</html>