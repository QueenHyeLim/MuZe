<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품</title>
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
}

#search-part > div {
	float : left;
}

/*검색 : 옵션*/
select{
	height: 45px;
	width: 100px;
	border-radius: 8px;
}

/*검색 : 검색어 입력*/
#search{
	margin-left: 10px;
}

#search > input{
	width: 400px;
	border: 1px solid white;
	border-radius: 8px;
	padding: 10px 12px;
}

/*검색 : 버튼*/
#btn{
	position : absolute;
	margin-top: 15px;
	margin-left: -30px;
}

/*결과*/
#result-part {
	background-color : rgb(128, 128, 128);
	margin-top: 20px;
	color : white;
}

/*결과 : 없는 경우*/
p{
	padding: 0;
	margin: 0;
}

/*결과 : 포스터*/
img {
	width : 150px;
	height : 200px;
}

.show > div{
	float : left;
}

.show {
	padding-left : 10px;
	padding-top : 10px;
	background-color: rgb(128, 128, 128);
	border: 1px solid black;
	color : white
}

.show:hover{
	cursor: pointer;
}

.des{
	margin-left : 10px;
}

.detail{
	margin-left: 10px;
	font-size: 10px;
	height: 30px;
	border-radius: 5px;
	background-color:rgb(39, 38, 38);
	border: 1px solid black;
	color : white;
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
	   			<div id="select">
		   			<select id="prfstate">
		   				<option value="00">전체</option>
		   				<option value="01">공연예정</option>
		   				<option value="02">공연중</option>
		   				<option value="03">공연완료</option>
		   			</select>
	   			</div>
	   			
	   			<div id="search">
		   			<input type="text" placeholder="검색어 입력" name=shprfnm id="shprfnm" minlength="2">
					<i class="fa-solid fa-magnifying-glass" id="btn"></i>

					<!--<span class="material-symbols-outlined" id="btn">search</span>-->

				</div>
	   		</div>
	   		
	   		<div id="result-part">
	   			<div class="result">
	   				
					<span>일치하는 항목이 존재하지 않습니다.</span>
	   				
	   			</div>
	   		</div>
	   		
			<div class="page">
				<div id="paging-part">
					<ul class="pagination">

					</ul>
				</div>
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

		let i; 

		var poster;
		var mt20id;
		var	prfnm;
		var	prfpdfrom;
		var	prfpdto;
		var	fcltynm;
		var	prfstate;
		var	genrenm;

		$('#btn').click(() => {
			if($('#shprfnm').val() == ''){
				alert('검색어를 입력하세요');
				$('#shprfnm').focus();
			} else {
				search();
				currentPage = 1;
			}
		})

		// 엔터키 클릭 이벤트
		$(()=>{
			$('#shprfnm').keydown(function(key){
				if(key.keyCode == 13){
					$('#btn').click();
				}
			})

		})
		
		// 검색 버튼 클릭 이벤트
		function search(){
			$.ajax({
				url : 'slist.sh',
				type : 'get',
				data : {
					prfstate : $('#prfstate').val(),
					shprfnm : $('#shprfnm').val()
				},
				success : function(result){
					const itemArr = result.dbs.db;
					searchList(result, itemArr);
				},
				error : function(){
					console.log('fail');
				}
			})
		}

		function searchList(result, itemArr){
			
			let value = '';
			let paging = '';
					
			if(result.dbs.length == 0){
				value += '<span>일치하는 항목이 존재하지 않습니다.</span>'; 
			} else {

				listCount = itemArr.length;
				pageLimit = 10;
				contentLimit = 10;

				maxPage = parseInt(Math.ceil(listCount / contentLimit));
				startPage = parseInt((currentPage -1) / pageLimit) * pageLimit + 1;
				endPage = startPage + pageLimit - 1;
							
				if(endPage > maxPage) {
					endPage = maxPage;
				}

				function searchResult(){

					let shows = [];
					
					if(itemArr.length > 1){
						for(let j = 0; j < itemArr.length; j++){
							shows.push(itemArr[j]);
						}
					} else {
						shows.push(itemArr);
					}

					value += '<div class="show">'
								+ '<div class="poster">'
									+ '<img src="' + shows[i].poster + '">'
								+ '</div>'
								+ '<div class="des">'
									+'<form action="detail.sh">'
										+'<input type="hidden" id="mt20id" name="mt20id" value="' + shows[i].mt20id + '"/>'
										+'<p>' + shows[i].prfnm + '<button align="center" class="detail">상세보기</button></p>'
										+'<p>' + shows[i].prfpdfrom + ' ~ ' +  shows[i].prfpdto + '</p>'
										+'<p>' + shows[i].fcltynm + '</p>'
										+'<p>' + shows[i].prfstate + '</p>'
										+'<p>' + shows[i].genrenm + '</p>'
										+'</form>'
									+ '</div> <br clear="both">'
								+ '</div>' ;
            	};
					
				var initial, condition = 0;
				if(itemArr.length > 1){
					if(itemArr.length > 10){
						if(currentPage != maxPage){
							initial = (currentPage -1) * contentLimit;
							condition = contentLimit * currentPage;

						} else if(listCount % contentLimit != 0 && currentPage == maxPage){
							initial = (maxPage - 1) * contentLimit;
							condition = (maxPage - 1) * contentLimit + listCount % contentLimit;
						} else {
							initial = (currentPage -1) * contentLimit;
							condition = contentLimit * currentPage;
						}

						for(i = initial; i < condition; i++){
							searchResult();
						}

						if(currentPage == 1){
							paging += '<li class="page-item disabled lt"><a class="page-link">&lt;</li>';
						} else {
							paging += '<li class="page-item lt"><a class="page-link">&lt;</a></li>';
						}

						for(let i = startPage; i < endPage + 1; i++){
							paging += '<li class="page-item paging" value="' + i + '"><a class="page-link" value="' + i + '">' + i + '</a></li>'
						}
						
						if(currentPage == maxPage){
							paging += '<li class="page-item disabled gt"><a class="page-link">&gt;</a></li>';
						} else {
							paging += '<li class="page-item gt"><a class="page-link">&gt;</a></li>';
						}
						

					} else if(10 >= itemArr.length){
						for(i in itemArr){
							searchResult();
						}
					}
							
				} else {
					i = 0;
					searchResult();
				}
			}	
			$('.result').html(value);
			$('.pagination').html(paging);
		}

		$(document).on('click', '.paging', function(){
			currentPage = $(this).val();
			search();
		})

		$(document).on('click', '.lt', function(){
			if(currentPage == 1){
				alert('첫 번째 페이지입니다.');
			} else {
				currentPage = currentPage - 1;
				search();
			}
		})

		$(document).on('click', '.gt', function(){
			if(currentPage < maxPage){
				currentPage = currentPage + 1;
				search();
			} else {
				alert('마지막 페이지입니다.');
			}
		})
	</script>
	 
	
</body>
</html>