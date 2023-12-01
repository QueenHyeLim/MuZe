<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#enrollForm > table {
	width: 100%;
	margin-top: 30px;
}

#enrollForm > table * {
	margin: 5px;
}

#other{
	resize: none;
}

/*첨부파일*/

</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content">
	   <div id="blank-area"></div>
	   <div class="page">
	   		<form action="dealEnroll.bo" method="post" id="enrollForm" enctype="multipart/form-data">
	   			<table align="center">
					<tr>
						<th>작품 제목</th>
						<td><input type="text" id="showTitle" name="showTitle" class="form-control" required/></td>
					</tr>
	   				<tr>
	   					<th>티켓 사용 날짜</th>
						<td><input type="date" id="ticketDate" name="ticketDate" class="form-control" required/></td>
	   				</tr>
					<tr>
						<th>티켓 사용 시간</th>
						<td><input type="time" id="ticketTime" name="ticketTime" class="form-control" required/></td>
					</tr>
					<tr>
						<th>좌석 정보</th>
						<td id="seatInfo">
							<select class="form-control" name="seatFloor">
								<option value="1층">1층</option>
								<option value="2층">2층</option>
								<option value="3층">3층</option>
							</select>
							<select class="form-control" name="seatRank">
								<option value="VIP">VIP</option>
								<option value="R">R</option>
								<option value="S">S</option>
								<option value="A">A</option>
								<option value="B">B</option>
							</select>
							<input type="text" id="seatArea" name="seatArea" class="form-control" placeholder="구역(존/블럭)" maxlength="100" required/>
							<input type="number" id="seatCol" name="seatCol" class="form-control" placeholder="열(예시: 6)" required/>
							<input type="text" id="seatDes" name="seatDes" class="form-control" placeholder="선택사항 : 추가 정보 입력"/>
						</td>
					</tr>
					<tr>
						<th>판매 가격</th>
						<td><input type="number" id="ticketPrice" name="ticketPrice" class="form-control" required/></td>
					</tr>
					<tr>
						<th>판매 수량</th>
						<td><input type="number" id="ticketMany" name="ticketMany" class="form-control" max="4" min="1" required/></td>
					</tr> 
					<tr>
						<th>세부 사항(선택)</th>
						<td><textarea id="other" name="other" class="form-control" rows="10"></textarea></td>
					</tr>
					<tr>
						<th>상품 이미지(선택)</th>
						<td>
							<div class="fileInput">
							    <input type="file" id="upfile" class="form-control-file border" name="upfile">
							</div>
						</td>
					</tr>
	   			</table>
				<div align="center">
					<button type="submit" class="btn btn-primary">등록하기</button>
				</div>
	   		</form>
	   </div>
	</div> 

	<script>
		$(() => {
			let sDate = new Date();
			sDate.setDate(sDate.getDate() + 1);
			let minStr = sDate.toISOString().split('T')[0];
			$('#ticketDate').attr("min", minStr);
			
			$("#file").on('change',function(){
				  var fileName = $("#file").val();
				  $(".upload-name").val(fileName);
			});

			$('#fileInput').click(() => {
				$('#file').click();
			})
		})
	</script>
</body>
</html>