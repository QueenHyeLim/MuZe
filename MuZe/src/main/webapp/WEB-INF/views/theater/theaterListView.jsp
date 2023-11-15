<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 목록</title>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content"> 
	   <div id="blank-area"></div>
	   <div class="page">
	   		<div id="search-part">
	   			<input type="text" placeholder="검색어 입력" name="shprfnmfct" id="shprfnmfct" required>
	   			<button onclick="search();">검색</button>
	   		</div> 
	   		
	   		<div id="result-part">
	   			<div class="result">
	   				 <table border="1" align="center">
	   				 	<thead>
	   				 		<tr align="center">
		   				 		<th width="300">시설명</th>
		   				 		<th>공연장 수</th>
		   				 		<th>지역(시도)</th>
		   				 		<th>지역(구군)</th>
		   				 		<th>개관연도</th>
		   				 		<th>지도보기</th>
		   				 	</tr>
	   				 	</thead>
	   				 	
	   				 	<tbody>
	   				 		<tr>
	   				 			<td colspan="6" align="center">일치하는 항목이 존재하지 않습니다.</td>
	   				 		</tr>
	   				 	</tbody>
	   				 </table> 				
	   			</div>
	   		</div>
	   		
	   		<div id="paging-part">
	   		</div>
	   </div>
	   <div class="page">02</div>
	   <div class="page">03</div>
	</div> 
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		function search(){
			$.ajax({
				url : 'rlist.th',
				data : {
					shprfnmfct : $('#shprfnmfct').val()
				},
				success : result => {
					console.log($(result).find('db'));
					
					const itemArr = $(result).find('db');
					
					// itemArr이 비어있지 않을 경우 '더보기'칸을 출력하고 '더보기'칸 클릭 시, 다음 페이지의 내용을 보여주기
					if(itemArr.length != 0){
						console.log('성공');
					}
					
					let value = '';
					
					itemArr.each((i, item) => {
						value += '<tr>'
						      + '<td>' + $(item).find('fcltynm').text() + '</td>'
						      + '<td>' + $(item).find('mt13cnt').text() + '</td>'
						      + '<td>' + $(item).find('sidonm').text() + '</td>'
						      + '<td>' + $(item).find('gugunnm').text() + '</td>'
						      + '<td>' + $(item).find('opende').text() + '</td>'
						      + '<td>'
						      + '<form action="theatermap">'
						      + '<input type="hidden" id="mt10id" name="mt10id" value="' + $(item).find('mt10id').text() + '"/>'
						      + '<button>지도</button>'
						      + '</form>'
						      + '</td>'
						      + '</tr>'
					})
					$('tbody').html(value);
					$('tbody').append('<tr><td align="center" colspan="6">더보기</td></tr>')
				},
				error : () => {
					console.log('fail');
				}
			})
		}
		
		
	</script>
</body>
</html>