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
	   				 		<tr>
		   				 		<th>시설명</th>
		   				 		<th>공연장 수</th>
		   				 		<th>지역(시도)</th>
		   				 		<th>지역(구군)</th>
		   				 		<th>개관연도</th>
		   				 		<th>지도보기</th>
		   				 	</tr>
	   				 	</thead>
	   				 	
	   				 	<tbody>
	   				 	
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
						      + '<input type="hidden" name="mt10id" value="' + $(item).find('mt10id').text() + '"/>'
						      + '<button>지도</button>'
						      + '</form>'
						      + '</td>'
						      + '</tr>'
					})
					$('tbody').html(value);
				},
				error : () => {
					console.log('fail');
				}
			})
		}
	</script>
</body>
</html>