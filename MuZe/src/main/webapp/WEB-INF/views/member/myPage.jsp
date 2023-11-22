<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>내 정보</title>
<style>
body {
  margin: 0;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 10%;
  background-color: black;
  position: fixed;
  height: 100%;
  overflow: auto;
}

li a {
  display: block;
  color: white;
  padding: 8px 16px;
  text-decoration: none;
}

 li a:hover {
 	text-decoration: none;
 	color: white;
 }


</style>
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
	
    
<ul>
  <br><br><br><br><br>
  <li><a href="http://localhost:8001/muze/">홈 화면</a></li>
  <br><br>
  <li><a href="myInfo.me">내 정보</a></li>
  <br><br>
  <li><a href="#">다이어리</a></li>
  <br><br>
  <li><a href="#">일정</a></li>
  <br><br>
  <li><a href="#">가계부</a></li>
  <br><br>
  <li><a href="#">즐겨찾기</a></li>
  <br><br>
  <li><a href="#">my muze</a></li>
</ul>

<div style="margin-left:25%;padding:1px 16px;height:1000px;">


    
</body>
</html>