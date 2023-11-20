<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 목록</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>

	/*전체를 감싸는 영역*/
	#content {
		padding-top: 15px;
	}

	/*검색*/
	#search-part {
		height : 50px;
		position: relative;
		width: 300px;
	}

	#search-part > input{
		width: 100%;
		border: 1px solid white;
		border-radius: 8px;
		padding: 10px 12px;
	}

	/*검색 : 버튼*/
	#btn {
		position : absolute;
		margin-top: 15px;
		margin-left: -30px;
	}

	/*결과*/
	#result-part{
		color : white;
		margin-top: 20px;
<<<<<<< Updated upstream
	}

	#btn {
		background-color: white;
		padding-top: 5px;
	}

	#search-part {
		height : 50px;
		position: relative;
		width: 300px;
	}

	#search-part > input{
		width: 100%;
		border: 1px solid white;
		border-radius: 8px;
		padding: 10px 12px;
	}

	#search-part > i{
		position : absolute;
		width: 17px;
		top: 10px;
		right: 12px;
		margin: 0;
	}

	#content {
		padding-top: 15px;
=======
>>>>>>> Stashed changes
	}

	table{
		width: 1302px;
	}
	
</style>

</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content"> 
	   <div id="blank-area"></div>
	   <div class="page">
	   		<div id="search-part">
				<!--  <div id="select">
					<select id="signgucode">
						<option value="00">전체</option>
						<option value="11">서울</option>
						<option value="26">부산</option>
						<option value="27">대구</option>
						<option value="28">인천</option>
						<option value="29">광주</option>
						<option value="30">대전</option>
						<option value="31">울산</option>
						<option value="36">세종</option>
						<option value="41">경기</option>
						<option value="51">강원</option>
						<option value="43">충북</option>
						<option value="44">충남</option>
						<option value="45">전북</option>
						<option value="46">전남</option>
						<option value="47">경북</option>
						<option value="48">경남</option>
						<option value="50">제주</option>
					</select>
				</div>-->
	   			<input type="text" placeholder="검색어 입력" name="shprfnmfct" id="shprfnmfct" required>
<<<<<<< Updated upstream
	   			<i class="fa-solid fa-magnifying-glass" onclick="search();" id="btn"></i>
=======
	   			<i class="fa-solid fa-magnifying-glass" id="btn"></i>
>>>>>>> Stashed changes
	   		</div> 
	   		
	   		<div id="result-part">
	   			<div class="result">
	   				 <table border="1" align="center" >
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
	</div> 
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>

		$(()=>{
			$('#btn').click(()=>{
				if($('#shprfnmfct').val() == ''){
					alert('검색어를 입력하세요');
					$('#shprfnmfct').focus();
				} else {
					search();
				}
			})

			// 엔터키 클릭
			$('#shprfnmfct').keydown(function(key){
				if(key.keyCode == 13){
					$('#btn').click();
				}
			})
		})



		// 검색 버튼 클릭 시 이벤트
		function search(){

			$.ajax({
				url : 'rlist.th',
				data : {
					shprfnmfct : $('#shprfnmfct').val(), // 시설명 키워드
					//signgucode : $('#signgucode').val()
				},
				success : result => {
					
					const itemArr = $(result).find('db');
					
					let value = '';
					
					if(itemArr.length != 0){
						itemArr.each((i, item) => {
						value += '<tr align="center">'
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
					} else {
						value += '<tr>'
							  + '<td colspan="6" align="center">일치하는 항목이 존재하지 않습니다.</td>'
							  + '</tr>';
					}
					
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