<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
#list-part{
	border : 1px solid;
	height : 900px;
	margin-top : 31.5px;
}

#search-part {
	height : 50px;
}

#result-part {
	background-color : beige;
}

#paging-part{
	height : 50px;
}

img {
	width : 100px;
	height : 150px;
}

.show > div{
	float : left;
}

.show {
	border : 1px solid;
	padding-left : 10px;
	padding-top : 10px;
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
</style>
</head>
<body>
	<jsp:include page="../common/navibar.jsp"/>
	
	 <div class="page" id="content"> 
	   <div id="blank-area"></div>
	   <div class="page">
	   		<div id="search-part">
	   			<input type="text" placeholder="검색어 입력" name=shprfnm id="shprfnm" required>
	   			<button id="btn1" onclick="search();">검색</button>
	   		</div>
	   		
	   		<div id="result-part">
	   			<div class="result">
	   				
	   				<p>일치하는 항목이 존재하지 않습니다.</p>
	   				
	   			</div>
	   		</div>
	   		
	   		<div id="paging-part">
	   		</div>
	   </div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		var cpage = 1;
		
		// 검색 버튼 클릭 이벤트
		function search(){
			$.ajax({
				url : 'slist.sh',
				data : {
					cpage : cpage,
					shprfnm : $('#shprfnm').val()
				},
				success : function(result){
					console.log($(result).find('db'));
					
					const itemArr = $(result).find('db');

					if(itemArr.length == 0){
						console.log('길이 0임: ' + itemArr.length);
					} else {
						console.log(itemArr.length);
					}
					
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
			   							+'<p>' + $(item).find('genrenm').text() + '</p>'
			   							+'</form>'
			   					   + '</div> <br clear="both">'
							  + '</div>'
						})
					} else {
						value += '<p>일치하는 항목이 존재하지 않습니다.</p>'; 
					}
					
					$('.result').html(value);
				},
				error : function(){
					console.log('fail');
				}
			})
		}
	</script>
	 
	
</body>
</html>