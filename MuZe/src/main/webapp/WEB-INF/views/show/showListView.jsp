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
#list-part{
	border : 1px solid;
	height : 900px;
	margin-top : 31.5px;
}

#search-part {
	height : 50px;
	position: relative;
	border: 1px solid red;
}

select{
	height: 45px;
	border-radius: 8px;
	margin-right: 10px;
}

#search-part > div {
	float : left;
}

#search{
	margin-left: 10px;
}

#search > input{
	width: 100%;
	border: 1px solid white;
	border-radius: 8px;
	padding: 10px 12px;
}

#search > i{
	position : absolute;
	width: 17px;
	top: 10px;
	right: 12px;
	margin: 0;
}

#result-part {
	background-color : beige;
	margin-top: 20px;
}

p{
	padding: 0;
	margin: 0;
}

#paging-part{
	height : 50px;
}

img {
	width : 150px;
	height : 200px;
}

.show > div{
	float : left;
}

.show {
	border : 1px solid;
	padding-left : 10px;
	padding-top : 10px;
}

.show:hover{
	cursor: pointer;
}

.des{
	margin-left : 10px;
}

.detail{
	margin-left: 10px;
}

#content {
	padding-top: 15px;
}

#btn {
	background-color: white;
	padding-top: 5px;
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
		   				<option value="01">공연예정</option>
		   				<option value="02">공연중</option>
		   				<option value="03">공연완료</option>
		   			</select>
	   			</div>
	   			
	   			<div id="search">
		   			<input type="text" placeholder="검색어 입력" name=shprfnm id="shprfnm" minlength="2">
					<i class="fa-solid fa-magnifying-glass" id="btn"></i>
				</div>
	   		</div>
	   		
	   		<div id="result-part">
	   			<div class="result">
	   				
					<span>일치하는 항목이 존재하지 않습니다.</span>
	   				
	   			</div>
	   		</div>
	   		
	   		<div id="paging-part">
	   		</div>
	   </div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		var cpage = 1;

		// 검색창에 아무것도 입력 안하면 버튼 비활성화
		// if($('#'))
		
		$('#btn').click(() => {
			if($('#shprfnm').val() == ''){
				console.log('검색어 없음');
				alert('검색어를 입력하세요');
			} else {
				search();
			}
		})
		
		
		// 검색 버튼 클릭 이벤트
		function search(){
			$.ajax({
				url : 'slist.sh',
				data : {
					prfstate : $('#prfstate').val(),
					shprfnm : $('#shprfnm').val()
				},
				success : function(result){
					 console.log($(result).find('db'));
					
					const itemArr = $(result).find('db');

					// if(itemArr.length == 0){
					// 	console.log('길이 0임: ' + itemArr.length);
					// } else {
					// 	console.log(itemArr.length);
					// }
					
					let value = '';
					
					if(itemArr.length != 0){
						itemArr.each((i, item) => { 
						value += '<div class="show">'
							  		+ '<div class="poster">'
							  			+ '<img src="' + $(item).find('poster').text() + '">'
							  		+ '</div>'
							  		+ '<div class="des">'
							  			+'<form action="detail.sh">'
							  			+'<input type="hidden" id="mt20id" name="mt20id" value="' + $(item).find('mt20id').text() + '"/>'
			   							+'<p>' + $(item).find('prfnm').text() + '<button class="detail">더보기</button></p>'
			   							+'<p>' + $(item).find('prfpdfrom').text() + ' ~ ' +  $(item).find('prfpdto').text() + '</p>'
			   							+'<p>' + $(item).find('fcltynm').text() + '</p>'
			   							+'<p>' + $(item).find('prfstate').text() + '</p>'
			   							+'<p>' + $(item).find('genrenm').text() + '</p>'
			   							+'</form>'
			   					   + '</div> <br clear="both">'
							  + '</div>'
						})
					} else {
						value += '<span>일치하는 항목이 존재하지 않습니다.</span>'; 
					}
					
					$('.result').html(value);

					
				},
				error : function(){
					console.log('fail');
				}
			})
			console.log("검색어 길이 : " + $('#shprfnm').val())
			return true;
		}
	</script>
	 
	
</body>
</html>