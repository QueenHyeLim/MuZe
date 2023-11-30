<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양도 게시글</title>
<style>
.page{
	background-colr : beige;
	color : white;
}

.table{
	margin-top : 20px;
}

table td, table th {
	color : white;
}

img{
	width: 300px;
	height: 300px;
}
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	<div class="page" id="content">
	   <div id="blank-area"></div>
	   <div class="page">
	   		
	   		<c:if test="${ sessionScope.loginUser.userId eq deal.userId }">
	   			<div class="page" id="buttton-area" align="right">
	   				<a href="dealUpdateForm.bo?dealNo=${ deal.dealNo }" class="btn btn-primary">수정</a>
					<a href="#" class="btn btn-danger" onclick="deleteDeal();" >삭제</a>
	   			</div>
	   		</c:if>
	   
	   		<table class="table" align="center">
	   			<tr>
	   				<th>작품명</th>
	   				<td>${ deal.showTitle }</td>
	   			</tr>
	   			
	   			<tr>
	   				<th>작성자</th>
	   				<td>${deal.userId }</td>
	   			</tr>
	   			
	   			<tr>
	   				<th>사용일</th>
	   				<td>${deal.ticketDate }  ${deal.ticketTime }</td>
	   			</tr>
	   			
	   			<tr>
	   				<th>좌석 정보</th>
	   				<td>
	   					${deal.seatFloor } | ${deal.seatRank} | ${ deal.seatArea } | ${deal.seatCol }
						<c:if test="${!empty deal.seatDes }">
							| ${deal.setDes }
						</c:if>	   					
	   				</td>
	   			</tr>
	   			
	   			<tr>
	   				<th>장당 가격</th>
	   				<td id="price">${deal.ticketPrice }</td>
	   			</tr>
	   			<tr>
	   				<th>구매 수량</th>
	   				<td id="many">${deal.ticketMany}</td>
	   			</tr>
	   			<tr>
	   				<th>총 가격</th>
	   				<td id="totalPrice"></td>
	   			</tr>
	   			<tr>
	   				<th>상품 상세정보</th>
	   				<c:choose>
	   					<c:when test="${empty deal.other }">
	   						<td>등록된 상품 상세정보가 없습니다.</td>
	   					</c:when>
	   					<c:otherwise>
	   						<td>${deal.other }</td>
	   					</c:otherwise>
	   				</c:choose>
	   				
	   			</tr>
				<tr>
					<th>상품 이미지</th>
					<c:choose>
						<c:when test="${empty deal.changeName}">
							<td>등록된 이미지가 없습니다.</td>
						</c:when>
						<c:otherwise>
							<td><img src="${deal.changeName}"></td>
						</c:otherwise>
					</c:choose>
				</tr>
	   		</table>
	   		
	   		<c:if test="${ !empty sessionScope.loginUser && deal.userId != sessionScope.loginUser.userId}">
	   		<div>
	   			<button class="btn btn-primary" onclick="chatDeal(${deal.dealNo})">대화하기</button>
	   		</div>
	   		</c:if>

		<form action="" id="deleteForm" method="post">
			<input type="hidden" name="dealNo" value="${deal.dealNo}" />
			<input type="hidden" name="filepath" value="${deal.changeName}"/>
		</form>
	</div> 
</div> 
	
	<script>
		$(() => {
			var ticketPrice = $('#price').text();
			var ticketMany = $('#many').text();
			
			var totalCount = ticketPrice * ticketMany;
			console.log(totalCount);
			
			$('#totalPrice').text(totalCount);
		})
		
		function chatDeal(dealNo){
			location.href="chatting.ch?dealNo=" + dealNo;
		}

		function deleteDeal(){
			var result = confirm('게시글을 삭제하겠습니까?');

			if(result){
				$('#deleteForm').attr('action', 'dealDelete.bo').submit();
			}
		}
	</script>
</body>
</html>