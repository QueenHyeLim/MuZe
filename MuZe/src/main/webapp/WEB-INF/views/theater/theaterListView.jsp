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
	}

	/*결과*/
	#result-part{
		color : white;
		margin-top: 20px;

	}

	table{
		width: 1302px;
	}

	/*페이징바 영역*/
	#paging-part{
		margin: auto;
		width: 300px;
		padding-top: 30px;
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
	   		
	   </div>

	   <div class="page">
		<div id="paging-part">
			<ul class="pagination">


			</ul>
		   </div>
	   </div>

	</div> 
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		var currentPage = 1;
		var listCount;
		var pageLimit;
		var contentLimit;

		var maxPage;
		var startPage;
		var endPage;

		$(()=>{
			$('#btn').click(()=>{
				if($('#shprfnmfct').val() == ''){
					alert('검색어를 입력하세요');
					$('#shprfnmfct').focus();
				} else {
					search();
					currentPage = 1;
				}
			})

			// 엔터키 클릭
			$('#shprfnmfct').keydown(function(key){
				if(key.keyCode == 13){
					$('#btn').click();
				}
			})

			if(currentPage == $('.paging').val()){
				$('.paging').addClass('active');
			}
		})

 

		// 검색 버튼 클릭 시 이벤트
		function search(){

			$.ajax({
				url : 'rlist.th',
				type : 'post',
				data : {
					shprfnmfct : $('#shprfnmfct').val() // 시설명 키워드
				},
				success : result => {
					
					const itemArr = result.dbs.db;

					// 검색 결과가 없는 경우

					abcde(null, result, itemArr);



				},
				error : () => {
					console.log('fail');
				}
			})

			
		} 

		function abcde(page, result, itemArr){

			let value = '';
			let paging = '';

			// 검색 결과가 0일 때
			if(result.dbs.length == 0){
						value += '<tr>'
							+ '<td colspan="6" align="center">일치하는 항목이 존재하지 않습니다.</td>'
							+ '</tr>';
			} else {

				listCount = itemArr.length;
				pageLimit = 10;
				contentLimit = 10;

				maxPage = parseInt(Math.ceil(listCount / contentLimit));
				startPage = parseInt((currentPage - 1) / pageLimit) * pageLimit + 1;
				//console.log('hihi :' + parseInt((currentPage - 1) / pageLimit));
				endPage = startPage + pageLimit - 1;

				if(endPage > maxPage) {
					endPage = maxPage;
				}

					if(itemArr.length > 1){
						// 검색 결과가 10개 이상일 때
						if(itemArr.length >= 10) {
							if(currentPage != maxPage){
								for(let i = (currentPage -1) * contentLimit ; i < contentLimit * currentPage; i++){
									let item = itemArr[i];
									// console.log(item);

									// if(item.fcltynm != undefined && i == (listCount - 1)){
									// 	for(let i )
									// }

									
									// 마지막 페이지가 아닐 때
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

								 // 마지막 페이지일 때
								} else if(listCount % contentLimit != 0 && currentPage == maxPage){
									for(let j = (maxPage-1) * contentLimit; j < (maxPage-1) * contentLimit + listCount % contentLimit; j++){
										let items = itemArr[j];
										value += '<tr align="center">'
										+ '<td>' + items.fcltynm + '</td>'
										+ '<td>' + items.mt13cnt + '</td>'
										+ '<td>' + items.sidonm + '</td>'
										+ '<td>' + items.gugunnm + '</td>'
										+ '<td>' + items.opende + '</td>'
										+ '<td>'
										+ '<form action="theatermap">'
										+ '<input type="hidden" id="mt10id" name="mt10id" value="' + items.mt10id + '"/>'
										+ '<button>지도</button>'
										+ '</form>'
										+ '</td>'
										+ '</tr>'
									}
								} else {
									for(let i = (currentPage -1) * 10 ; i < contentLimit * currentPage; i++){
									let item = itemArr[i];
									// console.log(item);
									
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
								}
								
								if(currentPage == 1){
									paging += '<li class="page-item disabled lt"><a class="page-link">&lt;</li>';
								} else {
									paging += '<li class="page-item lt"><a class="page-link">&lt;</a></li>';
								}

								for(let i = startPage; i < endPage + 1; i++){
									paging += '<li class="page-item paging" value="' + i + '"><a class="page-link" value="' + i + '">' + i + '</a></li>'
								}
								
								paging += '<li class="page-item gt"><a class="page-link">&gt;</a></li>';

							} else if(itemArr.length < 10) {
								for(let k in itemArr){
									let item = itemArr[k];
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
					$('.pagination').html(paging);

					$('.paging').click(function(){
						
					})
		}

		
		$(document).on('click', '.paging',function(){
						currentPage = $(this).val();
						//console.log(currentPage);
						search();


						console.log($(this).children());

						if(currentPage == $(this).val()){
							$(this).addClass('active');
							$(this).children().css('font-weight', 'bold');
						}
		})

		$(document).on('click', '.lt',function(){
			if(currentPage == 1){
				alert('첫 번째 페이지입니다.');
			} else {
				currentPage = currentPage - 1;
				//console.log(currentPage);
				search();
			}
			
		})

		$(document).on('click', '.gt',function(){
			if(currentPage < maxPage){
					currentPage = currentPage + 1;
					//console.log(currentPage);
					search();
			} else {
				alert('maxPage입니다.')
			}
		})
		
	</script>
</body>
</html> 