<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

table > tr, th{
	color : white;
}

#seatInfo > input, select{
	margin-bottom: 5px;
}

.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
		 <div class="page" id="content">
	   <div id="blank-area"></div>
	   <div class="page">
	   		<form action="dealUpdate.bo" method="post" id="enrollForm" enctype="multipart/form-data">
				<input type="checkbox" name="saleStatus" value="${deal.saleStatus}" checked style="display: none;">
	   			<table class="table" align="center">
					<tr>
						<th>판매 여부</th>
						<td>
							<label class="switch">
							  <input id="toggle" type="checkbox" value="${deal.saleStatus}">
							  <span class="slider round"></span>
							</label>
						</td>
					</tr>
					<tr>
						<th>작품명</th>
					 <td><input type="text" id="showTitle" name="showTitle" class="form-control" value="${deal.showTitle }"required/></td>
					</tr>
	   				<tr>
	   					<th>티켓 사용 날짜</th>
						<td><input type="date" id="ticketDate" name="ticketDate" class="form-control" value="${deal.ticketDate }"required/></td>
	   				</tr>
					<tr>
						<th>티켓 사용 시간</th>
						<td><input type="time" id="ticketTime" name="ticketTime" class="form-control" value="${deal.ticketTime }" required/></td>
					</tr>
					<tr>
						<th>좌석 정보</th>
						<td id="seatInfo">
							<select id="seatFloor" class="form-control" name="seatFloor">
								<option value="1층">1층</option>
								<option value="2층">2층</option>
								<option value="3층">3층</option>
							</select>
							<select id="seatRank" class="form-control" name="seatRank">
								<option value="VIP">VIP</option>
								<option value="R">R</option>
								<option value="S">S</option>
								<option value="A">A</option>
								<option value="B">B</option>
							</select>
							<input type="text" id="seatArea" name="seatArea" class="form-control" placeholder="구역(존/블럭)" maxlength="100" value="${deal.seatArea }" required/>
							<input type="number" id="seatCol" name="seatCol" class="form-control" placeholder="열(예시: 6)" value="${deal.seatCol }" required/>
							<input type="text" id="seatDes" name="seatDes" class="form-control" placeholder="선택사항 : 추가 정보 입력" value="${deal.seatDes }"/>
						</td>
					</tr>
					<tr>
						<th>판매 가격</th>
						<td><input type="number" id="ticketPrice" name="ticketPrice" class="form-control" value="${deal.ticketPrice }" required/></td>
					</tr>
					<tr>
						<th>판매 수량</th>
						<td><input type="number" id="ticketMany" name="ticketMany" class="form-control" max="4" min="1" value="${deal.ticketMany }" required/></td>
					</tr>
					<tr>
						<th>세부 사항</th>
						<td><textarea id="other" name="other" class="form-control" rows="10">${deal.other}</textarea></td>
					</tr>
					<tr>
						<th>상품 이미지</th>
						<td>
							<div class="filebox">
							    <input type="file" id="upfile" class="form-control-file border" name="reUpfile">
							    
							    <c:if test="${ !empty deal.changeName }">
							    	<span>업로드된 이미지</span>
							    	<a href="${deal.changeName}" download="${deal.originName}">${deal.originName}</a>	
							    	<input type="hidden" value="${ deal.originName }"/>
							    	<input type="hidden" value="${deal.changeName }"/>
							    </c:if>
							</div>
						</td>
					</tr>
	   			</table>
				<input type="hidden" name="userId" value="${sessionScope.loginUser.userId}"/>
				<div align="center">
					<input type="hidden" value="${deal.dealNo}" name="dealNo"/>
					<button type="submit" class="btn btn-primary">수정하기</button>
				</div>
	   		</form>
	   </div>
	</div>
	
	<script>
		$(()=> {
			
			$('#seatFloor').val('${deal.seatFloor}');
			$('#seatRank').val('${deal.seatRank}');

			console.log($('#toggle').val());
			
			if($('#toggle').val() == 'Y'){
				$('#toggle').attr('checked', true);
			} else {
				$('#toggle').attr('checked', false);
			}

			$('#toggle').click(() => {
				var checked = $('#toggle').is(':checked');
				if(checked){
					$('#toggle, [name=saleStatus]').val('Y');
					console.log($('#toggle').val())
				} else {
					$('#toggle, [name=saleStatus]').val('N');
					console.log($('#toggle').val())
				}
			})
			
		})
	</script>
</body>
</html>