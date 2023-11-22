<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


	#content {
		padding-top: 15px;

	/*결과*/
	#result-part{
		color : white;
		margin-top: 20px;

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
	   			<input type="text" placeholder="검색어 입력" name="shprfnmfct" id="shprfnmfct" required>

	   			<i class="fa-solid fa-magnifying-glass" onclick="search();" id="btn"></i>
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
				<ul class="pagination">

					<c:choose>
						<c:when test="${pi.currentPage eq 1}">
							<li class="page-item disabled"><a class="page-link">&lt;</li>
						</c:when>

						<c:otherwise>
							<li class="page-item"><a class="page-link">&lt;</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
							<li class="page-item"><a class="page-link">${p}</a></li>
					</c:forEach>

					<li class="page-item"><a class="page-link">Next</a></li>
				</ul>
	   		</div>
	   </div>

	   <input type="text" value="${showCount}" id="showCount"/>
	</div> 
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		var currentPage;
		var listCount;
		var pageLimit;
		var contentLimit;

		var maxPage;
		var startPage;
		var endPage;

		var ccontent;
	
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
					shprfnmfct : $('#shprfnmfct').val() // 시설명 키워드
					//page : 1
				},
				success : result => {
					
					const itemArr = result.dbs.db;

					let value = '';

					// 검색 결과가 없는 경우
					if(result.dbs.length == 0){
						value += '<tr>'
							+ '<td colspan="6" align="center">일치하는 항목이 존재하지 않습니다.</td>'
							+ '</tr>';
					} else {

						currentPage = 1;
						listCount = itemArr.length;
						pageLimit = 10;
						contentLimit = 10;

						maxPage = Math.ceil(listCount / contentLimit);
						startPage = (currentPage -1) / pageLimit * pageLimit + 1;
						endPage = startPage + pageLimit - 1;

						ccontet = pageLimit * (currentPage - 1);
							
						if(endPage > maxPage) {
							endPage = maxPage;
						}
												
						console.log('listCount : ' + listCount);
						console.log('maxPage : ' + maxPage);
						console.log('startPage : ' + startPage);
						console.log('endPage : ' + endPage);
						console.log('ccontent : ' + ccontent)

						if(itemArr.length > 1){
							/*for(let i in itemArr)*/ for(let i = currentPage -1 ; i < pageLimit; i++){
							let item = itemArr[i];
							value += '<tr align="center">'
								+ '<td>' + item.fcltynm + '</td>'
								+ '<td>' + item.mt13cnt + '</td>'
								+ '<td>' + item.sidonm + '</td>'
								+ '<td>' + item.gugunnm + '</td>'
								+ '<td>' + item.opende + '</td>'
								+ '<td>'
								+ '<form action="theatermap">'
								+ '<input type="hidden" id="mt10id" name="mt10id" value="' + item.mt10id + '"/>'
								+ '<button>지도</button>'
								+ '</form>'
								+ '</td>'
								+ '</tr>'
							}
						} else {
							value += '<tr align="center">'
									+ '<td>' + itemArr.fcltynm + '</td>'
									+ '<td>' + itemArr.mt13cnt + '</td>'
									+ '<td>' + itemArr.sidonm + '</td>'
									+ '<td>' + itemArr.gugunnm + '</td>'
									+ '<td>' + itemArr.opende + '</td>'
									+ '<td>'
									+ '<form action="theatermap">'
									+ '<input type="hidden" id="mt10id" name="mt10id" value="' + itemArr.mt10id + '"/>'
									+ '<button>지도</button>'
									+ '</form>'
									+ '</td>'
									+ '</tr>'
						} 
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