<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rank.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
#select-drop{
	width : 130px;
}
#rank-area{
	margin-top : 30px;
}
#row-rank-area{
	width : 100%;
	height : 300px;
	border-radius: 4cqmin;
	float : left;
	margin-bottom : 35px;
	background-color: rgba(128, 128, 128, 0.506);
	color : #fff;
}
#muzImage-area{
	width : 200px;
	height : 250px;
	margin-top : 25px;
	margin-left : 25px; 
}
#muzInfo-area{
	width : 75%;
	height : 200px;
	margin-top : 45px;
	margin-right : 35px;
	float:right;
}
#muzImage{
	width : 100%;
	height : 100%;
}
</style>
</head>
<body>
<jsp:include page="../common/navibar.jsp"/>
<div class="page" id="content">
    <div id="blank-area"></div>
    <div id="rank-area">
       	<select class="form-control" id="select-drop">
       		<option>인기순위</option>
       		<option>추천순위</option>
       		<option>가나다순</option>
       	</select>
       	<br/><br/>
   		<div id="row-rank-area">
   			<div id="muzInfo-area">
   				<h4>오페라의 유령</h4>
   				<p>2023.12.12~2024.01.29</p>
   				<p>예술의 극장</p>
   				<p>공연예정</p>
   				<p>뮤지컬</p>
   				<div id="bookmark-area">
					<i class="fa-regular fa-bookmark fa-lg" id="unbooked" onclick="unbookedClick();"></i>
					<i class="fa-solid fa-bookmark" style="color: #981d26;" id="booked" onclick="bookedClick();"></i>
   				</div>
   			</div>
   			<div id="muzImage-area">
   				<img src="https://cdn.onseoul.net/news/photo/202301/23399_23943_1458.jpg" id="muzImage"/>
   			</div>
   		</div>
   		<div id="row-rank-area">
   			<div id="muzInfo-area">
   				<h4>오페라의 유령</h4>
   				<p>2023.12.12~2024.01.29</p>
   				<p>예술의 극장</p>
   				<p>공연예정</p>
   				<p>뮤지컬</p>
   				<div id="bookmark-area">
					<i class="fa-regular fa-bookmark fa-lg" id="unbooked" onclick="unbookedClick();"></i>
					<i class="fa-solid fa-bookmark" style="color: #981d26;" id="booked" onclick="bookedClick();"></i>
   				</div>
   			</div>
   			<div id="muzImage-area">
   				<img src="https://ojsfile.ohmynews.com/PHT_IMG_FILE/2021/0309/IE002770932_PHT.jpg" id="muzImage"/>
   			</div>
   		</div>
   		<div id="row-rank-area">
   			<div id="muzInfo-area">
   				<h4>오페라의 유령</h4>
   				<p>2023.12.12~2024.01.29</p>
   				<p>예술의 극장</p>
   				<p>공연예정</p>
   				<p>뮤지컬</p>
   				<div id="bookmark-area">
					<i class="fa-regular fa-bookmark fa-lg" id="unbooked" onclick="unbookedClick();"></i>
					<i class="fa-solid fa-bookmark" style="color: #981d26;" id="booked" onclick="bookedClick();"></i>
   				</div>
   			</div>
   			<div id="muzImage-area">
   				<img src="https://otr.co.kr/wp-content/uploads/2020/08/%EB%A9%94%EB%A6%AC%EC%85%B8%EB%A6%AC%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg" id="muzImage"/>
   			</div>
   		</div>
   		<div id="row-rank-area">
   			<div id="muzInfo-area">
   				<h4>오페라의 유령</h4>
   				<p>2023.12.12~2024.01.29</p>
   				<p>예술의 극장</p>
   				<p>공연예정</p>
   				<p>뮤지컬</p>
   				<div id="bookmark-area">
					<i class="fa-regular fa-bookmark fa-lg" id="unbooked" onclick="unbookedClick();"></i>
					<i class="fa-solid fa-bookmark" style="color: #981d26;" id="booked" onclick="bookedClick();"></i>
   				</div>
   			</div>
   			<div id="muzImage-area">
   				<img src="https://image.newsis.com/2021/03/22/NISI20210322_0017272359_web.jpg" id="muzImage"/>
   			</div>
   		</div>
    </div>
</div>
</body>
</html>