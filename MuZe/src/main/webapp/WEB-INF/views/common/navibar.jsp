<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- alertify -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<style>
	@font-face {
	    font-family: 'JeonjuCraftMjB';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/JeonjuCraftMjB.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
	}
	
	*{
		font-family: 'JeonjuCraftMjB';
	}

	body{
		background-color: rgb(39, 38, 38);
		color : white;
	}
	a{
		text-decoration: none;
		color : white;
	}
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
	}
	#wrap {
	    width: 100%;
	    height: 100%;
	    background-size: cover;
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
	    height: 100px;
	    z-index:5;
	    background-color: rgba(152, 29, 37, 0.459);
		border-bottom: 1px solid rgba(255, 255, 255, 0.459);
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

	#login {
	    font-size: 16px;
	    width: 100%;
	    text-align: right;
	    float: right;
	 }

	#blank-area{
		width:100%;
		height:200px;
	}
	/* ---------------- navigator 영역 부분 ---------------- */
	#header.sticky{
       background-color: rgba(152, 29, 37, 0.459);
       position: fixed;
       top: 0;
    }
	#navi {
	    width: 1400px;
	    padding: 0;
	    padding-top : 20px;
	    padding-left : 400px;	
	    margin: 0;
	    list-style: none;
	    text-decoration: none;
	    font-size: 22px;
	    text-align: right;
	    float: left;
	    display: block;
	}
	#navi > li {
	    float: right;
	    height: 100%;
	    width: 15%;
	    text-align: center;
	}
	#navi a {
		color : #d0a933;
	    text-decoration: none;
	    width: 100%;
	    height: 100%;
	    display: block;
	    line-height: 30px;
	}
	#navi a:hover {
	    color: #fff;
	}
	#navi > li > ul {
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
	    /*background-image: url("resources/image/LoGo.png");*/
	    /*일단은 로고 사진은 임시 */
	    background-repeat: no-repeat;
	    background-position: center;
	    background-size: 100%;
	}
	#bfreser{
		text-decoration : none;
		color : white;
	}
	/*------------------------파일첨부 css-----------------------------*/
	.filebox .upload-name {
	    display: inline-block;
	    height: 40px;
	    padding: 0 10px;
	    vertical-align: middle;
	    border: 1px solid #dddddd;
	    width: 78%;
	    color: #999999;
	}
	.filebox label {
	    display: inline-block;
	    padding: 10px 20px;
	    color: #fff;
	    vertical-align: middle;
	    background-color: #999999;
	    cursor: pointer;
	    height: 40px;
	    margin-left: 10px;
	}
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
	#chatbot{
		width : 60px;
		height : 60px;
		position : fixed;
		bottom : 0;
		right : 0;
		background-image : url('https://cdn2.iconfinder.com/data/icons/artificial-intelligence-173/128/chatbot-AI-chat_bubble-chat-robotics-robot-communication-256.png');
	}
</style>
</head>
<body>

	<c:if test="${ not empty alertdeleteMsg }">
		<script>
			alert('${alertdeleteMsg}');
		</script>
		<c:remove var="alertdeleteMsg" scope="session"/>
	</c:if>
	<script>
	    window.addEventListener("scroll", function(){
	        var header = document.querySelector('#header');
	        header.classList.toggle("sticky", window.scrollY > 0);
	    })
	</script>
    <header id="menubar">
        <div id="header">
        	<c:choose>
        		<c:when test="${ empty loginUser }">
            <!-- 회원이 아닐때 보여지는 태그 -->
            <div id="login-form"><a href="loginPage.me">로그인</a> | <a href="enrollForm.me">회원가입</a></div>
           		</c:when>
           		<c:otherwise>
           		<div id="login"><label>${ sessionScope.loginUser.userName }님 환영합니다</label>&nbsp;&nbsp;<a href="logout.me">로그아웃</a></div>
           		</c:otherwise>
            </c:choose>
            
            <!-- navigator영역 start -->
            <ul id="navi">
            <c:if test="${ not empty sessionScope.loginUser}">
                <li>
                	<c:choose>
	                	<c:when test="${ empty loginUser }">
			                    <a href="loginPage.me">마이페이지</a>
			            </c:when>
			            
				        <c:when test="${sessionScope.loginUser.userGrade == 2 }">
				        	<a href="adminPage.me">관리자 페이지</a>
				        </c:when>
			            
			            <c:otherwise>
			            		<a href="myInfo.me">마이페이지</a>
			                    <ul>
			                        <li><a href="calendar.ca">다이어리</a></li>
			                        <li><a href="ticket.mz">my muze</a></li>
			                    </ul>
			            </c:otherwise>
			        </c:choose>
                </li>
            </c:if>
                <li>
                    <a href="">커뮤니티</a>
                    <ul>
                        <li><a href="fboardList.bo">자유게시판</a></li>
                        <li><a href="dealList.bo">티켓 양도</a></li>

                    </ul>
                </li>
                <li>
                <c:choose>
                <c:when test="${not empty sessionScope.loginUser }">
                    <a href="show.rs">예매하기</a>
                    </c:when>
                    <c:otherwise>
                     <a id="bfreser" onclick="alert('로그인 후 사용가능');">예매하기</a>
                    </c:otherwise>
                </c:choose>
                </li>
                <li>
                    <a href="list.th">극장</a>
                </li>
                <li>
                    <a href="list.sh">작품</a>
                </li>
                <li>
                	<a href="list.rk">랭킹</a>
                </li>
            </ul>
            <!-- navi 영역 end -->
            <div id="logoPlace"></div>
        </div>
    	<div class="chatbot" id="chatbot">
    	 	<a href="chatbot.ch">MUZE 챗봇</a>
    	</div>
    </header>
</body>
</html>