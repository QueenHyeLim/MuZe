<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Kirang+Haerang&family=Nanum+Gothic&display=swap" rel="stylesheet"/>
<!--Bootstrap 4-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	#menubar {
	    margin: 0;
	    padding: 0;
	    font-size: 30px;
	    color: black;
	    font-family: "Kirang Haerang", cursive;
	    font-family: "Nanum Gothic", sans-serif;
	}
	div {
	    box-sizing: border-box;
	    border: 1px solid red;
	}
	#wrap {
	    width: 100%;
	    height: 100%;
	    background-size: cover;
	    /* 예시) 사진 → 영상 */
	    /* background-image: url("resources/image/semi-boseong/보성사진.jpg");*/
	}
	.page {
	    padding: 0;
	    margin: 0;
	    width: 100%;
	    height: 100%;
	    color: black;
	}
	#header {
	    margin: 0;
	    padding: 0;
	    width: 100%;
	    height: 200px;
	    /* ↓ 스크롤을 해도 같이 내려오는 효과 */
	    position: fixed;
	    top: 0;
	}
	#content {
	    width: 1302px;
	    height: 100%;
	    margin: auto;
	}
	#login-form {
	    font-size: 16px;
	    width: 100%;
	    text-align: right;
	    float: right;
	}
	#blank-area{
		width:100%;
<<<<<<< Updated upstream
		height:200px;
=======
		height:100%;
>>>>>>> Stashed changes
	}
	/* ---------------- navigator 영역 부분 ---------------- */
	#navi {
	    width: 60%;
	    padding: 0;
	    padding-top: 110px;
	    padding-right: 100px;
	    margin: 0;
	    list-style: none;
	    text-decoration: none;
	    font-size: 22px;
	    text-align: right;
	    float: right;
	    display: block;
	}
	#navi > li {
	    float: right;
	    height: 100%;
	    width: 15%;
	    text-align: center;
	}
	#navi a {
	    text-decoration: none;
	    width: 100%;
	    height: 100%;
	    display: block;
	    line-height: 30px;
	}
	#navi a:hover {
	    color: orangered;
	}
	#navi > li > ul {
	    background-color: rgba(0, 128, 0, 0.457);
	    list-style: none;
	    padding: 0;
	    display: none;
	}
	#navi > li > a:hover + ul {
	    display: block;
	}
	#navi > li > ul:hover {
	    display: block;
	}
	#navi > li > ul a {
	    font-size: 17px;
	}
	#navi > li > ul a:hover {
	    font-size: 20px;
	}
	/* ---------------- navigator 영역 부분 end ---------------- */
	#userBox {
	    width: 60px;
	    height: 60px;
	    position: fixed;
	    bottom: 0;
	}
	#logoPlace {
	    width: 200px;
	    height: 200px;
	    margin-left: 50px;
	    background-image: url("resources/image/LoGo.png");
	    /*일단은 로고 사진은 임시 */
	    background-repeat: no-repeat;
	    background-position: center;
	    background-size: 100%;
	}
</style>
</head>
    <body>
        <div id="menubar">
            <!-- 회원일때 보여지는 회원정보 div -->
            <div id="userBox">
                <p style="font-size: 13px">회원 정보</p>
            </div>
            <div id="header">
                <!-- 회원이 아닐때 보여지는 태그 -->
                <div id="login-form"><a href="#">로그인</a> | <a href="#">회원가입</a></div>
                <!-- navigator영역 start -->
                <ul id="navi">
                    <li>
                        <a href="">마이페이지</a>
                        <ul>
                            <li><a href="#">다이어리</a></li>
                            <li><a href="#">일정</a></li>
                            <li><a href="#">my muze</a></li>
                            <li><a href="#">가계부</a></li>
                            <li><a href="#">즐겨찾기</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="">커뮤니티</a>
                        <ul>
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">티켓 양도</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">예매하기</a>
                    </li>
                    <li>
                        <a href="">극장</a>
                    </li>
                    <li>
                        <a href="list.sh">작품</a>
                    </li>
                </ul>
                <!-- navi 영역 end -->
                <div id="logoPlace"></div>
            </div>
        </div>
    </body>
</html>