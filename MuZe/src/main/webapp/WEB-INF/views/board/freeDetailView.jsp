<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

#boardReport:hover{
	cursor: pointer;
}

/*댓글 영역*/
.repText > * {
	float: left;
}

.form-control{
	resize : none;
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

/*모달창*/
.modal{
	color: black;
}

.modal-body > div{
	display: block;
}

.modal label{
	padding-left: 10px;
}

</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content">
	   <div id="blank-area"></div>
	   
	   <c:if test="${ sessionScope.loginUser.userNo eq b.boardWriter }">
		   <div class="page" id="button-area">
		   		<a href="fUpdateForm.bo?fbno=${ b.boardNo }" class="btn btn-primary">수정</a>
				<a href="#" class="btn btn-danger" id="delete">삭제</a>
		   </div>
	   </c:if>
	   
	   <div class="page" id="board">
	   		<div class="title-area">
	   			<h3 id="title">${ b.boardTitle }</h3>
	   			<span id="writer">${ b.userId }</span>
	   			<span id="createDate">${b.createDate }</span>
	   			<span>조회수 ${b.count }</span>
				<input type="hidden" value="${b.boardNo}" id="boardNo"/>
			
				<c:if test="${!empty sessionScope.loginUser}">
					<a data-toggle="modal" data-target="#myModal">신고</a>
					<i class="fa-regular fa-heart" id="unLike" onclick="boardLike();"></i>
					<i class="fa-solid fa-heart" id="Like" style="color: #981d26;" onclick="deleteLike();"></i>
				</c:if>
	   		</div>
	   		
	   		<hr>
	   		
	   		<div class="content-area">
	   			<span>${b.boardContent }</span>
	   		</div>
	   		
	   		<hr>
	   		
	   		<div class="reply-area">
	   			<span>댓글</span> <span id="repCount"></span>
				<hr/>
				
				<table class="table" align="center">
					<thead>
						<c:choose>
							<c:when test="${ empty sessionScope.loginUser }">
								<tr>
									<th colspan="2">
										<textarea class="form-control" cols="50" rows="2" style="width: 90%;" readonly>로그인 후 이용 가능한 서비스입니다.</textarea>
									</th>
									<th style="vertical-align: middle;"><button class="btn btn-secondary">등록하기</button></th>
								</tr>
							</c:when>
							
							<c:otherwise>
								<tr>
									<th colspan="2">
										<textarea class="form-control" id="rContent" cols="50" rows="2" style="width: 90%;" placeholder="댓글을 입력하세요"></textarea>
									</th>
									<th style="vertical-align: middle;"><button class="btn btn-secondary" onclick="insertFReply();">등록하기</button></th>
								</tr>
							</c:otherwise>
						</c:choose>
					</thead>
					
				</table>

				<div class="replyPart">

				</div>
				
	   		</div>
	   </div>
	</div>

	<div class="modal" id="myModal">
		<div class="modal-dialog">
		  <div class="modal-content">
	  
			<!-- Modal Header -->
			<div class="modal-header">
			  <h4 class="modal-title">신고하기</h4>
			  <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			
				<form action="fbReport.bo" method="post">
					<input type="hidden" value="${ b.boardNo }" name="boardNo"/>
					<input type="hidden" value="${ sessionScope.loginUser.userNo}" name="userNo"/>
					<!-- Modal body -->
					<div class="modal-body">
						<div>
							<input type="radio" name="report" id="spamRep" value="1"><label for="spamRep">스팸홍보/도배글입니다.</label>
						</div>
						
						<div>
							<input type="radio" name="report" id="obsRep" value="2"><label for="obsRep">음란물입니다.</label>
						</div>
						
						<div>
							<input type="radio" name="report" id="illRep" value="3"><label for="illRep">불법정보를 포함하고 있습니다.</label>
						</div>
						
						<div>
							<input type="radio" name="report" id="harmRep" value="4"><label for="harmRep">청소년에게 유해한 내용입니다.</label>
						</div>
						
						<div>
							<input type="radio" name="report" id="curseRep" value="5"><label for="curseRep">욕설/생명경시/혐오/차별적 표현입니다.</label>
						</div>
						
						<div>
							<input type="radio" name="report" id="piRep" value="6"><label for="piRep">개인정보 노출 게시물입니다.</label>
						</div>
						
						<div>
							<input type="radio" name="report" id="unpRep" value="7"><label for="unpRep">불쾌한 표현이 있습니다.</label>
						</div>
						<input type="hidden" name="repType" id="repType" required>
					</div>
				
		  
					<!-- Modal footer -->
					<div class="modal-footer">
					<button id="insertRep" class="btn btn-primary" type="submit">신고하기</button>
					</div>
				</form>
			</div>
		</div>
		
	  </div>
	
	<script>
	
	$(() => {
		selectReplyList();
		ajaxSelectLike();

		$('#insertRep').attr('disabled', true);

		$('[name=report]').click(function(){
			console.log($(this).val());
			$('#repType').val($(this).val())
			$('#insertRep').attr('disabled', false);
		})
		
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
			
			if($('#rContent').val().trim() != ''){
				$.ajax({
					url : 'fRInsert.bo',
					type : 'post',
					data : {
						boardNo : $('#boardNo').val(),
						repContent : $('#rContent').val(),
						userNo : '${sessionScope.loginUser.userNo}'
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
										+ '<span class="repWriter">' + result[i].replyWriter + '</span>';
										
										if('${loginUser.userId}' == result[i].replyWriter){
						value += 		'<button class="deleteRep" onclick="deleteRep(' + result[i].brepNo + ');">삭제</button>'	;		
										}
						value +=	'<hr/>'
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
		
		function boardLike(){
			$.ajax({
				url : 'insertLike.bo',
				type : 'post',
				data : {
					cateNo : '10',
					contentNo : $('#boardNo').val(),
					userNo : '${sessionScope.loginUser.userNo}'
				},
				success : result => {
					console.log(result);
					$('#unLike').hide();
					$('#Like').show();
				},
				error : () => {
					console.log('error');
				}
			})
		}

		function ajaxSelectLike(){
				$.ajax({
				url : 'selectLike.bo',
				type : 'post',
				data : {
					cateNo : '10',
					contentNo : $('#boardNo').val(),
					userNo : '${sessionScope.loginUser.userNo}'
				},
				success : result => {
					console.log(result);
					if(result > 0){
						$('#unLike').hide();
						$('#Like').show();
						console.log('좋아요 있음');
					} else {
						$('#unLike').show();
						$('#Like').hide();
						console.log('좋아요 없음');
					}
				},
				error : () => {
					console.log('에러');
				}
			})
		}

		function deleteLike(){
			$.ajax({
				url :'deleteLike.bo',
				type : 'post',
				data : {
					cateNo : '10',
					contentNo : $('#boardNo').val(),
					userNo : '${sessionScope.loginUser.userNo}'
				},
				success : result => {
					$('#unLike').show();
					$('#Like').hide();
				},
				error : () => {
					console.log('실패');
				}
			})
		}
	</script>
	 
</body>
</html>